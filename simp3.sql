--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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
-- Name: link_sectionstudent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.link_sectionstudent (
    sectionstudent_section integer,
    sectionstudent_student integer
);


ALTER TABLE public.link_sectionstudent OWNER TO postgres;

--
-- Name: link_userrole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.link_userrole (
    userrole_tabuserid_fk integer NOT NULL,
    userrole_listroleid_fk integer DEFAULT 6 NOT NULL
);


ALTER TABLE public.link_userrole OWNER TO postgres;

--
-- Name: list_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.list_role (
    rol_rolename character varying,
    rol_roleid integer NOT NULL
);


ALTER TABLE public.list_role OWNER TO postgres;

--
-- Name: list_role_change_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.list_role_change_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.list_role_change_seq OWNER TO postgres;

--
-- Name: list_role_change_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.list_role_change_seq OWNED BY public.list_role.rol_roleid;


--
-- Name: tab_attendance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tab_attendance (
    att_attendanceid integer NOT NULL,
    att_attendanceday date,
    att_attendancesection integer,
    att_attendanceobjective boolean
);


ALTER TABLE public.tab_attendance OWNER TO postgres;

--
-- Name: tab_attendance_att_attendanceid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tab_attendance_att_attendanceid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tab_attendance_att_attendanceid_seq OWNER TO postgres;

--
-- Name: tab_attendance_att_attendanceid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tab_attendance_att_attendanceid_seq OWNED BY public.tab_attendance.att_attendanceid;


--
-- Name: tab_course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tab_course (
    cou_courseid integer NOT NULL,
    cou_coursename character varying(255),
    cou_coursetype character varying(255),
    cou_courseperiodid_fk integer
);


ALTER TABLE public.tab_course OWNER TO postgres;

--
-- Name: tab_course_cou_courseid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tab_course_cou_courseid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tab_course_cou_courseid_seq OWNER TO postgres;

--
-- Name: tab_course_cou_courseid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tab_course_cou_courseid_seq OWNED BY public.tab_course.cou_courseid;


--
-- Name: tab_date; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tab_date (
    dat_dateid integer NOT NULL,
    dat_dateinfo character varying(255),
    dat_dateday date,
    dat_dateperson integer,
    dat_dateobserv character varying(255)
);


ALTER TABLE public.tab_date OWNER TO postgres;

--
-- Name: tab_date_dat_dateid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tab_date_dat_dateid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tab_date_dat_dateid_seq OWNER TO postgres;

--
-- Name: tab_date_dat_dateid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tab_date_dat_dateid_seq OWNED BY public.tab_date.dat_dateid;


--
-- Name: tab_employee; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.tab_employee OWNER TO postgres;

--
-- Name: tab_enroll; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tab_enroll (
    enr_enrollid integer NOT NULL,
    enr_studentid integer,
    enr_enrolldate timestamp without time zone
);


ALTER TABLE public.tab_enroll OWNER TO postgres;

--
-- Name: tab_property; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tab_property (
    pro_propertyid integer NOT NULL,
    pro_propertybrand character varying(255),
    pro_propertytype character varying(255),
    pro_propertyname character varying(255),
    pro_propertyprovenance character varying(255),
    pro_propertyentrydate timestamp without time zone,
    pro_propertyuser integer,
    pro_propertymodel character varying(255),
    pro_propertystate character varying(255),
    pro_propertyqualitya character varying(255)
);


ALTER TABLE public.tab_property OWNER TO postgres;

--
-- Name: tab_good_goo_goodid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tab_good_goo_goodid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tab_good_goo_goodid_seq OWNER TO postgres;

--
-- Name: tab_good_goo_goodid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tab_good_goo_goodid_seq OWNED BY public.tab_property.pro_propertyid;


--
-- Name: tab_grade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tab_grade (
    gra_gradeid integer NOT NULL,
    gra_gradedate date,
    gra_gradesection integer,
    gra_gradevalue double precision
);


ALTER TABLE public.tab_grade OWNER TO postgres;

--
-- Name: tab_grade_gra_gradeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tab_grade_gra_gradeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tab_grade_gra_gradeid_seq OWNER TO postgres;

--
-- Name: tab_grade_gra_gradeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tab_grade_gra_gradeid_seq OWNED BY public.tab_grade.gra_gradeid;


