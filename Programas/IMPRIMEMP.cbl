      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. IMPRIMEMP.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.           IBM-3083.
       OBJECT-COMPUTER.           IBM-3083.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPLEADOS
           ASSIGN TO "C:\COBOL\Archivos\BD-EMPLEADOS.txt".
           SELECT REPORTE
           ASSIGN TO "C:\COBOL\Archivos\REPORTE-EMPLEADOS.TXT".

       DATA DIVISION.
       FILE SECTION.
       FD  EMPLEADOS
           RECORD CONTAINS 86 CHARACTERS
           BLOCK CONTAINS 0 RECORDS.
       01  REG-EMPLEADOS          PIC X(86).

       FD  REPORTE
           RECORD CONTAINS 122 CHARACTERS
           BLOCK CONTAINS 0 RECORDS.
       01  REG-REPORTE            PIC X(122).

       WORKING-STORAGE SECTION.
       01  WS-DATOS-EMPLEADO.
           05 WS-ID-EMP           PIC 9(04).
           05 WS-NOMBRE-EMP       PIC X(20).
           05 WS-APE-PAT-EMP      PIC X(20).
           05 WS-APE-MAT-EMP      PIC X(20).
           05 WS-DIA-NAC          PIC 9(02).
           05 WS-MES-NAC          PIC 9(02).
           05 WS-ANIO-NAC         PIC 9(04).
           05 WS-DEPARTAMENTO     PIC 9(03).
           05 WS-PUESTO           PIC 9(02).
           05 WS-SALARIO          PIC 9(09).

       01  WS-TITULO-1.
           05 FILLER              PIC X(55)   VALUE SPACES.
           05 FILLER              PIC X(13)   VALUE "PRACTICA CRUD".
           05 FILLER              PIC X(54)   VALUE SPACES.

       01  WS-TITULO-2.
           05 FILLER              PIC X(01)   VALUE SPACES.
           05 FILLER              PIC X(17)   VALUE "FECHA: 23/07/2021".
           05 FILLER              PIC X(34)   VALUE SPACES.
           05 FILLER              PIC X(23)
                                  VALUE "EMPLEADOS DE LA EMPRESA".
           05 FILLER              PIC X(37)   VALUE SPACES.
           05 FILLER              PIC X(09)   VALUE "PAGINA: 1".
           05 FILLER              PIC X(01)   VALUE SPACES.

       01  WS-MARGEN.
           05 FILLER              PIC X(01)   VALUE SPACES.
           05 FILLER              PIC X(01)   VALUE "*".
           05 FILLER              PIC X(119)  VALUE ALL "-".
           05 FILLER              PIC X(01)   VALUE "*".

       01  WS-COLUMNAS.
           05 FILLER              PIC X(02)   VALUE SPACES.
           05 FILLER              PIC X(02)   VALUE "ID".
           05 FILLER              PIC X(05)   VALUE SPACES.
           05 FILLER              PIC X(06)   VALUE "NOMBRE".
           05 FILLER              PIC X(17)   VALUE SPACES.
           05 FILLER              PIC X(10)   VALUE "AP.PATERNO".
           05 FILLER              PIC X(14)   VALUE SPACES.
           05 FILLER              PIC X(10)   VALUE "AP.MATERNO".
           05 FILLER              PIC X(09)   VALUE SPACES.
           05 FILLER              PIC X(12)   VALUE "FECHA DE NAC".
           05 FILLER              PIC X(03)   VALUE SPACES.
           05 FILLER              PIC X(05)   VALUE "DEPTO".
           05 FILLER              PIC X(03)   VALUE SPACES.
           05 FILLER              PIC X(06)   VALUE "PUESTO".
           05 FILLER              PIC X(03)   VALUE SPACES.
           05 FILLER              PIC X(07)   VALUE "SALARIO".
           05 FILLER              PIC X(03)   VALUE SPACES.

       01  WS-DETALLE-EMP.
           05 FILLER              PIC X(01)   VALUE SPACES.
           05 WS-DET-ID           PIC ZZZZ9.
           05 FILLER              PIC X(03)   VALUE SPACES.
           05 WS-DET-NOMBRE       PIC X(20).
           05 FILLER              PIC X(03)   VALUE SPACES.
           05 WS-DET-AP-PAT       PIC X(20).
           05 FILLER              PIC X(04)   VALUE SPACES.
           05 WS-DET-AP-MAT       PIC X(20).
           05 FILLER              PIC X(01)   VALUE SPACES.
           05 WS-DET-DIA          PIC X(02).
           05 FILLER              PIC X(02)   VALUE "/".
           05 WS-DET-MES          PIC X(02).
           05 FILLER              PIC X(01)   VALUE "/".
           05 WS-DET-ANIO         PIC X(04).
           05 FILLER              PIC X(04)   VALUE SPACES.
           05 WS-DET-DPTO         PIC ZZ9.
           05 FILLER              PIC X(05)   VALUE SPACES.
           05 WS-DET-PUESTO       PIC Z9.
           05 FILLER              PIC X(04)   VALUE SPACES.
           05 WS-DET-SALARIO      PIC Z,ZZZ,ZZ9.99.

       05 SW-FIN              PIC X(03)    VALUE SPACES.

       PROCEDURE DIVISION.
       010-INICIO.
           PERFORM 020-ABRE-ARCHIVOS    THRU 020-FIN
           PERFORM 030-TITULOS          THRU 030-FIN
           PERFORM 040-LEE              THRU 040-FIN
           PERFORM 040-PROCESO          THRU 040-FIN
                   UNTIL SW-FIN EQUAL "FIN"
           PERFORM 050-CERRAR-ARCHIVOS  THRU 050-FIN
           GOBACK.

       020-ABRE-ARCHIVOS.
           OPEN INPUT  EMPLEADOS
                OUTPUT REPORTE.
       020-FIN. EXIT.

       030-TITULOS.
           WRITE REG-REPORTE FROM WS-TITULO-1 AFTER ADVANCING PAGE
           WRITE REG-REPORTE FROM WS-TITULO-2 AFTER ADVANCING 1
           WRITE REG-REPORTE FROM WS-MARGEN AFTER ADVANCING 1
           WRITE REG-REPORTE FROM WS-COLUMNAS AFTER ADVANCING 1
           WRITE REG-REPORTE FROM WS-MARGEN AFTER ADVANCING 1.
       030-FIN. EXIT.

       040-PROCESO.
           MOVE WS-ID-EMP        TO WS-DET-ID
           MOVE WS-NOMBRE-EMP    TO WS-DET-NOMBRE
           MOVE WS-APE-PAT-EMP   TO WS-DET-AP-PAT
           MOVE WS-APE-MAT-EMP   TO WS-DET-AP-MAT
           MOVE WS-DIA-NAC       TO WS-DET-DIA
           MOVE WS-MES-NAC       TO WS-DET-MES
           MOVE WS-ANIO-NAC      TO WS-DET-ANIO
           MOVE WS-DEPARTAMENTO  TO WS-DET-DPTO
           MOVE WS-PUESTO        TO WS-DET-PUESTO
           MOVE WS-SALARIO       TO WS-DET-SALARIO
           WRITE REG-REPORTE     FROM WS-DETALLE-EMP AFTER ADVANCING 1.

       040-LEE.
           READ EMPLEADOS INTO WS-DATOS-EMPLEADO AT END
                MOVE "FIN" TO SW-FIN.
       040-FIN. EXIT.

       050-CERRAR-ARCHIVOS.
           CLOSE EMPLEADOS
                 REPORTE.
       050-FIN. EXIT.
