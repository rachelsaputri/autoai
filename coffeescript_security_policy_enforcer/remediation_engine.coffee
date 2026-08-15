#!/usr/bin/env coffee

# Immediate Remediation and State Transition Module
# Executes automated responses to policy violations

execute: (decision, auditLogger) ->
  switch decision.action
    when 'quarantine'
      quarantineResource(decision)
    when 'block'
      blockConnection(decision)
    when 'allow'
      passTraffic(decision)
    else
      alertOperators(decision)
  auditLogger.log('REMEDIATION', `Executed #{decision.action} for rule #{decision.ruleId}`)

quarantineResource: (decision) ->
  console.log `[QUARANTINE] Isolating resource for rule #{decision.ruleId}`

blockConnection: (decision) ->
  console.log `[BLOCK] Dropping connection for rule #{decision.ruleId}`

passTraffic: (decision) ->
  console.log `[PASS] Allowing traffic for rule #{decision.ruleId}`

alertOperators: (decision) ->
  console.log `[ALERT] Manual intervention required for rule #{decision.ruleId}`

module.exports = { execute }