--
-- Name: tab_loan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tab_loan (
    loa_loanid integer NOT NULL,
    loa_loangoodid integer,
    loa_loanstartdate date,
    loa_loanenddate date,
    loa_loanbeneficiary integer,
    loa_loanuser integer,
    loa_loanobservation character varying(255)
);


ALTER TABLE public.tab_loan OWNER TO postgres;

--
-- Name: tab_movement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tab_movement (
    mov_movementid integer NOT NULL,
    mov_movementdate timestamp without time zone,
    mov_movementuser character varying(255),
    mov_movementype character varying(255),
    mov_movementverb character varying(255),
    mov_movementtable character varying(255),
    mov_movementrowsaffected character varying(255)
);


ALTER TABLE public.tab_movement OWNER TO postgres;

--
-- Name: tab_movement_mov_movementid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tab_movement_mov_movementid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tab_movement_mov_movementid_seq OWNER TO postgres;

--
-- Name: tab_movement_mov_movementid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tab_movement_mov_movementid_seq OWNED BY public.tab_movement.mov_movementid;


--
-- Name: tab_period; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tab_period (
    perperiodid integer NOT NULL,
    peryearstart date,
    peryearend date
);


ALTER TABLE public.tab_period OWNER TO postgres;

--
-- Name: tab_privileges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tab_privileges (
    pri_privilegesid integer NOT NULL,
    pri_privilegesname character varying(255)
);


ALTER TABLE public.tab_privileges OWNER TO postgres;

--
-- Name: tab_representative; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tab_representative (
    rep_representativeid integer NOT NULL,
    rep_representative1name character varying(255),
    rep_representative2name character varying(255),
    rep_representative1lastname character varying(255),
    rep_representative2lastname character varying(255),
    rep_representativebirth character varying(255),
    rep_representativephone character varying(255),
    rep_representativeadress character varying(255),
    rep_represnetativestatus character varying(255),
    rep_representativetype character varying(255)
);


ALTER TABLE public.tab_representative OWNER TO postgres;

--
-- Name: tab_representative_rep_representativeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tab_representative_rep_representativeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tab_representative_rep_representativeid_seq OWNER TO postgres;

--
-- Name: tab_representative_rep_representativeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tab_representative_rep_representativeid_seq OWNED BY public.tab_representative.rep_representativeid;


--
-- Name: tab_section; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tab_section (
    sec_sectionid integer NOT NULL,
    sec_sectioncourseid_fk integer,
    sec_sectionname character varying(255)
);


ALTER TABLE public.tab_section OWNER TO postgres;

--
-- Name: tab_section_sec_sectionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tab_section_sec_sectionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tab_section_sec_sectionid_seq OWNER TO postgres;

--
-- Name: tab_section_sec_sectionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tab_section_sec_sectionid_seq OWNED BY public.tab_section.sec_sectionid;


--
-- Name: tab_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tab_session (
    ses_sessionid integer NOT NULL,
    ses_sessionuser integer NOT NULL,
    ses_sessionstart timestamp without time zone NOT NULL,
    ses_sessionend timestamp without time zone NOT NULL
);


ALTER TABLE public.tab_session OWNER TO postgres;

--
-- Name: tab_session_ses_sessionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tab_session_ses_sessionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tab_session_ses_sessionid_seq OWNER TO postgres;

--
-- Name: tab_session_ses_sessionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tab_session_ses_sessionid_seq OWNED BY public.tab_session.ses_sessionid;


