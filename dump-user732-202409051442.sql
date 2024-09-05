--
-- PostgreSQL database dump
--

-- Dumped from database version 11.10 (Debian 11.10-astra.se5)
-- Dumped by pg_dump version 15.3

-- Started on 2024-09-05 14:42:52

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET escape_string_warning = off;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3008 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 197 (class 1259 OID 311713)
-- Name: client; Type: TABLE; Schema: public; Owner: user732
--

CREATE TABLE public.client (
    id integer NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    patronymic character varying(50),
    birthday date,
    registrationdate timestamp(3) without time zone NOT NULL,
    email character varying(255),
    phone character varying(20) NOT NULL,
    gendercode character(1) NOT NULL,
    photopath character varying(1000),
    documents character varying
);


ALTER TABLE public.client OWNER TO user732;

--
-- TOC entry 196 (class 1259 OID 311711)
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: user732
--

ALTER TABLE public.client ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 208 (class 1259 OID 320009)
-- Name: docofclient; Type: TABLE; Schema: public; Owner: user732
--

CREATE TABLE public.docofclient (
    idclient integer NOT NULL,
    iddoc integer NOT NULL
);


ALTER TABLE public.docofclient OWNER TO user732;

--
-- TOC entry 207 (class 1259 OID 313451)
-- Name: document; Type: TABLE; Schema: public; Owner: user732
--

CREATE TABLE public.document (
    path path,
    id integer NOT NULL
);


ALTER TABLE public.document OWNER TO user732;

--
-- TOC entry 198 (class 1259 OID 311741)
-- Name: gender; Type: TABLE; Schema: public; Owner: user732
--

CREATE TABLE public.gender (
    code character(1) NOT NULL,
    name character varying(10)
);


ALTER TABLE public.gender OWNER TO user732;

--
-- TOC entry 200 (class 1259 OID 311802)
-- Name: tag; Type: TABLE; Schema: public; Owner: user732
--

CREATE TABLE public.tag (
    id integer NOT NULL,
    title character varying(30) NOT NULL,
    color character(6) NOT NULL
);


ALTER TABLE public.tag OWNER TO user732;

--
-- TOC entry 199 (class 1259 OID 311800)
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: user732
--

ALTER TABLE public.tag ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 201 (class 1259 OID 311807)
-- Name: tagofclient; Type: TABLE; Schema: public; Owner: user732
--

CREATE TABLE public.tagofclient (
    clientid integer NOT NULL,
    tagid integer NOT NULL
);


ALTER TABLE public.tagofclient OWNER TO user732;

--
-- TOC entry 203 (class 1259 OID 313228)
-- Name: visit; Type: TABLE; Schema: public; Owner: user732
--

CREATE TABLE public.visit (
    id integer NOT NULL,
    data date NOT NULL,
    "time" time without time zone NOT NULL,
    idclient character varying
);


ALTER TABLE public.visit OWNER TO user732;

--
-- TOC entry 202 (class 1259 OID 313226)
-- Name: visit_id_seq; Type: SEQUENCE; Schema: public; Owner: user732
--

ALTER TABLE public.visit ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.visit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 206 (class 1259 OID 313235)
-- Name: visitofclient; Type: TABLE; Schema: public; Owner: user732
--

CREATE TABLE public.visitofclient (
    idclient integer NOT NULL,
    idvisit integer NOT NULL
);


ALTER TABLE public.visitofclient OWNER TO user732;

--
-- TOC entry 204 (class 1259 OID 313231)
-- Name: visitofclient_idclient_seq; Type: SEQUENCE; Schema: public; Owner: user732
--

ALTER TABLE public.visitofclient ALTER COLUMN idclient ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.visitofclient_idclient_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 205 (class 1259 OID 313233)
-- Name: visitofclient_idvisit_seq; Type: SEQUENCE; Schema: public; Owner: user732
--

ALTER TABLE public.visitofclient ALTER COLUMN idvisit ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.visitofclient_idvisit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 2991 (class 0 OID 311713)
-- Dependencies: 197
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: user732
--

