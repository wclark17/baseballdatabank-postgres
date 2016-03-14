--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.14
-- Dumped by pg_dump version 9.4.0
-- Started on 2016-03-13 20:01:14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 8 (class 2615 OID 33710)
-- Name: baseballdb; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA baseballdb;


SET search_path = baseballdb, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 193 (class 1259 OID 33575)
-- Name: allstarfull; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE allstarfull (
    playerid character varying(10) NOT NULL,
    yearid integer NOT NULL,
    gamenum integer NOT NULL,
    gameid character varying(12),
    teamid character varying(3),
    lgid character varying(2),
    gp integer,
    startingpos integer
);


--
-- TOC entry 194 (class 1259 OID 33580)
-- Name: appearances; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE appearances (
    yearid integer NOT NULL,
    teamid character varying(3) NOT NULL,
    lgid character varying(2),
    playerid character varying(9) NOT NULL,
    g_all integer,
    gs integer,
    g_batting integer,
    g_defense integer,
    g_p integer,
    g_c integer,
    g_1b integer,
    g_2b integer,
    g_3b integer,
    g_ss integer,
    g_lf integer,
    g_cf integer,
    g_rf integer,
    g_of integer,
    g_dh integer,
    g_ph integer,
    g_pr integer
);


--
-- TOC entry 195 (class 1259 OID 33585)
-- Name: awardsmanagers; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE awardsmanagers (
    playerid character varying(10) NOT NULL,
    awardid character varying(75) NOT NULL,
    yearid integer NOT NULL,
    lgid character varying(2) NOT NULL,
    tie character varying(1),
    notes character varying(100)
);


--
-- TOC entry 196 (class 1259 OID 33590)
-- Name: awardsplayers; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE awardsplayers (
    playerid character varying(9) NOT NULL,
    awardid character varying(255) NOT NULL,
    yearid integer NOT NULL,
    lgid character varying(2) NOT NULL,
    tie character varying(1),
    notes character varying(100)
);


--
-- TOC entry 197 (class 1259 OID 33595)
-- Name: awardssharemanagers; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE awardssharemanagers (
    awardid character varying(25) NOT NULL,
    yearid integer NOT NULL,
    lgid character varying(2) NOT NULL,
    playerid character varying(10) NOT NULL,
    pointswon integer,
    pointsmax integer,
    votesfirst integer
);


--
-- TOC entry 198 (class 1259 OID 33600)
-- Name: awardsshareplayers; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE awardsshareplayers (
    awardid character varying(25) NOT NULL,
    yearid integer NOT NULL,
    lgid character varying(2) NOT NULL,
    playerid character varying(9) NOT NULL,
    pointswon double precision,
    pointsmax integer,
    votesfirst double precision
);


--
-- TOC entry 199 (class 1259 OID 33605)
-- Name: batting; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE batting (
    playerid character varying(9) NOT NULL,
    yearid integer NOT NULL,
    stint integer NOT NULL,
    teamid character varying(3),
    lgid character varying(2),
    g integer,
    ab integer,
    r integer,
    h integer,
    "2B" integer,
    "3B" integer,
    hr integer,
    rbi integer,
    sb integer,
    cs integer,
    bb integer,
    so integer,
    ibb integer,
    hbp integer,
    sh integer,
    sf integer,
    gidp integer
);


--
-- TOC entry 200 (class 1259 OID 33610)
-- Name: battingpost; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE battingpost (
    yearid integer NOT NULL,
    round character varying(10) NOT NULL,
    playerid character varying(9) NOT NULL,
    teamid character varying(3),
    lgid character varying(2),
    g integer,
    ab integer,
    r integer,
    h integer,
    "2B" integer,
    "3B" integer,
    hr integer,
    rbi integer,
    sb integer,
    cs integer,
    bb integer,
    so integer,
    ibb integer,
    hbp integer,
    sh integer,
    sf integer,
    gidp integer
);


--
-- TOC entry 208 (class 1259 OID 33648)
-- Name: master; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE master (
    playerid character varying(10) NOT NULL,
    birthyear integer,
    birthmonth integer,
    birthday integer,
    birthcountry character varying(50),
    birthstate character varying(32),
    birthcity character varying(50),
    deathyear integer,
    deathmonth integer,
    deathday integer,
    deathcountry character varying(50),
    deathstate character varying(32),
    deathcity character varying(50),
    namefirst character varying(50),
    namelast character varying(50),
    namegiven character varying(255),
    weight integer,
    height double precision,
    bats character varying(1),
    throws character varying(1),
    debut timestamp without time zone,
    finalgame timestamp without time zone,
    retroid character varying(9),
    bbrefid character varying(9)
);


