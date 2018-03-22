m4_include(header.m4)
m4_header(`__M4_UTIL__',`

m4_dnl          constant values
m4_define(`m4_false',                                       0)
m4_define(`m4_true',                                        1)

m4_dnl          basic functions
m4_define(`m4_quote',                                       ``$*'')
m4_define(`m4_first',                                       `$1')
m4_define(`m4_rest',                                        m4_defn(`m4_shift'))
m4_define(`m4_pass',                                        `$*')
m4_define(`m4_strip',                                       `__m4_strip_front(__m4_strip_back($@))')
m4_define(`__m4_strip_front',                               `m4_patsubst(`$*',`^\s*',`')')
m4_define(`__m4_strip_back',                                `m4_patsubst(`$*',`\s*$',`')')
m4_define(`m4_shiftn',                                      `m4_ifelse($1, `0',
                                                                `m4_shift($@)',
                                                                `m4_shiftn(m4_eval($1 - 1), m4_shift(m4_shift($@)))')')
m4_define(`m4_nargs',                                       `m4_ifelse((m4_strip($*)), `()', `0', `$#')')
m4_define(`m4_argn',                                        `m4_first(m4_shiftn($1,m4_rest($@)))')

m4_dnl          logic functions
m4_define(`m4_or',                                          `m4_ifelse($1, m4_true,
                                                                m4_true,
                                                                `$2')')
m4_define(`m4_and',                                         `m4_ifelse($1, m4_true,
                                                                `$2',
                                                                m4_false)')
m4_define(`m4_not',                                         `m4_ifelse($1, m4_true,
                                                                m4_false,
                                                                m4_true)')

m4_dnl          loop constructs
m4_dnl              __m4_do_for(var, i, max, stmt)
m4_define(`__m4_do_for',                                    `m4_ifelse(m4_eval(`($2) < ($3)'), m4_true,
                                                                `m4_define(`$1', `$2')$4`'$0(`$1', m4_incr(`$2'), `$3', `$4')')')
m4_define(`m4_with',                                        `m4_pushdef(`$1', `$2')$3`'m4_popdef(`$1')')
m4_define(`m4_for',                                         `m4_pushdef(`$1')__m4_do_for(`$1', m4_eval(`$2'), m4_eval(`$3'), `$4')m4_popdef(`$1')')

')m4_dnl
