CLASS zcl_view_emplog DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_view_emplog IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  data: lo_setdet type REF TO zcl_employee_set,
        lo_viewlog type ref to zcl_loger.
        data result type abap_bool.
  lo_setdet = NEW #( ).
  lo_setdet->set_emp( EXPORTING userid = '12345678' role = 'admin'
                      IMPORTING  sys_result = result ).
  out->write( result ).
  lo_viewlog = zcl_loger=>get_instance( ).
  lo_viewlog->update_logger( '12345678' ).
  out->write( 'hello' ).

  ENDMETHOD.
ENDCLASS.
