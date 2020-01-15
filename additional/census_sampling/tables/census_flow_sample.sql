CREATE SEQUENCE flow_sample_id_seq
    START WITH 9523
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE flow_sample_id_seq OWNER TO postgres;

--
-- TOC entry 350 (class 1259 OID 968286)
-- Name: census_flow_sample; Type: TABLE; Schema: import; Owner: postgres
--

CREATE TABLE census_flow_sample (
    id integer DEFAULT nextval('flow_sample_id_seq'::regclass) NOT NULL,
    source_oa character varying NOT NULL,
    target_oa character varying NOT NULL,
    source public.geometry(Point,27700),
    target public.geometry(Point,27700),
    flow public.geometry(LineString,27700),
    source_node public.geometry(Point,27700),
    target_node public.geometry(Point,27700),
    source_description character varying,
    target_description character varying,
    walk_source_node public.geometry(Point,27700),
    walk_target_node public.geometry(Point,27700),
    cycle_source_node public.geometry(Point,27700),
    cycle_target_node public.geometry(Point,27700),
    car_source_node public.geometry(Point,27700),
    car_target_node public.geometry(Point,27700)
);


ALTER TABLE census_flow_sample OWNER TO postgres;