--
-- TOC entry 217 (class 1259 OID 33715)
-- Name: career_homeruns; Type: VIEW; Schema: baseballdb; Owner: -
--

CREATE VIEW career_homeruns AS
SELECT m.namefirst, m.namelast, sum(b.hr) AS hr FROM batting b, master m WHERE (((b.playerid)::text = (m.playerid)::text) AND (b.hr > 0)) GROUP BY b.playerid, m.namefirst, m.namelast ORDER BY sum(b.hr) DESC;


--
-- TOC entry 201 (class 1259 OID 33615)
-- Name: collegeplaying; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE collegeplaying (
    playerid character varying(9),
    schoolid character varying(15),
    yearid integer
);


--
-- TOC entry 202 (class 1259 OID 33618)
-- Name: fielding; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE fielding (
    playerid character varying(9) NOT NULL,
    yearid integer NOT NULL,
    stint integer NOT NULL,
    teamid character varying(3),
    lgid character varying(2),
    pos character varying(2) NOT NULL,
    g integer,
    gs integer,
    innouts integer,
    po integer,
    a integer,
    e integer,
    dp integer,
    pb integer,
    wp integer,
    sb integer,
    cs integer,
    zr double precision
);


--
-- TOC entry 203 (class 1259 OID 33623)
-- Name: fieldingof; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE fieldingof (
    playerid character varying(9) NOT NULL,
    yearid integer NOT NULL,
    stint integer NOT NULL,
    glf integer,
    gcf integer,
    grf integer
);


--
-- TOC entry 204 (class 1259 OID 33628)
-- Name: fieldingpost; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE fieldingpost (
    playerid character varying(9) NOT NULL,
    yearid integer NOT NULL,
    teamid character varying(3),
    lgid character varying(2),
    round character varying(10) NOT NULL,
    pos character varying(2) NOT NULL,
    g integer,
    gs integer,
    innouts integer,
    po integer,
    a integer,
    e integer,
    dp integer,
    tp integer,
    pb integer,
    sb integer,
    cs integer
);


--
-- TOC entry 205 (class 1259 OID 33633)
-- Name: halloffame; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE halloffame (
    playerid character varying(10) NOT NULL,
    yearid integer NOT NULL,
    votedby character varying(64) NOT NULL,
    ballots integer,
    needed integer,
    votes integer,
    inducted character varying(1),
    category character varying(20),
    needed_note character varying(25)
);


--
-- TOC entry 206 (class 1259 OID 33638)
-- Name: managers; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE managers (
    playerid character varying(10),
    yearid integer NOT NULL,
    teamid character varying(3) NOT NULL,
    lgid character varying(2),
    inseason integer NOT NULL,
    g integer,
    w integer,
    l integer,
    rank integer,
    plyrmgr character varying(1)
);


--
-- TOC entry 207 (class 1259 OID 33643)
-- Name: managershalf; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE managershalf (
    playerid character varying(10) NOT NULL,
    yearid integer NOT NULL,
    teamid character varying(3) NOT NULL,
    lgid character varying(2),
    inseason integer,
    half integer NOT NULL,
    g integer,
    w integer,
    l integer,
    rank integer
);


--
-- TOC entry 209 (class 1259 OID 33656)
-- Name: pitching; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE pitching (
    playerid character varying(9) NOT NULL,
    yearid integer NOT NULL,
    stint integer NOT NULL,
    teamid character varying(3),
    lgid character varying(2),
    w integer,
    l integer,
    g integer,
    gs integer,
    cg integer,
    sho integer,
    sv integer,
    ipouts integer,
    h integer,
    er integer,
    hr integer,
    bb integer,
    so integer,
    baopp double precision,
    era double precision,
    ibb integer,
    wp integer,
    hbp integer,
    bk integer,
    bfp integer,
    gf integer,
    r integer,
    sh integer,
    sf integer,
    gidp integer
);


