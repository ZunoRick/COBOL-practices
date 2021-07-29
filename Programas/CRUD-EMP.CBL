       IDENTIFICATION DIVISION.
       PROGRAM-ID.                CRUD-EMP.
      *     AUTHOR.                    RICARDO ZUNO.
      *     DATE-WRITTEN.              21/07/2021.

      *---------------------------------------------------------------*
      * OBJETIVO: CREAR UN SISTEMA DE ALTAS, BAJAS Y CAMBIOS APLICANDO*
      *                LO APRENDIDO DURANTE EL CURSO DE COBOL         *
      *---------------------------------------------------------------*

      *****************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-3081.
       OBJECT-COMPUTER. IBM-3081.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPLEADOS
           ASSIGN TO "C:\COBOL\Archivos\BD-EMPLEADOS.txt".

      *****************************************************************

       DATA DIVISION.
       FILE SECTION.
       FD  EMPLEADOS
           RECORD CONTAINS 86 CHARACTERS
           BLOCK CONTAINS 0 RECORDS.
       01  REG-EMPLEADOS              PIC X(86).

       WORKING-STORAGE SECTION.
       01  WS-RESPUESTA               PIC X(01).

       01  WS-INDEX                   PIC 9(04)      VALUE ZEROS.

       PROCEDURE DIVISION.
       010-INICIO.
           PERFORM 030-MUESTRA-MENU THRU 040-FIN
                   UNTIL WS-RESPUESTA EQUAL "E"
           GOBACK.

       030-MUESTRA-MENU.
           DISPLAY "TECLEE UNA OPCION: "
           DISPLAY " "
           DISPLAY "A: DAR DE ALTA A UN EMPLEADO"
           DISPLAY " "
           DISPLAY "B: DAR DE BAJA A UN EMPLEADO"
           DISPLAY " "
           DISPLAY "C: REALIZAR ALGUN CAMBIO EN LOS EMPLEADO"
           DISPLAY " "
           DISPLAY "I: IMPRIMIR LISTA DE EMPLEADOS"
           DISPLAY " "
           DISPLAY "E: SALIR DEL PROGRAMA"
           DISPLAY " "
           ACCEPT WS-RESPUESTA.

       040-EJECUTA-OPCION.
           EVALUATE WS-RESPUESTA
           WHEN "A"
                CALL "ALTAEMP"   USING WS-INDEX
           WHEN "B"
                CALL "BAJAEMP"   USING WS-INDEX
           WHEN "C"
                CALL "CAMBIOEMP" USING WS-INDEX
           WHEN "I"
                CALL "IMPRIMEMP"
                DISPLAY "EMPLEADOS IMPRESOS"
           WHEN "E"
                GOBACK
           WHEN OTHER
                DISPLAY "OPCION NO VALIDA"
                GO TO 030-MUESTRA-MENU
           END-EVALUATE.
       040-FIN. EXIT.
