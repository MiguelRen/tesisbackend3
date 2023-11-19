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
-- Name: link_userrole; Type: TABLE; Schema: public; Owner: miguel
--

CREATE TABLE public.link_userrole (
    userrole_tabuserid_fk integer NOT NULL,
    userrole_listroleid_fk integer DEFAULT 6 NOT NULL
);


ALTER TABLE public.link_userrole OWNER TO miguel;

--
-- Name: list_role; Type: TABLE; Schema: public; Owner: miguel
--

CREATE TABLE public.list_role (
    rol_rolename character varying,
    rol_roleid integer NOT NULL
);


ALTER TABLE public.list_role OWNER TO miguel;

--
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
-- Name: list_role_change_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: miguel
--

ALTER SEQUENCE public.list_role_change_seq OWNED BY public.list_role.rol_roleid;


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
-- Name: list_role rol_roleid; Type: DEFAULT; Schema: public; Owner: miguel
--

ALTER TABLE ONLY public.list_role ALTER COLUMN rol_roleid SET DEFAULT nextval('public.list_role_change_seq'::regclass);


--
-- Name: tab_user use_userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_user ALTER COLUMN use_userid SET DEFAULT nextval('public.tabuser_useuserid_seq'::regclass);


--
-- Data for Name: link_userrole; Type: TABLE DATA; Schema: public; Owner: miguel
--

COPY public.link_userrole (userrole_tabuserid_fk, userrole_listroleid_fk) FROM stdin;
16	6
\.


--
-- Data for Name: list_role; Type: TABLE DATA; Schema: public; Owner: miguel
--

COPY public.list_role (rol_rolename, rol_roleid) FROM stdin;
usuario	4
moderador	5
administrador	6
\.


--
-- Data for Name: tab_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_user (use_userid, use_username, use_userpassword, use_useremail) FROM stdin;
16	usuario	$2a$08$rrxJNHLRySh5DHcN88XMLeUT6R1Hlsqc6is0b5z55VWjVGT6PXesi	usuario@usuario.com
\.


--
-- Name: list_role_change_seq; Type: SEQUENCE SET; Schema: public; Owner: miguel
--

SELECT pg_catalog.setval('public.list_role_change_seq', 6, true);


--
-- Name: tabuser_useuserid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tabuser_useuserid_seq', 16, true);


--
-- Name: link_userrole link_userrole_pkey; Type: CONSTRAINT; Schema: public; Owner: miguel
--

ALTER TABLE ONLY public.link_userrole
    ADD CONSTRAINT link_userrole_pkey PRIMARY KEY (userrole_tabuserid_fk, userrole_listroleid_fk);


--
-- Name: link_userrole link_userrole_userid_roleid_unique; Type: CONSTRAINT; Schema: public; Owner: miguel
--

ALTER TABLE ONLY public.link_userrole
    ADD CONSTRAINT link_userrole_userid_roleid_unique UNIQUE (userrole_tabuserid_fk, userrole_listroleid_fk);


--
-- Name: list_role list_role_pkey; Type: CONSTRAINT; Schema: public; Owner: miguel
--

ALTER TABLE ONLY public.list_role
    ADD CONSTRAINT list_role_pkey PRIMARY KEY (rol_roleid);


--
-- Name: tab_user tabuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_user
    ADD CONSTRAINT tabuser_pkey PRIMARY KEY (use_userid);


--
-- Name: link_userrole link_userrole_userrole_listroleid_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: miguel
--

ALTER TABLE ONLY public.link_userrole
    ADD CONSTRAINT link_userrole_userrole_listroleid_fk_fkey FOREIGN KEY (userrole_listroleid_fk) REFERENCES public.list_role(rol_roleid);


--
-- Name: link_userrole link_userrole_userrole_tabuserid_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: miguel
--

ALTER TABLE ONLY public.link_userrole
    ADD CONSTRAINT link_userrole_userrole_tabuserid_fk_fkey FOREIGN KEY (userrole_tabuserid_fk) REFERENCES public.tab_user(use_userid);


--
-- Name: link_userrole link_userrole_userrole_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: miguel
--

ALTER TABLE ONLY public.link_userrole
    ADD CONSTRAINT link_userrole_userrole_userid_fkey FOREIGN KEY (userrole_tabuserid_fk) REFERENCES public.tab_user(use_userid);


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

