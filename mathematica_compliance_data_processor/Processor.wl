(* ==================================================================
   Mathematica Compliance Data Processor
   Language: Wolfram Language (Mathematica)
   Description: Complete data processing pipeline with validation,
                transformation, and export capabilities.
   ================================================================== *)

(* 1. Input Argument Parsing *)
args = StringSplit[CommandLineArguments[]];
params = Association[];
Do[If[StringMatchQ[arg, "--" ~~ ___ ~~ "=" ~~ ___],
   {k, v} = StringSplit[arg, "="] -> {StringTrim[k, "--"], StringTrim[v]};
   params = Association[params, {k -> v}]],
   {arg, args}
];

inputFile = Lookup[params, "input", ""];
outputFile = Lookup[params, "output", ""];
type = Lookup[params, "type", "json"];

If[inputFile == "" || outputFile == "",
   Print["ERROR: Missing --input or --output arguments."];
   Exit[1]
];

(* 2. Core Data Ingestion *)
rawData = Switch[FileType[inputFile],
   "JSON", 
   Module[{content},
     content = Import[inputFile, "JSON"];
     If[VectorQ[content], content, {content}]
   ],
   "CSV",
   Import[inputFile, "CSV"],
   "WDX", Import[inputFile],
   Print["ERROR: Unsupported file format " <> InputFile <> "."];
   Exit[1]
];

(* Handle CSV headers *)
If[FileType[inputFile] === "CSV" && Length[rawData] > 0,
   headers = rawData[[1]];
   rows = Rest[rawData];
   data = AssociationThread[headers, #] & /@ rows,
   If[AssociationQ[rawData], rawData = {rawData}, rawData]
];

(* 3. Data Validation & Cleaning *)
cleanedData = Map[
   Function[row,
     If[AssociationQ[row],
       Module[{cleanedRow = row},
         (* Type enforcement for String and Integer *)
         Do[
           If[! StringQ[v], 
             cleanedRow[k] = ToString[v]],
           {k, v}, cleanedRow
         ];
         (* Remove null/empty values *)
         Association[Association @@ Select[assocToPair[cleanedRow], #[[2]] =!= Null && #[[2]] =!= "" &]]
       ],
       row
     ]
   ],
   rawData
];

assocToPair = KeyValueMap[{#1, #2} &, #] &;

(* 4. Transformation Engine *)
transformedData = Map[
   Function[row,
     Module[{r = row},
       (* Example: Normalize email format if exists *)
       If[KeyExistsQ[r, "email"],
         r["email"] = StringTrim[StringLowercase[r["email"]], "@"]
       ];
       r
     ]
   ],
   cleanedData
];

(* 5. Export Results *)
If[FileType[outputFile] === "CSV",
   Module[{headerKeys},
     If[Length[transformedData] > 0,
       headerKeys = Keys[transformedData[[1]]];
       (* Flatten data for export *)
       flatData = Join[{headerKeys}, 
         Map[Values, transformedData, {2}]
       ];
       Export[outputFile, flatData, "CSV"]
     ]
   ],
   Export[outputFile, transformedData, "JSON"]
];

Print["SUCCESS: Data processed successfully."];
Print["Records processed: " <> ToString[Length[transformedData]]];
