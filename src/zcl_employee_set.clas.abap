CLASS zcl_employee_set DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
  data gwa_employee_val type ztemployeelog.
  methods set_emp IMPORTING userid type char8
                             role type char5
                  EXPORTING  sys_result type abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_employee_set IMPLEMENTATION.
METHOD set_emp.
gwa_employee_val = VALUE #(
                  user_id = userid
                  role = role
 ).
 INSERT ztemployeelog from @gwa_employee_val.
 if sy-subrc = 0.
     sys_result = abap_true.
 else.
     sys_result = abap_false.
 endif.
ENDMETHOD.
ENDCLASS.
