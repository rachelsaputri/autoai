/ Policy engine for K Compliance Auditor
/ Parses and validates security policies

/ Parse policy file
parse_policies: { [file_path]
  lines: read_lines[file_path];
  policies: ();
  each[{[line] parse_single_policy[line]} each lines];
}

/ Parse a single policy line
parse_single_policy: { [line]
  if[empty[line] or line[0] = '#'; ::
    fields: split[line; ';'];
    if[3 = count[fields];
      policy: (fields[0]; fields[1]; fields[2]);
      policies:, policy;
    ];
  ];
  policies
}

/ Validate policy format
validate_policy: { [policy]
  if[3 != count[policy]; 
    error[\"Invalid policy format\"];
  ];
  if[not string[policy[0]];
    error[\"Policy key must be a string\"];
  ];
  if[not string[policy[1]];
    error[\"Expected value must be a string\"];
  ];
  \n\"\";
}

/ Compile policies for fast lookup
compile_policies: { [raw_policies]
  dict: ();
  each[{[p] dict[p[0]]: p[1]} each raw_policies];
  dict
}