COPY public.client (id, firstname, lastname, patronymic, birthday, registrationdate, email, phone, gendercode, photopath, documents) FROM stdin;
3	Авдеев	  Самуил 	 Улебович	1996-07-04	2016-02-11 00:00:00	 cliffordj@mac.com	 7(3168)043-63-31 	1	 Клиентыm96.jpg	\N
4	Агафонов	 Юстиниан	 Олегович	1997-02-02	2016-06-08 00:00:00	 staffelb@sbcglobal.net	 7(303)810-28-78 	1	 Клиентыm1.jpg	\N
5	Александров	 Станислав	 Эдуардович	1981-07-04	2018-11-08 00:00:00	 bigmauler@aol.com	 7(18)164-05-12 	1	 Клиентыm2.jpg	\N
6	Алексеева	 Элина	 Матвеевна	2002-05-07	2018-03-28 00:00:00	 pthomsen@verizon.net	 7(8086)245-64-81 	2	 Клиенты1.jpg	\N
7	Андреев	 Станислав	 Максович	1975-10-10	2017-12-26 00:00:00	 budinger@mac.com	 7(02)993-91-28 	1	 Клиентыm3.jpg	\N
8	Андреева  	 Патрисия	 Валерьевна	1993-11-18	2016-07-17 00:00:00	 jigsaw@aol.com	 7(9648)953-81-26 	2	 Клиенты37.jpg	\N
9	Анисимов  	Валентин	 Пантелеймонович	2000-12-10	2018-01-20 00:00:00	 aaribaud@hotmail.com	 7(700)326-70-24 	1	 Клиентыm99.jpg	\N
10	Анисимова	 Тамара	 Витальевна	1988-06-16	2016-02-25 00:00:00	 schwaang@mac.com	 7(66)128-04-10 	2	 Клиенты2.jpg	\N
11	Артемьева	 Лиза	 Максимовна	1996-05-17	2018-10-07 00:00:00	 snunez@yahoo.ca	 7(696)972-70-21 	2	 Клиенты3.jpg	\N
12	Архипова  	 Прасковья	 Валерьевна	1979-01-09	2018-07-23 00:00:00	 cgcra@live.com	 7(86)540-10-21 	2	 Клиенты33.jpg	\N
13	Афанасьева  	 Розалия	 Макаровна	1977-05-01	2017-09-06 00:00:00	 malattia@hotmail.com	 7(0661)413-23-32 	2	 Клиенты31.jpg	\N
14	Баранов	 Михаил	 Романович	1997-07-12	2018-10-07 00:00:00	 bigmauler@outlook.com	 7(750)985-94-13 	1	 Клиентыm5.jpg	\N
15	Баранова	 Эльмира	 Дмитриевна	1977-01-15	2016-07-08 00:00:00	 jgmyers@comcast.net	 7(9240)643-15-50 	2	 Клиенты4.jpg	\N
16	Белозёрова	 Диана	 Антоновна	1989-02-27	2017-01-30 00:00:00	 dialworld@aol.com	 7(9900)174-59-87 	2	 Клиенты7.jpg	\N
17	Беляева  	 Сабрина	 Федосеевна	1972-07-26	2017-06-14 00:00:00	 agapow@gmail.com	 7(6580)534-32-58 	2	 Клиенты47.jpg	\N
18	Бирюкова	 Инара	 Улебовна	1978-07-21	2017-10-01 00:00:00	 smpeters@hotmail.com	 7(098)346-50-58 	2	 Клиенты5.jpg	\N
19	Блинов	 Евгений	 Мэлсович	1994-01-05	2017-05-07 00:00:00	 moxfulder@outlook.com	 7(0852)321-82-64 	1	 Клиентыm7.jpg	\N
20	Блохин	 Пантелеймон	 Феликсович	1978-03-06	2018-02-14 00:00:00	 balchen@comcast.net	 7(9524)556-48-98 	1	 Клиентыm8.jpg	\N
21	Бобров  	 Агафон	 Лаврентьевич	1995-07-29	2017-05-09 00:00:00	 petersen@comcast.net	 7(2159)507-39-57 	1	 Клиентыm35.jpg	\N
22	Бобылёв	 Георгий	 Витальевич	1983-12-19	2018-04-06 00:00:00	 csilvers@mac.com	 7(88)685-13-51 	1	 Клиентыm11.jpg	\N
23	Большаков	Вадим	Данилович	1970-05-15	2018-08-04 00:00:00	 uncle@gmail.com	 7(386)641-13-37 	1	 Клиентыm97.jpg	\N
24	Борисов	 Аввакум	 Артемович	1974-04-25	2017-03-11 00:00:00	 chlim@live.com	 7(2296)930-08-88 	1	 Клиентыm12.jpg	\N
25	Бурова 	 Светлана 	 Лукьевна	1979-01-04	2016-10-13 00:00:00	 wsnyder@aol.com	 7(358)173-82-21 	2	 Клиенты39.jpg	\N
26	Быков	 Трофим	 Константинович	1994-12-20	2016-04-17 00:00:00	 jguyer@aol.com	 7(3414)460-12-05 	1	 Клиентыm14.jpg	\N
27	Быкова	 Тала	 Георгьевна	2000-02-22	2016-08-13 00:00:00	 ganter@optonline.net	 7(13)915-53-53 	2	 Клиенты6.jpg	\N
28	Васильев	 Оскар	 Богданович	1971-01-30	2017-05-28 00:00:00	 miturria@verizon.net	 7(585)801-94-29 	1	 Клиентыm15.jpg	\N
29	Волков 	 Людвиг 	 Витальевич	1977-12-27	2016-04-27 00:00:00	 jrkorson@msn.com	 7(8459)592-05-58 	1	 Клиентыm50.jpg	\N
30	Воронова 	 Изабелла 	 Вячеславовна	1999-09-24	2017-12-21 00:00:00	 kildjean@sbcglobal.net	 7(17)433-44-98 	2	 Клиенты21.jpg	\N
31	Галкин	 Эрик	 Онисимович	1975-01-18	2016-07-19 00:00:00	 snunez@verizon.net	 7(759)873-77-39 	1	 Клиентыm16.jpg	\N
32	Голубев	 Иосиф	 Тимофеевич	1982-05-06	2018-08-18 00:00:00	 smcnabb@att.net	 7(78)972-73-11 	1	 Клиентыm18.jpg	\N
33	Горбачёв 	 Давид 	 Тимурович	1983-05-22	2018-12-17 00:00:00	 hedwig@att.net	 7(53)602-85-41 	1	 Клиентыm36.jpg	\N
34	Горбачёва	 Никки	 Еремеевна	1987-04-21	2018-08-16 00:00:00	 chinthaka@att.net	 7(94)789-69-20 	2	 Клиенты8.jpg	\N
35	Гордеев	 Павел	 Семенович	1984-09-06	2016-07-19 00:00:00	 dawnsong@verizon.net	 7(5243)599-66-72 	1	 Клиентыm19.jpg	\N
36	Горшкова	 Марта	 Иосифовна	2001-02-13	2016-08-04 00:00:00	 gbacon@mac.com	 7(544)650-59-03 	2	 Клиенты9.jpg	\N
37	Гусев	 Яков	 Авксентьевич	1995-12-10	2017-11-20 00:00:00	 jdhedden@icloud.com	 7(0972)781-11-37 	1	 Клиентыm20.jpg	\N
38	Гусева	 Роза	 Дмитриевна	1999-02-13	2017-12-12 00:00:00	 martyloo@live.com	 7(23)064-51-84 	2	 Клиенты10.jpg	\N
39	Гущина	 Янита	 Федоровна	1999-03-02	2018-02-01 00:00:00	 lishoy@att.net	 7(4544)716-68-96 	2	 Клиенты11.jpg	\N
40	Дементьев  	 Вадим	 Ростиславович	1993-07-10	2018-03-05 00:00:00	 jacks@aol.com	 7(79)330-46-15 	1	 Клиентыm39.jpg	\N
41	Дементьева 	 Эдита 	 Онисимовна	1975-09-17	2018-11-24 00:00:00	 frosal@hotmail.com	 7(198)922-28-76 	2	 Клиенты38.jpg	\N
42	Дмитриева	 Элина	 Даниловна	1988-12-10	2017-02-11 00:00:00	 vmalik@live.com	 7(787)140-48-84 	2	 Клиенты12.jpg	\N
43	Дроздов	 Вольдемар	 Артемович	1976-02-07	2017-07-18 00:00:00	 smpeters@me.com	 7(307)456-99-05 	1	 Клиентыm21.jpg	\N
44	Евсеев	 Макар	 Васильевич	1977-09-13	2018-12-05 00:00:00	 parsimony@sbcglobal.net	 7(2141)077-85-70 	1	 Клиентыm22.jpg	\N
45	Егорова	 Амалия	 Дамировна	1999-09-28	2016-06-30 00:00:00	 drezet@yahoo.com	 7(7486)408-12-26 	2	 Клиенты13.jpg	\N
46	Ермакова 	 Алла 	 Мироновна	1976-01-22	2017-02-09 00:00:00	 whimsy@aol.com	 7(06)437-13-73 	2	 Клиенты48.jpg	\N
47	Ершов	 Глеб	 Федорович	1970-06-14	2016-09-14 00:00:00	 sjava@aol.com	 7(2608)298-40-82 	1	 Клиентыm23.jpg	\N
48	Ершова	 Номи	 Андреевна	2001-09-13	2016-06-30 00:00:00	 miltchev@mac.com	 7(7757)315-90-99 	2	 Клиенты14.jpg	\N
49	Ефимов	 Альберт	 Проклович	1997-10-29	2018-06-21 00:00:00	 houle@live.com	 7(416)375-97-19 	1	 Клиентыm6.jpg	\N
50	Ефимова	 Магда	 Платоновна	1995-08-16	2017-08-01 00:00:00	 rbarreira@me.com	 7(9261)386-15-92 	2	 Клиенты16.jpg	\N
51	Ефремов	 Витольд	 Авксентьевич	1975-12-02	2018-04-09 00:00:00	 kwilliams@yahoo.ca	 7(93)922-14-03 	1	 Клиентыm28.jpg	\N
52	Журавлёв	 Леонтий	 Яковлевич	2000-03-02	2018-01-15 00:00:00	 cmdrgravy@me.com	 7(4403)308-56-96 	1	 Клиентыm24.jpg	\N
53	Зуев  	 Матвей	 Иванович	1981-03-28	2018-12-18 00:00:00	 brickbat@verizon.net	 7(5383)893-04-66 	1	 Клиентыm38.jpg	\N
54	Игнатов 	 Захар 	 Павлович	1998-10-07	2017-11-10 00:00:00	 dieman@icloud.com	 7(578)574-73-36 	1	 Клиентыm98.jpg	\N
55	Казаков 	 Дмитрий 	 Русланович	1978-12-15	2016-05-21 00:00:00	 ozawa@verizon.net	 7(51)682-19-40 	1	 Клиентыm44.jpg	\N
56	Калашников	 Артур	 Юрьевич	1972-12-13	2017-08-20 00:00:00	 oevans@aol.com	 7(147)947-47-21 	1	 Клиентыm10.jpg	\N
57	Калинин  	 Петр	 Иванович	1993-09-08	2016-05-26 00:00:00	 aschmitz@hotmail.com	 7(90)316-07-17 	1	 Клиентыm47.jpg	\N
58	Киселёв	 Устин	 Яковлевич	1985-01-08	2018-06-21 00:00:00	 dalamb@verizon.net	 7(83)334-52-76 	1	 Клиентыm25.jpg	\N
59	Князев	 Терентий	 Валерьевич	1991-06-19	2018-06-25 00:00:00	 rjones@aol.com	 7(98)397-23-23 	1	 Клиентыm26.jpg	\N
60	Колесникова  	 Алина	 Еремеевна	2001-04-19	2017-01-18 00:00:00	 gfxguy@outlook.com	 7(74)977-39-71 	2	 Клиенты40.jpg	\N
61	Колобов	 Орест	 Юлианович	2001-07-14	2017-01-01 00:00:00	 parkes@verizon.net	 7(1680)508-58-26 	1	 Клиентыm27.jpg	\N
62	Колобова	 Злата	 Романовна	1994-08-25	2016-12-03 00:00:00	 sinkou@aol.com	 7(50)884-07-35 	2	 Клиенты18.jpg	\N
63	Комиссарова	 Амалия	 Робертовна	1971-08-18	2017-08-04 00:00:00	 jorgb@msn.com	 7(22)647-46-32 	2	 Клиенты17.jpg	\N
64	Копылов	 Касьян	 Робертович	1983-08-04	2018-03-18 00:00:00	 crobles@sbcglobal.net	 7(5774)679-82-06 	1	 Клиентыm29.jpg	\N
65	Корнилова  	 Анэля	 Михайловна	1973-04-02	2016-05-22 00:00:00	 jonathan@aol.com	 7(20)980-01-60 	2	 Клиенты26.jpg	\N
66	Костина 	 Любава 	 Авксентьевна	1972-07-13	2016-02-26 00:00:00	 gordonjcp@hotmail.com	 7(6419)959-21-87 	2	 Клиенты41.jpg	\N
67	Крюков	 Наум	 Ильяович	1993-11-17	2017-02-01 00:00:00	 floxy@hotmail.com	 7(81)657-88-92 	1	 Клиентыm30.jpg	\N
68	Крюкова	 Авигея	 Святославовна	2000-08-10	2018-01-03 00:00:00	 simone@gmail.com	 7(499)318-88-53 	2	 Клиенты19.jpg	\N
69	Кудрявцев	 Богдан	 Христофорович	1988-02-27	2016-10-07 00:00:00	 lukka@hotmail.com	 7(20)131-84-09 	1	 Клиентыm31.jpg	\N
70	Кудряшов 	 Аверкий 	 Константинович	1991-07-26	2018-03-08 00:00:00	 nanop@msn.com	 7(88)732-96-30 	1	 Клиентыm33.jpg	\N
71	Кузьмин	 Леонтий	 Валерьянович	2000-05-05	2017-10-12 00:00:00	 msloan@hotmail.com	 7(1340)148-90-68 	1	 Клиентыm17.jpg	\N
72	Кузьмина  	 Дэнна	Витальевна 	1993-08-24	2016-03-27 00:00:00	 nichoj@mac.com	 7(9940)977-45-73 	2	 Клиенты20.jpg	\N
73	Куликова 	 Эвелина 	 Вячеславовна	1997-11-14	2018-02-01 00:00:00	 ilikered@hotmail.com	 7(0236)682-42-78 	2	 Клиенты23.jpg	\N
74	Лазарев 	 Алексей 	 Богданович	1977-03-10	2017-01-02 00:00:00	 claesjac@me.com	 7(0055)737-37-48 	1	 Клиентыm48.jpg	\N
75	Лазарева 	 Эльвина 	 Робертовна	1996-02-16	2018-04-11 00:00:00	 ahuillet@comcast.net	 7(5564)609-81-37 	2	 Клиенты28.jpg	\N
76	Мамонтова 	 Марфа	  Мироновна	1984-10-19	2018-02-27 00:00:00	 rfoley@verizon.net	 7(38)095-64-18 	2	 Клиенты29.jpg	\N
77	Медведев	 Святослав	 Юлианович	1972-10-04	2018-10-13 00:00:00	 hllam@comcast.net	 7(3520)435-21-20 	1	 Клиентыm13.jpg	\N
78	Мишина  	 Иветта	 Андреевна	2002-10-05	2016-01-24 00:00:00	 aukjan@yahoo.com	 7(3926)244-81-96 	2	 Клиенты30.jpg	\N
79	Морозов  	 Наум	 Валерьянович	1985-07-04	2016-05-02 00:00:00	 salesgeek@mac.com	 7(636)050-96-13 	1	 Клиентыm49.jpg	\N
80	Некрасов  	 Варлам	 Михайлович	2000-11-12	2017-12-03 00:00:00	 dogdude@verizon.net	 7(019)258-06-35 	1	 Клиентыm42.jpg	\N
81	Новиков 	 Адриан 	 Аркадьевич	1974-01-15	2018-11-23 00:00:00	 multiplx@verizon.net	 7(70)572-33-62 	1	 Клиентыm40.jpg	\N
82	Овчинникова 	 Лаура 	 Еремеевна	1992-04-03	2018-11-24 00:00:00	 carcus@yahoo.ca	 7(85)829-33-79 	2	 Клиенты35.jpg	\N
83	Орлова  	 Влада	 Мартыновна	1990-06-26	2016-03-21 00:00:00	 rnelson@yahoo.ca	 7(2506)433-38-35 	2	 Клиенты22.jpg	\N
84	Панфилов  	 Марк	 Рудольфович	1991-04-13	2016-02-23 00:00:00	 cremonini@optonline.net	 7(764)282-55-22 	1	 Клиентыm45.jpg	\N
85	Попова  	 Харита	 Якуновна	1997-12-16	2016-07-05 00:00:00	 firstpr@verizon.net	 7(335)386-81-06 	2	 Клиенты36.jpg	\N
86	Селиверстов  	 Глеб	 Максимович	1999-06-20	2016-01-07 00:00:00	 jigsaw@sbcglobal.net	 7(20)554-28-68 	1	 Клиентыm37.jpg	\N
87	Сидорова  	 Татьяна	 Михайловна	1974-04-24	2018-10-03 00:00:00	 tbeck@mac.com	 7(51)732-91-79 	2	 Клиенты42.jpg	\N
88	Силин 	 Гаянэ 	 Анатольевич	1976-05-27	2017-05-05 00:00:00	 multiplx@comcast.net	 7(4547)615-22-69 	1	 Клиентыm46.jpg	\N
89	Смирнов	Мартын	 Арсеньевич	1996-06-25	2017-02-07 00:00:00	 haddawy@live.com	 7(6251)589-02-43 	1	 Клиентыm34.jpg	\N
90	Степанова	 Амелия	 Робертовна	1970-06-06	2017-09-27 00:00:00	 rasca@hotmail.com	 7(1217)441-28-42 	2	 Клиенты15.jpg	\N
91	Суворова  	 Божена	 Анатольевна	1981-03-09	2016-01-28 00:00:00	 attwood@aol.com	 7(347)895-86-57 	2	 Клиенты34.jpg	\N
92	Сысоева  	 Дарина	 Ярославовна	1982-02-03	2016-05-13 00:00:00	 treit@verizon.net	 7(0698)387-96-04 	2	 Клиенты32.jpg	\N
93	Трофимова  	 Альжбета	 Якововна	1988-10-22	2017-09-21 00:00:00	 gbacon@mac.com	 7(1084)658-92-95 	2	 Клиенты25.jpg	\N
94	Турова 	 Георгина 	 Семёновна	1974-05-28	2018-02-22 00:00:00	 yruan@optonline.net	 7(555)321-42-99 	2	 Клиенты27.jpg	\N
95	Устинова 	 Юнона 	 Валентиновна	1982-08-08	2017-05-28 00:00:00	 kempsonc@live.com	 7(33)367-13-07	2	 Клиенты44.jpg	\N
96	Федотов	 Осип	 Анатольевич	1971-04-13	2018-07-23 00:00:00	 breegster@hotmail.com	 7(590)702-33-06 	1	 Клиентыm9.jpg	\N
97	Федотова	Сандра	Владленовна	1985-03-29	2016-11-08 00:00:00	 penna@verizon.net	 7(126)195-25-86 	2	 Клиенты24.jpg	\N
98	Филатов 	 Аристарх	 Дмитриевич	1989-05-29	2017-01-11 00:00:00	 hampton@att.net	 7(696)235-29-24 	1	 Клиентыm43.jpg	\N
99	Цветков	 Демьян	 Львович	1996-03-29	2016-02-12 00:00:00	 hauma@icloud.com	 7(93)546-43-73 	1	 Клиентыm4.jpg	\N
100	Шашкова 	 Гелла 	 Эдуардовна	1979-02-24	2016-11-16 00:00:00	 jadavis@mac.com	 7(57)446-21-04 	2	 Клиенты43.jpg	\N
101	Шестаков  	 Геннадий	Рубенович 	2001-07-01	2018-12-08 00:00:00	 tokuhirom@live.com	 7(2066)037-11-60 	1	 Клиентыm41.jpg	\N
2	Абрамов	 Станислав	 Филатович	1989-05-18	2016-12-08 00:00:00	 solomon@att.net	 7(6545)478-87-79 	1	 Клиентыm32.jpg	\N
\.


