       WORKING-STORAGE SECTION.                                         01550000
      *****************************************************             02531000
      * SQL INCLUDE FOR SQLCA (COMMUNICATIONS AREA)       *             02532102
      *****************************************************             02533000
                EXEC SQL INCLUDE SQLCA  END-EXEC.                       02534000
      *****************************************************             02535000
      * SQL DECLARATION FOR TABLE                         *             02536002
      *****************************************************             02537000
                EXEC SQL DECLARE ZBANK.ZIP TABLE                        02538001
                        (ZIP            CHAR(5)    NOT NULL,            02538101
                         STATE          CHAR(2)    NOT NULL,            02538201
                         ZIPNAME        CHAR(20)   NOT NULL,            02538301
                         LONGITUDE      CHAR(10)           ,            02538401
                         LATITUDE       CHAR(10)           ,            02538501
                         POPULATION     DECIMAL(7)         )            02538601
                         END-EXEC.                                      02540100
      *****************************************************             02540200
      * SQL CURSORS                                       *             02540300
      *****************************************************             02540400
                EXEC SQL DECLARE CUR1  CURSOR FOR                       02540700
                         SELECT * FROM ZBANK.ZIP                        02540901
                     END-EXEC.                                          02541000
      *****************************************************             02542000
      * STRUCTURE FOR CUSTOMER RECORD                     *             02543000
      *****************************************************             02544000
       01 ZIP-RECORD.                                                   02545001
          02 ZIP-I              PIC X(5).                               02546001
          02 STATE-I            PIC X(2).                               02547001
          02 ZIPNAME-I          PIC X(20).                              02548001
          02 LONGITUDE-I        PIC X(10).                              02549001
          02 LATITUDE-I         PIC X(10).                              02550001
          02 POPULATION-I       PIC 9(7).                               02560001
