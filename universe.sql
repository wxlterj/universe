--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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
    age_in_millions_of_years integer,
    movement_speed numeric(4,1),
    description text NOT NULL,
    is_visible_from_earth boolean NOT NULL,
    diameter integer,
    has_life boolean
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
    name character varying(30) NOT NULL,
    description text NOT NULL,
    diameter_in_kilometers integer,
    distance_from_earth integer,
    weight_in_earth_weight numeric(4,1),
    has_been_visiting boolean NOT NULL,
    has_atmosphere boolean NOT NULL,
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth integer,
    rotation_speed_in_meters_per_seconds numeric(4,1),
    has_life boolean NOT NULL,
    is_in_milky_way boolean NOT NULL,
    star_id integer NOT NULL,
    planet_type_id integer NOT NULL
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    description text NOT NULL,
    distance_from_earth integer,
    mass_in_solar_mass numeric(4,1),
    is_visible_form_earth boolean NOT NULL,
    emit_ultraviolet_radiation boolean NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13, 600.1, 'The Milky Way is a barred spiral galaxy that houses our solar system, with spiral arms swirling around a central bulge, comprised of hundreds of billions of stars', true, 100000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 12, 150.3, 'Andromeda, or M31, a vast spiral galaxy, surpasses the Milky Way in size. It lies 2.537 million light-years distant, containing billions of stars, visible to the naked eye in dark skies', true, 220000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 50, 24.6, 'Spiral galaxy in the Local Group, 3 million light-years away, smaller than Andromeda and Milky Way, hosting star-forming regions', true, 60000, false);
