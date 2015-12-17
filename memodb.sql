/*
Navicat PGSQL Data Transfer

Source Server         : Postgres
Source Server Version : 90305
Source Host           : localhost:5432
Source Database       : memodb
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90305
File Encoding         : 65001

Date: 2015-12-17 21:42:15
*/


-- ----------------------------
-- Sequence structure for tbhistory_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "tbhistory_id_seq" CASCADE;
CREATE SEQUENCE "tbhistory_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for tbmemo_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "tbmemo_id_seq" CASCADE;
CREATE SEQUENCE "tbmemo_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 4
 CACHE 1;
SELECT setval('"public"."tbmemo_id_seq"', 4, true);

-- ----------------------------
-- Sequence structure for tburl_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "tburl_id_seq" CASCADE;
CREATE SEQUENCE "tburl_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 3
 CACHE 1;
SELECT setval('"public"."tburl_id_seq"', 3, true) ;

-- ----------------------------
-- Sequence structure for tbuser_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "tbuser_id_seq" CASCADE;
CREATE SEQUENCE "tbuser_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 3
 CACHE 1;
SELECT setval('"public"."tbuser_id_seq"', 3, true);

-- ----------------------------
-- Table structure for tbhistory
-- ----------------------------
DROP TABLE IF EXISTS "tbhistory" CASCADE;
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
COMMIT;

-- ----------------------------
-- Table structure for tbmemo
-- ----------------------------
DROP TABLE IF EXISTS "tbmemo" CASCADE;
CREATE TABLE "tbmemo" (
"id" int4 DEFAULT nextval('tbmemo_id_seq'::regclass) NOT NULL,
"userid" int4 NOT NULL,
"urlid" int4 NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"content" varchar COLLATE "default",
"date" timestamp(6) NOT NULL,
"enable" bool NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbmemo
-- ----------------------------
BEGIN;
INSERT INTO "tbmemo" VALUES ('1', '2', '1', 'untitle', 'dear diary, fml', '2015-12-24 21:38:07', 't');
INSERT INTO "tbmemo" VALUES ('2', '2', '2', 'oh damn', 'asdfasdfkjas;', '2015-12-11 21:38:32', 'f');
INSERT INTO "tbmemo" VALUES ('3', '3', '3', 'sda', 'asdfasdfasdfasf', '2015-12-16 21:38:54', 't');
INSERT INTO "tbmemo" VALUES ('4', '3', '2', 'asdfasd', 'asdfa', '2015-12-08 21:39:17', 't');
COMMIT;

-- ----------------------------
-- Table structure for tburl
-- ----------------------------
DROP TABLE IF EXISTS "tburl" CASCADE;
CREATE TABLE "tburl" (
"id" int4 DEFAULT nextval('tburl_id_seq'::regclass) NOT NULL,
"url" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tburl
-- ----------------------------
BEGIN;
INSERT INTO "tburl" VALUES ('1', 'http://www.postgresql.org/docs/9.4/static/datatype-bit.html');
INSERT INTO "tburl" VALUES ('2', 'https://www.facebook.com/Troll.Football');
INSERT INTO "tburl" VALUES ('3', 'https://github.com/elit69?tab=activity');
COMMIT;

-- ----------------------------
-- Table structure for tbuser
-- ----------------------------
DROP TABLE IF EXISTS "tbuser" CASCADE;
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
ALTER SEQUENCE "tbhistory_id_seq" OWNED BY "tbhistory"."id";
ALTER SEQUENCE "tbmemo_id_seq" OWNED BY "tbmemo"."id";
ALTER SEQUENCE "tburl_id_seq" OWNED BY "tburl"."id";
ALTER SEQUENCE "tbuser_id_seq" OWNED BY "tbuser"."id";

-- ----------------------------
-- Primary Key structure for table tbhistory
-- ----------------------------
ALTER TABLE "tbhistory" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbmemo
-- ----------------------------
ALTER TABLE "tbmemo" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tburl
-- ----------------------------
ALTER TABLE "tburl" ADD PRIMARY KEY ("id");

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
ALTER TABLE "tbmemo" ADD FOREIGN KEY ("userid") REFERENCES "tbuser" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "tbmemo" ADD FOREIGN KEY ("urlid") REFERENCES "tburl" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
