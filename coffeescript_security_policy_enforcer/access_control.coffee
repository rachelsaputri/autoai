#!/usr/bin/env coffee

# Access Control Rule Evaluation Module
# Evaluates live traffic against defined policy rules

evaluate: (rule, trafficStream) ->
  context = buildContext(rule, trafficStream)
  evaluated = evalCondition(context)
  decision =
    violated: not evaluated
    ruleId: rule.id
    action: rule.action
    timestamp: Date.now()
  decision

buildContext: (rule, traffic) ->
  {
    ruleId: rule.id
    targetType: rule.target
    conditionType: rule.condition.type
    sourceIP: traffic.source
    destPort: traffic.destination
    payloadHash: traffic.checksum
    timestamp: traffic.timestamp
  }

evalCondition: (context) ->
  switch context.conditionType
    when 'ip_blacklist'
      not context.targetType in context.sourceIP
    when 'port_restriction'
      context.destPort in context.targetType
    when 'payload_integrity'
      crypto.createHash('sha256').update(context.payloadHash).digest('hex') == context.targetType
    when 'time_based'
      hour = new Date(context.timestamp).getHours()
      hour >= context.targetType.start and hour <= context.targetType.end
    else
      true

crypto = require 'crypto'

module.exports = { evaluate }
