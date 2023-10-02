--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-02 14:04:43

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
-- TOC entry 4857 (class 1262 OID 17362)
-- Name: gestor_equipos; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE gestor_equipos WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';


ALTER DATABASE gestor_equipos OWNER TO postgres;

\connect gestor_equipos

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
-- TOC entry 220 (class 1259 OID 17382)
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(255),
    position_id integer,
    team_id integer,
    age integer,
    avegare_points real,
    tshirt_number integer
);


ALTER TABLE public.players OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17381)
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.players_id_seq OWNER TO postgres;

--
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 219
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;


--
-- TOC entry 216 (class 1259 OID 17364)
-- Name: positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.positions (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255)
);


ALTER TABLE public.positions OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17363)
-- Name: positions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.positions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.positions_id_seq OWNER TO postgres;

--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 215
-- Name: positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.positions_id_seq OWNED BY public.positions.id;


--
-- TOC entry 218 (class 1259 OID 17373)
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255)
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17372)
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teams_id_seq OWNER TO postgres;

--
-- TOC entry 4860 (class 0 OID 0)
-- Dependencies: 217
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- TOC entry 4700 (class 2604 OID 17385)
-- Name: players id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- TOC entry 4698 (class 2604 OID 17367)
-- Name: positions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions ALTER COLUMN id SET DEFAULT nextval('public.positions_id_seq'::regclass);


--
-- TOC entry 4699 (class 2604 OID 17376)
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- TOC entry 4706 (class 2606 OID 17387)
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- TOC entry 4702 (class 2606 OID 17371)
-- Name: positions positions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);


--
-- TOC entry 4704 (class 2606 OID 17380)
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- TOC entry 4707 (class 2606 OID 17388)
-- Name: players players_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_position_id_fkey FOREIGN KEY (position_id) REFERENCES public.positions(id);


--
-- TOC entry 4708 (class 2606 OID 17393)
-- Name: players players_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id);


-- Completed on 2023-10-02 14:04:43

--
-- PostgreSQL database dump complete
--

INSERT INTO public.positions (id, name, description) VALUES (1, 'Alero', 'Jugador de posición Alero') ON CONFLICT DO NOTHING;
INSERT INTO public.positions (id, name, description) VALUES (2, 'Base', 'Jugador de posición Base') ON CONFLICT DO NOTHING;
INSERT INTO public.positions (id, name, description) VALUES (3, 'Pívot', 'Jugador de posición Pívot') ON CONFLICT DO NOTHING;
INSERT INTO public.positions (id, name, description) VALUES (4, 'Escolta', 'Jugador de posición Escolta') ON CONFLICT DO NOTHING;
INSERT INTO public.positions (id, name, description) VALUES (5, 'Ala-Pívot', 'Jugador de posición Ala-Pívot') ON CONFLICT DO NOTHING;


