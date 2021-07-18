       IDENTIFICATION DIVISION.
       PROGRAM-ID.                PROGIFEV.
       AUTHOR.                    RICARDO ZUNO.
       INSTALLATION.              CENTRO DE CAPACITACION.
       DATE-WRITTEN.              17/07/21.
       DATE-COMPILED.
       SECURITY.                  NO ES CONFIDENCIAL.
      *> ------------------------------------------------------
      *> PROGRAMA QUE HACE LO MISMO CON LAS SENTENCIAS 
      *> IF Y EVALUATE
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
           05 WS-OPCION-MENU      PIC X(01).
           05 WS-RESULTADO        PIC X(09).

       PROCEDURE DIVISION.
       010-RAIZ.
           DISPLAY "DIGITE LA OPCION"
           ACCEPT WS-OPCION-MENU

           EVALUATE WS-OPCION-MENU
             WHEN "A"
               MOVE "ALTA" TO WS-RESULTADO
             WHEN "B"
               MOVE "BAJA" TO WS-RESULTADO
             WHEN "C"
               MOVE "CAMBIO" TO WS-RESULTADO
             WHEN "1" THRU "5"
               MOVE "SIGUIENTE" TO WS-RESULTADO
             WHEN OTHER
               MOVE "ERROR" TO WS-RESULTADO
           END-EVALUATE
           DISPLAY "LA OPCION DEL MENU CON EVALUATE ES: " WS-RESULTADO

           IF WS-OPCION-MENU = "A"
           THEN
               MOVE "ALTA" TO WS-RESULTADO
           ELSE
              IF WS-OPCION-MENU = "B"
              THEN
                  MOVE "BAJA" TO WS-RESULTADO
              ELSE
                 IF WS-OPCION-MENU = "C"
                 THEN
                     MOVE "CAMBIO" TO WS-RESULTADO
                 ELSE
                    IF (WS-OPCION-MENU >= "1") AND 
                       (WS-OPCION-MENU <= "9")
                    THEN
                        MOVE "SIGUIENTE" TO WS-RESULTADO
                    ELSE
                       MOVE "ERROR" TO WS-RESULTADO
                    END-IF
                 END-IF
             END-IF
           END-IF

           DISPLAY "LA OPCION DEL MENU CON IF ES: " WS-RESULTADO.
           GOBACK.
