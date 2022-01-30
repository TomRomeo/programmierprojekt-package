class ZCL_ZC_12_CONNECTIONTP_MPC definition
  public
  inheriting from /IWBEP/CL_MGW_PUSH_ABS_MODEL
  create public .

public section.

  interfaces IF_SADL_GW_MODEL_EXPOSURE_DATA .

  types:
   TS_ZC_09_BOOKINGTPTYPE type ZC_09_BOOKINGTP .
  types:
   TT_ZC_09_BOOKINGTPTYPE type standard table of TS_ZC_09_BOOKINGTPTYPE .
  types:
   TS_ZC_09_CONNECTIONTPTYPE type ZC_09_CONNECTIONTP .
  types:
   TT_ZC_09_CONNECTIONTPTYPE type standard table of TS_ZC_09_CONNECTIONTPTYPE .
  types:
   TS_ZC_09_CUSTOMERTPTYPE type ZC_09_CUSTOMERTP .
  types:
   TT_ZC_09_CUSTOMERTPTYPE type standard table of TS_ZC_09_CUSTOMERTPTYPE .
  types:
   TS_ZC_09_FLIGHTTPTYPE type ZC_09_FLIGHTTP .
  types:
   TT_ZC_09_FLIGHTTPTYPE type standard table of TS_ZC_09_FLIGHTTPTYPE .
  types:
   TS_ZC_09_MEALTPTYPE type ZC_09_MEALTP .
  types:
   TT_ZC_09_MEALTPTYPE type standard table of TS_ZC_09_MEALTPTYPE .

  constants GC_ZC_09_BOOKINGTPTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ZC_09_BookingTPType' ##NO_TEXT.
  constants GC_ZC_09_CONNECTIONTPTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ZC_09_ConnectionTPType' ##NO_TEXT.
  constants GC_ZC_09_CUSTOMERTPTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ZC_09_CUSTOMERTPType' ##NO_TEXT.
  constants GC_ZC_09_FLIGHTTPTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ZC_09_FlightTPType' ##NO_TEXT.
  constants GC_ZC_09_MEALTPTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ZC_09_MEALTPType' ##NO_TEXT.

  methods DEFINE
    redefinition .
  methods GET_LAST_MODIFIED
    redefinition .
protected section.
private section.

  methods DEFINE_RDS_4
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_LAST_MODIFIED_RDS_4
    returning
      value(RV_LAST_MODIFIED_RDS) type TIMESTAMP .
ENDCLASS.



CLASS ZCL_ZC_12_CONNECTIONTP_MPC IMPLEMENTATION.


  method DEFINE.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*

model->set_schema_namespace( 'ZC_12_CONNECTIONTP_SRV' ).

define_rds_4( ).
get_last_modified_rds_4( ).
  endmethod.


  method DEFINE_RDS_4.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*
*   This code is generated for Reference Data Source
*   4
*&---------------------------------------------------------------------*
    TRY.
        if_sadl_gw_model_exposure_data~get_model_exposure( )->expose( model )->expose_vocabulary( vocab_anno_model ).
      CATCH cx_sadl_exposure_error INTO DATA(lx_sadl_exposure_error).
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_med_exception
          EXPORTING
            previous = lx_sadl_exposure_error.
    ENDTRY.
  endmethod.


  method GET_LAST_MODIFIED.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  CONSTANTS: lc_gen_date_time TYPE timestamp VALUE '20211014165207'.                  "#EC NOTEXT
 DATA: lv_rds_last_modified TYPE timestamp .
  rv_last_modified = super->get_last_modified( ).
  IF rv_last_modified LT lc_gen_date_time.
    rv_last_modified = lc_gen_date_time.
  ENDIF.
 lv_rds_last_modified =  GET_LAST_MODIFIED_RDS_4( ).
 IF rv_last_modified LT lv_rds_last_modified.
 rv_last_modified  = lv_rds_last_modified .
 ENDIF .
  endmethod.


  method GET_LAST_MODIFIED_RDS_4.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*
