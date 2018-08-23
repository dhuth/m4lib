m4_include(header.m4)
m4_header(`__M4_DEF__',`

m4_define(`__m4_deflist',                                   `m4_ifelse(m4_eval($# > 1), m4_true, `m4_define(`$1', `$2')$0(m4_shiftn(2,$@))',`')')
m4_define(`__m4_ndeflist',                                  `m4_ifelse(m4_eval($# > 2), m4_true, `m4_define(`$1',   `')$0(m4_shiftn(2,$@))',`')')
m4_define(`m4_define_ifdef',                                `m4_ifdef(`$1', `__m4_deflist(m4_shiftn(1,$@))'
                                                                            `__m4_ndeflist(m4_shiftn(1,$@))')')

')m4_dnl
