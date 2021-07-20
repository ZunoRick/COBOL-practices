       IDENTIFICATION DIVISION.
       PROGRAM-ID.                PROGESTR.
       AUTHOR.                    RICARDO ZUNO.
       INSTALLATION.              CENTRO DE CAPACITACION.
       DATE-WRITTEN.              20/07/2021.
       DATE-COMPILED.
       SECURITY.                  NO ES CONFIDENCIAL.
      *> ------------------------------------------------------
      *> PROGRAMA PARA LA PRUEBA DE PROGRAMACION ESTRUCTURADA
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
           05 WS-SUMA             PIC 9(05) VALUE ZEROS.
           05 WS-NUMERO           PIC 9(03) VALUE 999.

       PROCEDURE DIVISION.
       010-RAIZ.
           PERFORM 100-LEE-NUMEROS   THRU 100-FIN
           PERFORM 100-PROCESO       THRU 100-FIN
                   UNTIL WS-NUMERO EQUAL ZEROS
           DISPLAY "SUMA DE NUMEROS: " WS-SUMA		
           GOBACK.

       100-PROCESO.
           PERFORM 200-REALIZA-CALCULO THRU 200-FIN.
       100-LEE-NUMEROS.
           DISPLAY "DIGITE EL NUMERO: "
           ACCEPT WS-NUMERO.
       100-FIN. EXIT.

       200-REALIZA-CALCULO.
           COMPUTE WS-SUMA = WS-SUMA + WS-NUMERO.
       200-FIN.  EXIT.