INSERT INTO public.galaxy VALUES (4, 'The Whirlpool', 500, 140.6, 'Is a grand-design spiral galaxy located 23 million light-years away. It exhibits a prominent spiral structure and interacts gravitationally with its companion, NGC 5195', true, 80000, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 10, 999.6, 'Is a spiral galaxy located approximately 28 million light-years away. Its characterized by its prominent nucleus and extensive central bulge, resembling the shape of a wide-brimmed hat', true, 50000, false);
INSERT INTO public.galaxy VALUES (6, 'The Large Magellanic Cloud', 2, 378.6, 'Is a satellite irregular galaxy to the Milky Way, situated about 160,000 light-years away. It showcases active star-forming regions and nebulae, visible in the southern hemispheres skies', true, 14000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earths natural satellite', 3474, 384000, 0.1, true, false, 3);
INSERT INTO public.moon VALUES (2, 'Titan', 'Thick atmosphere, lakes of liquid methane', 5151, 12720000, 1.4, true, true, 6);
INSERT INTO public.moon VALUES (3, 'Europa', 'Icy surface with potential subsurface ocean', 3121, 62830000, 0.4, false, true, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Largest moon, contains its magnetic field', 5268, 10700000, 1.4, true, true, 5);
INSERT INTO public.moon VALUES (5, 'Enceladus', 'Geysers of water vapor and ice particles', 504, 12720000, 0.1, true, true, 6);
INSERT INTO public.moon VALUES (6, 'Callisto', 'Heavily cratered, ancient surface', 4821, 188200000, 1.8, true, false, 5);
INSERT INTO public.moon VALUES (7, 'Io', 'Volcanically active surface', 3643, 62830000, 0.8, true, true, 5);
INSERT INTO public.moon VALUES (8, 'Triton', 'Cold surface with geysers', 2706, 4354800, 0.2, false, true, 8);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Heavily cratered, thin atmosphere', 1527, 1527600, 0.1, false, true, 6);
INSERT INTO public.moon VALUES (10, 'Dione', 'Fractured surface, potential subsurface ocean', 1123, 12720000, 0.1, false, true, 6);
INSERT INTO public.moon VALUES (11, 'Tethys', 'Heavily cratered, ice-rich surface', 1060, 12720000, 0.1, false, true, 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', 'Dark and bright regions', 1470, 35610000, 0.1, false, false, 6);
INSERT INTO public.moon VALUES (13, 'Ariel', 'Young surface, complex geology', 1158, 12720000, 0.1, false, true, 7);
INSERT INTO public.moon VALUES (14, 'Umbriel', 'Dark surface, ancient cratered terrain', 1169, 1272000, 0.1, false, true, 7);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Varied terrains, fractured surface', 471, 12720000, 0.1, false, true, 7);
INSERT INTO public.moon VALUES (16, 'Hyperion', 'Irregular shape, sponge-like appearance', 270, 1568000, 0.1, true, false, 6);
INSERT INTO public.moon VALUES (17, 'Oberon', 'Dark surface, heavily cratered', 1523, 12720000, 0.1, false, true, 7);
INSERT INTO public.moon VALUES (18, 'Phobos', 'Irregularly shaped, orbits Mars closely', 22, 54600000, 0.1, true, false, 4);
INSERT INTO public.moon VALUES (19, 'Deimos', 'Irregularly shaped, orbits Mars distantly', 12, 76900000, 0.1, true, false, 4);
INSERT INTO public.moon VALUES (20, 'Amalthea', 'Irregularly shaped, reddish coloration', 167, 181366, 0.1, false, false, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Rocky, closest to the Sun', 10, 77, 10.9, false, true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Hot, thick atmosphere', 4600, 261, 6.5, false, true, 1, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Supports life, blue planet', 4600, 0, 46.0, true, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Cold, has polar ice caps', 4600, 227, 241.0, false, true, 1, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest, gas giant with storms', 4600, 778, 12.6, false, true, 1, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Known for its rings', 4600, 1, 9.8, false, true, 1, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Tilted axis, ice giant', 4600, 2, 2.5, false, true, 1, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Deep blue furthest gas giant', 4600, 4, 2.6, false, true, 1, 2);
INSERT INTO public.planet VALUES (9, 'Exo-Planet 1', 'Rocky, potential for oceans', 500, 10000, 100.0, false, false, 3, 2);
INSERT INTO public.planet VALUES (10, 'Exo-Planet 2', 'Gas giant with multiple moons', 1000, 300000, 50.0, false, false, 4, 2);
INSERT INTO public.planet VALUES (11, 'Exo-Planet 3', 'Ice-covered, possible geysers', 800, 15000, 30.0, false, true, 5, 2);
INSERT INTO public.planet VALUES (12, 'Exo-Planet 4', 'Desert-like, extreme heat', 800, 1500, 300.0, false, false, 3, 1);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Rocky', 'Solid-surfaced planets akin to Earth. Examples include Mercury, Venus, Earth, and Mars');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Composed mostly of light gases like hydrogen and helium. Examples are Jupiter, Saturn, Uranus, and Neptune');
INSERT INTO public.planet_type VALUES (3, 'Dwarf', 'Smaller celestial bodies not fully clearing their orbits. Pluto is a known dwarf planet');
INSERT INTO public.planet_type VALUES (4, 'Exoplanet', 'Planets orbiting stars outside our solar system. They vary in size, composition, and orbit characteristics');
INSERT INTO public.planet_type VALUES (5, 'Super-Earth', 'Rocky planets larger than Earth but smaller than gas giants. They exhibit diverse compositions');
INSERT INTO public.planet_type VALUES (6, 'Terrestrial', ' A broader classification encompassing Earth-like rocky planets and other solid-surfaced bodies');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4, 'G-type star, Earths life source', 26000, 1.2, true, true, 1);
INSERT INTO public.star VALUES (3, 'SN 1885A', 10, 'Supernova remnants in Andromeda, visible in 1885', 2500000, NULL, false, false, 2);
INSERT INTO public.star VALUES (4, 'HV 888', 10, 'Bright blue star in M33, visible with a telescope.', 3000000, NULL, false, true, 3);
INSERT INTO public.star VALUES (5, 'NGC 5195', 500, 'Small interacting galaxy with M51, visible in collision', 23000000, NULL, false, false, 4);
INSERT INTO public.star VALUES (6, 'NGC 4594', 1000, 'Elliptical galaxy, has a halo of globular star clusters', 28000000, NULL, false, false, 5);
INSERT INTO public.star VALUES (7, 'R136a1', 2000000, 'Luminous supergiant in LMC, intense source of UV rays', 160000, 310.0, false, true, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_type name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


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
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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

