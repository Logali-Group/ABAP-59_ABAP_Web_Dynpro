class ZCL_ASSIST_EMPLOYEE definition
  public
  inheriting from CL_WD_COMPONENT_ASSISTANCE
  create public .

public section.

  constants CTEXT_BUTTON_NEXT type STRING value 'Next' ##NO_TEXT.
  constants CTEXT_BUTTON_FINISH type STRING value 'Finish' ##NO_TEXT.

  methods GET_ROADMAP_INFO
    returning
      value(RS_RM_STEPS) type ZST_EMPL_ROADMAP .
  methods GET_EMPLOYEES_LIST
    returning
      value(RT_EMPLOYEES_LIST) type ZTT_EMPL_LIST .
  methods DELETE_EMPLOYEE
    importing
      !IV_PERNR type PERNR_D
    returning
      value(RV_PROCESS_OK) type ABAP_BOOL .
  methods UPDATE_EMPLOYEE
    importing
      !IS_EMPLOYEE type ZEMPL_LOGALI
    returning
      value(RV_PROCESS_OK) type ABAP_BOOL .
  methods INSERT_EMPLOYEE
    changing
      !CS_EMPLOYEE type ZEMPL_LOGALI
    returning
      value(RV_PROCESS_OK) type ABAP_BOOL .
protected section.
private section.
ENDCLASS.



CLASS ZCL_ASSIST_EMPLOYEE IMPLEMENTATION.


  METHOD delete_employee.

    DELETE FROM zempl_logali WHERE pernr EQ iv_pernr.

    IF sy-subrc EQ 0.
      rv_process_ok = abap_true.
    ENDIF.

  ENDMETHOD.


  METHOD get_employees_list.

    SELECT * FROM zempl_logali
       INTO TABLE rt_employees_list
       WHERE pernr NE space
       ORDER BY pernr DESCENDING.

  ENDMETHOD.


  METHOD get_roadmap_info.

    SELECT * FROM zempl_rm_steps
       INTO TABLE @DATA(lt_roadmap_steps)
       WHERE language EQ @sy-langu
       ORDER BY step_id ASCENDING.

    IF sy-subrc EQ 0.

      LOOP AT lt_roadmap_steps ASSIGNING FIELD-SYMBOL(<ls_roadmap_steps>).

        CASE sy-tabix.
          WHEN 1.
            rs_rm_steps-step_1_id         = <ls_roadmap_steps>-step_id.
            rs_rm_steps-step_1_desc       = <ls_roadmap_steps>-step_desc.
            rs_rm_steps-step_1_name       = <ls_roadmap_steps>-step_name.
            rs_rm_steps-step_1_enabled    = <ls_roadmap_steps>-enabled.
            rs_rm_steps-step_1_tooltip    = <ls_roadmap_steps>-tooltip.
            rs_rm_steps-step_1_visibility = <ls_roadmap_steps>-visibility.

          WHEN 2.
            rs_rm_steps-step_2_id         = <ls_roadmap_steps>-step_id.
            rs_rm_steps-step_2_desc       = <ls_roadmap_steps>-step_desc.
            rs_rm_steps-step_2_name       = <ls_roadmap_steps>-step_name.
            rs_rm_steps-step_2_enabled    = <ls_roadmap_steps>-enabled.
            rs_rm_steps-step_2_tooltip    = <ls_roadmap_steps>-tooltip.
            rs_rm_steps-step_2_visibility = <ls_roadmap_steps>-visibility.
          WHEN 3.
            rs_rm_steps-step_3_id         = <ls_roadmap_steps>-step_id.
            rs_rm_steps-step_3_desc       = <ls_roadmap_steps>-step_desc.
            rs_rm_steps-step_3_name       = <ls_roadmap_steps>-step_name.
            rs_rm_steps-step_3_enabled    = <ls_roadmap_steps>-enabled.
            rs_rm_steps-step_3_tooltip    = <ls_roadmap_steps>-tooltip.
            rs_rm_steps-step_3_visibility = <ls_roadmap_steps>-visibility.
        ENDCASE.

      ENDLOOP.

    ENDIF.

  ENDMETHOD.


  METHOD INSERT_EMPLOYEE.

      SELECT SINGLE FROM zempl_logali
             FIELDS MAX( pernr )
             INTO @DATA(lv_max_pernr).

      ADD 1 TO lv_max_pernr.
      cs_employee-pernr = lv_max_pernr.
      cs_employee-status = '1'.
      INSERT zempl_logali FROM cs_employee.

    IF sy-subrc EQ 0.
      rv_process_ok = abap_true.
    ENDIF.

  ENDMETHOD.


  METHOD UPDATE_EMPLOYEE.

    UPDATE zempl_logali FROM is_employee.

    IF sy-subrc EQ 0.
      rv_process_ok = abap_true.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
