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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    spiral boolean,
    elliptical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    diameter numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter numeric NOT NULL,
    num_moons integer NOT NULL,
    human_population integer NOT NULL,
    description text,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    num_planets integer NOT NULL,
    description text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.station (
    station_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_founded integer NOT NULL
);


ALTER TABLE public.station OWNER TO freecodecamp;

--
-- Name: station_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.station_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.station_station_id_seq OWNER TO freecodecamp;

--
-- Name: station_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.station_station_id_seq OWNED BY public.station.station_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: station station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.station ALTER COLUMN station_id SET DEFAULT nextval('public.station_station_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our galaxy :)', true, false);
INSERT INTO public.galaxy VALUES (2, 'Cygnus A', 'A radio galaxy and one of the strongest radio sources in the sky', false, true);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'One of the largest and most massive galaxies in the local universe', false, true);
INSERT INTO public.galaxy VALUES (4, 'Maffei 1', 'A massive elliptical galaxy that has a boxy shaped and is made of mainly old metal-rich stars', false, true);
INSERT INTO public.galaxy VALUES (5, 'Andromeda', 'The nearest major galaxy to the Milky way', true, false);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way. It is one of two dwarf galaxies that comprise the Magellanic Clouds', true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Our moon :)', 3, 2159.1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Completes an orbit in 7 hours and 39 minutes', 4, 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Completes an orbit in 30.3 hours', 4, 12.4);
INSERT INTO public.moon VALUES (4, 'Io', 'The most volcanically active body in our solar sytem', 5, 2263.8);
INSERT INTO public.moon VALUES (5, 'Europa', 'One of the best environments to look for life outsidde Earth', 5, 1939.7);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Has a magnetosphere and is the bread basket of the outer planets', 5, 3273.5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'The most heavily cratered object in our solar system.', 5, 2995.4);
INSERT INTO public.moon VALUES (8, 'tbd', 'tbd', 5, -1);
INSERT INTO public.moon VALUES (9, 'tbd2', 'tbd', 5, -1);
INSERT INTO public.moon VALUES (10, 'tbd3', 'tbd', 5, -1);
INSERT INTO public.moon VALUES (11, 'tbd4', 'tbd', 5, -1);
INSERT INTO public.moon VALUES (12, 'tbd5', 'tbd', 5, -1);
INSERT INTO public.moon VALUES (13, 'tbd6', 'tbd', 5, -1);
INSERT INTO public.moon VALUES (14, 'tbd7', 'tbd', 5, -1);
INSERT INTO public.moon VALUES (15, 'tbd8', 'tbd', 5, -1);
INSERT INTO public.moon VALUES (16, 'tbd9', 'tbd', 5, -1);
INSERT INTO public.moon VALUES (17, 'tbd10', 'tbd', 5, -1);
INSERT INTO public.moon VALUES (18, 'tbd11', 'tbd', 5, -1);
INSERT INTO public.moon VALUES (19, 'tbd12', 'tbd', 5, -1);
INSERT INTO public.moon VALUES (20, 'tbd13', 'tbd', 5, -1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4880, 0, 0, 'Closest planet to the sun and smallest planet in the Solar System.', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12103.6, 0, 0, 'Second closest planet to the sun and third brightest object in the sky after the sun and moon.', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12742, 1, 700000000, 'Thrid closest planet to the sun and contains life.', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6779, 2, 0, 'Mars closest planet to the sun and is red due to iron oxide in he soil.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 142984, 95, 0, 'Fifth closest planet to the sun and the largest planet in the solar system. Its mass is more than 2.5x all other planets combined.', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 25000, 146, 0, 'Sixth closest planet to the sun and has a pale yellow hue due to the amonia crystals in the upper atmosphere.', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 31518, 27, 0, 'Seventh closest planet to the sun and an gaseous cyan ice giant.', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 30599, 14, 0, 'Eighth closest planet to the sun and a near twin to Uranus.', 1);
INSERT INTO public.planet VALUES (9, 'Galileoe', -1, -1, 0, 'Aka 55 Cancri B. It is an example of a hot Jupiter', 5);
INSERT INTO public.planet VALUES (10, 'Brahe', -1, -1, 0, 'Aka 55 Cancri C. Has the mass of roughly half of Saturn', 5);
INSERT INTO public.planet VALUES (11, 'Lipperhey', -1, -1, 0, 'Aka 55 Cancri D. Located a similar distance from its star as Jupiter to Sol', 5);
INSERT INTO public.planet VALUES (12, 'Janssen', 14845, -1, 0, 'Aka 55 Cancri E. The first super Earth discover around a main sequence star', 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 8, 'A nearly perfect ball of plasma that sustains life on Earth', 1);
INSERT INTO public.star VALUES (3, 'UY Scuti', -1, 'Largest star in the milky way', 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 2, 'Closest star to Sol', 1);
INSERT INTO public.star VALUES (5, '55 Cancri', 5, 'A binary star system in the Cancer constellation', 1);
INSERT INTO public.star VALUES (6, 'Kepler-444', 5, 'A triple star system estimated to be 11.2 billion years old, 80% the age of the universe. ', 1);
INSERT INTO public.star VALUES (7, 'K2-3', 3, 'A red dwarf star with 3 exoplanets. ', 1);


--
-- Data for Name: station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.station VALUES (1, 'ISS', 1998);
INSERT INTO public.station VALUES (2, 'Tiangong Space Station', 2021);
INSERT INTO public.station VALUES (3, 'Ceres Station', 2223);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: station_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.station_station_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: station name_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.station
    ADD CONSTRAINT name_unq UNIQUE (name);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: station station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.station
    ADD CONSTRAINT station_pkey PRIMARY KEY (station_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

