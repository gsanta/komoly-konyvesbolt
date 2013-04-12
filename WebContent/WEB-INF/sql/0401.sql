CREATE ROLE fogyaszto;
GRANT latogato TO fogyaszto;

GRANT INSERT, UPDATE ON hosszaszolasok TO fogyaszto;
GRANT SELECT, INSERT ON megrendeles;

GRANT SELECT ON konyvek TO latogato;
GRANT SELECT ON hozzaszolasok TO latogato;

GRANT latogato TO nevtelen;

--------------------------------------------------------
--  File created - h�tf�-�prilis-01-2013   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ADMIN
--------------------------------------------------------

  CREATE TABLE "ROOT"."ADMIN" 
   (	"ADMIN_ID" NUMBER, 
	"NEV" VARCHAR2(30 BYTE), 
	"PASSWORD" VARCHAR2(200 BYTE), 
	"BOLT_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BOLT
--------------------------------------------------------

  CREATE TABLE "ROOT"."BOLT" 
   (	"BOLT_ID" NUMBER, 
	"NEV" VARCHAR2(200 BYTE), 
	"CIM" VARCHAR2(200 BYTE), 
	"TELSZAM" VARCHAR2(20 BYTE), 
	"KAPCSOLAT" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CIMEK
--------------------------------------------------------

  CREATE TABLE "ROOT"."CIMEK" 
   (	"CIM_ID" NUMBER, 
	"IRSZ" NUMBER, 
	"UTCA" VARCHAR2(100 BYTE), 
	"HAZSZAM" NUMBER, 
	"USER_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FILM
--------------------------------------------------------

  CREATE TABLE "ROOT"."FILM" 
   (	"FILM_ID" NUMBER, 
	"CIM" VARCHAR2(100 BYTE), 
	"RENDEZO" VARCHAR2(200 BYTE), 
	"HOSSZ" NUMBER, 
	"KIADO_ID" NUMBER, 
	"MUFAJ_ID" NUMBER, 
	"ADATHORDOZO" NUMBER, 
	"MEGJELENES" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table IRANYITOSZAM
--------------------------------------------------------

  CREATE TABLE "ROOT"."IRANYITOSZAM" 
   (	"IRSZ" NUMBER, 
	"TELEPULES" VARCHAR2(40 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table KIADO
--------------------------------------------------------

  CREATE TABLE "ROOT"."KIADO" 
   (	"KIADO_ID" NUMBER, 
	"NEV" VARCHAR2(200 BYTE), 
	"CIM" VARCHAR2(200 BYTE), 
	"TELSZAM" VARCHAR2(20 BYTE), 
	"KAPCSOLAT" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table KONYV
--------------------------------------------------------

  CREATE TABLE "ROOT"."KONYV" 
   (	"KONYV_ID" NUMBER, 
	"CIM" VARCHAR2(200 BYTE), 
	"ADDED" DATE, 
	"PRICE" NUMBER, 
	"KIADO_ID" NUMBER, 
	"MUFAJ_ID" NUMBER, 
	"OLDALSZAM" NUMBER, 
	"KOTES" VARCHAR2(200 BYTE), 
	"MERET" VARCHAR2(200 BYTE), 
	"ISEBOOK" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table KONYV_HOL
--------------------------------------------------------

  CREATE TABLE "ROOT"."KONYV_HOL" 
   (	"KONYV_ID" NUMBER, 
	"BOLT_ID" NUMBER, 
	"DARAB" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MUFAJOK
--------------------------------------------------------

  CREATE TABLE "ROOT"."MUFAJOK" 
   (	"MUFAJ_ID" NUMBER, 
	"MUFAJNEV" VARCHAR2(50 BYTE), 
	"SZULO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

  CREATE TABLE "ROOT"."REVIEW" 
   (	"USER_ID" NUMBER, 
	"KONYV_ID" NUMBER, 
	"REVIEW" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SZERZOK
--------------------------------------------------------

  CREATE TABLE "ROOT"."SZERZOK" 
   (	"KONYV_ID" NUMBER, 
	"SZERZO" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "ROOT"."USERS" 
   (	"USER_ID" NUMBER, 
	"NEV" VARCHAR2(200 BYTE), 
	"EMAIL" VARCHAR2(100 BYTE), 
	"PASSWORD" VARCHAR2(32 BYTE), 
	"ORDERED_NUM" NUMBER, 
	"ISTORZSVASARLO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table VASARLASOK
--------------------------------------------------------

  CREATE TABLE "ROOT"."VASARLASOK" 
   (	"VASARLAS_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"KONYV_ID" NUMBER, 
	"IRSZ" NUMBER, 
	"HAZSZAM" VARCHAR2(20 BYTE), 
	"BOLT_ID" NUMBER, 
	"MEGJEGYZES" VARCHAR2(2000 BYTE), 
	"DB" NUMBER, 
	"DATUM" DATE, 
	"AR" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ZENE
--------------------------------------------------------

  CREATE TABLE "ROOT"."ZENE" 
   (	"ZENE_ID" NUMBER, 
	"CIM" VARCHAR2(200 BYTE), 
	"ELOADO" VARCHAR2(200 BYTE), 
	"HOSSZ" NUMBER, 
	"KIADO_ID" NUMBER, 
	"MEGJELENES" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into ROOT.ADMIN
SET DEFINE OFF;
Insert into ROOT.ADMIN (ADMIN_ID,NEV,PASSWORD,BOLT_ID) values ('1','admin','aadmin1','1');
REM INSERTING into ROOT.BOLT
SET DEFINE OFF;
Insert into ROOT.BOLT (BOLT_ID,NEV,CIM,TELSZAM,KAPCSOLAT) values ('1','KoMoly Buda�rs','1221 Budapest, Frenk utca 10','0612345678','www.komolybp.hu');
Insert into ROOT.BOLT (BOLT_ID,NEV,CIM,TELSZAM,KAPCSOLAT) values ('2','KoMoly Telephely','5600 B�k�scsaba Frenk utca 2','0666555222','www.komoly.hu');
REM INSERTING into ROOT.CIMEK
SET DEFINE OFF;
Insert into ROOT.CIMEK (CIM_ID,IRSZ,UTCA,HAZSZAM,USER_ID) values ('1','5600','De�k Ferenc','2','1');
Insert into ROOT.CIMEK (CIM_ID,IRSZ,UTCA,HAZSZAM,USER_ID) values ('2','5600','Ha�n Lajos','4','2');
REM INSERTING into ROOT.FILM
SET DEFINE OFF;
Insert into ROOT.FILM (FILM_ID,CIM,RENDEZO,HOSSZ,KIADO_ID,MUFAJ_ID,ADATHORDOZO,MEGJELENES) values ('1','vdsksg','Fos Imre','223','1','2','3',to_date('10-JAN.  -01','RR-MON-DD'));
REM INSERTING into ROOT.IRANYITOSZAM
SET DEFINE OFF;
Insert into ROOT.IRANYITOSZAM (IRSZ,TELEPULES) values ('5600','B�k�scsaba');
Insert into ROOT.IRANYITOSZAM (IRSZ,TELEPULES) values ('1122','Budapest');
Insert into ROOT.IRANYITOSZAM (IRSZ,TELEPULES) values ('3698','Kutyar�cs�ge');
REM INSERTING into ROOT.KIADO
SET DEFINE OFF;
Insert into ROOT.KIADO (KIADO_ID,NEV,CIM,TELSZAM,KAPCSOLAT) values ('1','KoMoly','1111 Budapest, Kis utca 5','0615558889','www.komoly.hu');
Insert into ROOT.KIADO (KIADO_ID,NEV,CIM,TELSZAM,KAPCSOLAT) values ('2','KoRom','valami cim','232','www.fos.hu');
REM INSERTING into ROOT.KONYV
SET DEFINE OFF;
Insert into ROOT.KONYV (KONYV_ID,CIM,ADDED,PRICE,KIADO_ID,MUFAJ_ID,OLDALSZAM,KOTES,MERET,ISEBOOK) values ('1','P�l utcai gyilkosok',to_date('04-SZEPT.-29','RR-MON-DD'),'500','1','3','2500','lev�l','10x50x90','0');
Insert into ROOT.KONYV (KONYV_ID,CIM,ADDED,PRICE,KIADO_ID,MUFAJ_ID,OLDALSZAM,KOTES,MERET,ISEBOOK) values ('2','Makiriaszt�k',to_date('13-�PR.  -01','RR-MON-DD'),'2500','2','1','225','rossz','30x30x2','0');
REM INSERTING into ROOT.KONYV_HOL
SET DEFINE OFF;
Insert into ROOT.KONYV_HOL (KONYV_ID,BOLT_ID,DARAB) values ('1','1','2');
Insert into ROOT.KONYV_HOL (KONYV_ID,BOLT_ID,DARAB) values ('1','2','30');
Insert into ROOT.KONYV_HOL (KONYV_ID,BOLT_ID,DARAB) values ('2','1','3');
Insert into ROOT.KONYV_HOL (KONYV_ID,BOLT_ID,DARAB) values ('2','2','10');
REM INSERTING into ROOT.MUFAJOK
SET DEFINE OFF;
Insert into ROOT.MUFAJOK (MUFAJ_ID,MUFAJNEV,SZULO) values ('1','Dr�ma','0');
Insert into ROOT.MUFAJOK (MUFAJ_ID,MUFAJNEV,SZULO) values ('2','Melodr�ma','1');
Insert into ROOT.MUFAJOK (MUFAJ_ID,MUFAJNEV,SZULO) values ('3','V�gj�t�k','0');
Insert into ROOT.MUFAJOK (MUFAJ_ID,MUFAJNEV,SZULO) values ('4','Trag�dia','1');
Insert into ROOT.MUFAJOK (MUFAJ_ID,MUFAJNEV,SZULO) values ('5','Kuty�s','3');
REM INSERTING into ROOT.REVIEW
SET DEFINE OFF;
Insert into ROOT.REVIEW (USER_ID,KONYV_ID,REVIEW) values ('1','1','nagon j���');
Insert into ROOT.REVIEW (USER_ID,KONYV_ID,REVIEW) values ('2','2','ultrag�zz');
REM INSERTING into ROOT.SZERZOK
SET DEFINE OFF;
Insert into ROOT.SZERZOK (KONYV_ID,SZERZO) values ('1','Kov�cs Ferenc');
Insert into ROOT.SZERZOK (KONYV_ID,SZERZO) values ('2','Hans Truman');
Insert into ROOT.SZERZOK (KONYV_ID,SZERZO) values ('2','Johny Depp');
REM INSERTING into ROOT.USERS
SET DEFINE OFF;
Insert into ROOT.USERS (USER_ID,NEV,EMAIL,PASSWORD,ORDERED_NUM,ISTORZSVASARLO) values ('1','P�ter Ferenc','peti@feri.hu','11223','0','0');
Insert into ROOT.USERS (USER_ID,NEV,EMAIL,PASSWORD,ORDERED_NUM,ISTORZSVASARLO) values ('2','Kis J�zsef','kjozsi@gmail.com','123456','100','1');
REM INSERTING into ROOT.VASARLASOK
SET DEFINE OFF;
Insert into ROOT.VASARLASOK (VASARLAS_ID,USER_ID,KONYV_ID,IRSZ,HAZSZAM,BOLT_ID,MEGJEGYZES,DB,DATUM,AR) values ('1','1','2','5600','fos utca 4','1','mindenzsir','1',to_date('13-�PR.  -01','RR-MON-DD'),'1000');
Insert into ROOT.VASARLASOK (VASARLAS_ID,USER_ID,KONYV_ID,IRSZ,HAZSZAM,BOLT_ID,MEGJEGYZES,DB,DATUM,AR) values ('2','1','1','5600','De�kt 4','2','jjoo','2',to_date('13-�PR.  -02','RR-MON-DD'),'2000');
REM INSERTING into ROOT.ZENE
SET DEFINE OFF;
Insert into ROOT.ZENE (ZENE_ID,CIM,ELOADO,HOSSZ,KIADO_ID,MEGJELENES) values ('1','Living Things','Linkin Park','85','1',to_date('13-�PR.  -01','RR-MON-DD'));
Insert into ROOT.ZENE (ZENE_ID,CIM,ELOADO,HOSSZ,KIADO_ID,MEGJELENES) values ('2','Nemesis','Stratovarius','120','2',to_date('13-FEBR. -01','RR-MON-DD'));
--------------------------------------------------------
--  DDL for Index ADMIN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."ADMIN_PK" ON "ROOT"."ADMIN" ("ADMIN_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BOLT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."BOLT_PK" ON "ROOT"."BOLT" ("BOLT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CIMEK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."CIMEK_PK" ON "ROOT"."CIMEK" ("CIM_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CIMEK_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."CIMEK_UK1" ON "ROOT"."CIMEK" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FILM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."FILM_PK" ON "ROOT"."FILM" ("FILM_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IRANYITOSZAM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."IRANYITOSZAM_PK" ON "ROOT"."IRANYITOSZAM" ("IRSZ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index KIADO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."KIADO_PK" ON "ROOT"."KIADO" ("KIADO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index KONYV_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."KONYV_PK" ON "ROOT"."KONYV" ("KONYV_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index KONYV_HOL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."KONYV_HOL_PK" ON "ROOT"."KONYV_HOL" ("KONYV_ID", "BOLT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MUFAJOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."MUFAJOK_PK" ON "ROOT"."MUFAJOK" ("MUFAJ_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index REVIEW_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."REVIEW_PK" ON "ROOT"."REVIEW" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SZERZOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."SZERZOK_PK" ON "ROOT"."SZERZOK" ("KONYV_ID", "SZERZO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index USERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."USERS_PK" ON "ROOT"."USERS" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index VASARLASOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."VASARLASOK_PK" ON "ROOT"."VASARLASOK" ("VASARLAS_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ADMIN
--------------------------------------------------------

  ALTER TABLE "ROOT"."ADMIN" ADD CONSTRAINT "ADMIN_PK" PRIMARY KEY ("ADMIN_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."ADMIN" MODIFY ("ADMIN_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOLT
--------------------------------------------------------

  ALTER TABLE "ROOT"."BOLT" ADD CONSTRAINT "BOLT_PK" PRIMARY KEY ("BOLT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."BOLT" MODIFY ("BOLT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CIMEK
--------------------------------------------------------

  ALTER TABLE "ROOT"."CIMEK" ADD CONSTRAINT "CIMEK_PK" PRIMARY KEY ("CIM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."CIMEK" ADD CONSTRAINT "CIMEK_UK1" UNIQUE ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."CIMEK" MODIFY ("CIM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FILM
--------------------------------------------------------

  ALTER TABLE "ROOT"."FILM" ADD CONSTRAINT "FILM_PK" PRIMARY KEY ("FILM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."FILM" MODIFY ("FILM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table IRANYITOSZAM
--------------------------------------------------------

  ALTER TABLE "ROOT"."IRANYITOSZAM" ADD CONSTRAINT "IRANYITOSZAM_PK" PRIMARY KEY ("IRSZ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."IRANYITOSZAM" MODIFY ("IRSZ" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KIADO
--------------------------------------------------------

  ALTER TABLE "ROOT"."KIADO" ADD CONSTRAINT "KIADO_PK" PRIMARY KEY ("KIADO_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."KIADO" MODIFY ("KIADO_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KONYV
--------------------------------------------------------

  ALTER TABLE "ROOT"."KONYV" ADD CONSTRAINT "KONYV_PK" PRIMARY KEY ("KONYV_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."KONYV" MODIFY ("KONYV_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KONYV_HOL
--------------------------------------------------------

  ALTER TABLE "ROOT"."KONYV_HOL" ADD CONSTRAINT "KONYV_HOL_PK" PRIMARY KEY ("KONYV_ID", "BOLT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."KONYV_HOL" MODIFY ("KONYV_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ROOT"."KONYV_HOL" MODIFY ("BOLT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MUFAJOK
--------------------------------------------------------

  ALTER TABLE "ROOT"."MUFAJOK" ADD CONSTRAINT "MUFAJOK_PK" PRIMARY KEY ("MUFAJ_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."MUFAJOK" MODIFY ("MUFAJ_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "ROOT"."REVIEW" ADD CONSTRAINT "REVIEW_PK" PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."REVIEW" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SZERZOK
--------------------------------------------------------

  ALTER TABLE "ROOT"."SZERZOK" MODIFY ("KONYV_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ROOT"."SZERZOK" MODIFY ("SZERZO" NOT NULL ENABLE);
 
  ALTER TABLE "ROOT"."SZERZOK" ADD CONSTRAINT "SZERZOK_PK" PRIMARY KEY ("KONYV_ID", "SZERZO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "ROOT"."USERS" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ROOT"."USERS" ADD CONSTRAINT "USERS_PK" PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table VASARLASOK
--------------------------------------------------------

  ALTER TABLE "ROOT"."VASARLASOK" MODIFY ("VASARLAS_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ROOT"."VASARLASOK" ADD CONSTRAINT "VASARLASOK_PK" PRIMARY KEY ("VASARLAS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ADMIN
--------------------------------------------------------

  ALTER TABLE "ROOT"."ADMIN" ADD CONSTRAINT "ADMIN_BOLT_FK1" FOREIGN KEY ("ADMIN_ID")
	  REFERENCES "ROOT"."BOLT" ("BOLT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CIMEK
--------------------------------------------------------

  ALTER TABLE "ROOT"."CIMEK" ADD CONSTRAINT "CIMEK_IRANYITOSZAM_FK1" FOREIGN KEY ("IRSZ")
	  REFERENCES "ROOT"."IRANYITOSZAM" ("IRSZ") ENABLE;
 
  ALTER TABLE "ROOT"."CIMEK" ADD CONSTRAINT "CIMEK_USERS_FK1" FOREIGN KEY ("USER_ID")
	  REFERENCES "ROOT"."USERS" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FILM
--------------------------------------------------------

  ALTER TABLE "ROOT"."FILM" ADD CONSTRAINT "FILM_KIADO_FK1" FOREIGN KEY ("KIADO_ID")
	  REFERENCES "ROOT"."KIADO" ("KIADO_ID") ENABLE;
 
  ALTER TABLE "ROOT"."FILM" ADD CONSTRAINT "FILM_MUFAJOK_FK1" FOREIGN KEY ("MUFAJ_ID")
	  REFERENCES "ROOT"."MUFAJOK" ("MUFAJ_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KONYV
--------------------------------------------------------

  ALTER TABLE "ROOT"."KONYV" ADD CONSTRAINT "KONYV_KIADO_FK1" FOREIGN KEY ("KIADO_ID")
	  REFERENCES "ROOT"."KIADO" ("KIADO_ID") ENABLE;
 
  ALTER TABLE "ROOT"."KONYV" ADD CONSTRAINT "KONYV_MUFAJOK_FK1" FOREIGN KEY ("MUFAJ_ID")
	  REFERENCES "ROOT"."MUFAJOK" ("MUFAJ_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KONYV_HOL
--------------------------------------------------------

  ALTER TABLE "ROOT"."KONYV_HOL" ADD CONSTRAINT "KONYV_HOL_BOLT_FK1" FOREIGN KEY ("BOLT_ID")
	  REFERENCES "ROOT"."BOLT" ("BOLT_ID") ENABLE;
 
  ALTER TABLE "ROOT"."KONYV_HOL" ADD CONSTRAINT "KONYV_HOL_KONYV_FK1" FOREIGN KEY ("KONYV_ID")
	  REFERENCES "ROOT"."KONYV" ("KONYV_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "ROOT"."REVIEW" ADD CONSTRAINT "REVIEW_KONYV_FK1" FOREIGN KEY ("KONYV_ID")
	  REFERENCES "ROOT"."KONYV" ("KONYV_ID") ENABLE;
 
  ALTER TABLE "ROOT"."REVIEW" ADD CONSTRAINT "REVIEW_USERS_FK1" FOREIGN KEY ("USER_ID")
	  REFERENCES "ROOT"."USERS" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SZERZOK
--------------------------------------------------------

  ALTER TABLE "ROOT"."SZERZOK" ADD CONSTRAINT "SZERZOK_KONYV_FK1" FOREIGN KEY ("KONYV_ID")
	  REFERENCES "ROOT"."KONYV" ("KONYV_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table VASARLASOK
--------------------------------------------------------

  ALTER TABLE "ROOT"."VASARLASOK" ADD CONSTRAINT "VASARLASOK_BOLT_FK1" FOREIGN KEY ("BOLT_ID")
	  REFERENCES "ROOT"."BOLT" ("BOLT_ID") ENABLE;
 
  ALTER TABLE "ROOT"."VASARLASOK" ADD CONSTRAINT "VASARLASOK_IRANYITOSZAM_FK1" FOREIGN KEY ("IRSZ")
	  REFERENCES "ROOT"."IRANYITOSZAM" ("IRSZ") ENABLE;
 
  ALTER TABLE "ROOT"."VASARLASOK" ADD CONSTRAINT "VASARLASOK_KONYV_FK1" FOREIGN KEY ("KONYV_ID")
	  REFERENCES "ROOT"."KONYV" ("KONYV_ID") ENABLE;
 
  ALTER TABLE "ROOT"."VASARLASOK" ADD CONSTRAINT "VASARLASOK_USERS_FK1" FOREIGN KEY ("USER_ID")
	  REFERENCES "ROOT"."USERS" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ZENE
--------------------------------------------------------

  ALTER TABLE "ROOT"."ZENE" ADD CONSTRAINT "ZENE_KIADO_FK1" FOREIGN KEY ("ZENE_ID")
	  REFERENCES "ROOT"."KIADO" ("KIADO_ID") ENABLE;
