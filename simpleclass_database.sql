--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2024-03-08 21:34:29

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16407)
-- Name: link_userrole; Type: TABLE; Schema: public; Owner: miguel
--

CREATE TABLE public.link_userrole (
    userrole_tabuserid_fk integer NOT NULL,
    userrole_listroleid_fk integer DEFAULT 6 NOT NULL
);


ALTER TABLE public.link_userrole OWNER TO miguel;

--
-- TOC entry 218 (class 1259 OID 16415)
-- Name: list_role; Type: TABLE; Schema: public; Owner: miguel
--

CREATE TABLE public.list_role (
    rol_rolename character varying,
    rol_roleid integer NOT NULL
);


ALTER TABLE public.list_role OWNER TO miguel;

--
-- TOC entry 219 (class 1259 OID 16426)
-- Name: list_role_change_seq; Type: SEQUENCE; Schema: public; Owner: miguel
--

CREATE SEQUENCE public.list_role_change_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.list_role_change_seq OWNER TO miguel;

--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 219
-- Name: list_role_change_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: miguel
--

ALTER SEQUENCE public.list_role_change_seq OWNED BY public.list_role.rol_roleid;


--
-- TOC entry 225 (class 1259 OID 24645)
-- Name: tab_employee; Type: TABLE; Schema: public; Owner: miguel
--

CREATE TABLE public.tab_employee (
    emp_employeeid integer NOT NULL,
    emp_employee1name character(255),
    emp_employee2name character(255),
    emp_employee1lastname character(255),
    emp_employee2lastname character(255),
    emp_employeebirth date,
    emp_employeeadress character(255),
    emp_employeephone character(255),
    emp_employeestatus character(255),
    emp_employeetype character(255)
);


ALTER TABLE public.tab_employee OWNER TO miguel;

--
-- TOC entry 224 (class 1259 OID 24638)
-- Name: tab_student; Type: TABLE; Schema: public; Owner: miguel
--

CREATE TABLE public.tab_student (
    stu_studenid integer NOT NULL,
    stu_student1name character(255),
    stu_student2name character(255),
    stu_student1lastname character(255),
    stu_student2lastname character(255),
    stu_studentbirth date,
    stu_studentadress character(255),
    stu_studentemail character(255),
    stu_studentgender character(255),
    stu_studentphone integer
);


ALTER TABLE public.tab_student OWNER TO miguel;

--
-- TOC entry 216 (class 1259 OID 16396)
-- Name: tab_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tab_user (
    use_userid integer NOT NULL,
    use_username character varying,
    use_userpassword character varying,
    use_useremail character varying
);


ALTER TABLE public.tab_user OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24624)
-- Name: tabperiod; Type: TABLE; Schema: public; Owner: miguel
--

CREATE TABLE public.tabperiod (
    perperiodid integer NOT NULL,
    peryearstart date,
    peryearend date
);


ALTER TABLE public.tabperiod OWNER TO miguel;

--
-- TOC entry 222 (class 1259 OID 24623)
-- Name: tabperiod_perperiodid_seq; Type: SEQUENCE; Schema: public; Owner: miguel
--

CREATE SEQUENCE public.tabperiod_perperiodid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tabperiod_perperiodid_seq OWNER TO miguel;

--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 222
-- Name: tabperiod_perperiodid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: miguel
--

ALTER SEQUENCE public.tabperiod_perperiodid_seq OWNED BY public.tabperiod.perperiodid;


--
-- TOC entry 221 (class 1259 OID 24619)
-- Name: tabquarter; Type: TABLE; Schema: public; Owner: miguel
--

CREATE TABLE public.tabquarter (
    quaquarterid integer NOT NULL,
    quaquarterstart timestamp without time zone,
    quaquarterend timestamp without time zone
);


ALTER TABLE public.tabquarter OWNER TO miguel;

--
-- TOC entry 220 (class 1259 OID 24618)
-- Name: tabquarter_quaquarterid_seq; Type: SEQUENCE; Schema: public; Owner: miguel
--

