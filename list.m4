m4_include(header.m4)
m4_header(`__M4_LIST__',`
m4_include(util.m4)

# constructor
m4_define(`m4_list',                                        `($@)')

# destructor
m4_define(`m4_list_expand',                                 `m4_pass$1')


m4_define(`m4_list_len',                                    `m4_nargs(m4_list_expand($1))')
# m4_list_len(list, item)
m4_define(`m4_list_item',                                   `m4_argn($2,m4_list_expand($1))')
m4_define(`m4_list_first',                                  `m4_first(m4_list_expand($1))')
m4_define(`m4_list_rest',                                   `m4_list(m4_rest(m4_list_expand($1)))')
m4_define(`m4_list_empty',                                  `m4_ifelse(m4_list_len($1), `0', m4_true, m4_false)')

m4_define(`__m4_do_item',                                   m4_defn(`m4_with'))
m4_define(`__m4_list_foreach',                              `m4_for(`_i', 0, m4_list_len($2), `m4_with(`$1', `m4_list_item($2, _i)', `$3')')')
m4_define(`__m4_list_foreach_join',                         `m4_ifelse(m4_list_empty($2), m4_true, `',
                                                                       m4_list_len($2),   1,       `__m4_do_item(`$1',m4_list_first($2),`$3')',
                                                                                                   `__m4_do_item(`$1',m4_list_first($2),`$3')$4$0(`$1',m4_list_rest($2),`$3',`$4')')')

# m4_list_foreach(var, list, expr)
# m4_list_foreach(var, list, expr, delimiter)
m4_define(`m4_list_foreach',                                `m4_ifelse($#, `3', `__m4_list_foreach($@)',
                                                                       $#, `4', `__m4_list_foreach_join($@)')')
m4_define(`m4_list_enumerate',                              `m4_for(`$1', 0, m4_list_len($3), `m4_with(`$2', `m4_list_item($3, `$1')', `$4')')')

m4_define(`m4_list_join',                                   `m4_ifelse(
                                                                m4_list_empty($1), m4_true, `',
                                                                m4_list_len($1),   m4_true, `m4_pass$1',
                                                                                            `m4_list_first($1)$2$0(m4_rest($1),`$2')')')

')m4_dnl
