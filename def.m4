m4_include(header.m4)
m4_header(`__M4_DEF__',`

m4_define(`m4_define_ifdef',        `m4_ifelse($#,            `3',  `m4_ifdef(`$1', `m4_define(`$2', `$3')', `m4_define(`$2', `')')',
                                               m4_eval($# > 3), 1,  `m4_define_if_def(`$1', m4_shiftn(3,$@))')')

')m4_dnl