CREATE SEQUENCE public.tabquarter_quaquarterid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tabquarter_quaquarterid_seq OWNER TO miguel;

--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 220
-- Name: tabquarter_quaquarterid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: miguel
--

ALTER SEQUENCE public.tabquarter_quaquarterid_seq OWNED BY public.tabquarter.quaquarterid;


--
-- TOC entry 215 (class 1259 OID 16395)
-- Name: tabuser_useuserid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tabuser_useuserid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tabuser_useuserid_seq OWNER TO postgres;

--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 215
-- Name: tabuser_useuserid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tabuser_useuserid_seq OWNED BY public.tab_user.use_userid;


--
-- TOC entry 4717 (class 2604 OID 16427)
-- Name: list_role rol_roleid; Type: DEFAULT; Schema: public; Owner: miguel
--

ALTER TABLE ONLY public.list_role ALTER COLUMN rol_roleid SET DEFAULT nextval('public.list_role_change_seq'::regclass);


--
-- TOC entry 4715 (class 2604 OID 16399)
-- Name: tab_user use_userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_user ALTER COLUMN use_userid SET DEFAULT nextval('public.tabuser_useuserid_seq'::regclass);


--
-- TOC entry 4719 (class 2604 OID 24627)
-- Name: tabperiod perperiodid; Type: DEFAULT; Schema: public; Owner: miguel
--

ALTER TABLE ONLY public.tabperiod ALTER COLUMN perperiodid SET DEFAULT nextval('public.tabperiod_perperiodid_seq'::regclass);


--
-- TOC entry 4718 (class 2604 OID 24622)
-- Name: tabquarter quaquarterid; Type: DEFAULT; Schema: public; Owner: miguel
--

ALTER TABLE ONLY public.tabquarter ALTER COLUMN quaquarterid SET DEFAULT nextval('public.tabquarter_quaquarterid_seq'::regclass);


--
-- TOC entry 4882 (class 0 OID 16407)
-- Dependencies: 217
-- Data for Name: link_userrole; Type: TABLE DATA; Schema: public; Owner: miguel
--

COPY public.link_userrole (userrole_tabuserid_fk, userrole_listroleid_fk) FROM stdin;
16	6
17	6
16	5
18	6
19	6
\.


--
-- TOC entry 4883 (class 0 OID 16415)
-- Dependencies: 218
-- Data for Name: list_role; Type: TABLE DATA; Schema: public; Owner: miguel
--

COPY public.list_role (rol_rolename, rol_roleid) FROM stdin;
usuario	4
moderador	5
administrador	6
\.


--
-- TOC entry 4890 (class 0 OID 24645)
-- Dependencies: 225
-- Data for Name: tab_employee; Type: TABLE DATA; Schema: public; Owner: miguel
--

COPY public.tab_employee (emp_employeeid, emp_employee1name, emp_employee2name, emp_employee1lastname, emp_employee2lastname, emp_employeebirth, emp_employeeadress, emp_employeephone, emp_employeestatus, emp_employeetype) FROM stdin;
5656	lkhjuk                                                                                                                                                                                                                                                         	dsfs                                                                                                                                                                                                                                                           	yuuiy                                                                                                                                                                                                                                                          	dsfd                                                                                                                                                                                                                                                           	2024-03-07	Av Universidad. Edificio Los Pájaros 1 Apto 1-G.                                                                                                                                                                                                               	985664                                                                                                                                                                                                                                                         	sdfsdfs                                                                                                                                                                                                                                                        	sdfsd                                                                                                                                                                                                                                                          
205398406	perrez                                                                                                                                                                                                                                                         	josefina                                                                                                                                                                                                                                                       	pereira                                                                                                                                                                                                                                                        	guillermina                                                                                                                                                                                                                                                    	2024-01-25	sdasdasdas                                                                                                                                                                                                                                                     	965456                                                                                                                                                                                                                                                         	sdfsdfsd                                                                                                                                                                                                                                                       	sfsdfds                                                                                                                                                                                                                                                        
\.


