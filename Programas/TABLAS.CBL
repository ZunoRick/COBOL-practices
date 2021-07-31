       IDENTIFICATION DIVISION.
       PROGRAM-ID.                PROGTABL.
      * AUTHOR.                    RICARDO ZUNO.
      * INSTALLATION.              CENTRO DE CAPACITACION.
      * DATE-WRITTEN.              30/07/21.
      * DATE-COMPILED.
      * SECURITY.                  NO ES CONFIDENCIAL.
      *> ------------------------------------------------------
      *> PROGRAMA QUE CARGA INFORMACION EN UNA TABLA INTERNA
      *> Y DESPUES LA VACIA (3 ELEMENTOS)
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
       01  WS-TABLAS.
           05 WS-EMPLEADOS OCCURS 5 TIMES.
              10 WS-NUMERO        PIC 9(05).
              10 WS-NOMBRE        PIC X(35).
              10 WS-SALARIO       PIC 9(05)V99.

       01  WS-AREAS.
           05 WS-INDICE           PIC 9(02).

       PROCEDURE DIVISION.
       010-RAIZ.
           PERFORM 020-CARGA-TABLA THRU 020-FIN
                   VARYING WS-INDICE FROM 1 BY 1
                   UNTIL WS-INDICE GREATER 3

           PERFORM 030-VACIA-TABLA THRU 030-FIN
                   VARYING WS-INDICE FROM 1 BY 1
                   UNTIL WS-INDICE GREATER 3
           GOBACK.

       020-CARGA-TABLA.
           DISPLAY "NUMERO: "
           ACCEPT WS-NUMERO (WS-INDICE)
           DISPLAY "NOMBRE: "
           ACCEPT WS-NOMBRE (WS-INDICE)
           DISPLAY "SALARIO: "
           ACCEPT WS-SALARIO (WS-INDICE).
       020-FIN.  EXIT.

       030-VACIA-TABLA.
           DISPLAY "NUMERO: "  WS-NUMERO (WS-INDICE)
           DISPLAY "NOMBRE: "  WS-NOMBRE (WS-INDICE)
           DISPLAY "SALARIO: " WS-SALARIO (WS-INDICE)
           DISPLAY " ".
       030-FIN.  EXIT.
