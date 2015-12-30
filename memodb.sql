/*
Navicat PGSQL Data Transfer

Source Server         : postgres
Source Server Version : 90303
Source Host           : localhost:5432
Source Database       : memodb
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90303
File Encoding         : 65001

Date: 2015-12-30 09:04:14
*/


-- ----------------------------
-- Sequence structure for tbcategory_id_seq
-- ----------------------------

CREATE SEQUENCE "tbcategory_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."tbcategory_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for tbhistory_id_seq
-- ----------------------------
CREATE SEQUENCE "tbhistory_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."tbhistory_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for tbmemo_id_seq
-- ----------------------------

CREATE SEQUENCE "tbmemo_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 2
 CACHE 1;
SELECT setval('"public"."tbmemo_id_seq"', 2, true);

-- ----------------------------
-- Sequence structure for tbuser_id_seq
-- ----------------------------

CREATE SEQUENCE "tbuser_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 3
 CACHE 1;
SELECT setval('"public"."tbuser_id_seq"', 3, true);

-- ----------------------------
-- Table structure for tbcategory
-- ----------------------------
DROP TABLE IF EXISTS "tbcategory";
CREATE TABLE "tbcategory" (
"id" int4 DEFAULT nextval('tbcategory_id_seq'::regclass) NOT NULL,
"category" varchar COLLATE "default" NOT NULL,
"description" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbcategory
-- ----------------------------
BEGIN;
INSERT INTO "tbcategory" VALUES ('1', 'sport', null);
COMMIT;

-- ----------------------------
-- Table structure for tbhistory
-- ----------------------------
DROP TABLE IF EXISTS "tbhistory";
CREATE TABLE "tbhistory" (
"id" int8 DEFAULT nextval('tbhistory_id_seq'::regclass) NOT NULL,
"memoid" int4 NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"content" varchar COLLATE "default",
"date" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbhistory
-- ----------------------------
BEGIN;
INSERT INTO "tbhistory" VALUES ('1', '2', 'asdf', 'asd', '2015-12-30 09:03:27.906');
COMMIT;

-- ----------------------------
-- Table structure for tbmemo
-- ----------------------------
DROP TABLE IF EXISTS "tbmemo";
CREATE TABLE "tbmemo" (
"id" int4 DEFAULT nextval('tbmemo_id_seq'::regclass) NOT NULL,
"userid" int4 NOT NULL,
"url" varchar(32) COLLATE "default" NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"content" varchar COLLATE "default",
"date" timestamp(6) NOT NULL,
"enable" bool NOT NULL,
"urltitle" varchar COLLATE "default",
"categoryid" int4 NOT NULL,
"public" bool NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbmemo
-- ----------------------------
BEGIN;
INSERT INTO "tbmemo" VALUES ('2', '1', 'asd', 'asdf', 'asd', '2015-12-30 09:02:17', 't', 'asdfasdasdfasdf', '1', 't');
COMMIT;

-- ----------------------------
-- Table structure for tbuser
-- ----------------------------
DROP TABLE IF EXISTS "tbuser";
CREATE TABLE "tbuser" (
"id" int4 DEFAULT nextval('tbuser_id_seq'::regclass) NOT NULL,
"name" varchar COLLATE "default" NOT NULL,
"gender" varchar(1) COLLATE "default" NOT NULL,
"email" varchar COLLATE "default" NOT NULL,
"password" varchar COLLATE "default" NOT NULL,
"image" varchar COLLATE "default",
"enable" bool NOT NULL,
"role" varchar COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbuser
-- ----------------------------
BEGIN;
INSERT INTO "tbuser" VALUES ('1', 'admin', 'm', 'admin@hrd.com', '1', 'default.jpg', 't', 'ROLE_ADMIN');
INSERT INTO "tbuser" VALUES ('2', 'user1', 'm', 'user@hrd.com', '1', 'default.jpg', 't', 'ROLE_USER');
INSERT INTO "tbuser" VALUES ('3', 'user2', 'f', 'user2@gmail.com', '1', 'default.jpg', 't', 'ROLE_USER');
COMMIT;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "tbcategory_id_seq" OWNED BY "tbcategory"."id";
ALTER SEQUENCE "tbhistory_id_seq" OWNED BY "tbhistory"."id";
ALTER SEQUENCE "tbmemo_id_seq" OWNED BY "tbmemo"."id";
ALTER SEQUENCE "tbuser_id_seq" OWNED BY "tbuser"."id";

-- ----------------------------
-- Primary Key structure for table tbcategory
-- ----------------------------
ALTER TABLE "tbcategory" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbhistory
-- ----------------------------
ALTER TABLE "tbhistory" ADD PRIMARY KEY ("id");

CREATE or replace FUNCTION "insert_tbhistory"()
  RETURNS trigger AS $BODY$
BEGIN
 IF (TG_OP = 'UPDATE') THEN

INSERT INTO "public"."tbhistory" ("memoid", "title", "content", "date") VALUES(OLD.id,OLD.title,OLD.content,now());
    return null;
        END IF;
END
$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;
ALTER FUNCTION "public"."insert_tbhistory"() OWNER TO "postgres";

-- ----------------------------
-- Triggers structure for table tbmemo
-- ----------------------------
CREATE TRIGGER "triggger_insert_tbhistory" AFTER UPDATE ON "tbmemo"
FOR EACH ROW
EXECUTE PROCEDURE "insert_tbhistory"();

-- ----------------------------
-- Primary Key structure for table tbmemo
-- ----------------------------
ALTER TABLE "tbmemo" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbuser
-- ----------------------------
ALTER TABLE "tbuser" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "tbhistory"
-- ----------------------------
ALTER TABLE "tbhistory" ADD FOREIGN KEY ("memoid") REFERENCES "tbmemo" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "tbmemo"
-- ----------------------------
ALTER TABLE "tbmemo" ADD FOREIGN KEY ("categoryid") REFERENCES "tbcategory" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "tbmemo" ADD FOREIGN KEY ("userid") REFERENCES "tbuser" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
