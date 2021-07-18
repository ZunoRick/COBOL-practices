       IDENTIFICATION DIVISION.
       PROGRAM-ID.                PROGGOTD.
       AUTHOR.                    RICARDO ZUNO .
       INSTALLATION.              CENTRO DE CAPACITACION.
       DATE-WRITTEN.              17/07/21.
       DATE-COMPILED.
       SECURITY.                  NO ES CONFIDENCIAL.
      *> ------------------------------------------------------
      *> PROGRAMA QUE PRUEBA LA SENTENCIA GO TO .. DEPENDING ON
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
           05 WS-OPCION-MENU      PIC 9(01).
           05 WS-RESULTADO        PIC X(09).

       PROCEDURE DIVISION.
       000-RAIZ.
           DISPLAY "DIGITE LA OPCION"
           ACCEPT WS-OPCION-MENU
           GO TO 010-ALTA
                 020-BAJA
                 030-CAMBIO
           DEPENDING ON WS-OPCION-MENU
           DISPLAY "OPCION INVALIDA"
           GOBACK.           

       010-ALTA.
           DISPLAY "LA OPCION DEL MENU ES ALTA".
           GOBACK.

       020-BAJA.
           DISPLAY "LA OPCION DEL MENU ES BAJA".
           GOBACK.

       030-CAMBIO.
           DISPLAY "LA OPCION DEL MENU ES CAMBIO".
           GOBACK.