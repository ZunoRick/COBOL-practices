       IDENTIFICATION DIVISION.
       PROGRAM-ID.                PROGACDI.
      * AUTHOR.                    FERNANDO TOLEDO.
      * INSTALLATION.              CENTRO DE CAPACITACION.
      * DATE-WRITTEN.              17/11/16.
      * DATE-COMPILED.
      * SECURITY.                  NO ES CONFIDENCIAL.
      *> ------------------------------------------------------
      *> PROGRAMA QUE INTERACTUA CON EL USUARIO
      *> PRUEBA DE LA INSTRUCCION DISPLAY Y ACCEPT Y
      *> PRUEBA DE LOS DIVERSOS ACCEPT'S PARA MANEJO DE FECHAS
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
           05 WS-CUENTA           PIC 9(05).
           05 WS-FECHA.
              10 WS-FECHA-ANIO    PIC 9(02).
              10 WS-FECHA-MES     PIC 9(02).
              10 WS-FECHA-DIA     PIC 9(02).
           05 WS-DIAS-TRANSCURRIDOS.
              10 WS-ANIO          PIC 9(02).
              10 WS-DIAS          PIC 9(03).
           05 WS-DIA-SEMANA       PIC 9(01).
           05 WS-HORA.
              10 WS-HORA-HH       PIC 9(02).
              10 WS-HORA-MM       PIC 9(02).
              10 WS-HORA-SS       PIC 9(02).
              10 WS-HORA-FF       PIC 9(02).

       PROCEDURE DIVISION.
       010-RAIZ.
           DISPLAY "TECLEE EL NUMERO DE CUENTA:"
           ACCEPT WS-CUENTA
           DISPLAY "LA CUENTA ES: " WS-CUENTA
           DISPLAY " "
           ACCEPT WS-FECHA FROM DATE
           DISPLAY "LA FECHA DEL DIA ES: 20" WS-FECHA-ANIO "/"
                   WS-FECHA-MES "/" WS-FECHA-DIA
           DISPLAY " "
           ACCEPT WS-DIAS-TRANSCURRIDOS FROM DAY
           DISPLAY "LOS DIAS TRANSCURRIDOS SON: " WS-DIAS-TRANSCURRIDOS
           DISPLAY " "
           ACCEPT WS-DIA-SEMANA FROM DAY-OF-WEEK
           DISPLAY "EL DIA DE LA SEMANA ES: " WS-DIA-SEMANA
           DISPLAY " "
           ACCEPT WS-HORA FROM TIME
           DISPLAY "LA HORA DEL DIA ES: " WS-HORA-HH ":" WS-HORA-MM ":"
                    WS-HORA-SS ":" WS-HORA-FF.
           GOBACK.