--
-- TOC entry 3002 (class 0 OID 320009)
-- Dependencies: 208
-- Data for Name: docofclient; Type: TABLE DATA; Schema: public; Owner: user732
--

COPY public.docofclient (idclient, iddoc) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 313451)
-- Dependencies: 207
-- Data for Name: document; Type: TABLE DATA; Schema: public; Owner: user732
--

COPY public.document (path, id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 311741)
-- Dependencies: 198
-- Data for Name: gender; Type: TABLE DATA; Schema: public; Owner: user732
--

COPY public.gender (code, name) FROM stdin;
1	мужской
2	женский
\.


--
-- TOC entry 2994 (class 0 OID 311802)
-- Dependencies: 200
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: user732
--

COPY public.tag (id, title, color) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 311807)
-- Dependencies: 201
-- Data for Name: tagofclient; Type: TABLE DATA; Schema: public; Owner: user732
--

COPY public.tagofclient (clientid, tagid) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 313228)
-- Dependencies: 203
-- Data for Name: visit; Type: TABLE DATA; Schema: public; Owner: user732
--

COPY public.visit (id, data, "time", idclient) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 313235)
-- Dependencies: 206
-- Data for Name: visitofclient; Type: TABLE DATA; Schema: public; Owner: user732
--

COPY public.visitofclient (idclient, idvisit) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 196
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user732
--

