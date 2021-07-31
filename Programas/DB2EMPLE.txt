      ******************************************************************
      * DCLGEN TABLE(MAESTRO_EMP)                                      *
      *        LIBRARY(IBMUSER.USER.COPYS(BDEMPLE))                    *
      *        ACTION(REPLACE)                                         *
      *        LANGUAGE(COBOL)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE MAESTRO_EMP TABLE
           ( EMP_NUM                       DECIMAL(5, 0),
             EMP_NOMBRE                    CHAR(35),
             EMP_STATUS                    DECIMAL(1, 0),
             EMP_DEPTO                     DECIMAL(3, 0) NOT NULL,
             EMP_PUESTO                    DECIMAL(2, 0) NOT NULL,
             EMP_SALARIO	           DECIMAL(9, 2)
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE MAESTRO_EMP                        *
      ******************************************************************
       01  DCLBDEMPLE.
           05 EMP_NUM         PIC 9(5)    COMP-3.
           05 EMP_NOMBRE      PIC X(35).
           05 EMP_STATUS      PIC 9(1)    COMP-3.
           05 EMP_DEPTO       PIC 9(3)    COMP-3.
           05 EMP_PUESTO      PIC 9(2)    COMP-3.
           05 EMP_SALARIO     PIC 9(7)V99 COMP-3.
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 6      *
      ******************************************************************