*   This code is generated for Reference Data Source
*   4
*&---------------------------------------------------------------------*
*    @@TYPE_SWITCH:
    CONSTANTS: co_gen_date_time TYPE timestamp VALUE '20211014165207'.
    TRY.
        rv_last_modified_rds = CAST cl_sadl_gw_model_exposure( if_sadl_gw_model_exposure_data~get_model_exposure( ) )->get_last_modified( ).
      CATCH cx_root ##CATCH_ALL.
        rv_last_modified_rds = co_gen_date_time.
    ENDTRY.
    IF rv_last_modified_rds < co_gen_date_time.
      rv_last_modified_rds = co_gen_date_time.
    ENDIF.
  endmethod.


  method IF_SADL_GW_MODEL_EXPOSURE_DATA~GET_MODEL_EXPOSURE.
    CONSTANTS: co_gen_timestamp TYPE timestamp VALUE '20211014165207'.
    DATA(lv_sadl_xml) =
               |<?xml version="1.0" encoding="utf-16"?>|  &
               |<sadl:definition xmlns:sadl="http://sap.com/sap.nw.f.sadl" syntaxVersion="" >|  &
               | <sadl:dataSource type="CDS" name="ZC_09_BOOKINGTP" binding="ZC_09_BOOKINGTP" />|  &
               | <sadl:dataSource type="CDS" name="ZC_09_CONNECTIONTP" binding="ZC_09_CONNECTIONTP" />|  &
               | <sadl:dataSource type="CDS" name="ZC_09_CUSTOMERTP" binding="ZC_09_CUSTOMERTP" />|  &
               | <sadl:dataSource type="CDS" name="ZC_09_FLIGHTTP" binding="ZC_09_FLIGHTTP" />|  &
               | <sadl:dataSource type="CDS" name="ZC_09_MEALTP" binding="ZC_09_MEALTP" />|  &
               |<sadl:resultSet>|  &
               |<sadl:structure name="ZC_09_BookingTP" dataSource="ZC_09_BOOKINGTP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_CUSTOMER" binding="_CUSTOMER" target="ZC_09_CUSTOMERTP" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_FLIGHT" binding="_FLIGHT" target="ZC_09_FlightTP" cardinality="zeroToOne" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="ZC_09_ConnectionTP" dataSource="ZC_09_CONNECTIONTP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_FLIGHT" binding="_FLIGHT" target="ZC_09_FlightTP" cardinality="zeroToMany" />|  &
               | <sadl:association name="TO_MEAL" binding="_MEAL" target="ZC_09_MEALTP" cardinality="zeroToMany" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="ZC_09_CUSTOMERTP" dataSource="ZC_09_CUSTOMERTP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_BOOKING" binding="_BOOKING" target="ZC_09_BookingTP" cardinality="zeroToMany" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="ZC_09_FlightTP" dataSource="ZC_09_FLIGHTTP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_BOOKING" binding="_BOOKING" target="ZC_09_BookingTP" cardinality="zeroToMany" />|  &
               | <sadl:association name="TO_CONNECTION" binding="_CONNECTION" target="ZC_09_ConnectionTP" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_MEAL" binding="_MEAL" target="ZC_09_MEALTP" cardinality="zeroToMany" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="ZC_09_MEALTP" dataSource="ZC_09_MEALTP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_CONNECTION" binding="_CONNECTION" target="ZC_09_ConnectionTP" cardinality="zeroToMany" />|  &
               | <sadl:association name="TO_FLIGHT" binding="_FLIGHT" target="ZC_09_FlightTP" cardinality="zeroToMany" />|  &
               |</sadl:structure>|  &
               |</sadl:resultSet>|  &
               |</sadl:definition>| .

   ro_model_exposure = cl_sadl_gw_model_exposure=>get_exposure_xml( iv_uuid      = CONV #( 'ZC_12_CONNECTIONTP' )
                                                                    iv_timestamp = co_gen_timestamp
                                                                    iv_sadl_xml  = lv_sadl_xml ).
  endmethod.
ENDCLASS.
