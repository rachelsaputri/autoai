#!/usr/bin/env coffee

# Compliance Report Generation Module
# Produces standardized JSON and CSV compliance reports

fs = require 'fs'
path = require 'path'

class ReportGenerator
  constructor: (@outputPath) ->
    unless fs.existsSync(@outputPath)
      fs.mkdirSync(@outputPath, recursive: true)

  generate: (auditTrails, policyCount) ->
    report =
      generatedAt: new Date().toISOString()
      totalPoliciesEvaluated: policyCount
      auditEvents: auditTrails
      summary: calculateSummary(auditTrails)
    fs.writeFileSync(@outputPath + '/compliance_report.json', JSON.stringify(report, null, 2))
    fs.writeFileSync(@outputPath + '/compliance_report.csv', generateCSV(report))
    report

calculateSummary: (auditTrails) ->
  violations = auditTrails.filter((e) -> e.level is 'REMEDIATION').length
  totalEvents = auditTrails.length
  { totalEvents, violations, complianceRate: if totalEvents > 0 then ((totalEvents - violations) / totalEvents) * 100 else 100 }

generateCSV: (report) ->
  headers = 'Timestamp,Level,Message,Sequence'
  rows = report.auditEvents.map (e) -> "#{e.timestamp},#{e.level},#{e.message},#{e.sequence}"
  [headers, rows...].join('\n')

module.exports = { new: (outputPath) -> new ReportGenerator(outputPath) }