INSERT INTO public.teams (id, name, description) VALUES (6, 'Cleveland Cavaliers', 'Equipo de la NBA de Cleveland') ON CONFLICT DO NOTHING;
INSERT INTO public.teams (id, name, description) VALUES (7, 'Indiana Pacers', 'Equipo de la NBA de Indiana') ON CONFLICT DO NOTHING;
INSERT INTO public.teams (id, name, description) VALUES (8, 'New York Knicks', 'Equipo de la NBA de New York') ON CONFLICT DO NOTHING;
INSERT INTO public.teams (id, name, description) VALUES (9, 'Toronto Raptors', 'Equipo de la NBA de Toronto') ON CONFLICT DO NOTHING;
INSERT INTO public.teams (id, name, description) VALUES (10, 'Miami Heat', 'Equipo de la NBA de Miami') ON CONFLICT DO NOTHING;
INSERT INTO public.teams (id, name, description) VALUES (11, 'Los Angeles Lakers', 'Equipo de la NBA de Los Angeles') ON CONFLICT DO NOTHING;
INSERT INTO public.teams (id, name, description) VALUES (12, 'Oklahoma City Thunder', 'Equipo de la NBA de Oklahoma City') ON CONFLICT DO NOTHING;
INSERT INTO public.teams (id, name, description) VALUES (13, 'San Antonio Spurs', 'Equipo de la NBA de San Antonio') ON CONFLICT DO NOTHING;
INSERT INTO public.teams (id, name, description) VALUES (14, 'Chicago Bulls', 'Equipo de la NBA de Chicago') ON CONFLICT DO NOTHING;
INSERT INTO public.teams (id, name, description) VALUES (15, 'Milwaukee Bucks', 'Equipo de la NBA de Milwaukee') ON CONFLICT DO NOTHING;
INSERT INTO public.teams (id, name, description) VALUES (16, 'Philadelphia 76ers', 'Equipo de la NBA de Philadelphia') ON CONFLICT DO NOTHING;
INSERT INTO public.teams (id, name, description) VALUES (17, 'New Orleans Pelicans', 'Equipo de la NBA de New Orleans') ON CONFLICT DO NOTHING;
INSERT INTO public.teams (id, name, description) VALUES (18, 'Houston Rockets', 'Equipo de la NBA de Houston') ON CONFLICT DO NOTHING;
INSERT INTO public.teams (id, name, description) VALUES (19, 'Boston Celtics', 'Equipo de la NBA de Boston') ON CONFLICT DO NOTHING;
INSERT INTO public.teams (id, name, description) VALUES (20, 'Atlanta Hawks', 'Equipo de la NBA de Atlanta') ON CONFLICT DO NOTHING;
INSERT INTO public.teams (id, name, description) VALUES (21, 'Dallas Mavericks', 'Equipo de la NBA de Dallas') ON CONFLICT DO NOTHING;
INSERT INTO public.teams (id, name, description) VALUES (22, 'Washington Wizards', 'Equipo de la NBA de Washington') ON CONFLICT DO NOTHING;
INSERT INTO public.teams (id, name, description) VALUES (23, 'Denver Nuggets', 'Equipo de la NBA de Denver') ON CONFLICT DO NOTHING;
INSERT INTO public.teams (id, name, description) VALUES (24, 'Brooklyn Nets', 'Equipo de la NBA de Brooklyn') ON CONFLICT DO NOTHING;


INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (71, 'LeBron James', 1, 6, 36, 27.5, 23) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (72, 'Paul George', 1, 7, 30, 23.1, 13) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (73, 'Carmelo Anthony', 1, 8, 36, 24.5, 7) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (74, 'Kyle Lowry', 2, 9, 34, 21.8, 7) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (75, 'Dwyane Wade', 4, 10, 39, 20.4, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (76, 'Kobe Bryant', 4, 11, 42, 17.6, 24) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (77, 'Russell Westbrook', 2, 12, 32, 27.4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (78, 'Kevin Durant', 1, 12, 32, 29, 35) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (79, 'Kawhi Leonard', 1, 13, 29, 18.4, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (80, 'Jimmy Butler', 1, 14, 31, 21.8, 21) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (81, 'Giannis Antetokounmpo', 1, 15, 26, 20.1, 34) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (82, 'DeMar DeRozan', 4, 9, 31, 20, 10) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (83, 'Kyrie Irving', 2, 6, 28, 22.7, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (84, 'Joel Embiid', 5, 16, 27, 24.3, 21) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (85, 'DeMarcus Cousins', 5, 17, 30, 25.9, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (86, 'Paul George', 1, 12, 31, 22, 13) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (87, 'James Harden', 4, 18, 31, 29.6, 13) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (88, 'Pascal Siakam', 5, 9, 27, 17.2, 43) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (89, 'Kemba Walker', 2, 19, 30, 20.6, 8) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (90, 'Trae Young', 2, 20, 22, 24.1, 11) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (91, 'LeBron James', 1, 21, 36, 26.7, 23) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (92, 'Anthony Davis', 5, 21, 28, 24.3, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (93, 'Luka Dončić', 2, 22, 22, 24.7, 77) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (94, 'Bradley Beal', 4, 22, 27, 25, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.players (id, name, position_id, team_id, age, avegare_points, tshirt_number) VALUES (95, 'Nikola Jokić', 5, 23, 26, 20, 15) ON CONFLICT DO NOTHING;


--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 219
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.players_id_seq', 95, true);


--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 215
-- Name: positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.positions_id_seq', 5, true);


--
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 217
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_id_seq', 24, true);


-- Completed on 2023-10-02 14:02:36

--
-- PostgreSQL database dump complete
--