--
-- TOC entry 4889 (class 0 OID 24638)
-- Dependencies: 224
-- Data for Name: tab_student; Type: TABLE DATA; Schema: public; Owner: miguel
--

COPY public.tab_student (stu_studenid, stu_student1name, stu_student2name, stu_student1lastname, stu_student2lastname, stu_studentbirth, stu_studentadress, stu_studentemail, stu_studentgender, stu_studentphone) FROM stdin;
2545654	ana                                                                                                                                                                                                                                                            	anita                                                                                                                                                                                                                                                          	rar                                                                                                                                                                                                                                                            	rei                                                                                                                                                                                                                                                            	2024-03-01	Av Universidad. Edificio Los Pájaros 1 Apto 1-G.                                                                                                                                                                                                               	SDFSDFDS@asdsdasd                                                                                                                                                                                                                                              	\N	556456
456123	elena                                                                                                                                                                                                                                                          	maria                                                                                                                                                                                                                                                          	de troya                                                                                                                                                                                                                                                       	menelao                                                                                                                                                                                                                                                        	2024-03-02	Av Universidad. Edificio Los Pájaros 1 Apto 1-G.                                                                                                                                                                                                               	5646@hotmail.com                                                                                                                                                                                                                                               	male                                                                                                                                                                                                                                                           	966852
159753	luis                                                                                                                                                                                                                                                           	leon                                                                                                                                                                                                                                                           	marquez                                                                                                                                                                                                                                                        	montesinos                                                                                                                                                                                                                                                     	2023-11-16	la ceiba                                                                                                                                                                                                                                                       	mdsj@jhlfdf.com                                                                                                                                                                                                                                                	male                                                                                                                                                                                                                                                           	4145465
\.


--
-- TOC entry 4881 (class 0 OID 16396)
-- Dependencies: 216
-- Data for Name: tab_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_user (use_userid, use_username, use_userpassword, use_useremail) FROM stdin;
16	usuario	$2a$08$rrxJNHLRySh5DHcN88XMLeUT6R1Hlsqc6is0b5z55VWjVGT6PXesi	usuario@usuario.com
17	juan	$2a$08$Qya5d04FkBZu.Ht1EndVz.3AUj1caOx7WxtvM4Eij8fKudvZzjx1O	juan@juanito.com
18	Yoa	$2a$08$pM5JrkWKpozLukCIahkyse3za..cfCqViF3FvGwErnh.1sf5dtJkm	yoa@gmail.com
19	rogelios	$2a$08$VfBJCdfsnxeC8PXFsfZ2peeUzXzhwKMEbQgrKutTk3CwP1WJTmJzq	rogelios@gmail.com
\.


--
-- TOC entry 4888 (class 0 OID 24624)
-- Dependencies: 223
-- Data for Name: tabperiod; Type: TABLE DATA; Schema: public; Owner: miguel
--

COPY public.tabperiod (perperiodid, peryearstart, peryearend) FROM stdin;
74	2023-12-18	2024-01-17
75	2023-10-23	2024-01-03
78	2024-02-02	2024-02-20
79	2023-12-11	2024-01-17
80	2024-02-23	2024-03-05
\.


--
-- TOC entry 4886 (class 0 OID 24619)
-- Dependencies: 221
-- Data for Name: tabquarter; Type: TABLE DATA; Schema: public; Owner: miguel
--

COPY public.tabquarter (quaquarterid, quaquarterstart, quaquarterend) FROM stdin;
\.


--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 219
-- Name: list_role_change_seq; Type: SEQUENCE SET; Schema: public; Owner: miguel
--

SELECT pg_catalog.setval('public.list_role_change_seq', 6, true);


--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 222
-- Name: tabperiod_perperiodid_seq; Type: SEQUENCE SET; Schema: public; Owner: miguel
--

