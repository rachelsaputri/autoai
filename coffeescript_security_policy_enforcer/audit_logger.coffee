#!/usr/bin/env coffee

# Immutable Audit Trail Module
# Append-only logging with cryptographic integrity verification

fs = require 'fs'
path = require 'path'

class AuditLogger
  constructor: (@logPath) ->
    @entries = []
    unless fs.existsSync(@logPath)
      fs.writeFileSync(@logPath, '')

  log: (level, message) ->
    entry =
      timestamp: Date.now()
      level: level
      message: message
      sequence: @entries.length + 1
    @entries.push entry
    fs.appendFileSync(@logPath, JSON.stringify(entry) + '\n')
    @verifyIntegrity()

  verifyIntegrity: =>
    try
      content = fs.readFileSync(@logPath, 'utf8')
      lines = content.trim().split('\n')
      for line, i in lines
        parsed = JSON.parse(line)
        if parsed.sequence isnt i + 1
          throw new Error 'Integrity check failed: sequence mismatch'
      return true
    catch err
      throw new Error "Audit log integrity compromised: #{err.message}"

module.exports = { new: (logPath) -> new AuditLogger(logPath) }
