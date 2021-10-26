*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 23.06.2018 at 14:17:15
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZEMPL_G_DATA....................................*
DATA:  BEGIN OF STATUS_ZEMPL_G_DATA                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZEMPL_G_DATA                  .
CONTROLS: TCTRL_ZEMPL_G_DATA
            TYPE TABLEVIEW USING SCREEN '0002'.
*...processing: ZEMPL_LOGALI....................................*
DATA:  BEGIN OF STATUS_ZEMPL_LOGALI                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZEMPL_LOGALI                  .
CONTROLS: TCTRL_ZEMPL_LOGALI
            TYPE TABLEVIEW USING SCREEN '0003'.
*...processing: ZEMPL_RM_STEPS..................................*
DATA:  BEGIN OF STATUS_ZEMPL_RM_STEPS                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZEMPL_RM_STEPS                .
CONTROLS: TCTRL_ZEMPL_RM_STEPS
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZEMPL_G_DATA                  .
TABLES: *ZEMPL_LOGALI                  .
TABLES: *ZEMPL_RM_STEPS                .
TABLES: ZEMPL_G_DATA                   .
TABLES: ZEMPL_LOGALI                   .
TABLES: ZEMPL_RM_STEPS                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
