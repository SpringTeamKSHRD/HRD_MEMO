/*
Navicat PGSQL Data Transfer

Source Server         : postgres
Source Server Version : 90303
Source Host           : localhost:5432
Source Database       : memotest1
Source Schema         : memo

Target Server Type    : PGSQL
Target Server Version : 90303
File Encoding         : 65001

Date: 2016-01-05 17:14:33
*/

CREATE SCHEMA memo;
-- ----------------------------
-- Sequence structure for tbhistory_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "memo"."tbhistory_id_seq" CASCADE;
CREATE SEQUENCE "memo"."tbhistory_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 2
 CACHE 1;
SELECT setval('"memo"."tbhistory_id_seq"', 2, true);

-- ----------------------------
-- Sequence structure for tbmemo_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "memo"."tbmemo_id_seq" CASCADE;
CREATE SEQUENCE "memo"."tbmemo_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"memo"."tbmemo_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for tbmessage_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "memo"."tbmessage_id_seq" CASCADE;
CREATE SEQUENCE "memo"."tbmessage_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"memo"."tbmessage_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for tbreport_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "memo"."tbreport_id_seq" CASCADE;
CREATE SEQUENCE "memo"."tbreport_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"memo"."tbreport_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for tbldefaultmessage_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "memo"."tbldefaultmessage_id_seq" CASCADE;
CREATE SEQUENCE "memo"."tbldefaultmessage_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
 
-- ----------------------------
-- Table structure for tbldefaultmessage
-- ----------------------------

