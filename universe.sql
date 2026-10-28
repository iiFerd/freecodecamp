--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: element; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.element (
    element_id integer NOT NULL,
    name character varying(50) NOT NULL,
    atomic_number integer NOT NULL,
    atomic_mass numeric(4,1),
    family integer
);


ALTER TABLE public.element OWNER TO freecodecamp;

--
-- Name: elements_element_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.elements_element_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elements_element_id_seq OWNER TO freecodecamp;

--
-- Name: elements_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.elements_element_id_seq OWNED BY public.element.element_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50),
    description text NOT NULL,
    size_in_ly integer,
    apparent_magnitude numeric(5,5),
    star_number integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    description text,
    temperature_in_k integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    temperature_in_k integer,
    gravity numeric(4,1),
    description text,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    gravity numeric(4,1),
    name character varying(50) NOT NULL,
    description text NOT NULL,
    galaxy_id integer,
    velocity integer,
    has_solar_system boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: element element_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element ALTER COLUMN element_id SET DEFAULT nextval('public.elements_element_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: element; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.element VALUES (1, 'carbon', 6, 12.0, 1);
INSERT INTO public.element VALUES (2, 'Hydrogen', 1, 1.0, 1);
INSERT INTO public.element VALUES (3, 'Oxygen', 8, 16.0, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Milky Way or Milky Way Galaxy, or simply the Galaxy, is the galaxy that includes the Solar System', 87400, NULL, 4000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The Andromeda Galaxy is a barred spiral galaxy and is the nearest major galaxy to the Milky Way.', 152000, NULL, 4000);
INSERT INTO public.galaxy VALUES (3, 'Alcyoneous', 'Alcyoneus is a low-excitation, Fanaroff–Riley class II radio galaxy located 3.5 billion light-years (1.1 gigaparsecs) from Earth', 242700, NULL, 4000);
INSERT INTO public.galaxy VALUES (4, 'Backward', 'NGC 4622, also known as the Backward Galaxy, is a face-on unbarred spiral galaxy with a very prominent ring structure located in the constellation Centaurus.', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Bear Paw', 'NGC 2537, also known as the Bear Paw Galaxy, Bear Claw Galaxy, Arp 6, or Mrk 86', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'is a relatively isolated[7] spiral galaxy 17 million light-years away in the constellation of Coma Berenices.', 53800, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Europa', 5, 'Jupiter II is the smallest and least massive of Jupiter', 102);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'the innermost and larger of the two natural satellites of Mars', 233);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'the smaller and outer of the two natural satellites of Mars', 233);
INSERT INTO public.moon VALUES (4, 'Metis', 5, 'also known as Jupiter XVI, is the innermost known moon of Jupiter', 123);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, 'Ganymede is a natural satellite of Jupiter and is the largest and most massive moon in the Solar System', 110);
INSERT INTO public.moon VALUES (6, 'Callisto', 5, 'is the second-largest moon of Jupiter', 134);
INSERT INTO public.moon VALUES (7, 'Adrastea', 5, 'also known as Jupiter XV', 122);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 'is a moon of Jupiter', 120);
INSERT INTO public.moon VALUES (9, 'Thebe', 5, 'It was discovered by Stephen P. Synnott', 124);
INSERT INTO public.moon VALUES (10, 'Io', 5, 'is the innermost and second smallest of the four Galilean moons of Jupiter', 110);
INSERT INTO public.moon VALUES (11, 'Themisto', 5, 'is the innermost and one of the medium-sized irregular satellites of Jupiter', NULL);
INSERT INTO public.moon VALUES (12, 'Titan', 6, 'Titan is the largest moon of Saturn', NULL);
INSERT INTO public.moon VALUES (13, 'Lapetus', 6, 'moon of Saturn', NULL);
INSERT INTO public.moon VALUES (14, 'Pan', 6, 'Pan is the innermost named moon of Saturn', NULL);
INSERT INTO public.moon VALUES (15, 'Daphnis', 6, 'also known as Saturn XXXV', NULL);
INSERT INTO public.moon VALUES (16, 'Atlas', 6, 'Atlas is an inner satellite of Saturn which was discovered by Richard Terrile in 1980 from Voyager photos', NULL);
INSERT INTO public.moon VALUES (17, 'Prometheus', 6, 'is an inner satellite of Saturn.', NULL);
INSERT INTO public.moon VALUES (18, 'Triton', 7, 'Triton is the largest natural satellite of the planet Neptune.', NULL);
INSERT INTO public.moon VALUES (19, 'Proteus', 7, 'also known as Neptune VIII', NULL);
INSERT INTO public.moon VALUES (20, 'Hippocamp', 7, 'Hippocamp, also designated Neptune XIV', NULL);
INSERT INTO public.moon VALUES (21, 'Galatea', 7, 'also known as Neptune VI', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mercury', 437, 3.7, 'Mercury is the first planet from the Sun and the smallest in the Solar System', false, 8);
INSERT INTO public.planet VALUES (3, 'Venus', 232, 8.9, 'Venus is the second planet from the Sun. ', false, 8);
INSERT INTO public.planet VALUES (4, 'Mars', 209, 3.7, 'Mars is the fourth planet from the Sun.', false, 8);
INSERT INTO public.planet VALUES (5, 'Jupiter', 88, 24.8, 'Jupiter is the fifth planet from the Sun, and the largest in the Solar System.', false, 8);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, 10.4, 'Saturn is the sixth planet from the Sun, and is the second largest planet in the Solar System', false, 8);
INSERT INTO public.planet VALUES (7, 'Uranus', 76, 8.7, 'Uranus is the seventh planet from the Sun.', false, 8);
INSERT INTO public.planet VALUES (8, 'Neptune', 72, 11.3, 'Neptune is the eighth and farthest known planet orbiting the Sun.', false, 8);
INSERT INTO public.planet VALUES (9, 'Pluto', NULL, 0.6, 'Pluto (minor-planet number 134340) is a dwarf planet in the Kuiper belt', false, 8);
INSERT INTO public.planet VALUES (10, 'Haumea', 50, 0.2, 'Haumea (minor-planet number 136108) is a dwarf planet located beyond Neptunes or
bit', false, 8);
INSERT INTO public.planet VALUES (11, 'Quaoar', 44, 0.3, 'Quaoar (minor-planet number 50000) is a ringed dwarf planet in the Kuiper belt', false, 8);
INSERT INTO public.planet VALUES (12, 'Makemake', 30, 0.4, 'is a dwarf planet orbiting the Sun in the Kuiper belt', false, 8);
INSERT INTO public.planet VALUES (13, 'Gonggong', NULL, 0.2, 'is a dwarf planet orbiting the Sun in the Kuiper belt', false, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (8, 27.9, 'Sun', 'The Sun is the star located at the centre of the Solar System.', 1, 251, true);
INSERT INTO public.star VALUES (9, 5.2, 'Proxima Centauri', 'Proxima Centauri is the nearest star to Earth after the Sun.', 1, -22, true);
INSERT INTO public.star VALUES (10, 4.9, 'Barnards star', 'is a small red dwarf star in the constellation of Ophiuchus.', 1, NULL, true);
INSERT INTO public.star VALUES (11, 5.5, 'Wolf 359', 'is a red dwarf star located in the constellation Leo, near the ecliptic.', 1, NULL, NULL);
INSERT INTO public.star VALUES (12, 4.3, 'Sirius', 'is the brightest star in the night sky.', 1, NULL, NULL);
INSERT INTO public.star VALUES (13, 5.2, 'Ross 154', 'is a red dwarf star in the southern zodiac constellation of Sagittarius.', 1, NULL, NULL);
INSERT INTO public.star VALUES (14, 4.8, 'Gliese 887', 'also Lacaille 9352 (Lac 9352), is a red dwarf star in the southern constellation of Piscis Austrinus.', 1, NULL, NULL);
INSERT INTO public.star VALUES (15, NULL, 'DX cranci', 'is a red dwarf star in the northern zodiac constellation of Cancer.', 1, NULL, NULL);


--
-- Name: elements_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.elements_element_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


--
-- Name: element elements_atomic_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT elements_atomic_number_key UNIQUE (atomic_number);


--
-- Name: element elements_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT elements_name_key UNIQUE (name);


--
-- Name: element elements_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT elements_pkey PRIMARY KEY (element_id);


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
-- Name: moon moon_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key1 UNIQUE (name);


--
-- Name: moon moon_name_key2; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key2 UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_belongs_to_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_belongs_to_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_belongs_to_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_belongs_to_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

