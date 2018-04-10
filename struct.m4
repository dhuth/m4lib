m4_include(header.m4)
m4_header(`__M4_STRUCT__',`

m4_dnl
m4_dnl      m4_record_define(vect, (x, y, z))
m4_dnl      m4_record_new(vect, 1, 0, 0)                    =>  (1, 0, 0)
m4_dnl      m4_define(p, `m4_record_new(vect, 1, 2, 3))
m4_dnl      m4_record_get(p, vect, x)                       =>  1
m4_dnl      m4_record_get(p, vect, y)                       =>  2
m4_dnl      m4_record_get(p, vect, z)                       =>  3
m4_dnl


m4_define(`__m4_record_name',                               `record<$1>')
m4_define(`__m4_member_name',                               `$1::$2')
m4_define(`__m4_member_index',                              `$1::$2.index')
m4_define(`m4_record_define',                               `m4_strip(m4_list_enumerate(`_i',`_v',$2,
                                                                `m4_define(__m4_member_name(__m4_record_name(`$1'), _v), m4_list(`$1', _v, _i))
                                                                 m4_define(__m4_member_index(__m4_record_name(`$1'), _v), _i)'))')
m4_define(`m4_record_new',                                  `m4_list(m4_shiftn(1, $@))')
m4_define(`m4_record_get',                                  `m4_list_item($1, m4_indir(__m4_member_index(__m4_record_name(`$2'), `$3')))')

')m4_dnl
