declare-option range-specs client_ranges
define-command update_client_ranges %{ evaluate-commands set buffer client_ranges %val{timestamp} %sh{ for sel in $kak_selections_desc; do printf '%s|default,cyan ' "$sel"; done }}
define-command export_client_ranges %{ hook window NormalIdle .* %{ update_client_ranges }; hook window InsertIdle .* %{ update_client_ranges } }
define-command display_client_ranges %{ add-highlighter window/ ranges client_ranges }
