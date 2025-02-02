--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id uuid NOT NULL,
    name character varying NOT NULL,
    required_profile uuid NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manager (
    id uuid NOT NULL,
    fullname character varying NOT NULL,
    profile uuid NOT NULL,
    max_size numeric NOT NULL,
    clients uuid[] DEFAULT '{}'::uuid[]
);


ALTER TABLE public.manager OWNER TO postgres;

--
-- Name: profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile (
    id uuid NOT NULL,
    value character varying
);


ALTER TABLE public.profile OWNER TO postgres;

--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, name, required_profile) FROM stdin;
\.


--
-- Data for Name: manager; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.manager (id, fullname, profile, max_size, clients) FROM stdin;
\.


--
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile (id, value) FROM stdin;
28697fad-523c-4eaf-a8d3-fb3b7aae086f	╨Ф╨╛╨║╤Г╨╝╨╡╨╜╤В╨░╤Ж╨╕╤П
a287f7cd-159b-4743-9b49-38e70b42cf11	╨Ъ╨╛╨╜╤Б╤Г╨╗╤М╤В╨░╤Ж╨╕╤П
\.


--
-- Name: client clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: manager managers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manager
    ADD CONSTRAINT managers_pkey PRIMARY KEY (id);


--
-- Name: profile profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: client profile; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT profile FOREIGN KEY (required_profile) REFERENCES public.profile(id);


--
-- Name: manager profile; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manager
    ADD CONSTRAINT profile FOREIGN KEY (profile) REFERENCES public.profile(id);


--
-- PostgreSQL database dump complete
--