SELECT pg_catalog.setval('public.client_id_seq', 101, true);


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 199
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user732
--

SELECT pg_catalog.setval('public.tag_id_seq', 1, false);


--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 202
-- Name: visit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user732
--

SELECT pg_catalog.setval('public.visit_id_seq', 1, false);


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 204
-- Name: visitofclient_idclient_seq; Type: SEQUENCE SET; Schema: public; Owner: user732
--

SELECT pg_catalog.setval('public.visitofclient_idclient_seq', 1, false);


--
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 205
-- Name: visitofclient_idvisit_seq; Type: SEQUENCE SET; Schema: public; Owner: user732
--

SELECT pg_catalog.setval('public.visitofclient_idvisit_seq', 1, false);


--
-- TOC entry 2861 (class 2606 OID 320021)
-- Name: docofclient docofclient_pk; Type: CONSTRAINT; Schema: public; Owner: user732
--

ALTER TABLE ONLY public.docofclient
    ADD CONSTRAINT docofclient_pk PRIMARY KEY (idclient, iddoc);


--
-- TOC entry 2859 (class 2606 OID 320008)
-- Name: document document_pk; Type: CONSTRAINT; Schema: public; Owner: user732
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT document_pk PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 311720)
-- Name: client pk_client; Type: CONSTRAINT; Schema: public; Owner: user732
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT pk_client PRIMARY KEY (id);


