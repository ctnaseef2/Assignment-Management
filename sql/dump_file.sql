--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--





--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3 (Debian 14.3-1.pgdg110+1)
-- Dumped by pg_dump version 14.3 (Debian 14.3-1.pgdg110+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3 (Debian 14.3-1.pgdg110+1)
-- Dumped by pg_dump version 14.3 (Debian 14.3-1.pgdg110+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts_department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_department (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    total_academic_years integer NOT NULL
);


ALTER TABLE public.accounts_department OWNER TO postgres;

--
-- Name: accounts_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_department_id_seq OWNER TO postgres;

--
-- Name: accounts_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_department_id_seq OWNED BY public.accounts_department.id;


--
-- Name: accounts_department_subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_department_subjects (
    id bigint NOT NULL,
    department_id bigint NOT NULL,
    subject_id bigint NOT NULL
);


ALTER TABLE public.accounts_department_subjects OWNER TO postgres;

--
-- Name: accounts_department_subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_department_subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_department_subjects_id_seq OWNER TO postgres;

--
-- Name: accounts_department_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_department_subjects_id_seq OWNED BY public.accounts_department_subjects.id;


--
-- Name: accounts_staffs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_staffs (
    id bigint NOT NULL,
    department_id bigint,
    designation character varying(100) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.accounts_staffs OWNER TO postgres;

--
-- Name: accounts_staffs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_staffs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_staffs_id_seq OWNER TO postgres;

--
-- Name: accounts_staffs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_staffs_id_seq OWNED BY public.accounts_staffs.id;


--
-- Name: accounts_students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_students (
    id bigint NOT NULL,
    department_id bigint,
    user_id bigint NOT NULL,
    date_of_birth date NOT NULL,
    date_of_joining date NOT NULL,
    register_number character varying(25) NOT NULL
);


ALTER TABLE public.accounts_students OWNER TO postgres;

--
-- Name: accounts_students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_students_id_seq OWNER TO postgres;

--
-- Name: accounts_students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_students_id_seq OWNED BY public.accounts_students.id;


--
-- Name: accounts_subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_subject (
    id bigint NOT NULL,
    name character varying(60) NOT NULL,
    semester integer NOT NULL,
    description character varying(100) NOT NULL
);


ALTER TABLE public.accounts_subject OWNER TO postgres;

--
-- Name: accounts_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_subject_id_seq OWNER TO postgres;

--
-- Name: accounts_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_subject_id_seq OWNED BY public.accounts_subject.id;


--
-- Name: accounts_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    phone_number character varying(20) NOT NULL
);


ALTER TABLE public.accounts_user OWNER TO postgres;

--
-- Name: accounts_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_user_groups OWNER TO postgres;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_groups_id_seq OWNER TO postgres;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_user_groups_id_seq OWNED BY public.accounts_user_groups.id;


--
-- Name: accounts_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_id_seq OWNER TO postgres;

--
-- Name: accounts_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_user_id_seq OWNED BY public.accounts_user.id;


--
-- Name: accounts_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_user_user_permissions OWNER TO postgres;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_user_user_permissions_id_seq OWNED BY public.accounts_user_user_permissions.id;


--
-- Name: assignments_assignmentsubmissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assignments_assignmentsubmissions (
    id bigint NOT NULL,
    answer character varying(5000) NOT NULL,
    file character varying(500) NOT NULL,
    total_mark integer NOT NULL,
    status integer NOT NULL,
    created date NOT NULL,
    updated date NOT NULL,
    assignment_id bigint NOT NULL,
    student_id bigint NOT NULL,
    comments character varying(500) NOT NULL,
    updated_by_id bigint
);


ALTER TABLE public.assignments_assignmentsubmissions OWNER TO postgres;

--
-- Name: assignments_assignmentsubmissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assignments_assignmentsubmissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assignments_assignmentsubmissions_id_seq OWNER TO postgres;

--
-- Name: assignments_assignmentsubmissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assignments_assignmentsubmissions_id_seq OWNED BY public.assignments_assignmentsubmissions.id;


--
-- Name: assignments_assignmets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assignments_assignmets (
    id bigint NOT NULL,
    title character varying(50) NOT NULL,
    description character varying(100) NOT NULL,
    question character varying(1000) NOT NULL,
    total_marks integer NOT NULL,
    status integer NOT NULL,
    created date NOT NULL,
    updated date NOT NULL,
    last_date date NOT NULL,
    depatment_id bigint NOT NULL,
    subject_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.assignments_assignmets OWNER TO postgres;

--
-- Name: assignments_assignmets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assignments_assignmets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assignments_assignmets_id_seq OWNER TO postgres;

--
-- Name: assignments_assignmets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assignments_assignmets_id_seq OWNED BY public.assignments_assignmets.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: accounts_department id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_department ALTER COLUMN id SET DEFAULT nextval('public.accounts_department_id_seq'::regclass);


--
-- Name: accounts_department_subjects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_department_subjects ALTER COLUMN id SET DEFAULT nextval('public.accounts_department_subjects_id_seq'::regclass);


--
-- Name: accounts_staffs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_staffs ALTER COLUMN id SET DEFAULT nextval('public.accounts_staffs_id_seq'::regclass);


--
-- Name: accounts_students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_students ALTER COLUMN id SET DEFAULT nextval('public.accounts_students_id_seq'::regclass);


--
-- Name: accounts_subject id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_subject ALTER COLUMN id SET DEFAULT nextval('public.accounts_subject_id_seq'::regclass);


--
-- Name: accounts_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_id_seq'::regclass);


--
-- Name: accounts_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_groups_id_seq'::regclass);


--
-- Name: accounts_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_user_permissions_id_seq'::regclass);


--
-- Name: assignments_assignmentsubmissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments_assignmentsubmissions ALTER COLUMN id SET DEFAULT nextval('public.assignments_assignmentsubmissions_id_seq'::regclass);


--
-- Name: assignments_assignmets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments_assignmets ALTER COLUMN id SET DEFAULT nextval('public.assignments_assignmets_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: accounts_department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_department (id, name, total_academic_years) FROM stdin;
1	Computer	4
\.


--
-- Data for Name: accounts_department_subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_department_subjects (id, department_id, subject_id) FROM stdin;
1	1	1
2	1	2
3	1	3
\.


--
-- Data for Name: accounts_staffs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_staffs (id, department_id, designation, user_id) FROM stdin;
1	1	teacher	2
\.


--
-- Data for Name: accounts_students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_students (id, department_id, user_id, date_of_birth, date_of_joining, register_number) FROM stdin;
1	1	3	2000-04-12	2023-04-01	225555
\.


--
-- Data for Name: accounts_subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_subject (id, name, semester, description) FROM stdin;
1	Python	1	Python
2	Maths	1	Maths
3	Physics	1	Physics
\.


--
-- Data for Name: accounts_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, phone_number) FROM stdin;
1	pbkdf2_sha256$260000$AFRKGitFna3O0NOmHbVM8c$Z+U84oeN6/76JtMVur9FPJqtZNhOF4VEV/t/D90slnk=	2023-04-05 18:01:04.076587+00	t	admin				t	t	2023-04-05 18:00:56.349916+00	
2	pbkdf2_sha256$260000$rHPQSzeTACeBi8LpEmmVbh$A87ZSrk/9/nUUzfGGkRqzJGBfcgcNYIGASdRxZPDwNI=	\N	f	staff			staff@mail.com	f	t	2023-04-05 18:03:51.399788+00	222548877
3	pbkdf2_sha256$260000$XUGnE9orVHvUtHwpFBc9EA$bO5R6jGYusDg5JDvG4sHdW84QVdynfWbIUzsBl+Fa+s=	\N	f	student			student@mail.com	f	t	2023-04-05 18:04:46.234878+00	7854125432
\.


--
-- Data for Name: accounts_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user_groups (id, user_id, group_id) FROM stdin;
1	2	1
2	3	2
\.


--
-- Data for Name: accounts_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: assignments_assignmentsubmissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assignments_assignmentsubmissions (id, answer, file, total_mark, status, created, updated, assignment_id, student_id, comments, updated_by_id) FROM stdin;
1	Answer	CS8592-Unit-V_JZZ4jo4.pdf	12	1	2023-04-05	2023-04-05	1	1	nothing....	1
\.


--
-- Data for Name: assignments_assignmets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assignments_assignmets (id, title, description, question, total_marks, status, created, updated, last_date, depatment_id, subject_id, user_id) FROM stdin;
1	First Assignment	First Assignment	First Assignment Question	100	1	2023-04-05	2023-04-05	2023-04-06	1	1	1
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
1	staff
2	student
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	25
2	2	26
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Staff Permissions	6	staff_permissions
26	Students Permissions	6	students_permissions
27	Can add subject	7	add_subject
28	Can change subject	7	change_subject
29	Can delete subject	7	delete_subject
30	Can view subject	7	view_subject
31	Can add student	8	add_students
32	Can change student	8	change_students
33	Can delete student	8	delete_students
34	Can view student	8	view_students
35	Can add staff	9	add_staffs
36	Can change staff	9	change_staffs
37	Can delete staff	9	delete_staffs
38	Can view staff	9	view_staffs
39	Can add department	10	add_department
40	Can change department	10	change_department
41	Can delete department	10	delete_department
42	Can view department	10	view_department
43	Can add assignmets	11	add_assignmets
44	Can change assignmets	11	change_assignmets
45	Can delete assignmets	11	delete_assignmets
46	Can view assignmets	11	view_assignmets
47	Can add assignment submissions	12	add_assignmentsubmissions
48	Can change assignment submissions	12	change_assignmentsubmissions
49	Can delete assignment submissions	12	delete_assignmentsubmissions
50	Can view assignment submissions	12	view_assignmentsubmissions
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2023-04-05 18:03:13.078436+00	1	staff	1	[{"added": {}}]	3	1
2	2023-04-05 18:03:28.025963+00	2	student	1	[{"added": {}}]	3	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	accounts	user
7	accounts	subject
8	accounts	students
9	accounts	staffs
10	accounts	department
11	assignments	assignmets
12	assignments	assignmentsubmissions
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-04-05 18:00:31.841686+00
2	contenttypes	0002_remove_content_type_name	2023-04-05 18:00:31.848866+00
3	auth	0001_initial	2023-04-05 18:00:31.876275+00
4	auth	0002_alter_permission_name_max_length	2023-04-05 18:00:31.883286+00
5	auth	0003_alter_user_email_max_length	2023-04-05 18:00:31.887246+00
6	auth	0004_alter_user_username_opts	2023-04-05 18:00:31.891999+00
7	auth	0005_alter_user_last_login_null	2023-04-05 18:00:31.895761+00
8	auth	0006_require_contenttypes_0002	2023-04-05 18:00:31.896853+00
9	auth	0007_alter_validators_add_error_messages	2023-04-05 18:00:31.900588+00
10	auth	0008_alter_user_username_max_length	2023-04-05 18:00:31.904584+00
11	auth	0009_alter_user_last_name_max_length	2023-04-05 18:00:31.908571+00
12	auth	0010_alter_group_name_max_length	2023-04-05 18:00:31.912561+00
13	auth	0011_update_proxy_permissions	2023-04-05 18:00:31.916321+00
14	auth	0012_alter_user_first_name_max_length	2023-04-05 18:00:31.920234+00
15	accounts	0001_initial	2023-04-05 18:00:31.940564+00
16	accounts	0002_subject_students_staffs_department	2023-04-05 18:00:31.977838+00
17	accounts	0003_alter_staffs_department_alter_students_department	2023-04-05 18:00:31.999101+00
18	accounts	0004_alter_user_options	2023-04-05 18:00:32.005449+00
19	accounts	0005_department_total_academic_years_and_more	2023-04-05 18:00:32.022942+00
20	accounts	0006_subject_description	2023-04-05 18:00:32.028588+00
21	accounts	0007_students_register_number	2023-04-05 18:00:32.035509+00
22	admin	0001_initial	2023-04-05 18:00:32.051709+00
23	admin	0002_logentry_remove_auto_add	2023-04-05 18:00:32.05901+00
24	admin	0003_logentry_add_action_flag_choices	2023-04-05 18:00:32.069735+00
25	assignments	0001_initial	2023-04-05 18:00:32.105331+00
26	assignments	0002_assignmets_comments_assignmets_updated_by	2023-04-05 18:00:32.130975+00
27	assignments	0003_rename_user_assignmentsubmissions_student_and_more	2023-04-05 18:00:32.19477+00
28	assignments	0004_alter_assignmentsubmissions_answer_and_more	2023-04-05 18:00:32.213168+00
29	sessions	0001_initial	2023-04-05 18:00:32.222914+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
iaqbeafc2o9ioxzkga4kesxo5ty4qkri	.eJxVjEEOwiAQRe_C2hCmlQFcuu8ZyDCAVA0kpV0Z765NutDtf-_9l_C0rcVvPS1-juIiQJx-t0D8SHUH8U711iS3ui5zkLsiD9rl1GJ6Xg_376BQL9-acNCKGQFUzI7BWNTJZoMDmeCisVqBNtaprLOOOAY-oyNwjCmPYJV4fwDKmTcr:1pk7RQ:Zmx_ho8uXTr-V9QB9ELaYoYBJ5KB553Ga5NVd0pIUHg	2023-04-19 18:01:04.078677+00
\.


--
-- Name: accounts_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_department_id_seq', 1, true);


--
-- Name: accounts_department_subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_department_subjects_id_seq', 3, true);


--
-- Name: accounts_staffs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_staffs_id_seq', 1, true);


--
-- Name: accounts_students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_students_id_seq', 1, true);


--
-- Name: accounts_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_subject_id_seq', 3, true);


--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_groups_id_seq', 2, true);


--
-- Name: accounts_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_id_seq', 3, true);


--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_user_permissions_id_seq', 1, false);


--
-- Name: assignments_assignmentsubmissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assignments_assignmentsubmissions_id_seq', 1, true);


--
-- Name: assignments_assignmets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assignments_assignmets_id_seq', 1, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 2, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 50, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 2, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 29, true);


--
-- Name: accounts_department accounts_department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_department
    ADD CONSTRAINT accounts_department_pkey PRIMARY KEY (id);


--
-- Name: accounts_department_subjects accounts_department_subj_department_id_subject_id_7b93fd2d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_department_subjects
    ADD CONSTRAINT accounts_department_subj_department_id_subject_id_7b93fd2d_uniq UNIQUE (department_id, subject_id);


--
-- Name: accounts_department_subjects accounts_department_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_department_subjects
    ADD CONSTRAINT accounts_department_subjects_pkey PRIMARY KEY (id);


--
-- Name: accounts_staffs accounts_staffs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_staffs
    ADD CONSTRAINT accounts_staffs_pkey PRIMARY KEY (id);


--
-- Name: accounts_staffs accounts_staffs_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_staffs
    ADD CONSTRAINT accounts_staffs_user_id_key UNIQUE (user_id);


--
-- Name: accounts_students accounts_students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_students
    ADD CONSTRAINT accounts_students_pkey PRIMARY KEY (id);


--
-- Name: accounts_students accounts_students_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_students
    ADD CONSTRAINT accounts_students_user_id_key UNIQUE (user_id);


--
-- Name: accounts_subject accounts_subject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_subject
    ADD CONSTRAINT accounts_subject_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_groups accounts_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_groups accounts_user_groups_user_id_group_id_59c0b32f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_group_id_59c0b32f_uniq UNIQUE (user_id, group_id);


--
-- Name: accounts_user accounts_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq UNIQUE (user_id, permission_id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: accounts_user accounts_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_username_key UNIQUE (username);


--
-- Name: assignments_assignmentsubmissions assignments_assignmentsubmissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments_assignmentsubmissions
    ADD CONSTRAINT assignments_assignmentsubmissions_pkey PRIMARY KEY (id);


--
-- Name: assignments_assignmets assignments_assignmets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments_assignmets
    ADD CONSTRAINT assignments_assignmets_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: accounts_department_subjects_department_id_2d9356b0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_department_subjects_department_id_2d9356b0 ON public.accounts_department_subjects USING btree (department_id);


--
-- Name: accounts_department_subjects_subject_id_33ec80cc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_department_subjects_subject_id_33ec80cc ON public.accounts_department_subjects USING btree (subject_id);


--
-- Name: accounts_staffs_department_id_5b5c6047; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_staffs_department_id_5b5c6047 ON public.accounts_staffs USING btree (department_id);


--
-- Name: accounts_students_department_id_ae0128dd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_students_department_id_ae0128dd ON public.accounts_students USING btree (department_id);


--
-- Name: accounts_user_groups_group_id_bd11a704; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_groups_group_id_bd11a704 ON public.accounts_user_groups USING btree (group_id);


--
-- Name: accounts_user_groups_user_id_52b62117; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_groups_user_id_52b62117 ON public.accounts_user_groups USING btree (user_id);


--
-- Name: accounts_user_user_permissions_permission_id_113bb443; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_user_permissions_permission_id_113bb443 ON public.accounts_user_user_permissions USING btree (permission_id);


--
-- Name: accounts_user_user_permissions_user_id_e4f0a161; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_user_permissions_user_id_e4f0a161 ON public.accounts_user_user_permissions USING btree (user_id);


--
-- Name: accounts_user_username_6088629e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_username_6088629e_like ON public.accounts_user USING btree (username varchar_pattern_ops);


--
-- Name: assignments_assignmentsubmissions_assignment_id_af3c79c7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assignments_assignmentsubmissions_assignment_id_af3c79c7 ON public.assignments_assignmentsubmissions USING btree (assignment_id);


--
-- Name: assignments_assignmentsubmissions_updated_by_id_d9063b95; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assignments_assignmentsubmissions_updated_by_id_d9063b95 ON public.assignments_assignmentsubmissions USING btree (updated_by_id);


--
-- Name: assignments_assignmentsubmissions_user_id_9a1be907; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assignments_assignmentsubmissions_user_id_9a1be907 ON public.assignments_assignmentsubmissions USING btree (student_id);


--
-- Name: assignments_assignmets_depatment_id_10ff07d6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assignments_assignmets_depatment_id_10ff07d6 ON public.assignments_assignmets USING btree (depatment_id);


--
-- Name: assignments_assignmets_subject_id_2b58a5cc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assignments_assignmets_subject_id_2b58a5cc ON public.assignments_assignmets USING btree (subject_id);


--
-- Name: assignments_assignmets_user_id_3345cac8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assignments_assignmets_user_id_3345cac8 ON public.assignments_assignmets USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: accounts_department_subjects accounts_department__department_id_2d9356b0_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_department_subjects
    ADD CONSTRAINT accounts_department__department_id_2d9356b0_fk_accounts_ FOREIGN KEY (department_id) REFERENCES public.accounts_department(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_department_subjects accounts_department__subject_id_33ec80cc_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_department_subjects
    ADD CONSTRAINT accounts_department__subject_id_33ec80cc_fk_accounts_ FOREIGN KEY (subject_id) REFERENCES public.accounts_subject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_staffs accounts_staffs_department_id_5b5c6047_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_staffs
    ADD CONSTRAINT accounts_staffs_department_id_5b5c6047_fk_accounts_ FOREIGN KEY (department_id) REFERENCES public.accounts_department(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_staffs accounts_staffs_user_id_d5830f92_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_staffs
    ADD CONSTRAINT accounts_staffs_user_id_d5830f92_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_students accounts_students_department_id_ae0128dd_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_students
    ADD CONSTRAINT accounts_students_department_id_ae0128dd_fk_accounts_ FOREIGN KEY (department_id) REFERENCES public.accounts_department(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_students accounts_students_user_id_1b5d0b70_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_students
    ADD CONSTRAINT accounts_students_user_id_1b5d0b70_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_groups accounts_user_groups_group_id_bd11a704_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_group_id_bd11a704_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_groups accounts_user_groups_user_id_52b62117_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_52b62117_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_permission_id_113bb443_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_permission_id_113bb443_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_user_id_e4f0a161_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_user_id_e4f0a161_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assignments_assignmentsubmissions assignments_assignme_assignment_id_af3c79c7_fk_assignmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments_assignmentsubmissions
    ADD CONSTRAINT assignments_assignme_assignment_id_af3c79c7_fk_assignmen FOREIGN KEY (assignment_id) REFERENCES public.assignments_assignmets(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assignments_assignmets assignments_assignme_depatment_id_10ff07d6_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments_assignmets
    ADD CONSTRAINT assignments_assignme_depatment_id_10ff07d6_fk_accounts_ FOREIGN KEY (depatment_id) REFERENCES public.accounts_department(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assignments_assignmentsubmissions assignments_assignme_student_id_d76a8531_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments_assignmentsubmissions
    ADD CONSTRAINT assignments_assignme_student_id_d76a8531_fk_accounts_ FOREIGN KEY (student_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assignments_assignmets assignments_assignme_subject_id_2b58a5cc_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments_assignmets
    ADD CONSTRAINT assignments_assignme_subject_id_2b58a5cc_fk_accounts_ FOREIGN KEY (subject_id) REFERENCES public.accounts_subject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assignments_assignmentsubmissions assignments_assignme_updated_by_id_d9063b95_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments_assignmentsubmissions
    ADD CONSTRAINT assignments_assignme_updated_by_id_d9063b95_fk_accounts_ FOREIGN KEY (updated_by_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assignments_assignmets assignments_assignmets_user_id_3345cac8_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments_assignmets
    ADD CONSTRAINT assignments_assignmets_user_id_3345cac8_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

