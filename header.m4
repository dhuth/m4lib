m4_dnl
m4_dnl      m4_header(name, dfns...)
m4_dnl
m4_define(`m4_header',          `m4_ifdef(`$1',,
                                    `m4_define(`$1',)__m4_hide_defns(m4_divnum, m4_shift($@))')')m4_dnl
m4_dnl
m4_dnl      __m4_hide_defns(divnum, defns...)
m4_dnl
m4_define(`__m4_hide_defns',    `m4_divert(__m4_quote(m4_eval(`($1) - 1')))$*m4_divert(__m4_quote(m4_eval(`($1)')))')m4_dnl
m4_define(`__m4_quote',         ``$*'')m4_dnl
