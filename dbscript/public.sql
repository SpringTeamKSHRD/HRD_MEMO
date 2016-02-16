/*
Navicat PGSQL Data Transfer

Source Server         : postgres
Source Server Version : 90303
Source Host           : localhost:5432
Source Database       : memotest1
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90303
File Encoding         : 65001

Date: 2016-01-05 17:14:42
*/


-- ----------------------------
-- Sequence structure for tbluser_userid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbluser_userid_seq" CASCADE;
CREATE SEQUENCE "public"."tbluser_userid_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 32
 CACHE 1;
SELECT setval('"public"."tbluser_userid_seq"', 32, true);

-- ----------------------------
-- Table structure for tbluser
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbluser" CASCADE;
CREATE TABLE "public"."tbluser" (
"userid" int4 DEFAULT nextval('tbluser_userid_seq'::regclass) NOT NULL,
"email" text COLLATE "default" NOT NULL,
"password" text COLLATE "default" NOT NULL,
"username" text COLLATE "default",
"gender" text COLLATE "default",
"dateofbirth" date,
"phonenumber" text COLLATE "default",
"registerdate" timestamp(6),
"userimageurl" text COLLATE "default",
"usertypeid" int4,
"point" int2,
"universityid" int4,
"departmentid" int4,
"userstatus" bit(1),
"ismemoenabled" bool DEFAULT true NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbluser
-- ----------------------------
INSERT INTO "public"."tbluser" VALUES ('1', 'admin@gmail.com', '$2a$10$cHHVTPtstZqd0wqhRXpobu0.m15YkxdcQVB5gw.6s9PgIWeF7PFU2', 'admin', 'male', '2013-04-18', '12345678', '2015-01-13 16:45:23', 'avatar.png', '5', null, '36', '12', E'1', 't');
INSERT INTO "public"."tbluser" VALUES ('2', 'user@gmail.com', '$2a$10$cHHVTPtstZqd0wqhRXpobu0.m15YkxdcQVB5gw.6s9PgIWeF7PFU2', 'user', 'male', '2016-01-05', '1234123412', '2016-01-05 17:12:08', 'avatar.png', '2', null, '36', '12', E'1', 't');
-- ----------------------------
-- Table structure for tblusertype
-- ----------------------------
DROP TABLE IF EXISTS "public"."tblusertype";
CREATE TABLE "public"."tblusertype" (
"usertypeid" int4 NOT NULL,
"usertypename" text COLLATE "default",
"viewable" bool,
"commentable" bool,
"postable" bool,
"deleteable" bool,
"userable" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tblusertype
-- ----------------------------
INSERT INTO "public"."tblusertype" VALUES ('1', 'Visitor', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."tblusertype" VALUES ('2', 'Subscriber', 't', 't', 'f', 'f', 'f');
INSERT INTO "public"."tblusertype" VALUES ('3', 'Editor', 't', 't', 't', 'f', 'f');
INSERT INTO "public"."tblusertype" VALUES ('4', 'Moderator', 't', 't', 't', 't', 'f');
INSERT INTO "public"."tblusertype" VALUES ('5', 'Admin', 't', 't', 't', 't', 't');
INSERT INTO "public"."tblusertype" VALUES ('6', 'Employee', 't', 't', 't', 't', 't');
INSERT INTO "public"."tblusertype" VALUES ('7', 'Company', 't', 't', 't', 't', 't');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "public"."tbluser_userid_seq" OWNED BY "tbluser"."userid";

-- ----------------------------
-- Uniques structure for table tbluser
-- ----------------------------
ALTER TABLE "public"."tbluser" ADD UNIQUE ("email");

-- ----------------------------
-- Primary Key structure for table tbluser
-- ----------------------------
ALTER TABLE "public"."tbluser" ADD PRIMARY KEY ("userid");

-- ----------------------------
-- Primary Key structure for table tblusertype
-- ----------------------------
ALTER TABLE "public"."tblusertype" ADD PRIMARY KEY ("usertypeid");

-- ----------------------------
-- Foreign Key structure for table "public"."tbluser"
-- ----------------------------
ALTER TABLE "public"."tbluser" ADD FOREIGN KEY ("usertypeid") REFERENCES "public"."tblusertype" ("usertypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;
