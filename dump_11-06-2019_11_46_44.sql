--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.resources DROP CONSTRAINT resources_station;
ALTER TABLE ONLY public.real_estate_links DROP CONSTRAINT real_estate_links;
ALTER TABLE ONLY public.operation_resources DROP CONSTRAINT operation_resources_resources;
ALTER TABLE ONLY public.operation_resources DROP CONSTRAINT operation_resources_operations;
ALTER TABLE ONLY public.operation_resource_keys DROP CONSTRAINT operation_resource_keys_collection;
ALTER TABLE ONLY public.operations DROP CONSTRAINT "operation-real_estate";
ALTER TABLE ONLY public.operations DROP CONSTRAINT "operation-operation_key";
ALTER TABLE ONLY public.stations DROP CONSTRAINT stations_pkey;
ALTER TABLE ONLY public.stations DROP CONSTRAINT station_name;
ALTER TABLE ONLY public.river_sectors DROP CONSTRAINT river_sectors_pkey;
ALTER TABLE ONLY public.resources DROP CONSTRAINT resources_radio;
ALTER TABLE ONLY public.resources DROP CONSTRAINT resources_pkey;
ALTER TABLE ONLY public.resourcekey_patterns DROP CONSTRAINT resourcekey_patterns_pkey;
ALTER TABLE ONLY public.regex_patterns DROP CONSTRAINT regex_patterns_pkey;
ALTER TABLE ONLY public.real_estates DROP CONSTRAINT real_estates_pkey;
ALTER TABLE ONLY public.real_estates DROP CONSTRAINT real_estates_name;
ALTER TABLE ONLY public.real_estates DROP CONSTRAINT real_estates_key;
ALTER TABLE ONLY public.real_estate_tags DROP CONSTRAINT real_estate_tags_pkey;
ALTER TABLE ONLY public.real_estate_tags DROP CONSTRAINT "real_estate_tags-name";
ALTER TABLE ONLY public.real_estate_real_estate_tags DROP CONSTRAINT real_estate_real_estate_tags_pkey;
ALTER TABLE ONLY public.real_estate_links DROP CONSTRAINT real_estate_links_pkey;
ALTER TABLE ONLY public.railway_coordinate_boxes DROP CONSTRAINT railway_coordinate_boxes_pkey;
ALTER TABLE ONLY public.operation_resource_keys DROP CONSTRAINT pk_operation_resource_keys;
ALTER TABLE ONLY public.operations DROP CONSTRAINT operations_pkey;
ALTER TABLE ONLY public.operation_resources DROP CONSTRAINT operation_resources_pkey;
ALTER TABLE ONLY public.operation_keys DROP CONSTRAINT operation_keys_pkey;
ALTER TABLE ONLY public.operation_keys DROP CONSTRAINT operation_keys_key;
ALTER TABLE ONLY public.operation_keys DROP CONSTRAINT operation_keys_code;
ALTER TABLE ONLY public.eventlogs DROP CONSTRAINT eventlogs_pkey;
ALTER TABLE ONLY public.display_events DROP CONSTRAINT display_events_pkey;
ALTER TABLE ONLY public.databasechangeloglock DROP CONSTRAINT databasechangeloglock_pkey;
ALTER TABLE ONLY public.cameras DROP CONSTRAINT cameras_pkey;
ALTER TABLE ONLY public.cameras DROP CONSTRAINT "cameras-uri";
ALTER TABLE ONLY public.cameras DROP CONSTRAINT "cameras-name";
ALTER TABLE ONLY public.ambulance_patterns DROP CONSTRAINT ambulance_patterns_pkey;
SELECT pg_catalog.lo_unlink('24637');
SELECT pg_catalog.lo_unlink('24636');
SELECT pg_catalog.lo_unlink('24635');
SELECT pg_catalog.lo_unlink('24602');
SELECT pg_catalog.lo_unlink('24601');
SELECT pg_catalog.lo_unlink('24588');
SELECT pg_catalog.lo_unlink('24587');
SELECT pg_catalog.lo_unlink('24586');
SELECT pg_catalog.lo_unlink('24585');
SELECT pg_catalog.lo_unlink('24584');
SELECT pg_catalog.lo_unlink('24581');
SELECT pg_catalog.lo_unlink('24580');
SELECT pg_catalog.lo_unlink('24578');
SELECT pg_catalog.lo_unlink('24577');
SELECT pg_catalog.lo_unlink('24576');
DROP TABLE public.stations;
DROP TABLE public.river_sectors;
DROP TABLE public.resources;
DROP TABLE public.resourcekey_patterns;
DROP TABLE public.regex_patterns;
DROP TABLE public.real_estates;
DROP TABLE public.real_estate_tags;
DROP TABLE public.real_estate_real_estate_tags;
DROP TABLE public.real_estate_links;
DROP TABLE public.railway_coordinate_boxes;
DROP TABLE public.operations;
DROP TABLE public.operation_resources;
DROP TABLE public.operation_resource_keys;
DROP TABLE public.operation_keys;
DROP TABLE public.eventlogs;
DROP TABLE public.display_events;
DROP TABLE public.databasechangeloglock;
DROP TABLE public.databasechangelog;
DROP TABLE public.cameras;
DROP TABLE public.ambulance_patterns;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ambulance_patterns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ambulance_patterns (
    id character varying(64) NOT NULL,
    pattern character varying(512) NOT NULL,
    mode character varying(16) NOT NULL
);


ALTER TABLE public.ambulance_patterns OWNER TO postgres;

--
-- Name: cameras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cameras (
    id character varying(64) NOT NULL,
    name character varying(128) NOT NULL,
    uri character varying(1024) NOT NULL
);


ALTER TABLE public.cameras OWNER TO postgres;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO postgres;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

--
-- Name: display_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.display_events (
    id character varying(64) NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    text text,
    show_operation boolean NOT NULL
);


ALTER TABLE public.display_events OWNER TO postgres;

--
-- Name: eventlogs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eventlogs (
    id character varying(64) NOT NULL,
    "time" timestamp without time zone NOT NULL,
    type character varying(16) NOT NULL,
    message character varying(2048) NOT NULL
);


ALTER TABLE public.eventlogs OWNER TO postgres;

--
-- Name: operation_keys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operation_keys (
    id character varying(64) NOT NULL,
    key character varying(32) NOT NULL,
    type character varying(16) NOT NULL,
    code character varying(64),
    danger_to_life boolean DEFAULT false NOT NULL
);


ALTER TABLE public.operation_keys OWNER TO postgres;

--
-- Name: operation_resource_keys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operation_resource_keys (
    operation_id character varying(64) NOT NULL,
    resource_key character varying(256) NOT NULL,
    index integer NOT NULL
);


ALTER TABLE public.operation_resource_keys OWNER TO postgres;

--
-- Name: operation_resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operation_resources (
    operation_id character varying(64) NOT NULL,
    resource_id character varying(64) NOT NULL,
    index integer NOT NULL
);


ALTER TABLE public.operation_resources OWNER TO postgres;

--
-- Name: operations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operations (
    id character varying(64) NOT NULL,
    "time" timestamp without time zone,
    place character varying(512),
    object character varying(512),
    address_street character varying(128),
    address_zip character varying(16),
    address_town character varying(128),
    address_district character varying(128),
    latitude double precision,
    longitude double precision,
    code character varying(64),
    message character varying(512),
    notice character varying(2048),
    operation_key_id character varying(64),
    real_estate_id character varying(64),
    ambulance_called boolean,
    directions text,
    created timestamp without time zone,
    closed boolean,
    year integer,
    real_estate_additional character varying(128)
);


ALTER TABLE public.operations OWNER TO postgres;

--
-- Name: railway_coordinate_boxes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.railway_coordinate_boxes (
    id character varying(64) NOT NULL,
    ul_latitude double precision NOT NULL,
    ul_longitude double precision NOT NULL,
    lr_latitude double precision NOT NULL,
    lr_longitude double precision NOT NULL
);


ALTER TABLE public.railway_coordinate_boxes OWNER TO postgres;

--
-- Name: real_estate_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.real_estate_links (
    real_estate_id character varying(64) NOT NULL,
    link character varying(512) NOT NULL,
    description character varying(256)
);


ALTER TABLE public.real_estate_links OWNER TO postgres;

--
-- Name: real_estate_real_estate_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.real_estate_real_estate_tags (
    real_estate_id character varying(64) NOT NULL,
    real_estate_tag_id character varying(64) NOT NULL
);


ALTER TABLE public.real_estate_real_estate_tags OWNER TO postgres;

