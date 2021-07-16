       IDENTIFICATION DIVISION.
       PROGRAM-ID.                PROGCOMP.
       AUTHOR.                    RICARDO ZUNO.
       INSTALLATION.              CENTRO DE CAPACITACION.
       DATE-WRITTEN.              16/07/21.
       DATE-COMPILED.
       SECURITY.                  NO ES CONFIDENCIAL.
      *> ------------------------------------------------------
      *> PROGRAMA QUE PRUEBA LA INSTRUCCION COMPUTE
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
           COMPUTE WS-CAMPO-03 = WS-CAMPO-01 - WS-CAMPO-02
           DISPLAY "CAMPO-03: " WS-CAMPO-03

           COMPUTE WS-CAMPO-03 = WS-CAMPO-01 * WS-CAMPO-02
           DISPLAY "CAMPO-03: " WS-CAMPO-03

           COMPUTE WS-CAMPO-03 = WS-CAMPO-02 ** 3
           DISPLAY "CAMPO-03: " WS-CAMPO-03

           COMPUTE WS-CAMPO-03 = (WS-CAMPO-01 + WS-CAMPO-02) / 4
           DISPLAY "CAMPO-03: " WS-CAMPO-03
           GOBACK.