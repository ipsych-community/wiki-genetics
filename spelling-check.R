if (!exists("WORDS_TO_IGNORE")) WORDS_TO_IGNORE <- character(0)

# Spelling check
spelling_errors <- spelling::spell_check_files(
  path = `if`(interactive(), rstudioapi::getSourceEditorContext()$path,
              knitr::current_input()),
  ignore = c(scan("WORDLIST", what = ""), WORDS_TO_IGNORE),
  lang = "en-GB"
)

if (nrow(spelling_errors)) {
  capture.output(print(spelling_errors), file = "spelling.errors")
  stop(paste(sep = "\n",
             "Check spelling! Check file 'spelling.errors'",
             "Please correct misspelled words. If you want to ignore some words:",
             "  - add them to file 'WORDLIST' for commonly used terms",
             "  - add them to the variable 'WORDS_TO_IGNORE' for your file only"))
}

rm(spelling_errors)