--
-- TOC entry 210 (class 1259 OID 33661)
-- Name: pitchingpost; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE pitchingpost (
    playerid character varying(9) NOT NULL,
    yearid integer NOT NULL,
    round character varying(10) NOT NULL,
    teamid character varying(3),
    lgid character varying(2),
    w integer,
    l integer,
    g integer,
    gs integer,
    cg integer,
    sho integer,
    sv integer,
    ipouts integer,
    h integer,
    er integer,
    hr integer,
    bb integer,
    so integer,
    baopp double precision,
    era double precision,
    ibb integer,
    wp integer,
    hbp integer,
    bk integer,
    bfp integer,
    gf integer,
    r integer,
    sh integer,
    sf integer,
    gidp integer
);


--
-- TOC entry 211 (class 1259 OID 33666)
-- Name: salaries; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE salaries (
    yearid integer NOT NULL,
    teamid character varying(3) NOT NULL,
    lgid character varying(2) NOT NULL,
    playerid character varying(9) NOT NULL,
    salary double precision
);


--
-- TOC entry 212 (class 1259 OID 33671)
-- Name: schools; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE schools (
    schoolid character varying(15) NOT NULL,
    name_full character varying(255),
    city character varying(55),
    state character varying(55),
    country character varying(55)
);


--
-- TOC entry 213 (class 1259 OID 33676)
-- Name: seriespost; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE seriespost (
    yearid integer NOT NULL,
    round character varying(5) NOT NULL,
    teamidwinner character varying(3),
    lgidwinner character varying(2),
    teamidloser character varying(3),
    lgidloser character varying(2),
    wins integer,
    losses integer,
    ties integer
);


--
-- TOC entry 214 (class 1259 OID 33681)
-- Name: teams; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE teams (
    yearid integer NOT NULL,
    lgid character varying(2) NOT NULL,
    teamid character varying(3) NOT NULL,
    franchid character varying(3),
    divid character varying(1),
    "Rank" integer,
    g integer,
    ghome integer,
    w integer,
    l integer,
    divwin character varying(1),
    wcwin character varying(1),
    lgwin character varying(1),
    wswin character varying(1),
    r integer,
    ab integer,
    h integer,
    "2B" integer,
    "3B" integer,
    hr integer,
    bb integer,
    so integer,
    sb integer,
    cs integer,
    hbp integer,
    sf integer,
    ra integer,
    er integer,
    era double precision,
    cg integer,
    sho integer,
    sv integer,
    ipouts integer,
    ha integer,
    hra integer,
    bba integer,
    soa integer,
    e integer,
    dp integer,
    fp double precision,
    name character varying(50),
    park character varying(255),
    attendance integer,
    bpf integer,
    ppf integer,
    teamidbr character varying(3),
    teamidlahman45 character varying(3),
    teamidretro character varying(3)
);


--
-- TOC entry 215 (class 1259 OID 33686)
-- Name: teamsfranchises; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE teamsfranchises (
    franchid character varying(3) NOT NULL,
    franchname character varying(50),
    active character varying(2),
    naassoc character varying(3)
);


--
-- TOC entry 216 (class 1259 OID 33691)
-- Name: teamshalf; Type: TABLE; Schema: baseballdb; Owner: -
--

CREATE TABLE teamshalf (
    yearid integer NOT NULL,
    lgid character varying(2) NOT NULL,
    teamid character varying(3) NOT NULL,
    half character varying(1) NOT NULL,
    divid character varying(1),
    divwin character varying(1),
    "Rank" integer,
    g integer,
    w integer,
    l integer
);


--
-- TOC entry 2968 (class 2606 OID 33882)
-- Name: allstarfull_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY allstarfull
    ADD CONSTRAINT allstarfull_pkey PRIMARY KEY (playerid, yearid, gamenum);


--
-- TOC entry 2970 (class 2606 OID 33584)
-- Name: appearances_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY appearances
    ADD CONSTRAINT appearances_pkey PRIMARY KEY (yearid, teamid, playerid);


--
-- TOC entry 2972 (class 2606 OID 33589)
-- Name: awardsmanagers_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY awardsmanagers
    ADD CONSTRAINT awardsmanagers_pkey PRIMARY KEY (yearid, awardid, lgid, playerid);


--
-- TOC entry 2974 (class 2606 OID 33594)
-- Name: awardsplayers_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY awardsplayers
    ADD CONSTRAINT awardsplayers_pkey PRIMARY KEY (yearid, awardid, lgid, playerid);


