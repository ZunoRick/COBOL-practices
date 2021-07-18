       IDENTIFICATION DIVISION.
       PROGRAM-ID. IF-ANIDADOS.
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01  WS-AREA-A-USAR.
           05 CAMPO-A     PIC 9(02).
           05 CAMPO-B     PIC 9(02).
           05 CAMPO-C     PIC 9(02).
           05 CAMPO-D     PIC 9(02).
           05 CAMPO-E     PIC 9(02).
           05 CAMPO-F     PIC 9(02).
           05 CAMPO-G     PIC 9(02).
           05 CAMPO-H     PIC 9(02).

       PROCEDURE DIVISION.
       010-ANIDADOS.
           IF CAMPO-A IS GREATER CAMPO-B
              IF CAMPO-E < CAMPO-F
                 PERFORM 020-CALCULO-01 THRU 020-FIN
              ELSE
                 PERFORM 030-CALCULO-02 THRU 030-FIN
              END-IF
           ELSE
              IF CAMPO-C EQUAL CAMPO-D
                 IF CAMPO-G = CAMPO-H
                    NEXT SENTENCE
                 ELSE
                    PERFORM 040-CALCULO-04 THRU 040-FIN
                 END-IF
              ELSE
                 PERFORM 050-CALCULO-03 THRU 050-FIN
              END-IF
           END-IF
           PERFORM 060-CALCULO-05 THRU 060-FIN.
           GOBACK.

       020-CALCULO-01.
       020-FIN. EXIT.

       030-CALCULO-02.
       030-FIN. EXIT.

       040-CALCULO-04.
       040-FIN. EXIT.

       050-CALCULO-03.
       050-FIN. EXIT.

       060-CALCULO-05.
       060-FIN. EXIT.
