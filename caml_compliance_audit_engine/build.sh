#!/bin/bash

# Build script for Caml Compliance Audit Engine
set -e

echo "Building Caml Compliance Audit Engine..."

# Compile modules
ocamlc -g -o audit_engine \
  config.ml \
  policy_enforcer.ml \
  remediation_handler.ml \
  audit_runner.ml

if [ $? -eq 0 ]; then
    echo "Build successful. Binary 'audit_engine' created."
else
    echo "Build failed."
    exit 1
fi

echo "To run the engine, execute: ./audit_engine"
