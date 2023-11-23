--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.4

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

DROP DATABASE final_project;
--
-- Name: final_project; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE final_project WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE final_project OWNER TO postgres;

\connect final_project

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
-- Name: competitors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.competitors (
    research_development_spent numeric,
    administration numeric,
    marketing_spent numeric,
    state_usa character varying,
    profit numeric
);


ALTER TABLE public.competitors OWNER TO postgres;

--
-- Name: corruption_convictions_per_capita; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.corruption_convictions_per_capita (
    state_usa character varying,
    convictions_per_capita numeric
);


ALTER TABLE public.corruption_convictions_per_capita OWNER TO postgres;

--
-- Name: health_spending; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.health_spending (
    state_usa character varying,
    avg_spending numeric,
    min_spending numeric,
    max_spending numeric
);


ALTER TABLE public.health_spending OWNER TO postgres;

--
-- Name: population; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.population (
    state_usa character varying,
    estimate numeric
);


ALTER TABLE public.population OWNER TO postgres;

--
-- Name: property_prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.property_prices (
    state_usa character varying,
    avg_price numeric,
    min_price numeric,
    max_price numeric
);


ALTER TABLE public.property_prices OWNER TO postgres;

--
-- Name: state_income; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.state_income (
    state_usa character varying,
    average_income numeric,
    minimum_income numeric,
    maximum_income numeric
);


ALTER TABLE public.state_income OWNER TO postgres;

--
-- Data for Name: competitors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.competitors (research_development_spent, administration, marketing_spent, state_usa, profit) FROM stdin;
\.
COPY public.competitors (research_development_spent, administration, marketing_spent, state_usa, profit) FROM '$$PATH$$/3588.dat';

--
-- Data for Name: corruption_convictions_per_capita; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.corruption_convictions_per_capita (state_usa, convictions_per_capita) FROM stdin;
\.
COPY public.corruption_convictions_per_capita (state_usa, convictions_per_capita) FROM '$$PATH$$/3591.dat';

--
-- Data for Name: health_spending; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.health_spending (state_usa, avg_spending, min_spending, max_spending) FROM stdin;
\.
COPY public.health_spending (state_usa, avg_spending, min_spending, max_spending) FROM '$$PATH$$/3589.dat';

--
-- Data for Name: population; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.population (state_usa, estimate) FROM stdin;
\.
COPY public.population (state_usa, estimate) FROM '$$PATH$$/3593.dat';

--
-- Data for Name: property_prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.property_prices (state_usa, avg_price, min_price, max_price) FROM stdin;
\.
COPY public.property_prices (state_usa, avg_price, min_price, max_price) FROM '$$PATH$$/3590.dat';

--
-- Data for Name: state_income; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.state_income (state_usa, average_income, minimum_income, maximum_income) FROM stdin;
\.
COPY public.state_income (state_usa, average_income, minimum_income, maximum_income) FROM '$$PATH$$/3592.dat';

--
-- PostgreSQL database dump complete
--

