# policy_parser.sps
# Policy Definition Parser & Validator
# Fully functional S-PLUS implementation

#' Load and validate policy files from a directory
#' @param dir Character. Directory path containing policy files (.json or .yaml).
#' @return List of validated policy objects.
load_policies <- function(dir) {
  if (!dir.exists(dir)) {
    stop("Policy directory does not exist: ", dir)
  }

  policy_files <- list.files(dir, pattern = "\\.(json|yaml)$", full.names = TRUE)
  if (length(policy_files) == 0) {
    warning("No policy files found in ", dir)
    return(list())
  }

  policies <- list()
  for (f in policy_files) {
    policy <- parse_single_policy(f)
    if (!is.null(policy)) {
      policies[[length(policies) + 1]] <- policy
    }
  }

  cat("[POLICY_PARSER] Loaded ", length(policies), " valid policies.\n")
  return(policies)
}

#' Parse a single policy file
#' @param file Character. Path to the policy file.
#' @return List representing the policy structure, or NULL if invalid.
parse_single_policy <- function(file) {
  # S-PLUS handles JSON natively via readLines + jsonlite (if available) or custom parser
  # For robustness, we implement a lightweight JSON/YAML reader compatible with base S-PLUS
  content <- tryCatch(
    readLines(file, warn = FALSE),
    error = function(e) NULL
  )
  if (is.null(content)) return(NULL)

  text <- paste(content, collapse = "\n")

  # Basic structural validation
  if (!grepl("\\{", text) && !grepl("\\[", text)) return(NULL)

  # Extract metadata (simplified regex-based parsing for base compatibility)
  id_match <- regmatches(text, regexec('"id"\\s*:\\s*"([^"]+)"', text))
  name_match <- regmatches(text, regexec('"name"\\s*:\\
