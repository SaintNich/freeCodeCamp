--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (147, 2018, 'Final', 668, 669, 4, 2);
INSERT INTO public.games VALUES (148, 2018, 'Third Place', 670, 671, 2, 0);
INSERT INTO public.games VALUES (149, 2018, 'Semi-Final', 669, 671, 2, 1);
INSERT INTO public.games VALUES (150, 2018, 'Semi-Final', 668, 670, 1, 0);
INSERT INTO public.games VALUES (151, 2018, 'Quarter-Final', 669, 672, 3, 2);
INSERT INTO public.games VALUES (152, 2018, 'Quarter-Final', 671, 673, 2, 0);
INSERT INTO public.games VALUES (153, 2018, 'Quarter-Final', 670, 674, 2, 1);
INSERT INTO public.games VALUES (154, 2018, 'Quarter-Final', 668, 675, 2, 0);
INSERT INTO public.games VALUES (155, 2018, 'Eighth-Final', 671, 676, 2, 1);
INSERT INTO public.games VALUES (156, 2018, 'Eighth-Final', 673, 677, 1, 0);
INSERT INTO public.games VALUES (157, 2018, 'Eighth-Final', 670, 678, 3, 2);
INSERT INTO public.games VALUES (158, 2018, 'Eighth-Final', 674, 679, 2, 0);
INSERT INTO public.games VALUES (159, 2018, 'Eighth-Final', 669, 680, 2, 1);
INSERT INTO public.games VALUES (160, 2018, 'Eighth-Final', 672, 681, 2, 1);
INSERT INTO public.games VALUES (161, 2018, 'Eighth-Final', 675, 682, 2, 1);
INSERT INTO public.games VALUES (162, 2018, 'Eighth-Final', 668, 683, 4, 3);
INSERT INTO public.games VALUES (163, 2014, 'Final', 684, 683, 1, 0);
INSERT INTO public.games VALUES (164, 2014, 'Third Place', 685, 674, 3, 0);
INSERT INTO public.games VALUES (165, 2014, 'Semi-Final', 683, 685, 1, 0);
INSERT INTO public.games VALUES (166, 2014, 'Semi-Final', 684, 674, 7, 1);
INSERT INTO public.games VALUES (167, 2014, 'Quarter-Final', 685, 686, 1, 0);
INSERT INTO public.games VALUES (168, 2014, 'Quarter-Final', 683, 670, 1, 0);
INSERT INTO public.games VALUES (169, 2014, 'Quarter-Final', 674, 676, 2, 1);
INSERT INTO public.games VALUES (170, 2014, 'Quarter-Final', 684, 668, 1, 0);
INSERT INTO public.games VALUES (171, 2014, 'Eighth-Final', 674, 687, 2, 1);
INSERT INTO public.games VALUES (172, 2014, 'Eighth-Final', 676, 675, 2, 0);
INSERT INTO public.games VALUES (173, 2014, 'Eighth-Final', 668, 688, 2, 0);
INSERT INTO public.games VALUES (174, 2014, 'Eighth-Final', 684, 689, 2, 1);
INSERT INTO public.games VALUES (175, 2014, 'Eighth-Final', 685, 679, 2, 1);
INSERT INTO public.games VALUES (176, 2014, 'Eighth-Final', 686, 690, 2, 1);
INSERT INTO public.games VALUES (177, 2014, 'Eighth-Final', 683, 677, 1, 0);
INSERT INTO public.games VALUES (178, 2014, 'Eighth-Final', 670, 691, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (668, 'France');
INSERT INTO public.teams VALUES (669, 'Croatia');
INSERT INTO public.teams VALUES (670, 'Belgium');
INSERT INTO public.teams VALUES (671, 'England');
INSERT INTO public.teams VALUES (672, 'Russia');
INSERT INTO public.teams VALUES (673, 'Sweden');
INSERT INTO public.teams VALUES (674, 'Brazil');
INSERT INTO public.teams VALUES (675, 'Uruguay');
INSERT INTO public.teams VALUES (676, 'Colombia');
INSERT INTO public.teams VALUES (677, 'Switzerland');
INSERT INTO public.teams VALUES (678, 'Japan');
INSERT INTO public.teams VALUES (679, 'Mexico');
INSERT INTO public.teams VALUES (680, 'Denmark');
INSERT INTO public.teams VALUES (681, 'Spain');
INSERT INTO public.teams VALUES (682, 'Portugal');
INSERT INTO public.teams VALUES (683, 'Argentina');
INSERT INTO public.teams VALUES (684, 'Germany');
INSERT INTO public.teams VALUES (685, 'Netherlands');
INSERT INTO public.teams VALUES (686, 'Costa Rica');
INSERT INTO public.teams VALUES (687, 'Chile');
INSERT INTO public.teams VALUES (688, 'Nigeria');
INSERT INTO public.teams VALUES (689, 'Algeria');
INSERT INTO public.teams VALUES (690, 'Greece');
INSERT INTO public.teams VALUES (691, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 178, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 691, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

