      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.                ALTAEMP.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.           IBM-3083.
       OBJECT-COMPUTER.           IBM-3083.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPLEADOS
           ASSIGN TO "C:\COBOL\Archivos\BD-EMPLEADOS.txt".

       DATA DIVISION.
       FILE SECTION.
       FD  EMPLEADOS
           RECORD CONTAINS 86 CHARACTERS
           BLOCK CONTAINS 0 RECORDS.
       01  REG-EMPLEADOS          PIC X(86).

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

       01  SW-FIN                 PIC X(01)     VALUE SPACES.

       LINKAGE SECTION.
       01  LK-INDEX               PIC 9(04).

       PROCEDURE DIVISION USING LK-INDEX.
       010-INICIO.
           PERFORM 020-ABRE-ARCHIVOS THRU 020-FIN
           PERFORM 030-LEE-DATOS THRU 050-FIN
                   UNTIL SW-FIN EQUAL "N"
           PERFORM 040-CIERRA-ARCHIVOS THRU 040-FIN.
           GOBACK.

       020-ABRE-ARCHIVOS.
           OPEN OUTPUT EMPLEADOS.
       020-FIN. EXIT.

       030-LEE-DATOS.
           ADD 1 TO LK-INDEX
           MOVE LK-INDEX TO WS-ID-EMP
           DISPLAY "INGRESE LOS DATOS DEL EMPLEADO:"
           DISPLAY " "
           DISPLAY "NOMBRE: "
           ACCEPT WS-NOMBRE-EMP
           DISPLAY "APELLIDO PATERNO"
           ACCEPT WS-APE-PAT-EMP
           DISPLAY "APELLIDO MATERNO"
           ACCEPT WS-APE-MAT-EMP
           DISPLAY "FECHA DE NACIMIENTO COMENZANDO POR: "
           DISPLAY "DIA (DD): "
           ACCEPT WS-DIA-NAC
           DISPLAY "MES (MM): "
           ACCEPT WS-MES-NAC
           DISPLAY "ANIO (AAAA): "
           ACCEPT WS-ANIO-NAC
           DISPLAY "CLAVE DE DEPARTAMENTO: "
           ACCEPT WS-DEPARTAMENTO
           DISPLAY "PUESTO: "
           ACCEPT WS-PUESTO
           DISPLAY "SUELDO"
           ACCEPT WS-SALARIO.

       040-VALIDA-DATOS.
           EVALUATE WS-DIA-NAC
           WHEN 01 THRU 31
              CONTINUE
           WHEN OTHER
              DISPLAY "FORMATO DE DIA INCORRECTO."
              DISPLAY " "
              GO TO 030-LEE-DATOS
           END-EVALUATE

           EVALUATE WS-MES-NAC
           WHEN 01 THRU 12
              CONTINUE
           WHEN OTHER
              DISPLAY "FORMATO DE MES INCORRECTO."
              DISPLAY " "
              GO TO 030-LEE-DATOS
           END-EVALUATE

           EVALUATE WS-ANIO-NAC
           WHEN 1961 THRU 2003
              CONTINUE
           WHEN OTHER
              DISPLAY "FORMATO DE ANIO INCORRECTO."
              DISPLAY " "
              GO TO 030-LEE-DATOS
           END-EVALUATE

           DISPLAY "¿REGISTRAR OTRO EMPLEADO? (Y/N): "
           ACCEPT SW-FIN.

       050-ESCRIBE-DATOS.
           WRITE REG-EMPLEADOS FROM WS-DATOS-EMPLEADO.
       050-FIN. EXIT.

       040-CIERRA-ARCHIVOS.
           CLOSE EMPLEADOS.
       040-FIN. EXIT.
