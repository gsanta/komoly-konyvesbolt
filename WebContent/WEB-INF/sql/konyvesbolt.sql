--------------------------------------------------------
--  File created - vasárnap-március-17-2013   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ADMIN
--------------------------------------------------------

  CREATE TABLE "ROOT"."ADMIN" 
   (	"ADMIN_ID" NUMBER, 
	"NEV" VARCHAR2(30 BYTE), 
	"PASSWORD" VARCHAR2(200 BYTE), 
	"BOLT_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
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
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
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
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table IRANYITOSZAM
--------------------------------------------------------

  CREATE TABLE "ROOT"."IRANYITOSZAM" 
   (	"IRSZ" NUMBER, 
	"TELEPULES" VARCHAR2(40 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
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
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
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
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table KONYV_HOL
--------------------------------------------------------

  CREATE TABLE "ROOT"."KONYV_HOL" 
   (	"KONYV_ID" NUMBER, 
	"BOLT_ID" NUMBER, 
	"DARAB" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MUFAJOK
--------------------------------------------------------

  CREATE TABLE "ROOT"."MUFAJOK" 
   (	"MUFAJ_ID" NUMBER, 
	"MUFAJNEV" VARCHAR2(50 BYTE), 
	"SZULO" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

  CREATE TABLE "ROOT"."REVIEW" 
   (	"USER_ID" NUMBER, 
	"KONYV_ID" NUMBER, 
	"REVIEW" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SZERZOK
--------------------------------------------------------

  CREATE TABLE "ROOT"."SZERZOK" 
   (	"KONYV_ID" NUMBER, 
	"SZERZO" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
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
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
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
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
REM INSERTING into ROOT.ADMIN
SET DEFINE OFF;
REM INSERTING into ROOT.BOLT
SET DEFINE OFF;
REM INSERTING into ROOT.CIMEK
SET DEFINE OFF;
REM INSERTING into ROOT.IRANYITOSZAM
SET DEFINE OFF;
REM INSERTING into ROOT.KIADO
SET DEFINE OFF;
REM INSERTING into ROOT.KONYV
SET DEFINE OFF;
REM INSERTING into ROOT.KONYV_HOL
SET DEFINE OFF;
REM INSERTING into ROOT.MUFAJOK
SET DEFINE OFF;
REM INSERTING into ROOT.REVIEW
SET DEFINE OFF;
REM INSERTING into ROOT.SZERZOK
SET DEFINE OFF;
REM INSERTING into ROOT.USERS
SET DEFINE OFF;
REM INSERTING into ROOT.VASARLASOK
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index ADMIN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."ADMIN_PK" ON "ROOT"."ADMIN" ("ADMIN_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BOLT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."BOLT_PK" ON "ROOT"."BOLT" ("BOLT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CIMEK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."CIMEK_PK" ON "ROOT"."CIMEK" ("CIM_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CIMEK_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."CIMEK_UK1" ON "ROOT"."CIMEK" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IRANYITOSZAM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."IRANYITOSZAM_PK" ON "ROOT"."IRANYITOSZAM" ("IRSZ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index KIADO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."KIADO_PK" ON "ROOT"."KIADO" ("KIADO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index KONYV_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."KONYV_PK" ON "ROOT"."KONYV" ("KONYV_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index KONYV_HOL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."KONYV_HOL_PK" ON "ROOT"."KONYV_HOL" ("KONYV_ID", "BOLT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MUFAJOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."MUFAJOK_PK" ON "ROOT"."MUFAJOK" ("MUFAJ_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index REVIEW_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."REVIEW_PK" ON "ROOT"."REVIEW" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SZERZOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."SZERZOK_PK" ON "ROOT"."SZERZOK" ("KONYV_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index USERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."USERS_PK" ON "ROOT"."USERS" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index VASARLASOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROOT"."VASARLASOK_PK" ON "ROOT"."VASARLASOK" ("VASARLAS_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ADMIN
--------------------------------------------------------

  ALTER TABLE "ROOT"."ADMIN" ADD CONSTRAINT "ADMIN_PK" PRIMARY KEY ("ADMIN_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."ADMIN" MODIFY ("ADMIN_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOLT
--------------------------------------------------------

  ALTER TABLE "ROOT"."BOLT" ADD CONSTRAINT "BOLT_PK" PRIMARY KEY ("BOLT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."BOLT" MODIFY ("BOLT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CIMEK
--------------------------------------------------------

  ALTER TABLE "ROOT"."CIMEK" ADD CONSTRAINT "CIMEK_PK" PRIMARY KEY ("CIM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."CIMEK" ADD CONSTRAINT "CIMEK_UK1" UNIQUE ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."CIMEK" MODIFY ("CIM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table IRANYITOSZAM
--------------------------------------------------------

  ALTER TABLE "ROOT"."IRANYITOSZAM" ADD CONSTRAINT "IRANYITOSZAM_PK" PRIMARY KEY ("IRSZ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."IRANYITOSZAM" MODIFY ("IRSZ" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KIADO
--------------------------------------------------------

  ALTER TABLE "ROOT"."KIADO" ADD CONSTRAINT "KIADO_PK" PRIMARY KEY ("KIADO_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."KIADO" MODIFY ("KIADO_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KONYV
--------------------------------------------------------

  ALTER TABLE "ROOT"."KONYV" ADD CONSTRAINT "KONYV_PK" PRIMARY KEY ("KONYV_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."KONYV" MODIFY ("KONYV_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KONYV_HOL
--------------------------------------------------------

  ALTER TABLE "ROOT"."KONYV_HOL" ADD CONSTRAINT "KONYV_HOL_PK" PRIMARY KEY ("KONYV_ID", "BOLT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."KONYV_HOL" MODIFY ("KONYV_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ROOT"."KONYV_HOL" MODIFY ("BOLT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MUFAJOK
--------------------------------------------------------

  ALTER TABLE "ROOT"."MUFAJOK" ADD CONSTRAINT "MUFAJOK_PK" PRIMARY KEY ("MUFAJ_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."MUFAJOK" MODIFY ("MUFAJ_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "ROOT"."REVIEW" ADD CONSTRAINT "REVIEW_PK" PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ROOT"."REVIEW" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SZERZOK
--------------------------------------------------------

  ALTER TABLE "ROOT"."SZERZOK" MODIFY ("KONYV_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ROOT"."SZERZOK" ADD CONSTRAINT "SZERZOK_PK" PRIMARY KEY ("KONYV_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "ROOT"."USERS" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ROOT"."USERS" ADD CONSTRAINT "USERS_PK" PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table VASARLASOK
--------------------------------------------------------

  ALTER TABLE "ROOT"."VASARLASOK" MODIFY ("VASARLAS_ID" NOT NULL ENABLE);
 
  ALTER TABLE "ROOT"."VASARLASOK" ADD CONSTRAINT "VASARLASOK_PK" PRIMARY KEY ("VASARLAS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
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