DROP TABLE IF EXISTS "memo"."tbldefaultmessage" CASCADE;
CREATE TABLE "memo"."tbldefaultmessage" (
"id" int4 DEFAULT nextval('"memo".tbldefaultmessage_id_seq'::regclass) NOT NULL,
"messsage" varchar(100) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbldefaultmessage
-- ----------------------------
INSERT INTO "memo"."tbldefaultmessage" VALUES ('1', 'your memo has been block by admin');
INSERT INTO "memo"."tbldefaultmessage" VALUES ('2', 'thanks you for your reporting');

-- ----------------------------
-- Table structure for tbhistory
-- ----------------------------
DROP TABLE IF EXISTS "memo"."tbhistory" CASCADE;
CREATE TABLE "memo"."tbhistory" (
"id" int8 DEFAULT nextval('"memo".tbhistory_id_seq'::regclass) NOT NULL,
"memoid" int4 NOT NULL,
"title" varchar COLLATE "default",
"content" varchar COLLATE "default",
"date" timestamp(6) DEFAULT now()
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbhistory
-- ----------------------------
INSERT INTO "memo"."tbhistory" VALUES ('2', '1', 'sdf', 'sdf', '2016-01-05 17:10:23.587');

-- ----------------------------
-- Table structure for tbmemo
-- ----------------------------
DROP TABLE IF EXISTS "memo"."tbmemo" CASCADE;
CREATE TABLE "memo"."tbmemo" (
"id" int4 DEFAULT nextval('"memo".tbmemo_id_seq'::regclass) NOT NULL,
"userid" int4 NOT NULL,
"content" varchar COLLATE "default",
"title" varchar COLLATE "default",
"domain" varchar COLLATE "default",
"url" varchar COLLATE "default" NOT NULL,
"date" timestamp(6) DEFAULT now(),
"isenable" bool DEFAULT true NOT NULL,
"ispublic" bool DEFAULT false NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbmemo
-- ----------------------------
INSERT INTO "memo"."tbmemo" VALUES ('1', '1', 'sdfsdfsdfs', 'sdf', 'sdf', 'sdf', '2016-01-05 17:09:58', 't', 't');

-- ----------------------------
-- Table structure for tbmessage
-- ----------------------------
DROP TABLE IF EXISTS "memo"."tbmessage";
CREATE TABLE "memo"."tbmessage" (
"id" int4 DEFAULT nextval('"memo".tbmessage_id_seq'::regclass) NOT NULL,
"userid" int4 NOT NULL,
"memoid" int4 ,
"isviewed" bool DEFAULT false NOT NULL,
"date" timestamp(6) DEFAULT now(),
"message_id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbmessage
-- ----------------------------
INSERT INTO "memo"."tbmessage" VALUES ('1', '1', '1', 'f', '2016-01-05 17:09:58', '1');

-- ----------------------------
-- Table structure for tbreport
-- ----------------------------
DROP TABLE IF EXISTS "memo"."tbreport" CASCADE;
CREATE TABLE "memo"."tbreport" (
"id" int4 DEFAULT nextval('"memo".tbreport_id_seq'::regclass) NOT NULL,
"reporterid" int4 NOT NULL,
"memoid" int4 NOT NULL,
"description" varchar COLLATE "default",
"date" timestamp(6) DEFAULT now(),
"isblocked" bool DEFAULT false NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbreport
-- ----------------------------
INSERT INTO "memo"."tbreport" VALUES ('1', '1', '1', 'asdasdf', '2016-01-05 17:10:58', 'f');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "memo"."tbldefaultmessage_id_seq" OWNED BY "memo"."tbldefaultmessage"."id";
ALTER SEQUENCE "memo"."tbhistory_id_seq" OWNED BY "memo"."tbhistory"."id";
ALTER SEQUENCE "memo"."tbmemo_id_seq" OWNED BY "memo"."tbmemo"."id";
ALTER SEQUENCE "memo"."tbmessage_id_seq" OWNED BY "memo"."tbmessage"."id";
ALTER SEQUENCE "memo"."tbreport_id_seq" OWNED BY "memo"."tbreport"."id";

-- ----------------------------
-- Primary Key structure for table tbldefaultmessage
-- ----------------------------
ALTER TABLE "memo"."tbldefaultmessage" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbhistory
-- ----------------------------
ALTER TABLE "memo"."tbhistory" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Function Trigger insert_tbhistory
-- ----------------------------
CREATE or replace FUNCTION "memo"."insert_tbhistory"()
  RETURNS trigger AS $BODY$
BEGIN
 IF (TG_OP = 'UPDATE') THEN

INSERT INTO "memo"."tbhistory" ("memoid", "title", "content", "date") VALUES(OLD.id,OLD.title,OLD.content,now());
    return null;
        END IF;
END
$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;
ALTER FUNCTION "memo"."insert_tbhistory"() OWNER TO "postgres";
-- ----------------------------
-- Triggers structure for table tbmemo
-- ----------------------------
CREATE TRIGGER "triggger_insert_tbhistory" AFTER UPDATE ON "memo"."tbmemo"
FOR EACH ROW
EXECUTE PROCEDURE "memo"."insert_tbhistory"();

-- ----------------------------
-- Primary Key structure for table tbmemo
-- ----------------------------
ALTER TABLE "memo"."tbmemo" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbmessage
-- ----------------------------
ALTER TABLE "memo"."tbmessage" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbreport
-- ----------------------------
ALTER TABLE "memo"."tbreport" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "memo"."tbmemo"
-- ----------------------------
ALTER TABLE "memo"."tbmemo" ADD FOREIGN KEY ("userid") REFERENCES "public"."tbluser" ("userid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "memo"."tbmessage"
-- ----------------------------
ALTER TABLE "memo"."tbmessage" ADD FOREIGN KEY ("userid") REFERENCES "public"."tbluser" ("userid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "memo"."tbmessage" ADD FOREIGN KEY ("message_id") REFERENCES "memo"."tbldefaultmessage" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "memo"."tbreport"
-- ----------------------------
ALTER TABLE "memo"."tbreport" ADD FOREIGN KEY ("reporterid") REFERENCES "public"."tbluser" ("userid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "memo"."tbreport" ADD FOREIGN KEY ("memoid") REFERENCES "memo"."tbmemo" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- create view login
-- ----------------------------
CREATE VIEW "memo".v_user_roles 
AS
SELECT ut.usertypeid,u.userid,u.username,ut.usertypename
FROM "public".tblusertype ut
INNER JOIN "public".tbluser u
ON ut.usertypeid =u.usertypeid