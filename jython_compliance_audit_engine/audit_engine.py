#!/usr/bin/env python3
"""Jython Compliance Audit Engine

A fully functional, production-ready compliance auditing framework.
"""
import os
import sys
import json
import logging
import yaml
import glob
from datetime import datetime
from typing import List, Dict, Any, Optional

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.StreamHandler(sys.stdout),
        logging.FileHandler('audit.log')
    ]
)
logger = logging.getLogger(__name__)


class PolicyParser:
    def __init__(self, policy_file: str):
        self.policy_file = policy_file
        self.policies: Dict[str, Any] = {}
        self._load_policies()

    def _load_policies(self):
        if not os.path.exists(self.policy_file):
            logger.error(f"Policy file not found: {self.policy_file}")
            sys.exit(1)
        try:
            with open(self.policy_file, 'r') as f:
                self.policies = yaml.safe_load(f)
            logger.info("Policies loaded successfully.")
        except yaml.YAMLError as e:
            logger.error(f"Error parsing policy file: {e}")
            sys.exit(1)

    def get_rule(self, rule_name: str) -> Optional[Dict[str, Any]]:
        return self.policies.get(rule_name)

    def list_rules(self) -> List[str]:
        return list(self.policies.keys())


class ConfigurationAuditor:
    def __init__(self, config_dir: str, policy_parser: PolicyParser):
        self.config_dir = config_dir
        self.policy_parser = policy_parser
        self.violations: List[Dict[str, Any]] = []

    def audit(self) -> List[Dict[str, Any]]:
        logger.info("Starting configuration audit...")
        config_files = glob.glob(os.path.join(self.config_dir, '*.conf'))
        if not config_files:
            logger.warning("No configuration files found in target directory.")
            return []

        for conf_file in config_files:
            logger.info(f"Auditing file: {os.path.basename(conf_file)}")
            try:
                config_data = self._parse_config(conf_file)
                self._check_policies(os.path.basename(conf_file), config_data)
            except Exception as e:
                logger.error(f"Failed to audit {conf_file}: {e}")

        logger.info(f"Audit complete. Found {len(self.violations)} violation(s).")
        return self.violations

    def _parse_config(self, filepath: str) -> Dict[str, Any]:
        config = {}
        with open(filepath, 'r') as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith('#'):
                    if '=' in line:
                        key, value = line.split('=', 1)
                        config[key.strip()] = value.strip()
        return config

    def _check_policies(self, file_name: str, config_data: Dict[str, Any]):
        for rule_name, rule_def in self.policy_parser.policies.items():
            target_key = rule_def.get('target')
            expected_value = rule_def.get('expected')
            severity = rule_def.get('severity', 'medium')

            if target_key and target_key in config_data:
                actual_value = config_data[target_key]
                if str(actual_value).strip() != str(expected_value).strip():
                    self.violations.append({
                        'file': file_name,
                        'rule': rule_name,
                        'target': target_key,
                        'expected': expected_value,
                        'actual': actual_value,
                        'severity': severity,
                        'timestamp': datetime.now().isoformat()
                    })
                    logger.warning(f"VIOLATION: [{severity.upper()}] {file_name} - {target_key} is '{actual_value}', expected '{expected_value}'")


class ReportGenerator:
    def __init__(self, violations: List[Dict[str, Any]], output_dir: str = 'reports'):
        self.violations = violations
        self.output_dir = output_dir
        os.makedirs(self.output_dir, exist_ok=True)

    def generate(self) -> str:
        if not self.violations:
            logger.info("No violations found. Skipping report generation.")
            return ''

        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        report_path = os.path.join(self.output_dir, f'audit_report_{timestamp}.txt')

        with open(report_path, 'w') as f:
            f.write(f"COMPLIANCE AUDIT REPORT\n")
            f.write(f"Generated: {datetime.now().isoformat()}\n")
            f.write(f"Total Violations: {len(self.violations)}\n")
            f.write('='*50 + '\n\n')

            for v in self.violations:
                f.write(f"Severity: {v['severity'].upper()}\n")
                f.write(f"Rule: {v['rule']}\n")
                f.write(f"File: {v['file']}\n")
                f.write(f"Target: {v['target']}\n")
                f.write(f"Expected: {v['expected']}\n")
                f.write(f"Actual: {v['actual']}\n")
                f.write('-'*50 + '\n')

        logger.info(f"Report generated successfully at: {report_path}")
        return report_path


def main():
    policy_file = 'policies/compliance_policy.yaml'
    config_dir = 'configs/'

    if not os.path.exists(policy_file):
        logger.error(f"Policy file '{policy_file}' not found.")
        sys.exit(1)
    if not os.path.isdir(config_dir):
        os.makedirs(config_dir, exist_ok=True)
        logger.warning(f"Config directory '{config_dir}' created. Please add configuration files.")
        sys.exit(0)

    try:
        parser = PolicyParser(policy_file)
        auditor = ConfigurationAuditor(config_dir, parser)
        violations = auditor.audit()
        
        if violations:
            generator = ReportGenerator(violations)
            report_path = generator.generate()
            print(f"\nAudit finished. Violations detected. See report at: {report_path}")
        else:
            print("\nAudit finished. No violations found. System is compliant.")
    except Exception as e:
        logger.critical(f"Fatal error during execution: {e}")
        sys.exit(1)


if __name__ == '__main__':
    main()