--
-- Name: real_estate_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.real_estate_tags (
    id character varying(64) NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE public.real_estate_tags OWNER TO postgres;

--
-- Name: real_estates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.real_estates (
    id character varying(64) NOT NULL,
    name character varying(128) NOT NULL,
    key character varying(512),
    address_street character varying(128),
    address_zip character varying(16),
    address_town character varying(128),
    address_district character varying(128),
    information character varying(2048),
    latitude double precision,
    longitude double precision,
    folder_address integer,
    number character varying(64)
);


ALTER TABLE public.real_estates OWNER TO postgres;

--
-- Name: regex_patterns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regex_patterns (
    id character varying(64) NOT NULL,
    pattern character varying(512) NOT NULL,
    source character varying(16) NOT NULL,
    index integer NOT NULL
);


ALTER TABLE public.regex_patterns OWNER TO postgres;

--
-- Name: resourcekey_patterns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resourcekey_patterns (
    id character varying(64) NOT NULL,
    pattern character varying(512) NOT NULL,
    mode character varying(16) NOT NULL
);


ALTER TABLE public.resourcekey_patterns OWNER TO postgres;

--
-- Name: resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resources (
    id character varying(64) NOT NULL,
    name character varying(128) NOT NULL,
    radio character varying(128),
    station_id character varying(64) NOT NULL,
    in_service boolean DEFAULT true NOT NULL,
    key character varying(64)
);


ALTER TABLE public.resources OWNER TO postgres;

--
-- Name: river_sectors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.river_sectors (
    id character varying(64) NOT NULL,
    river character varying(128) NOT NULL,
    kmfrom double precision NOT NULL,
    kmto double precision NOT NULL,
    kminterval double precision NOT NULL
);


ALTER TABLE public.river_sectors OWNER TO postgres;

--
-- Name: stations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stations (
    id character varying(64) NOT NULL,
    name character varying(64) NOT NULL,
    address_street character varying(128),
    address_zip character varying(16),
    address_town character varying(128),
    address_district character varying(128),
    latitude double precision,
    longitude double precision
);


ALTER TABLE public.stations OWNER TO postgres;

--
-- Name: 24576; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('24576');


ALTER LARGE OBJECT 24576 OWNER TO postgres;

--
-- Name: 24577; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('24577');


ALTER LARGE OBJECT 24577 OWNER TO postgres;

--
-- Name: 24578; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('24578');


ALTER LARGE OBJECT 24578 OWNER TO postgres;

--
-- Name: 24580; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('24580');


ALTER LARGE OBJECT 24580 OWNER TO postgres;

--
-- Name: 24581; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('24581');


ALTER LARGE OBJECT 24581 OWNER TO postgres;

--
-- Name: 24584; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('24584');


ALTER LARGE OBJECT 24584 OWNER TO postgres;

--
-- Name: 24585; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('24585');


ALTER LARGE OBJECT 24585 OWNER TO postgres;

--
-- Name: 24586; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('24586');


ALTER LARGE OBJECT 24586 OWNER TO postgres;

--
-- Name: 24587; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('24587');


ALTER LARGE OBJECT 24587 OWNER TO postgres;

--
-- Name: 24588; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('24588');


ALTER LARGE OBJECT 24588 OWNER TO postgres;

--
-- Name: 24601; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('24601');


ALTER LARGE OBJECT 24601 OWNER TO postgres;

--
-- Name: 24602; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('24602');


ALTER LARGE OBJECT 24602 OWNER TO postgres;

--
-- Name: 24635; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('24635');


ALTER LARGE OBJECT 24635 OWNER TO postgres;

--
-- Name: 24636; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('24636');


ALTER LARGE OBJECT 24636 OWNER TO postgres;

--
-- Name: 24637; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('24637');


ALTER LARGE OBJECT 24637 OWNER TO postgres;

--
-- Data for Name: ambulance_patterns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ambulance_patterns (id, pattern, mode) FROM stdin;
\.


--
-- Data for Name: cameras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cameras (id, name, uri) FROM stdin;
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
00-init	ihrigb	classpath:/db/changelog/0.0.1.xml	2019-01-19 11:17:53.56751	1	EXECUTED	8:f796024bba9b97df06c6327dfbfb3226	createTable tableName=regex_patterns; insert tableName=regex_patterns; insert tableName=regex_patterns; insert tableName=regex_patterns; insert tableName=regex_patterns; insert tableName=regex_patterns; insert tableName=regex_patterns; insert tabl...		\N	3.6.2	\N	\N	7896673360
00-add-operationKey-columns	ihrigb	classpath:/db/changelog/0.0.2.xml	2019-01-19 11:17:53.59833	2	EXECUTED	8:16318799b3a27d7e0bf739cf9c99b88d	addColumn tableName=operation_keys; addUniqueConstraint constraintName=operation_keys_code, tableName=operation_keys		\N	3.6.2	\N	\N	7896673360
01-add-resources-table	ihrigb	classpath:/db/changelog/0.0.2.xml	2019-01-19 11:17:53.632897	3	EXECUTED	8:7bfbeb3ecccd334cd985fb74d95aa8eb	createTable tableName=resources; addUniqueConstraint constraintName=resources_radio, tableName=resources; addForeignKeyConstraint baseTableName=resources, constraintName=resources_station, referencedTableName=stations		\N	3.6.2	\N	\N	7896673360
03-add-real-estate-table	ihrigb	classpath:/db/changelog/0.0.2.xml	2019-01-19 11:17:53.689206	4	EXECUTED	8:ee3550ba4b1c00e3062e9bd2957066b7	createTable tableName=real_estates; addUniqueConstraint constraintName=real_estates_name, tableName=real_estates; addUniqueConstraint constraintName=real_estates_key, tableName=real_estates		\N	3.6.2	\N	\N	7896673360
04-add-eventlog-table	ihrigb	classpath:/db/changelog/0.0.2.xml	2019-01-19 11:17:53.729973	5	EXECUTED	8:84112c4f5ba7fe842e3d432e3e4eb587	createTable tableName=eventlogs		\N	3.6.2	\N	\N	7896673360
00-add-resource-columns	ihrigb	classpath:/db/changelog/0.0.3.xml	2019-01-19 11:17:53.741079	6	EXECUTED	8:ed5dab6912667aa5908a4bfb2870d013	addColumn tableName=resources		\N	3.6.2	\N	\N	7896673360
00-add-resource-key-column	ihrigb	classpath:/db/changelog/0.0.4.xml	2019-01-19 11:17:53.747137	7	EXECUTED	8:6a79b318f4bc07ee3ed36bf8483b778f	addColumn tableName=resources		\N	3.6.2	\N	\N	7896673360
00-fix-code-regex	ihrigb	classpath:/db/changelog/0.0.5.xml	2019-01-19 11:17:53.754918	8	EXECUTED	8:688c769cbf7e24a1f2bab9b2a5d10e70	update tableName=regex_patterns		\N	3.6.2	\N	\N	7896673360
01-create-resourcekey-patterns-table	ihrigb	classpath:/db/changelog/0.0.5.xml	2019-01-19 11:17:53.790204	9	EXECUTED	8:6e5893e39da32c03f00c5081712028bf	createTable tableName=resourcekey_patterns		\N	3.6.2	\N	\N	7896673360
02-create-ambulance-patterns-table	ihrigb	classpath:/db/changelog/0.0.5.xml	2019-01-19 11:17:53.830949	10	EXECUTED	8:126757f7fd9c2c56435637f3f10ec802	createTable tableName=ambulance_patterns		\N	3.6.2	\N	\N	7896673360
00-create-realestate-links-table	ihrigb	classpath:/db/changelog/0.0.7.xml	2019-01-19 11:17:53.865802	11	EXECUTED	8:dc204b0f0e7434ae0ec2170baf5a9c6a	createTable tableName=real_estate_links; addForeignKeyConstraint baseTableName=real_estate_links, constraintName=real_estate_links, referencedTableName=real_estates		\N	3.6.2	\N	\N	7896673360
01-add-coordinate-to-realestate	ihrigb	classpath:/db/changelog/0.0.7.xml	2019-01-19 11:17:53.885097	12	EXECUTED	8:556abf24aa7edff83baf6e5d467c5acf	addColumn tableName=real_estates		\N	3.6.2	\N	\N	7896673360
02-add-coordinate-to-station	ihrigb	classpath:/db/changelog/0.0.7.xml	2019-01-19 11:17:53.901772	13	EXECUTED	8:1d3ddf4c3c7bf00f396839c26c4723e4	addColumn tableName=stations		\N	3.6.2	\N	\N	7896673360
03-operation-persistence	ihrigb	classpath:/db/changelog/0.0.7.xml	2019-01-19 11:17:53.976046	14	EXECUTED	8:af7540b36f21bfc0815e87e5f43d22e3	createTable tableName=operations; addForeignKeyConstraint baseTableName=operations, constraintName=operation-operation_key, referencedTableName=operation_keys; addForeignKeyConstraint baseTableName=operations, constraintName=operation-real_estate,...		\N	3.6.2	\N	\N	7896673360
00-change-pk-resource_keys	ihrigb	classpath:/db/changelog/0.0.8.xml	2019-02-08 08:37:23.69332	15	EXECUTED	8:5a842a14f2312c5364f03448bfcd7dad	dropPrimaryKey tableName=operation_resource_keys; addPrimaryKey constraintName=pk_operation_resource_keys, tableName=operation_resource_keys		\N	3.6.2	\N	\N	9615043582
01-add-real-estate-folder-address	ihrigb	classpath:/db/changelog/0.0.8.xml	2019-02-08 08:37:23.710668	16	EXECUTED	8:63531d41744854f0a471be2ba18c14e4	addColumn tableName=real_estates		\N	3.6.2	\N	\N	9615043582
00-add-description-column	ihrigb	classpath:/db/changelog/0.1.0.xml	2019-02-22 11:45:33.115476	17	EXECUTED	8:ca03fa0d33208b0d55982dec9839567a	addColumn tableName=real_estate_links		\N	3.6.3	\N	\N	0835933010
01-increase-column-size-realestate-pattern	ihrigb	classpath:/db/changelog/0.1.0.xml	2019-02-22 11:45:33.147987	18	EXECUTED	8:4e87160e9e75edaeae15f096538215b7	modifyDataType columnName=key, tableName=real_estates		\N	3.6.3	\N	\N	0835933010
02-create-riversector-table	ihrigb	classpath:/db/changelog/0.1.0.xml	2019-02-22 11:45:33.174878	19	EXECUTED	8:0a97db96d5da35170b8ffb7ae345c98e	createTable tableName=river_sectors		\N	3.6.3	\N	\N	0835933010
03-create-railway_coordinate_boxes	ihrigb	classpath:/db/changelog/0.1.0.xml	2019-02-22 11:45:33.196774	20	EXECUTED	8:bb8cb6d69b70a684b56321199494d916	createTable tableName=railway_coordinate_boxes		\N	3.6.3	\N	\N	0835933010
00-add_number_to_realestate	ihrigb	classpath:/db/changelog/0.1.1.xml	2019-03-20 17:22:25.648528	21	EXECUTED	8:899eb6419697941315b7e4bc6089d9d6	addColumn tableName=real_estates		\N	3.6.3	\N	\N	3102545554
01-create_realestate_tags_table	ihrigb	classpath:/db/changelog/0.1.1.xml	2019-03-20 17:22:25.728558	22	EXECUTED	8:62c99d8f17c03871e8f4e2430c952082	createTable tableName=real_estate_tags; addUniqueConstraint constraintName=real_estate_tags-name, tableName=real_estate_tags; createTable tableName=real_estate_real_estate_tags		\N	3.6.3	\N	\N	3102545554
01-create_cameras_table	ihrigb	classpath:/db/changelog/0.1.2.xml	2019-04-17 14:39:26.081263	23	EXECUTED	8:7e1bec36e6754920a58ce9143ee53acf	createTable tableName=cameras; addUniqueConstraint constraintName=cameras-name, tableName=cameras; addUniqueConstraint constraintName=cameras-uri, tableName=cameras		\N	3.6.3	\N	\N	5511965919
02-create_displayevents_table	ihrigb	classpath:/db/changelog/0.1.2.xml	2019-04-17 14:39:26.118899	24	EXECUTED	8:b9ff2a2e0a71405c0a639920fb6abbf3	createTable tableName=display_events		\N	3.6.3	\N	\N	5511965919
01-real_estate_additional	ihrigb	classpath:/db/changelog/0.1.3.xml	2019-05-31 09:27:40.11221	25	EXECUTED	8:04e77bee0250b456a5f5527fd0e6263b	addColumn tableName=operations		\N	3.6.3	\N	\N	9294860042
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: display_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.display_events (id, start_time, end_time, text, show_operation) FROM stdin;
\.


--
-- Data for Name: eventlogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eventlogs (id, "time", type, message) FROM stdin;
\.


--
-- Data for Name: operation_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.operation_keys (id, key, type, code, danger_to_life) FROM stdin;
\.


--
-- Data for Name: operation_resource_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.operation_resource_keys (operation_id, resource_key, index) FROM stdin;
1190003372	CHR 53	0
1190003372	LAMP 01	1
1190003372	LAMP 02	2
1190003372	LAMP 1/10-1	3
1190003372	LAMPER 1	4
1190003372	RKB 13/83-1	5
1190003372	RN 27/82-1	6
1190003464	AKB 05	0
1190003464	AKB 20/11-1	1
1190003464	AKB 20/83-1	2
1190003464	BÜRST 01	3
1190003464	BÜRST 02	4
1190003464	BÜRST 1/11-1	5
1190003464	BÜRST 2/72-1	6
1190003464	FB 02	7
1190003464	FB 07	8
1190003464	FB 08-2	9
1190003464	FB 30/12-1	10
1190003464	FUE KREIS ST.1	11
1190003464	FÜ.STAB LS1	12
1190003464	KID	13
1190003464	LAMP 01	14
1190003464	LAMP 02	15
1190003464	LAMP 1/10-1	16
1190003464	LAMP 1/11-1	17
1190003464	LAMP 1/23-1	18
1190003464	LAMP 1/25-1	19
1190003464	LAMP 1/30-1	20
1190003464	LAMP 1/44-1	21
1190003464	LAMP 1/46-1	22
1190003464	LAMPER 1	23
1190003464	MESSWEST	24
1190003464	RKB 11/82-1	25
1190003464	RKB 11/83-1	26
1190003464	RKB 13/83-1	27
1190003464	RKB 3/83-1	28
1190003464	RKB 5/82-1	29
1190003464	RN 8/83-6	30
1190003464	RN 8/83-7	31
1170022292	LAMP 01	0
1170022292	LAMP 02	1
1170022292	LAMP 1/10-1	2
1170022292	LAMP 1/25-1	3
1170022292	LAMP 1/44-1	4
1170022292	LAMPER 1	5
1170022994	LAMP 01	0
1170022994	LAMP 02	1
1170022994	LAMP 1/10-1	2
1170022994	LAMP 1/25-1	3
1170022994	LAMP 1/44-1	4
1170022994	LAMPER 1	5
1140022994	LAMP 01	0
1140022994	LAMP 02	1
1140022994	LAMP 1/10-1	2
1140022994	LAMP 1/25-1	3
1140022994	LAMP 1/44-1	4
1140022994	LAMPER 1	5
\.


--
-- Data for Name: operation_resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.operation_resources (operation_id, resource_id, index) FROM stdin;
\.


--
-- Data for Name: operations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.operations (id, "time", place, object, address_street, address_zip, address_town, address_district, latitude, longitude, code, message, notice, operation_key_id, real_estate_id, ambulance_called, directions, created, closed, year, real_estate_additional) FROM stdin;
1190003372	2019-01-23 09:32:35	\N	AH DIETRICH BONHOEFER ALTENHEIM	Hospitalstr. 1	\N	Lampertheim	Lampertheim	49.59380393	8.47416746000000032	H-1 RTH	Hubschrauberlandung am Gerätehaus	\N	\N	\N	t	24580	2019-01-24 14:41:00.941	t	2019	\N
1190003464	2019-01-23 20:13:48	\N	EUROPARING 16 / 5.OG	Europaring 16	\N	Lampertheim	Lampertheim	49.5868781499999969	8.4917226699999997	F-Y2	brennt Zimmer - hohes Haus - Menschenrettung	\N	\N	\N	t	24581	2019-01-24 14:41:02.118	t	2019	\N
1170022292	2017-05-24 13:09:39	\N	LITAUISCHES GYMNASIUM	Heide	\N	Lampertheim	Lampertheim	49.5834203599999981	8.50401431999999957	F-2 Y	unklarer Brand	Gebäude nebendran	\N	\N	t	24587	2019-02-08 08:37:30.285	t	2017	\N
1170022994	2017-05-24 13:09:39	\N	KEGELZENTRUM HEIDE	Heide	\N	Lampertheim	Lampertheim	49.5834203599999981	8.50401431999999957	F-2 Y	unklarer Brand	Gebäude nebendran	\N	e7298cf2-df89-4042-af87-8ade6c324747	t	24588	2019-02-08 08:49:54.679	t	2017	\N
1140022994	2017-05-24 13:09:39	\N	KEGELZENTRUM HEIDE	Heide	\N	Lampertheim	Lampertheim	49.5834203599999981	8.50401431999999957	F-2 Y	unklarer Brand	Gebäude nebendran	\N	e7298cf2-df89-4042-af87-8ade6c324747	t	24602	2019-02-22 12:19:41.064	t	2017	\N
\.


--
-- Data for Name: railway_coordinate_boxes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.railway_coordinate_boxes (id, ul_latitude, ul_longitude, lr_latitude, lr_longitude) FROM stdin;
8fe90e21-b940-4b6f-bbb9-98a30bd7d739	49.666052999999998	8.36293900000000079	49.5227199999999996	8.5973980000000001
\.


--
-- Data for Name: real_estate_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.real_estate_links (real_estate_id, link, description) FROM stdin;
\.


--
-- Data for Name: real_estate_real_estate_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.real_estate_real_estate_tags (real_estate_id, real_estate_tag_id) FROM stdin;
eafea189-d581-4f0e-9e4a-76137fbb2424	ab26e4a1-6d45-4832-a057-e033d999375b
\.


--
-- Data for Name: real_estate_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.real_estate_tags (id, name) FROM stdin;
ab26e4a1-6d45-4832-a057-e033d999375b	Kindergarten
c7d432f0-055f-4088-85b9-4acc028bb0a9	Krankenhaus
\.


--
-- Data for Name: real_estates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.real_estates (id, name, key, address_street, address_zip, address_town, address_district, information, latitude, longitude, folder_address, number) FROM stdin;
eafea189-d581-4f0e-9e4a-76137fbb2424	Krippe Zauberwald	KRIPPE	Helene-Lange-Weg 3	68623	Lampertheim	\N	\N	49.5961950000000016	8.47342199999999934	\N	\N
e7298cf2-df89-4042-af87-8ade6c324747	Kegelzentrum Heide	KEGELZENTRUM HEIDE	Heide	68623	Lampertheim	\N	\N	49.5836589815006334	8.50408315658569514	11	\N
\.


--
-- Data for Name: regex_patterns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regex_patterns (id, pattern, source, index) FROM stdin;
ID	Einsatznummer\\:[^\\S\\n]+(\\d+)\\r\\n	BODY	0
TIME	Zeiten:[^\\S\\n]+\\d{2}\\.\\d{2}\\.\\d{4}\\s\\d{2}\\:\\d{2}\\:\\d{2}\\s+(\\d{2}\\.\\d{2}\\.\\d{4}\\s\\d{2}\\:\\d{2}\\:\\d{2})\\r\\n	BODY	0
PLACE	Einsatzort\\:[^\\S\\n]+(.+)\\r\\n	BODY	0
OBJECT	Objekt\\:[^\\S\\n]+(.+)\\r\\n	BODY	0
TOWN	Ort\\:[^\\S\\n]+(.+)\\r\\n	BODY	0
DISTRICT	Ortsteil\\:[^\\S\\n]+(.+)\\r\\n	BODY	0
STREET	Straße\\:[^\\S\\n]+(.+)\\r\\n	BODY	0
LATITUDE	Koordinaten\\:[^\\S\\n]+POINT\\s\\(\\d+\\.\\d+\\s(\\d+\\.\\d+)\\)\\r\\n	BODY	0
LONGITUDE	Koordinaten\\:[^\\S\\n]+POINT\\s\\((\\d+\\.\\d+)\\s\\d+\\.\\d+\\)\\r\\n	BODY	0
NOTICE	Bemerkung\\:[^\\S\\n]+(.+)\\r\\n	BODY	0
MESSAGE	Meldebild\\:[^\\S\\n]+(.+)\\r\\n	BODY	0
RESOURCE_KEYS	EM\\:(.+)\\s\\salarmiert.+\\r\\n	BODY	0
CODE	^\\d+\\s\\/\\s([FH]\\-[^-]+)\\s\\-\\s.*$	SUBJECT	0
\.


--
-- Data for Name: resourcekey_patterns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resourcekey_patterns (id, pattern, mode) FROM stdin;
\.


--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resources (id, name, radio, station_id, in_service, key) FROM stdin;
\.


--
-- Data for Name: river_sectors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.river_sectors (id, river, kmfrom, kmto, kminterval) FROM stdin;
64516879-ac34-4be2-868b-55ce4efa5c63	RHINE	430	450	1
\.


--
-- Data for Name: stations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stations (id, name, address_street, address_zip, address_town, address_district, latitude, longitude) FROM stdin;
7401651b-2705-461a-a6dd-9a871a011669	Mitte	Florianstraße 4	68623	Lampertheim	\N	49.5912549999999968	8.48047799999999974
\.


--
-- Data for Name: BLOBS; Type: BLOBS; Schema: -; Owner: 
--

BEGIN;

SELECT pg_catalog.lo_open('24576', 131072);
SELECT pg_catalog.lowrite(0, '\x7b2274797065223a2246656174757265436f6c6c656374696f6e222c2262626f78223a5b382e3437343136382c34392e35393136342c382e3438303835322c34392e3539333931345d2c226665617475726573223a5b7b2274797065223a2246656174757265222c2270726f70657274696573223a7b2273756d6d617279223a5b7b226475726174696f6e223a3135362e342c2264697374616e6365223a3636392e367d5d2c2262626f78223a5b382e3437343136382c34392e35393136342c382e3438303835322c34392e3539333931345d2c227761795f706f696e7473223a5b302c31385d7d2c2267656f6d65747279223a7b2274797065223a224c696e65537472696e67222c22636f6f7264696e61746573223a5b5b382e3438303835322c34392e35393136345d2c5b382e3438303834382c34392e3539313635355d2c5b382e3438303536382c34392e35393234375d2c5b382e3438303437372c34392e3539323636395d2c5b382e3438303333352c34392e3539323937375d2c5b382e3438303237372c34392e35393330335d2c5b382e3438303237392c34392e35393331335d2c5b382e34383031332c34392e3539333432385d2c5b382e3438303035322c34392e3539333630365d2c5b382e34373939382c34392e3539333735375d2c5b382e3437393936382c34392e3539333737345d2c5b382e3437393836342c34392e3539333835355d2c5b382e3437393735332c34392e35393338375d2c5b382e3437393532392c34392e3539333838365d2c5b382e3437393434392c34392e3539333838345d2c5b382e3437393237372c34392e35393338385d2c5b382e3437373834312c34392e3539333931345d2c5b382e3437363233322c34392e3539333930355d2c5b382e3437343136382c34392e3539333931335d5d7d2c226964223a226669642d2d37336530613366335f31363837303931343465665f2d32653032227d5d7d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('24577', 131072);
SELECT pg_catalog.lowrite(0, '\x7b2274797065223a2246656174757265436f6c6c656374696f6e222c2262626f78223a5b382e3437373537352c34392e3538363532322c382e3439323639332c34392e3539333431325d2c226665617475726573223a5b7b2274797065223a2246656174757265222c2270726f70657274696573223a7b2273756d6d617279223a5b7b226475726174696f6e223a3237392e342c2264697374616e6365223a323032342e397d5d2c2262626f78223a5b382e3437373537352c34392e3538363532322c382e3439323639332c34392e3539333431325d2c227761795f706f696e7473223a5b302c33375d7d2c2267656f6d65747279223a7b2274797065223a224c696e65537472696e67222c22636f6f7264696e61746573223a5b5b382e3438303835322c34392e35393136345d2c5b382e3438303834382c34392e3539313635355d2c5b382e3438303536382c34392e35393234375d2c5b382e3438303437372c34392e3539323636395d2c5b382e3438303333352c34392e3539323937375d2c5b382e3438303237372c34392e35393330335d2c5b382e3438303137362c34392e35393239375d2c5b382e3437393937372c34392e3539323932355d2c5b382e3437393030332c34392e35393238345d2c5b382e3437383838382c34392e3539333431325d2c5b382e3437373933352c34392e3539333138345d2c5b382e34373739372c34392e3539333130385d2c5b382e34373736372c34392e3539303538355d2c5b382e3437373537352c34392e3539303438385d2c5b382e3437383638332c34392e3539303035375d2c5b382e3437393930362c34392e3538393535365d2c5b382e34373939362c34392e3538393533335d2c5b382e34383031342c34392e3538393434325d2c5b382e3438303735342c34392e3538393131335d2c5b382e3438313837392c34392e3538383530385d2c5b382e3438323534392c34392e3538383136325d2c5b382e34383239382c34392e3538373938345d2c5b382e3438333436332c34392e3538373833375d2c5b382e3438343131372c34392e3538373639385d2c5b382e343834362c34392e3538373634355d2c5b382e3438353238362c34392e3538373633385d2c5b382e3438363130362c34392e3538373639395d2c5b382e3438363235362c34392e3538373731355d2c5b382e343837342c34392e35383738355d2c5b382e3438383237322c34392e3538373837395d2c5b382e3438383938382c34392e3538373834315d2c5b382e3438393930332c34392e3538373732385d2c5b382e3439303432342c34392e3538373634365d2c5b382e3439313439342c34392e3538373435385d2c5b382e3439323639332c34392e3538373232395d2c5b382e34393235362c34392e3538373131385d2c5b382e3439313834352c34392e3538363532325d2c5b382e3439313530332c34392e3538363639335d5d7d2c226964223a226669642d2d636463646433315f31363835353833656163645f2d3535227d5d7d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('24578', 131072);
SELECT pg_catalog.lowrite(0, '\x7b2274797065223a2246656174757265436f6c6c656374696f6e222c2262626f78223a5b382e3437373537352c34392e3538363532322c382e3439323639332c34392e3539333431325d2c226665617475726573223a5b7b2274797065223a2246656174757265222c2270726f70657274696573223a7b2273756d6d617279223a5b7b226475726174696f6e223a3237392e342c2264697374616e6365223a323032342e397d5d2c2262626f78223a5b382e3437373537352c34392e3538363532322c382e3439323639332c34392e3539333431325d2c227761795f706f696e7473223a5b302c33375d7d2c2267656f6d65747279223a7b2274797065223a224c696e65537472696e67222c22636f6f7264696e61746573223a5b5b382e3438303835322c34392e35393136345d2c5b382e3438303834382c34392e3539313635355d2c5b382e3438303536382c34392e35393234375d2c5b382e3438303437372c34392e3539323636395d2c5b382e3438303333352c34392e3539323937375d2c5b382e3438303237372c34392e35393330335d2c5b382e3438303137362c34392e35393239375d2c5b382e3437393937372c34392e3539323932355d2c5b382e3437393030332c34392e35393238345d2c5b382e3437383838382c34392e3539333431325d2c5b382e3437373933352c34392e3539333138345d2c5b382e34373739372c34392e3539333130385d2c5b382e34373736372c34392e3539303538355d2c5b382e3437373537352c34392e3539303438385d2c5b382e3437383638332c34392e3539303035375d2c5b382e3437393930362c34392e3538393535365d2c5b382e34373939362c34392e3538393533335d2c5b382e34383031342c34392e3538393434325d2c5b382e3438303735342c34392e3538393131335d2c5b382e3438313837392c34392e3538383530385d2c5b382e3438323534392c34392e3538383136325d2c5b382e34383239382c34392e3538373938345d2c5b382e3438333436332c34392e3538373833375d2c5b382e3438343131372c34392e3538373639385d2c5b382e343834362c34392e3538373634355d2c5b382e3438353238362c34392e3538373633385d2c5b382e3438363130362c34392e3538373639395d2c5b382e3438363235362c34392e3538373731355d2c5b382e343837342c34392e35383738355d2c5b382e3438383237322c34392e3538373837395d2c5b382e3438383938382c34392e3538373834315d2c5b382e3438393930332c34392e3538373732385d2c5b382e3439303432342c34392e3538373634365d2c5b382e3439313439342c34392e3538373435385d2c5b382e3439323639332c34392e3538373232395d2c5b382e34393235362c34392e3538373131385d2c5b382e3439313834352c34392e3538363532325d2c5b382e3439313530332c34392e3538363639335d5d7d2c226964223a226669642d2d636463646433315f31363835353833656163645f2d3534227d5d7d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('24580', 131072);
SELECT pg_catalog.lowrite(0, '\x7b2274797065223a2246656174757265436f6c6c656374696f6e222c2262626f78223a5b382e3437343136382c34392e35393136342c382e3438303835322c34392e3539333931345d2c226665617475726573223a5b7b2274797065223a2246656174757265222c2270726f70657274696573223a7b2273756d6d617279223a5b7b226475726174696f6e223a3135362e342c2264697374616e6365223a3636392e367d5d2c2262626f78223a5b382e3437343136382c34392e35393136342c382e3438303835322c34392e3539333931345d2c227761795f706f696e7473223a5b302c31385d7d2c2267656f6d65747279223a7b2274797065223a224c696e65537472696e67222c22636f6f7264696e61746573223a5b5b382e3438303835322c34392e35393136345d2c5b382e3438303834382c34392e3539313635355d2c5b382e3438303536382c34392e35393234375d2c5b382e3438303437372c34392e3539323636395d2c5b382e3438303333352c34392e3539323937375d2c5b382e3438303237372c34392e35393330335d2c5b382e3438303237392c34392e35393331335d2c5b382e34383031332c34392e3539333432385d2c5b382e3438303035322c34392e3539333630365d2c5b382e34373939382c34392e3539333735375d2c5b382e3437393936382c34392e3539333737345d2c5b382e3437393836342c34392e3539333835355d2c5b382e3437393735332c34392e35393338375d2c5b382e3437393532392c34392e3539333838365d2c5b382e3437393434392c34392e3539333838345d2c5b382e3437393237372c34392e35393338385d2c5b382e3437373834312c34392e3539333931345d2c5b382e3437363233322c34392e3539333930355d2c5b382e3437343136382c34392e3539333931335d5d7d2c226964223a226669642d2d37336530613366335f31363837303931343465665f2d32653032227d5d7d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('24581', 131072);
SELECT pg_catalog.lowrite(0, '\x7b2274797065223a2246656174757265436f6c6c656374696f6e222c2262626f78223a5b382e3437373537352c34392e3538363532322c382e3439323639332c34392e3539333431325d2c226665617475726573223a5b7b2274797065223a2246656174757265222c2270726f70657274696573223a7b2273756d6d617279223a5b7b226475726174696f6e223a3237392e342c2264697374616e6365223a323032342e397d5d2c2262626f78223a5b382e3437373537352c34392e3538363532322c382e3439323639332c34392e3539333431325d2c227761795f706f696e7473223a5b302c33375d7d2c2267656f6d65747279223a7b2274797065223a224c696e65537472696e67222c22636f6f7264696e61746573223a5b5b382e3438303835322c34392e35393136345d2c5b382e3438303834382c34392e3539313635355d2c5b382e3438303536382c34392e35393234375d2c5b382e3438303437372c34392e3539323636395d2c5b382e3438303333352c34392e3539323937375d2c5b382e3438303237372c34392e35393330335d2c5b382e3438303137362c34392e35393239375d2c5b382e3437393937372c34392e3539323932355d2c5b382e3437393030332c34392e35393238345d2c5b382e3437383838382c34392e3539333431325d2c5b382e3437373933352c34392e3539333138345d2c5b382e34373739372c34392e3539333130385d2c5b382e34373736372c34392e3539303538355d2c5b382e3437373537352c34392e3539303438385d2c5b382e3437383638332c34392e3539303035375d2c5b382e3437393930362c34392e3538393535365d2c5b382e34373939362c34392e3538393533335d2c5b382e34383031342c34392e3538393434325d2c5b382e3438303735342c34392e3538393131335d2c5b382e3438313837392c34392e3538383530385d2c5b382e3438323534392c34392e3538383136325d2c5b382e34383239382c34392e3538373938345d2c5b382e3438333436332c34392e3538373833375d2c5b382e3438343131372c34392e3538373639385d2c5b382e343834362c34392e3538373634355d2c5b382e3438353238362c34392e3538373633385d2c5b382e3438363130362c34392e3538373639395d2c5b382e3438363235362c34392e3538373731355d2c5b382e343837342c34392e35383738355d2c5b382e3438383237322c34392e3538373837395d2c5b382e3438383938382c34392e3538373834315d2c5b382e3438393930332c34392e3538373732385d2c5b382e3439303432342c34392e3538373634365d2c5b382e3439313439342c34392e3538373435385d2c5b382e3439323639332c34392e3538373232395d2c5b382e34393235362c34392e3538373131385d2c5b382e3439313834352c34392e3538363532325d2c5b382e3439313530332c34392e3538363639335d5d7d2c226964223a226669642d2d636463646433315f31363835353833656163645f2d3534227d5d7d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('24584', 131072);
SELECT pg_catalog.lowrite(0, '\x7b2274797065223a2246656174757265436f6c6c656374696f6e222c2262626f78223a5b382e3437373537352c34392e3538333432322c382e3530343031362c34392e3539333431325d2c226665617475726573223a5b7b2274797065223a2246656174757265222c2270726f70657274696573223a7b2273756d6d617279223a5b7b226475726174696f6e223a3337322e342c2264697374616e6365223a323833382e397d5d2c2262626f78223a5b382e3437373537352c34392e3538333432322c382e3530343031362c34392e3539333431325d2c227761795f706f696e7473223a5b302c34375d7d2c2267656f6d65747279223a7b2274797065223a224c696e65537472696e67222c22636f6f7264696e61746573223a5b5b382e3438303835322c34392e35393136345d2c5b382e3438303834382c34392e3539313635355d2c5b382e3438303536382c34392e35393234375d2c5b382e3438303437372c34392e3539323636395d2c5b382e3438303333352c34392e3539323937375d2c5b382e3438303237372c34392e35393330335d2c5b382e3438303137362c34392e35393239375d2c5b382e3437393937372c34392e3539323932355d2c5b382e3437393030332c34392e35393238345d2c5b382e3437383838382c34392e3539333431325d2c5b382e3437373933352c34392e3539333138345d2c5b382e34373739372c34392e3539333130385d2c5b382e34373736372c34392e3539303538355d2c5b382e3437373537352c34392e3539303438385d2c5b382e3437383638332c34392e3539303035375d2c5b382e3437393930362c34392e3538393535365d2c5b382e34373939362c34392e3538393533335d2c5b382e34383031342c34392e3538393434325d2c5b382e3438303735342c34392e3538393131335d2c5b382e3438313837392c34392e3538383530385d2c5b382e3438323534392c34392e3538383136325d2c5b382e34383239382c34392e3538373938345d2c5b382e3438333436332c34392e3538373833375d2c5b382e3438343131372c34392e3538373639385d2c5b382e343834362c34392e3538373634355d2c5b382e3438353238362c34392e3538373633385d2c5b382e3438363130362c34392e3538373639395d2c5b382e3438363235362c34392e3538373731355d2c5b382e343837342c34392e35383738355d2c5b382e3438383237322c34392e3538373837395d2c5b382e3438383938382c34392e3538373834315d2c5b382e3438393930332c34392e3538373732385d2c5b382e3439303432342c34392e3538373634365d2c5b382e3439313439342c34392e3538373435385d2c5b382e3439323639332c34392e3538373232395d2c5b382e3439333231382c34392e3538373132315d2c5b382e3439333537392c34392e3538373035375d2c5b382e34393335352c34392e3538373030365d2c5b382e3439343339312c34392e3538363739395d2c5b382e3439353433342c34392e3538363531385d2c5b382e3439353437342c34392e3538363535355d2c5b382e3439383434382c34392e3538353534315d2c5b382e3439393331372c34392e3538353234355d2c5b382e3439393431322c34392e3538353334335d2c5b382e3530313534332c34392e3538343437365d2c5b382e3530333534352c34392e3538333633335d2c5b382e35303336362c34392e3538333537325d2c5b382e3530343031362c34392e3538333432325d5d7d2c226964223a226669642d2d636463646433315f31363862393965343532325f31326237227d5d7d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('24585', 131072);
SELECT pg_catalog.lowrite(0, '\x7b2274797065223a2246656174757265436f6c6c656374696f6e222c2262626f78223a5b382e3437373537352c34392e3538333432322c382e3530343031362c34392e3539333431325d2c226665617475726573223a5b7b2274797065223a2246656174757265222c2270726f70657274696573223a7b2273756d6d617279223a5b7b226475726174696f6e223a3337322e342c2264697374616e6365223a323833382e397d5d2c2262626f78223a5b382e3437373537352c34392e3538333432322c382e3530343031362c34392e3539333431325d2c227761795f706f696e7473223a5b302c34375d7d2c2267656f6d65747279223a7b2274797065223a224c696e65537472696e67222c22636f6f7264696e61746573223a5b5b382e3438303835322c34392e35393136345d2c5b382e3438303834382c34392e3539313635355d2c5b382e3438303536382c34392e35393234375d2c5b382e3438303437372c34392e3539323636395d2c5b382e3438303333352c34392e3539323937375d2c5b382e3438303237372c34392e35393330335d2c5b382e3438303137362c34392e35393239375d2c5b382e3437393937372c34392e3539323932355d2c5b382e3437393030332c34392e35393238345d2c5b382e3437383838382c34392e3539333431325d2c5b382e3437373933352c34392e3539333138345d2c5b382e34373739372c34392e3539333130385d2c5b382e34373736372c34392e3539303538355d2c5b382e3437373537352c34392e3539303438385d2c5b382e3437383638332c34392e3539303035375d2c5b382e3437393930362c34392e3538393535365d2c5b382e34373939362c34392e3538393533335d2c5b382e34383031342c34392e3538393434325d2c5b382e3438303735342c34392e3538393131335d2c5b382e3438313837392c34392e3538383530385d2c5b382e3438323534392c34392e3538383136325d2c5b382e34383239382c34392e3538373938345d2c5b382e3438333436332c34392e3538373833375d2c5b382e3438343131372c34392e3538373639385d2c5b382e343834362c34392e3538373634355d2c5b382e3438353238362c34392e3538373633385d2c5b382e3438363130362c34392e3538373639395d2c5b382e3438363235362c34392e3538373731355d2c5b382e343837342c34392e35383738355d2c5b382e3438383237322c34392e3538373837395d2c5b382e3438383938382c34392e3538373834315d2c5b382e3438393930332c34392e3538373732385d2c5b382e3439303432342c34392e3538373634365d2c5b382e3439313439342c34392e3538373435385d2c5b382e3439323639332c34392e3538373232395d2c5b382e3439333231382c34392e3538373132315d2c5b382e3439333537392c34392e3538373035375d2c5b382e34393335352c34392e3538373030365d2c5b382e3439343339312c34392e3538363739395d2c5b382e3439353433342c34392e3538363531385d2c5b382e3439353437342c34392e3538363535355d2c5b382e3439383434382c34392e3538353534315d2c5b382e3439393331372c34392e3538353234355d2c5b382e3439393431322c34392e3538353334335d2c5b382e3530313534332c34392e3538343437365d2c5b382e3530333534352c34392e3538333633335d2c5b382e35303336362c34392e3538333537325d2c5b382e3530343031362c34392e3538333432325d5d7d2c226964223a226669642d2d37336530613366335f31363862656363353133625f2d31636664227d5d7d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('24586', 131072);
SELECT pg_catalog.lowrite(0, '\x7b2274797065223a2246656174757265436f6c6c656374696f6e222c2262626f78223a5b382e3437373537352c34392e3538333432322c382e3530343031362c34392e3539333431325d2c226665617475726573223a5b7b2274797065223a2246656174757265222c2270726f70657274696573223a7b2273756d6d617279223a5b7b226475726174696f6e223a3337322e342c2264697374616e6365223a323833382e397d5d2c2262626f78223a5b382e3437373537352c34392e3538333432322c382e3530343031362c34392e3539333431325d2c227761795f706f696e7473223a5b302c34375d7d2c2267656f6d65747279223a7b2274797065223a224c696e65537472696e67222c22636f6f7264696e61746573223a5b5b382e3438303835322c34392e35393136345d2c5b382e3438303834382c34392e3539313635355d2c5b382e3438303536382c34392e35393234375d2c5b382e3438303437372c34392e3539323636395d2c5b382e3438303333352c34392e3539323937375d2c5b382e3438303237372c34392e35393330335d2c5b382e3438303137362c34392e35393239375d2c5b382e3437393937372c34392e3539323932355d2c5b382e3437393030332c34392e35393238345d2c5b382e3437383838382c34392e3539333431325d2c5b382e3437373933352c34392e3539333138345d2c5b382e34373739372c34392e3539333130385d2c5b382e34373736372c34392e3539303538355d2c5b382e3437373537352c34392e3539303438385d2c5b382e3437383638332c34392e3539303035375d2c5b382e3437393930362c34392e3538393535365d2c5b382e34373939362c34392e3538393533335d2c5b382e34383031342c34392e3538393434325d2c5b382e3438303735342c34392e3538393131335d2c5b382e3438313837392c34392e3538383530385d2c5b382e3438323534392c34392e3538383136325d2c5b382e34383239382c34392e3538373938345d2c5b382e3438333436332c34392e3538373833375d2c5b382e3438343131372c34392e3538373639385d2c5b382e343834362c34392e3538373634355d2c5b382e3438353238362c34392e3538373633385d2c5b382e3438363130362c34392e3538373639395d2c5b382e3438363235362c34392e3538373731355d2c5b382e343837342c34392e35383738355d2c5b382e3438383237322c34392e3538373837395d2c5b382e3438383938382c34392e3538373834315d2c5b382e3438393930332c34392e3538373732385d2c5b382e3439303432342c34392e3538373634365d2c5b382e3439313439342c34392e3538373435385d2c5b382e3439323639332c34392e3538373232395d2c5b382e3439333231382c34392e3538373132315d2c5b382e3439333537392c34392e3538373035375d2c5b382e34393335352c34392e3538373030365d2c5b382e3439343339312c34392e3538363739395d2c5b382e3439353433342c34392e3538363531385d2c5b382e3439353437342c34392e3538363535355d2c5b382e3439383434382c34392e3538353534315d2c5b382e3439393331372c34392e3538353234355d2c5b382e3439393431322c34392e3538353334335d2c5b382e3530313534332c34392e3538343437365d2c5b382e3530333534352c34392e3538333633335d2c5b382e35303336362c34392e3538333537325d2c5b382e3530343031362c34392e3538333432325d5d7d2c226964223a226669642d2d636463646433315f31363862393965343532325f31333632227d5d7d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('24587', 131072);
SELECT pg_catalog.lowrite(0, '\x7b2274797065223a2246656174757265436f6c6c656374696f6e222c2262626f78223a5b382e3437373537352c34392e3538333432322c382e3530343031362c34392e3539333431325d2c226665617475726573223a5b7b2274797065223a2246656174757265222c2270726f70657274696573223a7b2273756d6d617279223a5b7b226475726174696f6e223a3337322e342c2264697374616e6365223a323833382e397d5d2c2262626f78223a5b382e3437373537352c34392e3538333432322c382e3530343031362c34392e3539333431325d2c227761795f706f696e7473223a5b302c34375d7d2c2267656f6d65747279223a7b2274797065223a224c696e65537472696e67222c22636f6f7264696e61746573223a5b5b382e3438303835322c34392e35393136345d2c5b382e3438303834382c34392e3539313635355d2c5b382e3438303536382c34392e35393234375d2c5b382e3438303437372c34392e3539323636395d2c5b382e3438303333352c34392e3539323937375d2c5b382e3438303237372c34392e35393330335d2c5b382e3438303137362c34392e35393239375d2c5b382e3437393937372c34392e3539323932355d2c5b382e3437393030332c34392e35393238345d2c5b382e3437383838382c34392e3539333431325d2c5b382e3437373933352c34392e3539333138345d2c5b382e34373739372c34392e3539333130385d2c5b382e34373736372c34392e3539303538355d2c5b382e3437373537352c34392e3539303438385d2c5b382e3437383638332c34392e3539303035375d2c5b382e3437393930362c34392e3538393535365d2c5b382e34373939362c34392e3538393533335d2c5b382e34383031342c34392e3538393434325d2c5b382e3438303735342c34392e3538393131335d2c5b382e3438313837392c34392e3538383530385d2c5b382e3438323534392c34392e3538383136325d2c5b382e34383239382c34392e3538373938345d2c5b382e3438333436332c34392e3538373833375d2c5b382e3438343131372c34392e3538373639385d2c5b382e343834362c34392e3538373634355d2c5b382e3438353238362c34392e3538373633385d2c5b382e3438363130362c34392e3538373639395d2c5b382e3438363235362c34392e3538373731355d2c5b382e343837342c34392e35383738355d2c5b382e3438383237322c34392e3538373837395d2c5b382e3438383938382c34392e3538373834315d2c5b382e3438393930332c34392e3538373732385d2c5b382e3439303432342c34392e3538373634365d2c5b382e3439313439342c34392e3538373435385d2c5b382e3439323639332c34392e3538373232395d2c5b382e3439333231382c34392e3538373132315d2c5b382e3439333537392c34392e3538373035375d2c5b382e34393335352c34392e3538373030365d2c5b382e3439343339312c34392e3538363739395d2c5b382e3439353433342c34392e3538363531385d2c5b382e3439353437342c34392e3538363535355d2c5b382e3439383434382c34392e3538353534315d2c5b382e3439393331372c34392e3538353234355d2c5b382e3439393431322c34392e3538353334335d2c5b382e3530313534332c34392e3538343437365d2c5b382e3530333534352c34392e3538333633335d2c5b382e35303336362c34392e3538333537325d2c5b382e3530343031362c34392e3538333432325d5d7d2c226964223a226669642d2d37336530613366335f31363862656363353133625f2d31636664227d5d7d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('24588', 131072);
SELECT pg_catalog.lowrite(0, '\x7b2274797065223a2246656174757265436f6c6c656374696f6e222c2262626f78223a5b382e3437373537352c34392e3538333432322c382e3530343031362c34392e3539333431325d2c226665617475726573223a5b7b2274797065223a2246656174757265222c2270726f70657274696573223a7b2273756d6d617279223a5b7b226475726174696f6e223a3337322e342c2264697374616e6365223a323833382e397d5d2c2262626f78223a5b382e3437373537352c34392e3538333432322c382e3530343031362c34392e3539333431325d2c227761795f706f696e7473223a5b302c34375d7d2c2267656f6d65747279223a7b2274797065223a224c696e65537472696e67222c22636f6f7264696e61746573223a5b5b382e3438303835322c34392e35393136345d2c5b382e3438303834382c34392e3539313635355d2c5b382e3438303536382c34392e35393234375d2c5b382e3438303437372c34392e3539323636395d2c5b382e3438303333352c34392e3539323937375d2c5b382e3438303237372c34392e35393330335d2c5b382e3438303137362c34392e35393239375d2c5b382e3437393937372c34392e3539323932355d2c5b382e3437393030332c34392e35393238345d2c5b382e3437383838382c34392e3539333431325d2c5b382e3437373933352c34392e3539333138345d2c5b382e34373739372c34392e3539333130385d2c5b382e34373736372c34392e3539303538355d2c5b382e3437373537352c34392e3539303438385d2c5b382e3437383638332c34392e3539303035375d2c5b382e3437393930362c34392e3538393535365d2c5b382e34373939362c34392e3538393533335d2c5b382e34383031342c34392e3538393434325d2c5b382e3438303735342c34392e3538393131335d2c5b382e3438313837392c34392e3538383530385d2c5b382e3438323534392c34392e3538383136325d2c5b382e34383239382c34392e3538373938345d2c5b382e3438333436332c34392e3538373833375d2c5b382e3438343131372c34392e3538373639385d2c5b382e343834362c34392e3538373634355d2c5b382e3438353238362c34392e3538373633385d2c5b382e3438363130362c34392e3538373639395d2c5b382e3438363235362c34392e3538373731355d2c5b382e343837342c34392e35383738355d2c5b382e3438383237322c34392e3538373837395d2c5b382e3438383938382c34392e3538373834315d2c5b382e3438393930332c34392e3538373732385d2c5b382e3439303432342c34392e3538373634365d2c5b382e3439313439342c34392e3538373435385d2c5b382e3439323639332c34392e3538373232395d2c5b382e3439333231382c34392e3538373132315d2c5b382e3439333537392c34392e3538373035375d2c5b382e34393335352c34392e3538373030365d2c5b382e3439343339312c34392e3538363739395d2c5b382e3439353433342c34392e3538363531385d2c5b382e3439353437342c34392e3538363535355d2c5b382e3439383434382c34392e3538353534315d2c5b382e3439393331372c34392e3538353234355d2c5b382e3439393431322c34392e3538353334335d2c5b382e3530313534332c34392e3538343437365d2c5b382e3530333534352c34392e3538333633335d2c5b382e35303336362c34392e3538333537325d2c5b382e3530343031362c34392e3538333432325d5d7d2c226964223a226669642d2d636463646433315f31363862393965343532325f31333632227d5d7d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('24601', 131072);
SELECT pg_catalog.lowrite(0, '\x7b2274797065223a2246656174757265436f6c6c656374696f6e222c2262626f78223a5b382e3437373537352c34392e3538333432322c382e3530343031362c34392e3539333431325d2c226665617475726573223a5b7b2274797065223a2246656174757265222c2270726f70657274696573223a7b2273756d6d617279223a5b7b226475726174696f6e223a3337322e342c2264697374616e6365223a323833382e397d5d2c2262626f78223a5b382e3437373537352c34392e3538333432322c382e3530343031362c34392e3539333431325d2c227761795f706f696e7473223a5b302c34375d7d2c2267656f6d65747279223a7b2274797065223a224c696e65537472696e67222c22636f6f7264696e61746573223a5b5b382e3438303835322c34392e35393136345d2c5b382e3438303834382c34392e3539313635355d2c5b382e3438303536382c34392e35393234375d2c5b382e3438303437372c34392e3539323636395d2c5b382e3438303333352c34392e3539323937375d2c5b382e3438303237372c34392e35393330335d2c5b382e3438303137362c34392e35393239375d2c5b382e3437393937372c34392e3539323932355d2c5b382e3437393030332c34392e35393238345d2c5b382e3437383838382c34392e3539333431325d2c5b382e3437373933352c34392e3539333138345d2c5b382e34373739372c34392e3539333130385d2c5b382e34373736372c34392e3539303538355d2c5b382e3437373537352c34392e3539303438385d2c5b382e3437383638332c34392e3539303035375d2c5b382e3437393930362c34392e3538393535365d2c5b382e34373939362c34392e3538393533335d2c5b382e34383031342c34392e3538393434325d2c5b382e3438303735342c34392e3538393131335d2c5b382e3438313837392c34392e3538383530385d2c5b382e3438323534392c34392e3538383136325d2c5b382e34383239382c34392e3538373938345d2c5b382e3438333436332c34392e3538373833375d2c5b382e3438343131372c34392e3538373639385d2c5b382e343834362c34392e3538373634355d2c5b382e3438353238362c34392e3538373633385d2c5b382e3438363130362c34392e3538373639395d2c5b382e3438363235362c34392e3538373731355d2c5b382e343837342c34392e35383738355d2c5b382e3438383237322c34392e3538373837395d2c5b382e3438383938382c34392e3538373834315d2c5b382e3438393930332c34392e3538373732385d2c5b382e3439303432342c34392e3538373634365d2c5b382e3439313439342c34392e3538373435385d2c5b382e3439323639332c34392e3538373232395d2c5b382e3439333231382c34392e3538373132315d2c5b382e3439333537392c34392e3538373035375d2c5b382e34393335352c34392e3538373030365d2c5b382e3439343339312c34392e3538363739395d2c5b382e3439353433342c34392e3538363531385d2c5b382e3439353437342c34392e3538363535355d2c5b382e3439383434382c34392e3538353534315d2c5b382e3439393331372c34392e3538353234355d2c5b382e3439393431322c34392e3538353334335d2c5b382e3530313534332c34392e3538343437365d2c5b382e3530333534352c34392e3538333633335d2c5b382e35303336362c34392e3538333537325d2c5b382e3530343031362c34392e3538333432325d5d7d2c226964223a226669642d2d636463646433315f31363865313664303936375f35383635227d5d7d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('24602', 131072);
SELECT pg_catalog.lowrite(0, '\x7b2274797065223a2246656174757265436f6c6c656374696f6e222c2262626f78223a5b382e3437373537352c34392e3538333432322c382e3530343031362c34392e3539333431325d2c226665617475726573223a5b7b2274797065223a2246656174757265222c2270726f70657274696573223a7b2273756d6d617279223a5b7b226475726174696f6e223a3337322e342c2264697374616e6365223a323833382e397d5d2c2262626f78223a5b382e3437373537352c34392e3538333432322c382e3530343031362c34392e3539333431325d2c227761795f706f696e7473223a5b302c34375d7d2c2267656f6d65747279223a7b2274797065223a224c696e65537472696e67222c22636f6f7264696e61746573223a5b5b382e3438303835322c34392e35393136345d2c5b382e3438303834382c34392e3539313635355d2c5b382e3438303536382c34392e35393234375d2c5b382e3438303437372c34392e3539323636395d2c5b382e3438303333352c34392e3539323937375d2c5b382e3438303237372c34392e35393330335d2c5b382e3438303137362c34392e35393239375d2c5b382e3437393937372c34392e3539323932355d2c5b382e3437393030332c34392e35393238345d2c5b382e3437383838382c34392e3539333431325d2c5b382e3437373933352c34392e3539333138345d2c5b382e34373739372c34392e3539333130385d2c5b382e34373736372c34392e3539303538355d2c5b382e3437373537352c34392e3539303438385d2c5b382e3437383638332c34392e3539303035375d2c5b382e3437393930362c34392e3538393535365d2c5b382e34373939362c34392e3538393533335d2c5b382e34383031342c34392e3538393434325d2c5b382e3438303735342c34392e3538393131335d2c5b382e3438313837392c34392e3538383530385d2c5b382e3438323534392c34392e3538383136325d2c5b382e34383239382c34392e3538373938345d2c5b382e3438333436332c34392e3538373833375d2c5b382e3438343131372c34392e3538373639385d2c5b382e343834362c34392e3538373634355d2c5b382e3438353238362c34392e3538373633385d2c5b382e3438363130362c34392e3538373639395d2c5b382e3438363235362c34392e3538373731355d2c5b382e343837342c34392e35383738355d2c5b382e3438383237322c34392e3538373837395d2c5b382e3438383938382c34392e3538373834315d2c5b382e3438393930332c34392e3538373732385d2c5b382e3439303432342c34392e3538373634365d2c5b382e3439313439342c34392e3538373435385d2c5b382e3439323639332c34392e3538373232395d2c5b382e3439333231382c34392e3538373132315d2c5b382e3439333537392c34392e3538373035375d2c5b382e34393335352c34392e3538373030365d2c5b382e3439343339312c34392e3538363739395d2c5b382e3439353433342c34392e3538363531385d2c5b382e3439353437342c34392e3538363535355d2c5b382e3439383434382c34392e3538353534315d2c5b382e3439393331372c34392e3538353234355d2c5b382e3439393431322c34392e3538353334335d2c5b382e3530313534332c34392e3538343437365d2c5b382e3530333534352c34392e3538333633335d2c5b382e35303336362c34392e3538333537325d2c5b382e3530343031362c34392e3538333432325d5d7d2c226964223a226669642d2d636463646433315f31363865313664303936375f35383635227d5d7d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('24635', 131072);
SELECT pg_catalog.lowrite(0, '\x3c68313e457373656e206865757465204162656e643c2f68313e3c703e5363686e69747a656c206d697420506f6d6d657320756e642053616c61743c2f703e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('24636', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('24637', 131072);
SELECT pg_catalog.lowrite(0, '\x3c68313e457373656e3c2f68313e3c703e5363686e69747a656c206d697420506f6d6d657320756e642053616c61743c2f703e');
SELECT pg_catalog.lo_close(0);

COMMIT;

--
-- Name: ambulance_patterns ambulance_patterns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ambulance_patterns
    ADD CONSTRAINT ambulance_patterns_pkey PRIMARY KEY (id, pattern, mode);


--
-- Name: cameras cameras-name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cameras
    ADD CONSTRAINT "cameras-name" UNIQUE (name);


--
-- Name: cameras cameras-uri; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cameras
    ADD CONSTRAINT "cameras-uri" UNIQUE (uri);


--
-- Name: cameras cameras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cameras
    ADD CONSTRAINT cameras_pkey PRIMARY KEY (id);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: display_events display_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.display_events
    ADD CONSTRAINT display_events_pkey PRIMARY KEY (id);


--
-- Name: eventlogs eventlogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventlogs
    ADD CONSTRAINT eventlogs_pkey PRIMARY KEY (id);


--
-- Name: operation_keys operation_keys_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation_keys
    ADD CONSTRAINT operation_keys_code UNIQUE (code);


--
-- Name: operation_keys operation_keys_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation_keys
    ADD CONSTRAINT operation_keys_key UNIQUE (key);


--
-- Name: operation_keys operation_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation_keys
    ADD CONSTRAINT operation_keys_pkey PRIMARY KEY (id);


--
-- Name: operation_resources operation_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation_resources
    ADD CONSTRAINT operation_resources_pkey PRIMARY KEY (operation_id, resource_id);


--
-- Name: operations operations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operations
    ADD CONSTRAINT operations_pkey PRIMARY KEY (id);


--
-- Name: operation_resource_keys pk_operation_resource_keys; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation_resource_keys
    ADD CONSTRAINT pk_operation_resource_keys PRIMARY KEY (operation_id, resource_key, index);


--
-- Name: railway_coordinate_boxes railway_coordinate_boxes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.railway_coordinate_boxes
    ADD CONSTRAINT railway_coordinate_boxes_pkey PRIMARY KEY (id);


--
-- Name: real_estate_links real_estate_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_links
    ADD CONSTRAINT real_estate_links_pkey PRIMARY KEY (real_estate_id, link);


--
-- Name: real_estate_real_estate_tags real_estate_real_estate_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_real_estate_tags
    ADD CONSTRAINT real_estate_real_estate_tags_pkey PRIMARY KEY (real_estate_id, real_estate_tag_id);


--
-- Name: real_estate_tags real_estate_tags-name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_tags
    ADD CONSTRAINT "real_estate_tags-name" UNIQUE (name);


--
-- Name: real_estate_tags real_estate_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_tags
    ADD CONSTRAINT real_estate_tags_pkey PRIMARY KEY (id);


--
-- Name: real_estates real_estates_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estates
    ADD CONSTRAINT real_estates_key UNIQUE (key);


--
-- Name: real_estates real_estates_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estates
    ADD CONSTRAINT real_estates_name UNIQUE (name);


--
-- Name: real_estates real_estates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estates
    ADD CONSTRAINT real_estates_pkey PRIMARY KEY (id);


--
-- Name: regex_patterns regex_patterns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regex_patterns
    ADD CONSTRAINT regex_patterns_pkey PRIMARY KEY (id, pattern, source);


--
-- Name: resourcekey_patterns resourcekey_patterns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resourcekey_patterns
    ADD CONSTRAINT resourcekey_patterns_pkey PRIMARY KEY (id, pattern, mode);


--
-- Name: resources resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- Name: resources resources_radio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_radio UNIQUE (radio);


--
-- Name: river_sectors river_sectors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.river_sectors
    ADD CONSTRAINT river_sectors_pkey PRIMARY KEY (id);


--
-- Name: stations station_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT station_name UNIQUE (name);


--
-- Name: stations stations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT stations_pkey PRIMARY KEY (id);


--
-- Name: operations operation-operation_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operations
    ADD CONSTRAINT "operation-operation_key" FOREIGN KEY (operation_key_id) REFERENCES public.operation_keys(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: operations operation-real_estate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operations
    ADD CONSTRAINT "operation-real_estate" FOREIGN KEY (real_estate_id) REFERENCES public.real_estates(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: operation_resource_keys operation_resource_keys_collection; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation_resource_keys
    ADD CONSTRAINT operation_resource_keys_collection FOREIGN KEY (operation_id) REFERENCES public.operations(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: operation_resources operation_resources_operations; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation_resources
    ADD CONSTRAINT operation_resources_operations FOREIGN KEY (operation_id) REFERENCES public.operations(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: operation_resources operation_resources_resources; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation_resources
    ADD CONSTRAINT operation_resources_resources FOREIGN KEY (resource_id) REFERENCES public.resources(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: real_estate_links real_estate_links; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_links
    ADD CONSTRAINT real_estate_links FOREIGN KEY (real_estate_id) REFERENCES public.real_estates(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: resources resources_station; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_station FOREIGN KEY (station_id) REFERENCES public.stations(id);


--
-- PostgreSQL database dump complete
--

