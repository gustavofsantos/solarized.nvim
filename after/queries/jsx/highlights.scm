;; extends

(import_clause
  (identifier) @include.identifier)

(named_imports
  (import_specifier
    name: (identifier) @include.identifier))

(import_statement
  source: (string) @include.source
  (#set! "priority" 200))

[ 
 "'"
 "`"
 "\""
] @punctuation.string.delimiter
