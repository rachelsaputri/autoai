#!/usr/bin/env coffee

# Real-time Security Policy Enforcement Gateway
# Entry Point and Orchestration Module

fs = require 'fs'
path = require 'path'
net = require 'net'
{ EventEmitter } = require 'events'

policyLoader = require './policy_loader'
accessControl = require './access_control'
remediationEngine = require './remediation_engine'
auditLogger = require './audit_logger'
reportGenerator = require './report_generator'

class SecurityGateway extends EventEmitter
  constructor: (@config) ->
    @policies = []
    @auditTrails = []
    @complianceStatus = 'uninitialized'
    @auditLogger = auditLogger.new @config.audit_log_path
    @reportGenerator = reportGenerator.new @config.report_output_path

  initialize: =>
    @policies = policyLoader.load(@config.policy_path)
    @complianceStatus = 'active'
    @auditLogger.log('INFO', 'Security Gateway initialized and policies loaded successfully')
    @emit 'gateway:ready'

  evaluateTraffic: (trafficStream) =>
    results = []
    for rule in @policies
      decision = accessControl.evaluate(rule, trafficStream)
      results.push decision
      if decision.violated
        remediationEngine.execute(decision, @auditLogger)
    @auditLogger.log('INFO', `Traffic evaluation complete. ${results.filter((r) -> r.violated).length} violations detected.`)
    @emit 'traffic:evaluated', results
    results

  generateReport: =>
    report = @reportGenerator.generate(@auditTrails, @policies.length)
    @auditLogger.log('INFO', 'Compliance report generated')
    report

module.exports = SecurityGateway