SELECT pg_catalog.setval('public.tabperiod_perperiodid_seq', 80, true);


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 220
-- Name: tabquarter_quaquarterid_seq; Type: SEQUENCE SET; Schema: public; Owner: miguel
--

SELECT pg_catalog.setval('public.tabquarter_quaquarterid_seq', 1, false);


--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 215
-- Name: tabuser_useuserid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tabuser_useuserid_seq', 19, true);


--
-- TOC entry 4723 (class 2606 OID 16444)
-- Name: link_userrole link_userrole_pkey; Type: CONSTRAINT; Schema: public; Owner: miguel
--

ALTER TABLE ONLY public.link_userrole
    ADD CONSTRAINT link_userrole_pkey PRIMARY KEY (userrole_tabuserid_fk, userrole_listroleid_fk);


--
-- TOC entry 4725 (class 2606 OID 16451)
-- Name: link_userrole link_userrole_userid_roleid_unique; Type: CONSTRAINT; Schema: public; Owner: miguel
--

ALTER TABLE ONLY public.link_userrole
    ADD CONSTRAINT link_userrole_userid_roleid_unique UNIQUE (userrole_tabuserid_fk, userrole_listroleid_fk);


--
-- TOC entry 4727 (class 2606 OID 16453)
-- Name: list_role list_role_pkey; Type: CONSTRAINT; Schema: public; Owner: miguel
--

ALTER TABLE ONLY public.list_role
    ADD CONSTRAINT list_role_pkey PRIMARY KEY (rol_roleid);


--
-- TOC entry 4733 (class 2606 OID 24651)
-- Name: tab_employee tab_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: miguel
--

ALTER TABLE ONLY public.tab_employee
    ADD CONSTRAINT tab_employee_pkey PRIMARY KEY (emp_employeeid);


--
-- TOC entry 4731 (class 2606 OID 24644)
-- Name: tab_student tab_student_pkey; Type: CONSTRAINT; Schema: public; Owner: miguel
--

ALTER TABLE ONLY public.tab_student
    ADD CONSTRAINT tab_student_pkey PRIMARY KEY (stu_studenid);


--
-- TOC entry 4729 (class 2606 OID 24629)
-- Name: tabperiod tabperiod_pkey; Type: CONSTRAINT; Schema: public; Owner: miguel
--

ALTER TABLE ONLY public.tabperiod
    ADD CONSTRAINT tabperiod_pkey PRIMARY KEY (perperiodid);


--
-- TOC entry 4721 (class 2606 OID 16403)
-- Name: tab_user tabuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_user
    ADD CONSTRAINT tabuser_pkey PRIMARY KEY (use_userid);


--
-- TOC entry 4734 (class 2606 OID 16454)
-- Name: link_userrole link_userrole_userrole_listroleid_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: miguel
--

ALTER TABLE ONLY public.link_userrole
    ADD CONSTRAINT link_userrole_userrole_listroleid_fk_fkey FOREIGN KEY (userrole_listroleid_fk) REFERENCES public.list_role(rol_roleid);


--
-- TOC entry 4735 (class 2606 OID 16445)
-- Name: link_userrole link_userrole_userrole_tabuserid_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: miguel
--

ALTER TABLE ONLY public.link_userrole
    ADD CONSTRAINT link_userrole_userrole_tabuserid_fk_fkey FOREIGN KEY (userrole_tabuserid_fk) REFERENCES public.tab_user(use_userid);


--
-- TOC entry 4736 (class 2606 OID 16438)
-- Name: link_userrole link_userrole_userrole_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: miguel
--

ALTER TABLE ONLY public.link_userrole
    ADD CONSTRAINT link_userrole_userrole_userid_fkey FOREIGN KEY (userrole_tabuserid_fk) REFERENCES public.tab_user(use_userid);


--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE tab_user; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tab_user TO miguel;


--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 215
-- Name: SEQUENCE tabuser_useuserid_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.tabuser_useuserid_seq TO miguel;


-- Completed on 2024-03-08 21:34:30

--
-- PostgreSQL database dump complete
--

