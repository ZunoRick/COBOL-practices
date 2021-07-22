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
      *****************************************************************

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       01  WS-INDEX               PIC 9(04)      VALUE ZEROS.

       PROCEDURE DIVISION.
       010-INICIO.
           CALL "ALTAEMP" USING WS-INDEX.
           GOBACK.