--
-- TOC entry 2849 (class 2606 OID 311745)
-- Name: gender pk_gender; Type: CONSTRAINT; Schema: public; Owner: user732
--

ALTER TABLE ONLY public.gender
    ADD CONSTRAINT pk_gender PRIMARY KEY (code);


--
-- TOC entry 2851 (class 2606 OID 311806)
-- Name: tag pk_tag; Type: CONSTRAINT; Schema: public; Owner: user732
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT pk_tag PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 311813)
-- Name: tagofclient pk_tagofclient; Type: CONSTRAINT; Schema: public; Owner: user732
--

ALTER TABLE ONLY public.tagofclient
    ADD CONSTRAINT pk_tagofclient PRIMARY KEY (clientid, tagid);


--
-- TOC entry 2855 (class 2606 OID 313245)
-- Name: visit visit_pk; Type: CONSTRAINT; Schema: public; Owner: user732
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT visit_pk PRIMARY KEY (id);


--
-- TOC entry 2857 (class 2606 OID 313243)
-- Name: visitofclient visitofclient_pk; Type: CONSTRAINT; Schema: public; Owner: user732
--

ALTER TABLE ONLY public.visitofclient
    ADD CONSTRAINT visitofclient_pk PRIMARY KEY (idclient, idvisit);


