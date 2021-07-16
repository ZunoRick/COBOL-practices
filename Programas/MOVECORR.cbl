       IDENTIFICATION DIVISION.
       PROGRAM-ID.                PROGMOVC.
       AUTHOR.                    RICARDO ZUNO.
       INSTALLATION.              CENTRO DE CAPACITACION.
       DATE-WRITTEN.              16/07/21.
       DATE-COMPILED.
       SECURITY.                  NO ES CONFIDENCIAL.
      *> ------------------------------------------------------
      *> PROGRAMA QUE PRUEBA LA INSTRUCION MOVE CORRESPONDING
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
           05 WS-NOMBRE-NPM.
              10 WS-NOMBRE        PIC X(15) VALUE "RICARDO        ".
              10 WS-PATERNO       PIC X(15) VALUE "ZUNO           ".
              10 WS-MATERNO       PIC X(15) VALUE "SANCHEZ        ".

           05 WS-NOMBRE-PMN.
              10 WS-PATERNO       PIC X(15).
              10 WS-MATERNO       PIC X(15).
              10 WS-NOMBRE        PIC X(15).

       PROCEDURE DIVISION.
       010-RAIZ.
           MOVE CORRESPONDING WS-NOMBRE-NPM TO WS-NOMBRE-PMN
           DISPLAY "CONTENIDO DE WS-NOMBRE-PMN: " WS-NOMBRE-PMN.
           GOBACK.
