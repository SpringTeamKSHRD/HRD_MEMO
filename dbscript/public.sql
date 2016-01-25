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
 START 2
 CACHE 1;
SELECT setval('"public"."tbluser_userid_seq"', 2, true);

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
INSERT INTO "public"."tbluser" VALUES ('3', 'mi@egestas.edu', 'eget', 'ornare,', 'ullamcorper', '2016-07-06', '2', '2015-07-10 00:00:00', 'Proin', '2', '1', '1', '1', E'0', 't');
INSERT INTO "public"."tbluser" VALUES ('5', 'scelerisque.mollis.Phasellus@vitaeeratVivamus.net', 'non,', 'sit', 'lobortis', '2016-05-18', '5', '2015-03-22 00:00:00', 'ante', '1', '2', '2', '2', E'0', 't');
INSERT INTO "public"."tbluser" VALUES ('6', 'suscipit.est@Curabitur.net', 'Suspendisse', 'Phasellus', 'aliquam', '2016-10-29', '13', '2015-07-16 00:00:00', 'eget', '1', '2', '1', '1', E'1', 't');
INSERT INTO "public"."tbluser" VALUES ('7', 'lobortis.ultrices.Vivamus@loremipsumsodales.net', 'Cras', 'semper', 'luctus', '2015-05-27', '2', '2015-09-07 00:00:00', 'dictum', '1', '1', '1', '1', E'1', 't');
INSERT INTO "public"."tbluser" VALUES ('8', 'et.risus.Quisque@rhoncusNullamvelit.net', 'purus,', 'Aliquam', 'et,', '2015-08-09', '3', '2016-05-08 00:00:00', 'In', '2', '2', '2', '2', E'0', 't');
INSERT INTO "public"."tbluser" VALUES ('9', 'auctor.quis@nislNullaeu.ca', 'Morbi', 'magna', 'Vestibulum', '2016-12-23', '11', '2016-09-20 00:00:00', 'pede', '1', '2', '1', '1', E'0', 't');
INSERT INTO "public"."tbluser" VALUES ('10', 'rutrum@aliquetnecimperdiet.ca', 'pellentesque,', 'mauris,', 'Ut', '2016-11-29', '12', '2016-10-19 00:00:00', 'Vivamus', '2', '2', '2', '2', E'1', 't');
INSERT INTO "public"."tbluser" VALUES ('11', 'bibendum.sed.est@euismodet.org', 'magna', 'enim.', 'elit.', '2016-07-05', '8', '2016-03-03 00:00:00', 'justo', '2', '1', '2', '2', E'1', 't');
INSERT INTO "public"."tbluser" VALUES ('12', 'sem.mollis.dui@ametluctus.ca', 'orci', 'ullamcorper.', 'tincidunt', '2016-10-17', '5', '2016-08-09 00:00:00', 'est', '1', '1', '1', '1', E'0', 't');
INSERT INTO "public"."tbluser" VALUES ('13', 'justo.Praesent@Nullafacilisis.net', 'at', 'mauris', 'arcu.', '2016-12-27', '5', '2016-03-04 00:00:00', 'eu', '1', '2', '2', '1', E'1', 't');
INSERT INTO "public"."tbluser" VALUES ('14', 'Nunc@metusvitae.net', 'nisi', 'Nullam', 'Proin', '2015-09-05', '8', '2016-02-25 00:00:00', 'tristique', '2', '2', '2', '2', E'0', 't');
INSERT INTO "public"."tbluser" VALUES ('15', 'pellentesque.a.facilisis@dolor.ca', 'eu', 'bibendum.', 'Nullam', '2016-11-12', '3', '2016-02-08 00:00:00', 'fames', '1', '1', '1', '1', E'0', 't');
INSERT INTO "public"."tbluser" VALUES ('16', 'at.fringilla.purus@eget.com', 'massa', 'enim', 'dictum', '2016-10-11', '10', '2015-09-02 00:00:00', 'libero.', '2', '1', '1', '2', E'1', 't');
INSERT INTO "public"."tbluser" VALUES ('17', 'dolor.Quisque.tincidunt@auctorquistristique.co.uk', 'aliquet', 'Mauris', 'Vestibulum', '2016-09-07', '12', '2015-08-18 00:00:00', 'amet', '1', '1', '1', '2', E'1', 't');
INSERT INTO "public"."tbluser" VALUES ('18', 'Etiam.laoreet@volutpatNullafacilisis.net', 'scelerisque', 'enim.', 'nisi', '2015-06-19', '8', '2015-07-07 00:00:00', 'fringilla.', '1', '1', '2', '1', E'0', 't');
INSERT INTO "public"."tbluser" VALUES ('19', 'eleifend@metus.edu', 'mi,', 'Proin', 'cursus', '2016-07-13', '5', '2015-11-29 00:00:00', 'et', '2', '2', '2', '1', E'1', 't');
INSERT INTO "public"."tbluser" VALUES ('20', 'Maecenas@sem.com', 'hendrerit', 'facilisi.', 'enim', '2016-08-08', '4', '2016-06-02 00:00:00', 'vel,', '1', '2', '1', '1', E'0', 't');
INSERT INTO "public"."tbluser" VALUES ('21', 'odio@dui.org', 'vulputate,', 'Nullam', 'at,', '2016-06-18', '1', '2016-01-05 00:00:00', 'ut,', '2', '2', '2', '1', E'0', 't');
INSERT INTO "public"."tbluser" VALUES ('22', 'Morbi@etrisusQuisque.com', 'nec', 'Curabitur', 'eu', '2015-08-23', '1', '2015-07-13 00:00:00', 'Fusce', '1', '1', '2', '1', E'1', 't');
INSERT INTO "public"."tbluser" VALUES ('23', 'eu.accumsan@lacusMaurisnon.net', 'nec', 'dictum', 'Quisque', '2016-08-18', '8', '2016-04-19 00:00:00', 'lectus.', '1', '1', '1', '1', E'1', 't');
INSERT INTO "public"."tbluser" VALUES ('24', 'cursus.vestibulum.Mauris@nonlacinia.org', 'cubilia', 'sociis', 'ac', '2015-06-06', '3', '2015-12-15 00:00:00', 'quis', '2', '1', '1', '1', E'0', 't');
INSERT INTO "public"."tbluser" VALUES ('25', 'neque@non.net', 'Cum', 'Etiam', 'ante', '2016-11-15', '7', '2015-02-22 00:00:00', 'tellus.', '2', '1', '2', '1', E'1', 't');
INSERT INTO "public"."tbluser" VALUES ('26', 'vitae.posuere.at@laoreetipsumCurabitur.edu', 'Suspendisse', 'enim.', 'ornare', '2016-02-14', '12', '2015-11-02 00:00:00', 'nec,', '1', '1', '1', '2', E'0', 't');
INSERT INTO "public"."tbluser" VALUES ('27', 'egestas.Sed.pharetra@ridiculus.com', 'parturient', 'est.', 'dolor.', '2015-01-27', '13', '2015-07-08 00:00:00', 'dictum', '1', '2', '2', '2', E'0', 't');
INSERT INTO "public"."tbluser" VALUES ('28', 'non@lobortisquispede.ca', 'dui.', 'erat', 'eros', '2015-03-03', '9', '2015-03-11 00:00:00', 'ornare', '1', '1', '1', '2', E'0', 't');
INSERT INTO "public"."tbluser" VALUES ('29', 'diam@adui.co.uk', 'non', 'Aenean', 'nulla.', '2015-09-10', '9', '2016-12-11 00:00:00', 'justo', '2', '1', '2', '1', E'0', 't');
INSERT INTO "public"."tbluser" VALUES ('30', 'sollicitudin.commodo.ipsum@ultricesposuerecubilia.ca', 'imperdiet', 'accumsan', 'ridiculus', '2016-12-11', '8', '2016-10-31 00:00:00', 'enim', '1', '1', '1', '1', E'1', 't');
INSERT INTO "public"."tbluser" VALUES ('31', 'at.arcu.Vestibulum@magnisdisparturient.com', 'lorem', 'Mauris', 'consectetuer', '2015-08-19', '8', '2015-09-06 00:00:00', 'risus.', '2', '2', '2', '1', E'1', 't');
INSERT INTO "public"."tbluser" VALUES ('32', 'Vivamus@pede.edu', 'in', 'adipiscing', 'vestibulum', '2015-12-03', '7', '2015-12-01 00:00:00', 'felis.', '1', '2', '2', '2', E'0', 't');

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
