// main.dats
// Entry point for the ATS Binary Integrity Monitor

include "share/atspre_staload.hats"

extern "C" fn printf (fmt: &str, ...): int
extern "C" fn fopen (path: &str, mode: &str): ptr<void)
extern "C" fn fclose (fp: ptr<void>): int
extern "C" fn fprintf (fp: ptr<void>, fmt: &str, ...): int

extern "C" fn parse_binary_integrity_report (path: &str): bool
extern "C" fn compute_section_hashes (path: &str, hash_map: &str): int

staload "./parsing.dats"
staload "./integrity.dats"
staload "./reporting.dats"

fun main (args: ~list (string)): int =
  var filename := ""
  var format := "json"
  var baseline := ""
  
  var i := 0
  while i < length_of (args) do
  begin
    if args[i] = "--format" then
    begin
      i += 1
      if i < length_of (args) then format := args[i]
      i += 1
    end
    else if args[i] = "--baseline" then
    begin
      i += 1
      if i < length_of (args) then baseline := args[i]
      i += 1
    end
    else if args[i] <> "" then
      filename := args[i]
      i += 1
  end
  
  if filename = "" then
  begin
    println! ("Usage: ats_binary_integrity_monitor <binary> [--format json|xml] [--baseline <path>]")
    1
  end
  else
  begin
    // Step 1: Parse and verify binary structure
    if parse_binary_integrity_report (filename) then
    begin
      // Step 2: Compute integrity hashes for sections
      var hash_result := compute_section_hashes (filename, "section_hashes.txt")
      if hash_result = 0 then
      begin
        // Step 3: Generate compliance report
        var report_path := "audit_report." ++ (if format = "xml" then "xml" else "json")
        generate_compliance_log (filename, report_path, format)
        println! ("Analysis complete. Report saved to " ++ report_path)
        0
      end
      else
      begin
        println! ("Error computing section hashes.")
        1
      end
    end
    else
    begin
      println! ("Error: Failed to parse binary or verify integrity.")
      1
    end
  end
