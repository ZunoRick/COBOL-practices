       IDENTIFICATION DIVISION.
       PROGRAM-ID.                PBAPERFO.
       AUTHOR.                    RICARDO ZUNO.
       INSTALLATION.              CENTRO DE CAPACITACION.
       DATE-WRITTEN.              18/07/2021.
       DATE-COMPILED.
       SECURITY.                  NO ES CONFIDENCIAL.
      *> ------------------------------------------------------
      *> PROGRAMA QUE PRUEBA EL USO DEL PERFORM
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
           05 WS-CONTADOR         PIC 9(02) VALUE ZEROS.
           05 WS-TOTAL            PIC 9(02).
           05 WS-SUMA             PIC 9(03) VALUE ZEROS.

       PROCEDURE DIVISION.
       010-RAIZ.
           PERFORM 010-SUMA THRU 010-FIN 5 TIMES
           DISPLAY "SUMA DEL CONTADOR: " WS-CONTADOR		
           DISPLAY " "	

           DISPLAY "TECLEE EL TOTAL"
           ACCEPT WS-TOTAL
           PERFORM 020-PROCESO THRU 020-FIN 
                   VARYING WS-CONTADOR FROM 1 BY 1
                   UNTIL   WS-CONTADOR GREATER WS-TOTAL
           DISPLAY " "
           DISPLAY "SUMA DEL CONTADOR: " WS-SUMA
           GOBACK.

       010-SUMA.
           COMPUTE WS-CONTADOR = WS-CONTADOR + 1.
       010-FIN. EXIT.

       020-PROCESO.
           DISPLAY "VALOR DEL CONTADOR: " WS-CONTADOR
           ADD WS-CONTADOR TO WS-SUMA.
       020-FIN. EXIT.

