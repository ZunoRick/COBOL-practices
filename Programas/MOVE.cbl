       IDENTIFICATION DIVISION.
       PROGRAM-ID.                PROGMOVE.
       AUTHOR.                    RICARDO ZUNO.
       INSTALLATION.              CENTRO DE CAPACITACION.
       DATE-WRITTEN.              16/07/21.
       DATE-COMPILED.
       SECURITY.                  NO ES CONFIDENCIAL.
      *> ------------------------------------------------------
      *> PROGRAMA QUE PRUEBA LA SENTENCIA MOVE
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
           05 WS-CAMPO-01         PIC X(07) VALUE "RICARDO".
           05 WS-CAMPO-02         PIC X(08) VALUE SPACES   .

       PROCEDURE DIVISION.
       010-RAIZ.
           MOVE WS-CAMPO-01 TO WS-CAMPO-02
           DISPLAY "CONTENIDO DE CAMPO 02: " WS-CAMPO-02
           GOBACK.