--
-- TOC entry 2976 (class 2606 OID 33599)
-- Name: awardssharemanagers_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY awardssharemanagers
    ADD CONSTRAINT awardssharemanagers_pkey PRIMARY KEY (awardid, yearid, lgid, playerid);


--
-- TOC entry 2978 (class 2606 OID 33604)
-- Name: awardsshareplayers_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY awardsshareplayers
    ADD CONSTRAINT awardsshareplayers_pkey PRIMARY KEY (awardid, yearid, lgid, playerid);


--
-- TOC entry 2980 (class 2606 OID 33609)
-- Name: batting_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY batting
    ADD CONSTRAINT batting_pkey PRIMARY KEY (playerid, yearid, stint);


--
-- TOC entry 2982 (class 2606 OID 33614)
-- Name: battingpost_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY battingpost
    ADD CONSTRAINT battingpost_pkey PRIMARY KEY (yearid, round, playerid);


--
-- TOC entry 2984 (class 2606 OID 33622)
-- Name: fielding_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY fielding
    ADD CONSTRAINT fielding_pkey PRIMARY KEY (playerid, yearid, stint, pos);


--
-- TOC entry 2986 (class 2606 OID 33627)
-- Name: fieldingof_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY fieldingof
    ADD CONSTRAINT fieldingof_pkey PRIMARY KEY (playerid, yearid, stint);


--
-- TOC entry 2988 (class 2606 OID 33632)
-- Name: fieldingpost_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY fieldingpost
    ADD CONSTRAINT fieldingpost_pkey PRIMARY KEY (playerid, yearid, round, pos);


--
-- TOC entry 2990 (class 2606 OID 33637)
-- Name: halloffame_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY halloffame
    ADD CONSTRAINT halloffame_pkey PRIMARY KEY (playerid, yearid, votedby);


--
-- TOC entry 2992 (class 2606 OID 33642)
-- Name: managers_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY managers
    ADD CONSTRAINT managers_pkey PRIMARY KEY (yearid, teamid, inseason);


--
-- TOC entry 2994 (class 2606 OID 33647)
-- Name: managershalf_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY managershalf
    ADD CONSTRAINT managershalf_pkey PRIMARY KEY (yearid, teamid, playerid, half);


--
-- TOC entry 2996 (class 2606 OID 33655)
-- Name: master_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY master
    ADD CONSTRAINT master_pkey PRIMARY KEY (playerid);


--
-- TOC entry 2998 (class 2606 OID 33660)
-- Name: pitching_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY pitching
    ADD CONSTRAINT pitching_pkey PRIMARY KEY (playerid, yearid, stint);


--
-- TOC entry 3000 (class 2606 OID 33665)
-- Name: pitchingpost_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY pitchingpost
    ADD CONSTRAINT pitchingpost_pkey PRIMARY KEY (playerid, yearid, round);


--
-- TOC entry 3002 (class 2606 OID 33670)
-- Name: salaries_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY salaries
    ADD CONSTRAINT salaries_pkey PRIMARY KEY (yearid, teamid, lgid, playerid);


--
-- TOC entry 3004 (class 2606 OID 33675)
-- Name: schools_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY schools
    ADD CONSTRAINT schools_pkey PRIMARY KEY (schoolid);


--
-- TOC entry 3006 (class 2606 OID 33680)
-- Name: seriespost_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY seriespost
    ADD CONSTRAINT seriespost_pkey PRIMARY KEY (yearid, round);


--
-- TOC entry 3008 (class 2606 OID 33685)
-- Name: teams_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (yearid, lgid, teamid);


--
-- TOC entry 3010 (class 2606 OID 33690)
-- Name: teamsfranchises_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY teamsfranchises
    ADD CONSTRAINT teamsfranchises_pkey PRIMARY KEY (franchid);


--
-- TOC entry 3012 (class 2606 OID 33695)
-- Name: teamshalf_pkey; Type: CONSTRAINT; Schema: baseballdb; Owner: -
--

ALTER TABLE ONLY teamshalf
    ADD CONSTRAINT teamshalf_pkey PRIMARY KEY (yearid, teamid, lgid, half);


-- Completed on 2016-03-13 20:01:15

--
-- PostgreSQL database dump complete
--

