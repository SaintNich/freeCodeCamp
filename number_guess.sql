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

DROP DATABASE number_game;
--
-- Name: number_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_game OWNER TO freecodecamp;

\connect number_game

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
-- Name: number_game; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number_game (
    username character varying(22),
    games_played integer,
    game_id integer NOT NULL
);


ALTER TABLE public.number_game OWNER TO freecodecamp;

--
-- Name: number_game_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.number_game_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.number_game_game_id_seq OWNER TO freecodecamp;

--
-- Name: number_game_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.number_game_game_id_seq OWNED BY public.number_game.game_id;


--
-- Name: number_game game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_game ALTER COLUMN game_id SET DEFAULT nextval('public.number_game_game_id_seq'::regclass);


--
-- Data for Name: number_game; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_game VALUES ('josh', 1, 79);
INSERT INTO public.number_game VALUES ('josh', NULL, 80);
INSERT INTO public.number_game VALUES ('josh', NULL, 81);
INSERT INTO public.number_game VALUES ('josh', 9, 82);
INSERT INTO public.number_game VALUES ('josh', 14, 83);
INSERT INTO public.number_game VALUES ('george', 11, 84);
INSERT INTO public.number_game VALUES ('george', 7, 85);
INSERT INTO public.number_game VALUES ('george', 7, 86);
INSERT INTO public.number_game VALUES ('user_1697511173124', 932, 87);
INSERT INTO public.number_game VALUES ('user_1697511173124', 126, 88);
INSERT INTO public.number_game VALUES ('user_1697511173123', 278, 89);
INSERT INTO public.number_game VALUES ('user_1697511173123', 693, 90);
INSERT INTO public.number_game VALUES ('user_1697511173124', 749, 91);
INSERT INTO public.number_game VALUES ('user_1697511173124', 990, 92);
INSERT INTO public.number_game VALUES ('user_1697511173124', 846, 93);
INSERT INTO public.number_game VALUES ('user_1697511219925', 680, 94);
INSERT INTO public.number_game VALUES ('user_1697511219925', 594, 95);
INSERT INTO public.number_game VALUES ('user_1697511219924', 235, 96);
INSERT INTO public.number_game VALUES ('user_1697511219924', 179, 97);
INSERT INTO public.number_game VALUES ('user_1697511219925', 460, 98);
INSERT INTO public.number_game VALUES ('user_1697511219925', 80, 99);
INSERT INTO public.number_game VALUES ('user_1697511219925', 52, 100);


--
-- Name: number_game_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.number_game_game_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