--
-- TOC entry 2867 (class 2606 OID 320027)
-- Name: docofclient docofclient_client_fk; Type: FK CONSTRAINT; Schema: public; Owner: user732
--

ALTER TABLE ONLY public.docofclient
    ADD CONSTRAINT docofclient_client_fk FOREIGN KEY (idclient) REFERENCES public.client(id);


--
-- TOC entry 2868 (class 2606 OID 320022)
-- Name: docofclient docofclient_document_fk; Type: FK CONSTRAINT; Schema: public; Owner: user732
--

ALTER TABLE ONLY public.docofclient
    ADD CONSTRAINT docofclient_document_fk FOREIGN KEY (iddoc) REFERENCES public.document(id);


--
-- TOC entry 2862 (class 2606 OID 311824)
-- Name: client fk_client_gender; Type: FK CONSTRAINT; Schema: public; Owner: user732
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT fk_client_gender FOREIGN KEY (gendercode) REFERENCES public.gender(code);


--
-- TOC entry 2863 (class 2606 OID 311874)
-- Name: tagofclient fk_tagofclient_tag; Type: FK CONSTRAINT; Schema: public; Owner: user732
--

ALTER TABLE ONLY public.tagofclient
    ADD CONSTRAINT fk_tagofclient_tag FOREIGN KEY (tagid) REFERENCES public.tag(id);


--
-- TOC entry 2864 (class 2606 OID 328483)
-- Name: tagofclient tagofclient_client_fk; Type: FK CONSTRAINT; Schema: public; Owner: user732
--

ALTER TABLE ONLY public.tagofclient
    ADD CONSTRAINT tagofclient_client_fk FOREIGN KEY (clientid) REFERENCES public.client(id);


--
-- TOC entry 2865 (class 2606 OID 313267)
-- Name: visitofclient visitofclient_client_fk; Type: FK CONSTRAINT; Schema: public; Owner: user732
--

ALTER TABLE ONLY public.visitofclient
    ADD CONSTRAINT visitofclient_client_fk FOREIGN KEY (idclient) REFERENCES public.client(id);


--
-- TOC entry 2866 (class 2606 OID 313262)
-- Name: visitofclient visitofclient_visit_fk; Type: FK CONSTRAINT; Schema: public; Owner: user732
--

ALTER TABLE ONLY public.visitofclient
    ADD CONSTRAINT visitofclient_visit_fk FOREIGN KEY (idvisit) REFERENCES public.visit(id);


--
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-09-05 14:42:52

--
-- PostgreSQL database dump complete
--

