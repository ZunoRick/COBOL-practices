       IDENTIFICATION DIVISION.
       PROGRAM-ID.                PROG0010.
      * AUTHOR.                    RICARDO ZUNO.
      * INSTALLATION.              CENTRO DE CAPACITACION.
      * DATE-WRITTEN.              17/11/16.
      * DATE-COMPILED.
      * SECURITY.                  NO ES CONFIDENCIAL.

      *---------------------------------------------------------------*
      * OBJETIVO: LEER E IMPRIMIR EL ARCHIVO DE LOS EMPLEADOS DE LA   *
      *                 EMPRESA                                       *
      *---------------------------------------------------------------*

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.           IBM-3083.
       OBJECT-COMPUTER.           IBM-3083.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPLEADOS ASSIGN TO "C:\COBOL\Archivos\EMPLEADO.TXT".
           SELECT REPORTE   ASSIGN TO "C:\COBOL\Archivos\REPORTE.TXT".

       DATA DIVISION.
       FILE SECTION.
       FD  EMPLEADOS
      *     LABEL RECORDS ARE STANDARD
           RECORD CONTAINS 50 CHARACTERS
           BLOCK CONTAINS 0 RECORDS.
      *     DATA RECORD IS REG-EMPLEADOS.
       01  REG-EMPLEADOS          PIC X(50).

       FD  REPORTE
      *     LABEL RECORDS ARE STANDARD
           RECORD CONTAINS 80 CHARACTERS
           BLOCK CONTAINS 0 RECORDS.
      *     DATA RECORD IS REG-REPORTE.
       01  REG-REPORTE            PIC X(80).

       WORKING-STORAGE SECTION.
       01  WS-AREAS-A-USAR.
           05 WS-REG-EMPLEADOS.
              10 WS-NUMERO-EMP    PIC 9(05).
              10 WS-NOMBRE-EMP    PIC X(30).
              10 WS-STATUS-EMP    PIC 9(01).
              10 WS-DEPTO-EMP     PIC 9(03).
              10 WS-PUESTO-EMP    PIC 9(02).
              10 WS-SALARIO-EMP   PIC 9(07)V99.
           05 WS-LEIDOS-EMP       PIC 9(05)    VALUE ZEROS.
           05 WS-IMPRESOS         PIC 9(05)    VALUE ZEROS.
           05 WS-TOT-SALARIOS     PIC 9(09)V99 VALUE ZEROS.
           05 SW-FIN              PIC X(03)    VALUE SPACES.

       01  WS-TITULO-1.
           05 FILLER              PIC X(27)    VALUE SPACES.
           05 WS-TIT-1            PIC X(22)
                                  VALUE "CENTRO DE CAPACITACION".
           05 FILLER              PIC X(31)    VALUE SPACES.

       01  WS-TITULO-2.
           05 FILLER              PIC X(08)    VALUE " FECHA: ".
           05 WS-TIT-2-DIA        PIC 9(02).
           05 FILLER              PIC X(01)    VALUE "/".
           05 WS-TIT-2-MES        PIC 9(02).
           05 FILLER              PIC X(01)    VALUE "/".
           05 WS-TIT-2-ANIO       PIC 9(04).
           05 FILLER              PIC X(09)    VALUE SPACES.
           05 WS-TIT-2            PIC X(23)
                                  VALUE "EMPLEADOS DE LA EMPRESA".
           05 FILLER              PIC X(17)    VALUE SPACES.
           05 FILLER              PIC X(08)    VALUE "PAGINA: ".
           05 WS-TIT-2-PAGINA     PIC ZZ9.
           05 FILLER              PIC X(02)    VALUE SPACES.

       01  WS-GUIONES.
           05 FILLER              PIC X(01).
           05 FILLER              PIC X(78)    VALUE ALL "-".
           05 FILLER              PIC X(01)    VALUE SPACES.

       01  WS-SUB-TITULO-1.
           05 FILLER              PIC X(04)    VALUE SPACES.
           05 FILLER              PIC X(06)    VALUE "NUMERO".
           05 FILLER              PIC X(12)    VALUE SPACES.
           05 FILLER              PIC X(06)    VALUE "NOMBRE".
           05 FILLER              PIC X(15)    VALUE SPACES.
           05 FILLER              PIC X(06)    VALUE "STATUS".
           05 FILLER              PIC X(02)    VALUE SPACES.
           05 FILLER              PIC X(05)    VALUE "DEPTO".
           05 FILLER              PIC X(01)    VALUE SPACES.
           05 FILLER              PIC X(06)    VALUE "PUESTO".
           05 FILLER              PIC X(04)    VALUE SPACES.
           05 FILLER              PIC X(07)    VALUE "SALARIO".
           05 FILLER              PIC X(06)    VALUE SPACES.
       01  WS-DETALLE.
           05 FILLER              PIC X(04)    VALUE SPACES.
           05 WS-DET-NUMERO       PIC ZZZZ9.
           05 FILLER              PIC X(04)    VALUE SPACES.
           05 WS-DET-NOMBRE       PIC X(30).
           05 FILLER              PIC X(04)    VALUE SPACES.
           05 WS-DET-STATUS       PIC 9(01).
           05 FILLER              PIC X(04)    VALUE SPACES.
           05 WS-DET-DEPTO        PIC 9(03).
           05 FILLER              PIC X(04)    VALUE SPACES.
           05 WS-DET-PUESTO       PIC 9(02).
           05 FILLER              PIC X(03)    VALUE SPACES.
           05 WS-DET-SALARIO      PIC Z,ZZZ,ZZ9.99.
           05 FILLER              PIC X(04)    VALUE SPACES.

       01  WS-DETALLE-LEIDOS.
           05 FILLER              PIC X(01).
           05 FILLER              PIC X(29)
                                  VALUE "TOTAL DE EMPLEADOS LEIDOS  : ".
           05 WS-TOT-LEIDOS       PIC ZZ,ZZ9.
           05 FILLER              PIC X(44)    VALUE SPACES.

       01  WS-DETALLE-IMPRESOS.
           05 FILLER              PIC X(01).
           05 FILLER              PIC X(29)
                                  VALUE "TOTAL DE EMPLEADOS IMPRESOS: ".
           05 WS-TOT-IMPRESOS     PIC ZZ,ZZ9.
           05 FILLER              PIC X(44)    VALUE SPACES.

       01  WS-DETALLE-SALARIOS.
           05 FILLER              PIC X(01).
           05 FILLER              PIC X(29)
                                  VALUE "SUMA TOTAL DE SALARIOS    : ".
           05 WS-DET-SALARIO2     PIC $$$,$$$,$$9.99.
           05 FILLER              PIC X(36)    VALUE SPACES.

      * LINKAGE SECTION.
       01  LK-FECHA.
           05 FILLER              PIC X(02).
           05 LK-DIA              PIC 9(02)   VALUE 12.
           05 LK-MES              PIC 9(02)   VALUE 07.
           05 LK-ANIO             PIC 9(04)   VALUE 2021.

       PROCEDURE DIVISION.
       010-INICIO.
           PERFORM 020-ABRE-ARCHIVOS THRU 020-FIN
           PERFORM 030-TITULOS       THRU 030-FIN
           PERFORM 040-LEE           THRU 040-FIN
           PERFORM 040-PROCESO       THRU 040-FIN
                   UNTIL SW-FIN EQUAL "FIN"
           PERFORM  050-FINAL        THRU 050-FIN
           GOBACK.
            
       020-ABRE-ARCHIVOS.
           OPEN INPUT  EMPLEADOS
                OUTPUT REPORTE.
       020-FIN. EXIT.
       
       030-TITULOS.
           WRITE REG-REPORTE FROM WS-TITULO-1 AFTER ADVANCING PAGE
           MOVE LK-DIA  TO WS-TIT-2-DIA
           MOVE LK-MES  TO WS-TIT-2-MES
           MOVE LK-ANIO TO WS-TIT-2-ANIO
           MOVE 1       TO WS-TIT-2-PAGINA
           WRITE REG-REPORTE FROM WS-TITULO-2 AFTER ADVANCING 1
           WRITE REG-REPORTE FROM WS-GUIONES AFTER ADVANCING 1
           WRITE REG-REPORTE FROM WS-SUB-TITULO-1 AFTER ADVANCING 1
           WRITE REG-REPORTE FROM WS-GUIONES AFTER ADVANCING 1.
       030-FIN. EXIT.

       040-PROCESO.
           ADD 1                  TO WS-LEIDOS-EMP
           ADD WS-SALARIO-EMP     TO WS-TOT-SALARIOS
           MOVE WS-NUMERO-EMP     TO WS-DET-NUMERO
           MOVE WS-NOMBRE-EMP     TO WS-DET-NOMBRE
           MOVE WS-STATUS-EMP     TO WS-DET-STATUS
           MOVE WS-DEPTO-EMP      TO WS-DET-DEPTO
           MOVE WS-PUESTO-EMP     TO WS-DET-PUESTO
           MOVE WS-SALARIO-EMP    TO WS-DET-SALARIO
           WRITE REG-REPORTE FROM WS-DETALLE AFTER ADVANCING 1
           ADD 1 TO WS-IMPRESOS.

       040-LEE.
           READ EMPLEADOS INTO WS-REG-EMPLEADOS AT END
                MOVE "FIN" TO SW-FIN.
       040-FIN. EXIT. 

       050-FINAL.
           MOVE WS-LEIDOS-EMP     TO WS-TOT-LEIDOS
           WRITE REG-REPORTE FROM WS-DETALLE-LEIDOS AFTER ADVANCING 2
           MOVE WS-IMPRESOS       TO WS-TOT-IMPRESOS
           WRITE REG-REPORTE FROM WS-DETALLE-IMPRESOS AFTER ADVANCING 1
           MOVE WS-TOT-SALARIOS   TO WS-DET-SALARIO2
           WRITE REG-REPORTE FROM WS-DETALLE-SALARIOS AFTER ADVANCING 1
           CLOSE EMPLEADOS
                 REPORTE.
       050-FIN. EXIT.
