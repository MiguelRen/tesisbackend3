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
    userrole_userid integer,
    userrole_roleid integer
);


ALTER TABLE public.link_userrole OWNER TO miguel;

--
-- Name: list_role; Type: TABLE; Schema: public; Owner: miguel
--

CREATE TABLE public.list_role (
    role_roleid integer,
    role_rolename character varying
);


ALTER TABLE public.list_role OWNER TO miguel;

--
-- Name: tab_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tab_user (
    use_userid integer NOT NULL,
    use_username character varying,
    use_userpassword character varying,
    use_userrole integer,
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
-- Name: tab_user use_userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_user ALTER COLUMN use_userid SET DEFAULT nextval('public.tabuser_useuserid_seq'::regclass);


--
-- Data for Name: link_userrole; Type: TABLE DATA; Schema: public; Owner: miguel
--

COPY public.link_userrole (userrole_userid, userrole_roleid) FROM stdin;
\.


--
-- Data for Name: list_role; Type: TABLE DATA; Schema: public; Owner: miguel
--

COPY public.list_role (role_roleid, role_rolename) FROM stdin;
\.


--
-- Data for Name: tab_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_user (use_userid, use_username, use_userpassword, use_userrole, use_useremail) FROM stdin;
\.


--
-- Name: tabuser_useuserid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tabuser_useuserid_seq', 2, true);


--
-- Name: tab_user tabuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_user
    ADD CONSTRAINT tabuser_pkey PRIMARY KEY (use_userid);


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

