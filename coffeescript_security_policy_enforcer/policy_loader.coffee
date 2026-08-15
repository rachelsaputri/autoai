#!/usr/bin/env coffee

# Dynamic Policy Ingestion and Validation Module
# Parses JSON policy definitions and ensures schema integrity

fs = require 'fs'
path = require 'path'

VALID_RULE_TYPES = ['allow', 'deny', 'quarantine', 'block']
REQUIRED_FIELDS = ['id', 'type', 'target', 'condition', 'action']

load: (policyPath) ->
  try
    data = fs.readFileSync(policyPath, 'utf8')
    policies = JSON.parse(data)
    unless Array.isArray(policies)
      throw new Error 'Policy file must contain an array of rules'
    validatedPolicies = []
    for policy in policies
      unless validatePolicy(policy)
        throw new Error "Invalid policy schema: #{policy.id or 'unknown'}"
      validatedPolicies.push policy
    validatedPolicies
  catch err
    throw new Error "Failed to load policies: #{err.message}"

validatePolicy: (policy) ->
  unless policy.id and policy.type and policy.target and policy.condition and policy.action
    return false
  unless VALID_RULE_TYPES.includes(policy.type)
    return false
  return true

module.exports = { load }
