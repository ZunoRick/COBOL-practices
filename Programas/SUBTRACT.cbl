       IDENTIFICATION DIVISION.
       PROGRAM-ID.                PROGSUBT.
       AUTHOR.                    RICARDO ZUNO.
       INSTALLATION.              CENTRO DE CAPACITACION.
       DATE-WRITTEN.              16/07/21.
       DATE-COMPILED.
       SECURITY.                  NO ES CONFIDENCIAL.
      *> ------------------------------------------------------
      *> PROGRAMA QUE PRUEBA LA SENTENCIA SUBTRACT
      *> ------------------------------------------------------

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.           IBM-3083.
       OBJECT-COMPUTER.           IBM-3083.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       01  WS-AREAS-A-USAR.		
           05 WS-CAMPO-01         PIC 9(03)   VALUE 20.
           05 WS-CAMPO-02         PIC 9(03)   VALUE 8.
           05 WS-CAMPO-03         PIC S9(03)  VALUE ZEROS.

       PROCEDURE DIVISION.
       010-RAIZ.
           DISPLAY "CAMPO-02 ANTES  : " WS-CAMPO-02
           SUBTRACT 1 FROM WS-CAMPO-02
           DISPLAY "CAMPO-02 DESPUES: " WS-CAMPO-02
           DISPLAY " "
           DISPLAY "CAMPO-01 ANTES  : " WS-CAMPO-01
           SUBTRACT WS-CAMPO-02 FROM WS-CAMPO-01
           DISPLAY "CAMPO-01 DESPUES: " WS-CAMPO-01
           DISPLAY " "
           DISPLAY "CAMPO-03 ANTES  : " WS-CAMPO-03
           SUBTRACT WS-CAMPO-01 FROM WS-CAMPO-02 GIVING WS-CAMPO-03
           DISPLAY "CAMPO 03 DESPUES: " WS-CAMPO-03.
           GOBACK.
