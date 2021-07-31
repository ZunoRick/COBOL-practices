       IDENTIFICATION DIVISION.
       PROGRAM-ID.                PROGSORT.
      * AUTHOR.                    RICARDO ZUNO.
      * INSTALLATION.              CENTRO DE CAPACITACION.
      * DATE-WRITTEN.              30/07/21.
      * DATE-COMPILED.
      * SECURITY.                  NO ES CONFIDENCIAL.
      *> ------------------------------------------------------
      *> PROGRAMA QUE EMITE UN REPORTE DE UN ARCHIVO CLASIFICADO
      *> SE UTILIZA LA INSTRUCCION SORT CON LAS OPCIONES DE
      *> INPUT PROCEDURE Y OUTPUT PROCEDURE
      *> ------------------------------------------------------

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.           IBM-3083.
       OBJECT-COMPUTER.           IBM-3083.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPLEADOS
           ASSIGN TO "C:\COBOL\Archivos\EMPLEADO.TXT".

           SELECT REPORTE
           ASSIGN TO "C:\COBOL\Archivos\REPORTE.TXT".

           SELECT ARCHIVO-SORT
           ASSIGN TO "C:\COBOL\Archivos\REPORTE-SORT.TXT".

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

       SD  ARCHIVO-SORT
           RECORD CONTAINS 50 CHARACTERS
           DATA RECORD IS REG-SORT.
       01  REG-SORT.
           05 SORT-NUMERO-EMP     PIC 9(05).
           05 SORT-NOMBRE-EMP     PIC X(30).
           05 SORT-STATUS-EMP     PIC 9(01).
           05 SORT-DEPTO-EMP      PIC 9(03).
           05 SORT-PUESTO-EMP     PIC 9(02).
           05 SORT-SALARIO-EMP    PIC 9(07)V99.

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
           05 WS-SELECCIONADOS    PIC 9(09)    VALUE ZEROS.

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
           SORT ARCHIVO-SORT ON ASCENDING KEY
                SORT-DEPTO-EMP
                SORT-NUMERO-EMP
           INPUT  PROCEDURE 020-ORDENA  THRU 020-FIN
           OUTPUT PROCEDURE 100-IMPRIME THRU 100-FIN
           PERFORM 200-FINAL            THRU 200-FIN
           GOBACK.

       020-ORDENA.
           PERFORM 030-ABRE-ARCHIVOS THRU 030-FIN
           PERFORM 040-LEE-EMPLEADOS THRU 040-FIN
           PERFORM 040-SELECCIONA    THRU 040-FIN
                   UNTIL SW-FIN EQUAL "FIN".
       020-FIN.  EXIT.

       030-ABRE-ARCHIVOS.
           OPEN INPUT  EMPLEADOS
                OUTPUT REPORTE.
       030-FIN.  EXIT.

       040-SELECCIONA.
           IF WS-STATUS-EMP EQUAL 8
              THEN
                 RELEASE REG-SORT FROM WS-REG-EMPLEADOS
                 ADD 1 TO WS-SELECCIONADOS
              END-IF
           ADD 1 TO WS-LEIDOS-EMP.
       040-LEE-EMPLEADOS.
           READ EMPLEADOS INTO WS-REG-EMPLEADOS AT END
                MOVE "FIN" TO SW-FIN.
       040-FIN.  EXIT.

       100-IMPRIME.
           PERFORM 110-TITULOS  THRU 110-FIN
           MOVE SPACES TO SW-FIN
           PERFORM 120-LEE-SORT THRU 120-FIN
           PERFORM 120-REPORTE  THRU 120-FIN
                   UNTIL SW-FIN EQUAL "FIN".
       100-FIN.  EXIT.

       110-TITULOS.
           WRITE REG-REPORTE FROM WS-TITULO-1
           MOVE LK-DIA  TO WS-TIT-2-DIA
           MOVE LK-MES  TO WS-TIT-2-MES
           MOVE LK-ANIO TO WS-TIT-2-ANIO
           MOVE 1       TO WS-TIT-2-PAGINA
           WRITE REG-REPORTE FROM WS-TITULO-2
           WRITE REG-REPORTE FROM WS-GUIONES
           WRITE REG-REPORTE FROM WS-SUB-TITULO-1
           WRITE REG-REPORTE FROM WS-GUIONES.
       110-FIN.  EXIT.

       120-REPORTE.
           ADD WS-SALARIO-EMP     TO WS-TOT-SALARIOS
           MOVE WS-NUMERO-EMP     TO WS-DET-NUMERO
           MOVE WS-NOMBRE-EMP     TO WS-DET-NOMBRE
           MOVE WS-STATUS-EMP     TO WS-DET-STATUS
           MOVE WS-DEPTO-EMP      TO WS-DET-DEPTO
           MOVE WS-PUESTO-EMP     TO WS-DET-PUESTO
           MOVE WS-SALARIO-EMP    TO WS-DET-SALARIO
           WRITE REG-REPORTE FROM WS-DETALLE
           ADD 1 TO WS-IMPRESOS.
       120-LEE-SORT.
           RETURN ARCHIVO-SORT INTO WS-REG-EMPLEADOS AT END
                MOVE "FIN" TO SW-FIN.
       120-FIN.  EXIT.

       200-FINAL.
           MOVE WS-LEIDOS-EMP     TO WS-TOT-LEIDOS
           WRITE REG-REPORTE FROM WS-DETALLE-LEIDOS
           MOVE WS-IMPRESOS       TO WS-TOT-IMPRESOS
           WRITE REG-REPORTE FROM WS-DETALLE-IMPRESOS
           MOVE WS-TOT-SALARIOS   TO WS-DET-SALARIO2
           WRITE REG-REPORTE FROM WS-DETALLE-SALARIOS
           CLOSE EMPLEADOS REPORTE.
       200-FIN.  EXIT.
