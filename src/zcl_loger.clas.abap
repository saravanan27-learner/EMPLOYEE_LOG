CLASS zcl_loger DEFINITION
  PUBLIC
  FINAL
  CREATE private .

  PUBLIC SECTION.
  CLASS-DATA: locker type abap_bool.
  class-methods get_instance RETURNING
               VALUE(ro_log) TYPE REF TO zcl_loger.
  methods update_logger importing userid type char8.
  PROTECTED SECTION.
  PRIVATE SECTION.
  class-DATA go_log type REF TO zcl_loger.
  methods constructor.

ENDCLASS.



CLASS zcl_loger IMPLEMENTATION.
method constructor.
    locker = abap_true.
endmethod.
method get_instance.
if go_log is INITIAL.
    go_log = new #(  ).
endif.
ro_log = go_log.
ENDMETHOD.
method update_logger.
data up_log type ztemployeelog.
if locker is not initial.
   data(lv_user) = userid.
select single * from ztemployeelog where user_id eq @lv_user into @data(lwa).
up_log = value #(
user_id = lv_user
last_changed_by =  sy-uname
last_changed_at = sy-uzeit
 ).
 modify ztemployeelog from @up_log.
endif.
ENDMETHOD.
ENDCLASS.