--
-- Name: tab_student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tab_student (
    stu_studentid integer NOT NULL,
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


ALTER TABLE public.tab_student OWNER TO postgres;

--
-- Name: tab_teacher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tab_teacher (
    tea_teacherid integer NOT NULL,
    tea_teacher1name character varying(255),
    tea_teacher2name character varying(255),
    tea_teacher1lastname character varying(255),
    tea_teacher2lastname character varying(255),
    tea_teacherbirth date,
    tea_teacheradress character varying(255),
    tea_teacherphone character varying(255),
    tea_teacherstatus character varying(255),
    tea_teachertype character varying(255)
);


ALTER TABLE public.tab_teacher OWNER TO postgres;

--
-- Name: tab_teacher_tea_teacherid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tab_teacher_tea_teacherid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tab_teacher_tea_teacherid_seq OWNER TO postgres;

--
-- Name: tab_teacher_tea_teacherid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tab_teacher_tea_teacherid_seq OWNED BY public.tab_teacher.tea_teacherid;


--
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
-- Name: tabperiod_perperiodid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tabperiod_perperiodid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tabperiod_perperiodid_seq OWNER TO postgres;

--
-- Name: tabperiod_perperiodid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tabperiod_perperiodid_seq OWNED BY public.tab_period.perperiodid;


--
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
-- Name: tabuser_useuserid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tabuser_useuserid_seq OWNED BY public.tab_user.use_userid;


--
-- Name: list_role rol_roleid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_role ALTER COLUMN rol_roleid SET DEFAULT nextval('public.list_role_change_seq'::regclass);


--
-- Name: tab_attendance att_attendanceid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_attendance ALTER COLUMN att_attendanceid SET DEFAULT nextval('public.tab_attendance_att_attendanceid_seq'::regclass);


--
-- Name: tab_course cou_courseid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_course ALTER COLUMN cou_courseid SET DEFAULT nextval('public.tab_course_cou_courseid_seq'::regclass);


--
-- Name: tab_date dat_dateid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_date ALTER COLUMN dat_dateid SET DEFAULT nextval('public.tab_date_dat_dateid_seq'::regclass);


--
-- Name: tab_grade gra_gradeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_grade ALTER COLUMN gra_gradeid SET DEFAULT nextval('public.tab_grade_gra_gradeid_seq'::regclass);


--
-- Name: tab_movement mov_movementid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_movement ALTER COLUMN mov_movementid SET DEFAULT nextval('public.tab_movement_mov_movementid_seq'::regclass);


--
-- Name: tab_period perperiodid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_period ALTER COLUMN perperiodid SET DEFAULT nextval('public.tabperiod_perperiodid_seq'::regclass);


--
-- Name: tab_property pro_propertyid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_property ALTER COLUMN pro_propertyid SET DEFAULT nextval('public.tab_good_goo_goodid_seq'::regclass);


--
-- Name: tab_representative rep_representativeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_representative ALTER COLUMN rep_representativeid SET DEFAULT nextval('public.tab_representative_rep_representativeid_seq'::regclass);


--
-- Name: tab_section sec_sectionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_section ALTER COLUMN sec_sectionid SET DEFAULT nextval('public.tab_section_sec_sectionid_seq'::regclass);


--
-- Name: tab_session ses_sessionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_session ALTER COLUMN ses_sessionid SET DEFAULT nextval('public.tab_session_ses_sessionid_seq'::regclass);


--
-- Name: tab_teacher tea_teacherid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_teacher ALTER COLUMN tea_teacherid SET DEFAULT nextval('public.tab_teacher_tea_teacherid_seq'::regclass);


--
-- Name: tab_user use_userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_user ALTER COLUMN use_userid SET DEFAULT nextval('public.tabuser_useuserid_seq'::regclass);


--
-- Data for Name: link_sectionstudent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.link_sectionstudent (sectionstudent_section, sectionstudent_student) FROM stdin;
\.


--
-- Data for Name: link_userrole; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.link_userrole (userrole_tabuserid_fk, userrole_listroleid_fk) FROM stdin;
16	6
17	6
16	5
18	6
19	6
20	6
21	6
28	6
29	6
30	6
31	6
32	6
33	6
34	6
35	6
36	6
37	6
38	6
39	6
40	6
41	6
42	6
43	6
\.


--
-- Data for Name: list_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.list_role (rol_rolename, rol_roleid) FROM stdin;
usuario	4
moderador	5
administrador	6
\.


--
-- Data for Name: tab_attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_attendance (att_attendanceid, att_attendanceday, att_attendancesection, att_attendanceobjective) FROM stdin;
\.


--
-- Data for Name: tab_course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_course (cou_courseid, cou_coursename, cou_coursetype, cou_courseperiodid_fk) FROM stdin;
2	lenguaje1	sdada	80
3	PIANO	TEORICO	80
4	deporte	teorica	81
5	topografia	teorico	84
6	agricultura	teorica	75
7	agricultura	teorica	75
8	Bilirrubina	práctica	80
\.


--
-- Data for Name: tab_date; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_date (dat_dateid, dat_dateinfo, dat_dateday, dat_dateperson, dat_dateobserv) FROM stdin;
\.


--
-- Data for Name: tab_employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_employee (emp_employeeid, emp_employee1name, emp_employee2name, emp_employee1lastname, emp_employee2lastname, emp_employeebirth, emp_employeeadress, emp_employeephone, emp_employeestatus, emp_employeetype) FROM stdin;
5656	lkhjuk                                                                                                                                                                                                                                                         	dsfs                                                                                                                                                                                                                                                           	yuuiy                                                                                                                                                                                                                                                          	dsfd                                                                                                                                                                                                                                                           	2024-03-07	Av Universidad. Edificio Los Pájaros 1 Apto 1-G.                                                                                                                                                                                                               	985664                                                                                                                                                                                                                                                         	sdfsdfs                                                                                                                                                                                                                                                        	sdfsd                                                                                                                                                                                                                                                          
205398406	perrez                                                                                                                                                                                                                                                         	josefina                                                                                                                                                                                                                                                       	pereira                                                                                                                                                                                                                                                        	guillermina                                                                                                                                                                                                                                                    	2024-01-25	sdasdasdas                                                                                                                                                                                                                                                     	965456                                                                                                                                                                                                                                                         	sdfsdfsd                                                                                                                                                                                                                                                       	sfsdfds                                                                                                                                                                                                                                                        
89745321	sdfklsdj                                                                                                                                                                                                                                                       	apolinar                                                                                                                                                                                                                                                       	sdlfksd                                                                                                                                                                                                                                                        	cantor                                                                                                                                                                                                                                                         	2001-03-13	jhsdgfhjg. maturin                                                                                                                                                                                                                                             	04148968524                                                                                                                                                                                                                                                    	activo                                                                                                                                                                                                                                                         	coworker                                                                                                                                                                                                                                                       
\.


--
-- Data for Name: tab_enroll; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_enroll (enr_enrollid, enr_studentid, enr_enrolldate) FROM stdin;
\.


--
-- Data for Name: tab_grade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_grade (gra_gradeid, gra_gradedate, gra_gradesection, gra_gradevalue) FROM stdin;
\.


--
-- Data for Name: tab_loan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_loan (loa_loanid, loa_loangoodid, loa_loanstartdate, loa_loanenddate, loa_loanbeneficiary, loa_loanuser, loa_loanobservation) FROM stdin;
\.


--
-- Data for Name: tab_movement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_movement (mov_movementid, mov_movementdate, mov_movementuser, mov_movementype, mov_movementverb, mov_movementtable, mov_movementrowsaffected) FROM stdin;
\.


--
-- Data for Name: tab_period; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_period (perperiodid, peryearstart, peryearend) FROM stdin;
75	2023-10-23	2024-01-03
80	2024-02-23	2024-03-05
83	2024-04-18	2024-08-14
85	2023-12-05	2024-05-08
86	2024-05-08	2024-07-11
81	2023-12-19	2024-07-11
91	2024-06-06	2024-06-28
84	2024-01-24	2024-03-19
78	2024-02-03	2024-05-20
92	2024-08-15	2025-08-28
\.


--
-- Data for Name: tab_privileges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_privileges (pri_privilegesid, pri_privilegesname) FROM stdin;
\.


--
-- Data for Name: tab_property; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_property (pro_propertyid, pro_propertybrand, pro_propertytype, pro_propertyname, pro_propertyprovenance, pro_propertyentrydate, pro_propertyuser, pro_propertymodel, pro_propertystate, pro_propertyqualitya) FROM stdin;
\.


--
-- Data for Name: tab_representative; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_representative (rep_representativeid, rep_representative1name, rep_representative2name, rep_representative1lastname, rep_representative2lastname, rep_representativebirth, rep_representativephone, rep_representativeadress, rep_represnetativestatus, rep_representativetype) FROM stdin;
\.


--
-- Data for Name: tab_section; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_section (sec_sectionid, sec_sectioncourseid_fk, sec_sectionname) FROM stdin;
1	3	1
2	5	unica
3	5	segunda
4	6	3
5	6	5
6	6	clase 2
7	6	clase 3
8	6	clase 4
\.


--
-- Data for Name: tab_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_session (ses_sessionid, ses_sessionuser, ses_sessionstart, ses_sessionend) FROM stdin;
\.


--
-- Data for Name: tab_student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_student (stu_studentid, stu_student1name, stu_student2name, stu_student1lastname, stu_student2lastname, stu_studentbirth, stu_studentadress, stu_studentemail, stu_studentgender, stu_studentphone) FROM stdin;
2545654	ana                                                                                                                                                                                                                                                            	anita                                                                                                                                                                                                                                                          	rar                                                                                                                                                                                                                                                            	rei                                                                                                                                                                                                                                                            	2024-03-01	Av Universidad. Edificio Los Pájaros 1 Apto 1-G.                                                                                                                                                                                                               	SDFSDFDS@asdsdasd                                                                                                                                                                                                                                              	\N	556456
456123	elena                                                                                                                                                                                                                                                          	maria                                                                                                                                                                                                                                                          	de troya                                                                                                                                                                                                                                                       	menelao                                                                                                                                                                                                                                                        	2024-03-02	Av Universidad. Edificio Los Pájaros 1 Apto 1-G.                                                                                                                                                                                                               	5646@hotmail.com                                                                                                                                                                                                                                               	male                                                                                                                                                                                                                                                           	966852
159753	luis                                                                                                                                                                                                                                                           	leon                                                                                                                                                                                                                                                           	marquez                                                                                                                                                                                                                                                        	montesinos                                                                                                                                                                                                                                                     	2023-11-16	la ceiba                                                                                                                                                                                                                                                       	mdsj@jhlfdf.com                                                                                                                                                                                                                                                	male                                                                                                                                                                                                                                                           	4145465
456123789	juan                                                                                                                                                                                                                                                           	cantor                                                                                                                                                                                                                                                         	cantor j                                                                                                                                                                                                                                                       	juan                                                                                                                                                                                                                                                           	2024-03-21	fghfgh                                                                                                                                                                                                                                                         	sdad@gmail.com                                                                                                                                                                                                                                                 	masculino                                                                                                                                                                                                                                                      	456432
789165465	kasandra                                                                                                                                                                                                                                                       	kasandrilla                                                                                                                                                                                                                                                    	matute                                                                                                                                                                                                                                                         	manaure                                                                                                                                                                                                                                                        	2024-04-18	la manga                                                                                                                                                                                                                                                       	fjdfid@gmail.com                                                                                                                                                                                                                                               	fluido                                                                                                                                                                                                                                                         	893554
23456789	juan                                                                                                                                                                                                                                                           	arango                                                                                                                                                                                                                                                         	arango                                                                                                                                                                                                                                                         	juan                                                                                                                                                                                                                                                           	2024-04-04	los balnearios                                                                                                                                                                                                                                                 	fjk@gmail.com                                                                                                                                                                                                                                                  	masculino                                                                                                                                                                                                                                                      	4142698
\.


--
-- Data for Name: tab_teacher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_teacher (tea_teacherid, tea_teacher1name, tea_teacher2name, tea_teacher1lastname, tea_teacher2lastname, tea_teacherbirth, tea_teacheradress, tea_teacherphone, tea_teacherstatus, tea_teachertype) FROM stdin;
\.


--
-- Data for Name: tab_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_user (use_userid, use_username, use_userpassword, use_useremail) FROM stdin;
17	juan	$2a$08$Qya5d04FkBZu.Ht1EndVz.3AUj1caOx7WxtvM4Eij8fKudvZzjx1O	juan@juanito.com
19	rogelios	$2a$08$VfBJCdfsnxeC8PXFsfZ2peeUzXzhwKMEbQgrKutTk3CwP1WJTmJzq	rogelios@gmail.com
18	carlos	$2a$08$pM5JrkWKpozLukCIahkyse3za..cfCqViF3FvGwErnh.1sf5dtJkm	yoa@gmail.com
20	mega	$2a$08$D3rxC07DS6eaDaNgnFo/8eMbGcVzSVNY7SvUdXOt3RzgQ6esznfLC	mega@gmail.com
21	orbita	$2a$08$XKMuFPWNy/BBNC.beXxp7O399Bb9Jemd37wOG3ZcobAAnH75Qv2cW	orbita@gmail.com
28	dorangel	$2a$08$tvg9SjKjnGo8aR1Vs6p0mu8Mg54wqCYzwR2vjMqfNJc/VF.EkQIOO	dor@gmail.com
29	jose	$2a$08$Ch1wFCyTv3o3JFX7fZ5aDOVnDinSlhmpMGaMy8IYPRUBIkKehB5W6	jose@gmail.com
30	juana	$2a$08$NgtwGdFe.be9LtuJyxxLVOEllf8XorUleQTI7wD9hW0/PxWV7G2Z6	juana@gmail.com
31	anamaria	$2a$08$ivf0souDjTWl2ZTfWTlske0heJZrB/zOe7LpshPBu2B83I/pW3p5y	anamaria@gmail.com
32	luis	$2a$08$Cl6hoz5KC.uE4Z.CjKf16.IRbeBQChdoTo7oZJ291AkGjMerm5/46	luis@gmail.com
33	omar	$2a$08$.XRnm153X..OoetqOF2yjO.rc7/SM4oTmY09W6qo4r0rB4ARxcV/2	omar@gmail.com
34	yenesis	$2a$08$GQTdNI7R1huPyxNR2kSJZe6n//q3e8WDBtXOCeXrRygw2pQiDO/X6	yenesis@gmail.com
35	verduras	$2a$08$khCPXgCR.bdtZGAAXPOsAu/ugVLX5Wz9unkMx0KTgTQWwY.BA8x7O	verduras@g.com
36	santaines	$2a$08$F9l1QL4t4ta1.X6tBNdRaOotbJwDg7cbl7vewXWxvH/.AeDnR0f7O	santaines@gmail.com
37	catamaran	$2a$08$b.BqQSZnF7NXOQovnbCECundkLnDxBtZXI6Mv75SUpHCw6505IjhG	cata@gmail.com
38	negra	$2a$08$UKX64a6zUg0UiM/jIqxmuOjqF0vXtGFNhzf/S.u47noKvK5jXqXHe	negra@gmail.com
39	anasimons	$2a$08$GOwpqPWfl/HI.X8.qlOVc.YfKkkk/8jfF8ufIbUYOGi9zCelxoWOu	anasimons@gmail.com
40	yordi	$2a$08$NNDN7.l84W/Hqq9UR2ptNeTmADHOHOmOSFzWNJh5umbPhU9x26AF6	yordi@gmail.com
16	matarile	$2a$08$rrxJNHLRySh5DHcN88XMLeUT6R1Hlsqc6is0b5z55VWjVGT6PXesi	usuario@usuario.com
41	kasandra	$2a$08$E6y9TUrhZSy5F6eYosZuu.dVnb4u.kHmVmK5WwZrC1HABBgHAmjce	kasandra@gmail.com
42	usuario	$2a$08$0tV6u9NWp0QVs.wdcP0o5eP4jsMzlSPX1FYpG3uO/j7.ZqKO4lZX6	usuario@gmail.com
43	emiliano	$2a$08$bEtBflBvpk9fEOlV6hacU.VmTbx0QizDzAsnz3Zhm0s2FPrqQJAQO	emiliano@gmail.com
\.


--
-- Name: list_role_change_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.list_role_change_seq', 6, true);


--
-- Name: tab_attendance_att_attendanceid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tab_attendance_att_attendanceid_seq', 1, false);


--
-- Name: tab_course_cou_courseid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tab_course_cou_courseid_seq', 8, true);


--
-- Name: tab_date_dat_dateid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tab_date_dat_dateid_seq', 1, false);


--
-- Name: tab_good_goo_goodid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tab_good_goo_goodid_seq', 1, false);


--
-- Name: tab_grade_gra_gradeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tab_grade_gra_gradeid_seq', 1, false);


--
-- Name: tab_movement_mov_movementid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tab_movement_mov_movementid_seq', 1, false);


--
-- Name: tab_representative_rep_representativeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tab_representative_rep_representativeid_seq', 1, false);


--
-- Name: tab_section_sec_sectionid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tab_section_sec_sectionid_seq', 8, true);


--
-- Name: tab_session_ses_sessionid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tab_session_ses_sessionid_seq', 1, false);


--
-- Name: tab_teacher_tea_teacherid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tab_teacher_tea_teacherid_seq', 1, false);


--
-- Name: tabperiod_perperiodid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tabperiod_perperiodid_seq', 92, true);


--
-- Name: tabuser_useuserid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tabuser_useuserid_seq', 43, true);


--
-- Name: link_userrole link_userrole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_userrole
    ADD CONSTRAINT link_userrole_pkey PRIMARY KEY (userrole_tabuserid_fk, userrole_listroleid_fk);


--
-- Name: link_userrole link_userrole_userid_roleid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_userrole
    ADD CONSTRAINT link_userrole_userid_roleid_unique UNIQUE (userrole_tabuserid_fk, userrole_listroleid_fk);


--
-- Name: list_role list_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_role
    ADD CONSTRAINT list_role_pkey PRIMARY KEY (rol_roleid);


--
-- Name: tab_attendance tab_attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_attendance
    ADD CONSTRAINT tab_attendance_pkey PRIMARY KEY (att_attendanceid);


--
-- Name: tab_course tab_course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_course
    ADD CONSTRAINT tab_course_pkey PRIMARY KEY (cou_courseid);


--
-- Name: tab_date tab_date_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_date
    ADD CONSTRAINT tab_date_pkey PRIMARY KEY (dat_dateid);


--
-- Name: tab_employee tab_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_employee
    ADD CONSTRAINT tab_employee_pkey PRIMARY KEY (emp_employeeid);


--
-- Name: tab_enroll tab_enroll_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_enroll
    ADD CONSTRAINT tab_enroll_pkey PRIMARY KEY (enr_enrollid);


--
-- Name: tab_property tab_good_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_property
    ADD CONSTRAINT tab_good_pkey PRIMARY KEY (pro_propertyid);


--
-- Name: tab_grade tab_grade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_grade
    ADD CONSTRAINT tab_grade_pkey PRIMARY KEY (gra_gradeid);


--
-- Name: tab_loan tab_loan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_loan
    ADD CONSTRAINT tab_loan_pkey PRIMARY KEY (loa_loanid);


--
-- Name: tab_privileges tab_privileges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_privileges
    ADD CONSTRAINT tab_privileges_pkey PRIMARY KEY (pri_privilegesid);


--
-- Name: tab_representative tab_representative_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_representative
    ADD CONSTRAINT tab_representative_pkey PRIMARY KEY (rep_representativeid);


--
-- Name: tab_section tab_section_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_section
    ADD CONSTRAINT tab_section_pkey PRIMARY KEY (sec_sectionid);


--
-- Name: tab_session tab_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_session
    ADD CONSTRAINT tab_session_pkey PRIMARY KEY (ses_sessionid);


--
-- Name: tab_student tab_student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_student
    ADD CONSTRAINT tab_student_pkey PRIMARY KEY (stu_studentid);


--
-- Name: tab_teacher tab_teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_teacher
    ADD CONSTRAINT tab_teacher_pkey PRIMARY KEY (tea_teacherid);


--
-- Name: tab_period tabperiod_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_period
    ADD CONSTRAINT tabperiod_pkey PRIMARY KEY (perperiodid);


--
-- Name: tab_user tabuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_user
    ADD CONSTRAINT tabuser_pkey PRIMARY KEY (use_userid);


--
-- Name: tab_course fk_course_period; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_course
    ADD CONSTRAINT fk_course_period FOREIGN KEY (cou_courseperiodid_fk) REFERENCES public.tab_period(perperiodid);


--
-- Name: link_sectionstudent link_sectionstudent_sectionstudent_section_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_sectionstudent
    ADD CONSTRAINT link_sectionstudent_sectionstudent_section_fkey FOREIGN KEY (sectionstudent_section) REFERENCES public.tab_section(sec_sectionid);


--
-- Name: link_sectionstudent link_sectionstudent_sectionstudent_student_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_sectionstudent
    ADD CONSTRAINT link_sectionstudent_sectionstudent_student_fkey FOREIGN KEY (sectionstudent_student) REFERENCES public.tab_student(stu_studentid);


--
-- Name: link_userrole link_userrole_userrole_listroleid_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_userrole
    ADD CONSTRAINT link_userrole_userrole_listroleid_fk_fkey FOREIGN KEY (userrole_listroleid_fk) REFERENCES public.list_role(rol_roleid);


--
-- Name: link_userrole link_userrole_userrole_tabuserid_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_userrole
    ADD CONSTRAINT link_userrole_userrole_tabuserid_fk_fkey FOREIGN KEY (userrole_tabuserid_fk) REFERENCES public.tab_user(use_userid);


--
-- Name: link_userrole link_userrole_userrole_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_userrole
    ADD CONSTRAINT link_userrole_userrole_userid_fkey FOREIGN KEY (userrole_tabuserid_fk) REFERENCES public.tab_user(use_userid);


--
-- Name: tab_section tab_section_sec_sectioncourseid_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_section
    ADD CONSTRAINT tab_section_sec_sectioncourseid_fk_fkey FOREIGN KEY (sec_sectioncourseid_fk) REFERENCES public.tab_course(cou_courseid);


--
-- Name: TABLE tab_user; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tab_user TO miguel;


--
-- Name: SEQUENCE tabuser_useuserid_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.tabuser_useuserid_seq TO miguel;


--
-- PostgreSQL database dump complete
--

