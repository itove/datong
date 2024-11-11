--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

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
-- Name: notify_messenger_messages(); Type: FUNCTION; Schema: public; Owner: datong
--

CREATE FUNCTION public.notify_messenger_messages() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
            BEGIN
                PERFORM pg_notify('messenger_messages', NEW.queue_name::text);
                RETURN NEW;
            END;
        $$;


ALTER FUNCTION public.notify_messenger_messages() OWNER TO datong;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: category; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    label character varying(255) NOT NULL
);


ALTER TABLE public.category OWNER TO datong;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: datong
--

CREATE SEQUENCE public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO datong;

--
-- Name: comment; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public.comment (
    id integer NOT NULL,
    node_id integer,
    author_id integer NOT NULL,
    body text NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    up integer DEFAULT 0 NOT NULL,
    down integer DEFAULT 0 NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.comment OWNER TO datong;

--
-- Name: COLUMN comment.created_at; Type: COMMENT; Schema: public; Owner: datong
--

COMMENT ON COLUMN public.comment.created_at IS '(DC2Type:datetime_immutable)';


--
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: datong
--

CREATE SEQUENCE public.comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_id_seq OWNER TO datong;

--
-- Name: conf; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public.conf (
    id integer NOT NULL,
    language_id integer,
    sitename character varying(255) NOT NULL,
    keywords text,
    description character varying(255) DEFAULT NULL::character varying,
    address character varying(255) DEFAULT NULL::character varying,
    phone character varying(25) DEFAULT NULL::character varying,
    email character varying(55) DEFAULT NULL::character varying,
    logo character varying(255) DEFAULT NULL::character varying,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    note character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.conf OWNER TO datong;

--
-- Name: COLUMN conf.keywords; Type: COMMENT; Schema: public; Owner: datong
--

COMMENT ON COLUMN public.conf.keywords IS '(DC2Type:simple_array)';


--
-- Name: COLUMN conf.updated_at; Type: COMMENT; Schema: public; Owner: datong
--

COMMENT ON COLUMN public.conf.updated_at IS '(DC2Type:datetime_immutable)';


--
-- Name: conf_id_seq; Type: SEQUENCE; Schema: public; Owner: datong
--

CREATE SEQUENCE public.conf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_id_seq OWNER TO datong;

--
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);


ALTER TABLE public.doctrine_migration_versions OWNER TO datong;

--
-- Name: feedback; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public.feedback (
    id integer NOT NULL,
    node_id integer,
    firstname character varying(15) DEFAULT NULL::character varying,
    lastname character varying(15) DEFAULT NULL::character varying,
    email character varying(35) DEFAULT NULL::character varying,
    phone character varying(20) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying,
    body text NOT NULL,
    country character varying(30) DEFAULT NULL::character varying,
    sex smallint,
    province character varying(255) DEFAULT NULL::character varying,
    city character varying(255) DEFAULT NULL::character varying,
    note character varying(255) DEFAULT NULL::character varying,
    name character varying(255) DEFAULT NULL::character varying,
    type smallint
);


ALTER TABLE public.feedback OWNER TO datong;

--
-- Name: feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: datong
--

CREATE SEQUENCE public.feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feedback_id_seq OWNER TO datong;

--
-- Name: image; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public.image (
    id integer NOT NULL,
    node_id integer NOT NULL,
    image character varying(255) NOT NULL,
    title character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.image OWNER TO datong;

--
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: datong
--

CREATE SEQUENCE public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO datong;

--
-- Name: language; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public.language (
    id integer NOT NULL,
    language character varying(30) NOT NULL,
    prefix character varying(15) NOT NULL,
    locale character varying(15) NOT NULL
);


ALTER TABLE public.language OWNER TO datong;

--
-- Name: language_id_seq; Type: SEQUENCE; Schema: public; Owner: datong
--

CREATE SEQUENCE public.language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.language_id_seq OWNER TO datong;

--
-- Name: link; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public.link (
    id integer NOT NULL,
    menu_id integer NOT NULL,
    title character varying(255) NOT NULL,
    link character varying(255) NOT NULL,
    weight smallint NOT NULL
);


ALTER TABLE public.link OWNER TO datong;

--
-- Name: link_id_seq; Type: SEQUENCE; Schema: public; Owner: datong
--

CREATE SEQUENCE public.link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.link_id_seq OWNER TO datong;

--
-- Name: menu; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public.menu (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    label character varying(255) NOT NULL
);


ALTER TABLE public.menu OWNER TO datong;

--
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: datong
--

CREATE SEQUENCE public.menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_id_seq OWNER TO datong;

--
-- Name: messenger_messages; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public.messenger_messages (
    id bigint NOT NULL,
    body text NOT NULL,
    headers text NOT NULL,
    queue_name character varying(190) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    available_at timestamp(0) without time zone NOT NULL,
    delivered_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.messenger_messages OWNER TO datong;

--
-- Name: COLUMN messenger_messages.created_at; Type: COMMENT; Schema: public; Owner: datong
--

COMMENT ON COLUMN public.messenger_messages.created_at IS '(DC2Type:datetime_immutable)';


--
-- Name: COLUMN messenger_messages.available_at; Type: COMMENT; Schema: public; Owner: datong
--

COMMENT ON COLUMN public.messenger_messages.available_at IS '(DC2Type:datetime_immutable)';


--
-- Name: COLUMN messenger_messages.delivered_at; Type: COMMENT; Schema: public; Owner: datong
--

COMMENT ON COLUMN public.messenger_messages.delivered_at IS '(DC2Type:datetime_immutable)';


--
-- Name: messenger_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: datong
--

CREATE SEQUENCE public.messenger_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messenger_messages_id_seq OWNER TO datong;

--
-- Name: messenger_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: datong
--

ALTER SEQUENCE public.messenger_messages_id_seq OWNED BY public.messenger_messages.id;


--
-- Name: node; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public.node (
    id integer NOT NULL,
    language_id integer,
    category_id integer,
    parent_id integer,
    title character varying(255) NOT NULL,
    body text,
    image character varying(255) DEFAULT NULL::character varying,
    summary text,
    video character varying(255) DEFAULT NULL::character varying,
    audio character varying(255) DEFAULT NULL::character varying,
    qr character varying(255) DEFAULT NULL::character varying,
    phone character varying(255) DEFAULT NULL::character varying,
    latitude double precision,
    longitude double precision,
    address character varying(255) DEFAULT NULL::character varying,
    price integer,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    author_id integer,
    up integer DEFAULT 0,
    down integer DEFAULT 0,
    deleted boolean
);


ALTER TABLE public.node OWNER TO datong;

--
-- Name: COLUMN node.created_at; Type: COMMENT; Schema: public; Owner: datong
--

COMMENT ON COLUMN public.node.created_at IS '(DC2Type:datetime_immutable)';


--
-- Name: COLUMN node.updated_at; Type: COMMENT; Schema: public; Owner: datong
--

COMMENT ON COLUMN public.node.updated_at IS '(DC2Type:datetime_immutable)';


--
-- Name: node_id_seq; Type: SEQUENCE; Schema: public; Owner: datong
--

CREATE SEQUENCE public.node_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.node_id_seq OWNER TO datong;

--
-- Name: node_region; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public.node_region (
    node_id integer NOT NULL,
    region_id integer NOT NULL
);


ALTER TABLE public.node_region OWNER TO datong;

--
-- Name: node_tag; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public.node_tag (
    node_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.node_tag OWNER TO datong;

--
-- Name: order; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    node_id integer NOT NULL,
    consumer_id integer NOT NULL,
    quantity smallint NOT NULL,
    amount integer NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    paid_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    used_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status smallint NOT NULL,
    price integer NOT NULL,
    cancelled_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    refunded_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    deleted_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    sn character varying(255) NOT NULL,
    wx_trans_id character varying(255) DEFAULT NULL::character varying,
    bank_type character varying(255) DEFAULT NULL::character varying,
    wx_prepay_id character varying(255) DEFAULT NULL::character varying,
    deleted boolean NOT NULL
);


ALTER TABLE public."order" OWNER TO datong;

--
-- Name: COLUMN "order".created_at; Type: COMMENT; Schema: public; Owner: datong
--

COMMENT ON COLUMN public."order".created_at IS '(DC2Type:datetime_immutable)';


--
-- Name: COLUMN "order".paid_at; Type: COMMENT; Schema: public; Owner: datong
--

COMMENT ON COLUMN public."order".paid_at IS '(DC2Type:datetime_immutable)';


--
-- Name: COLUMN "order".used_at; Type: COMMENT; Schema: public; Owner: datong
--

COMMENT ON COLUMN public."order".used_at IS '(DC2Type:datetime_immutable)';


--
-- Name: COLUMN "order".cancelled_at; Type: COMMENT; Schema: public; Owner: datong
--

COMMENT ON COLUMN public."order".cancelled_at IS '(DC2Type:datetime_immutable)';


--
-- Name: COLUMN "order".refunded_at; Type: COMMENT; Schema: public; Owner: datong
--

COMMENT ON COLUMN public."order".refunded_at IS '(DC2Type:datetime_immutable)';


--
-- Name: COLUMN "order".deleted_at; Type: COMMENT; Schema: public; Owner: datong
--

COMMENT ON COLUMN public."order".deleted_at IS '(DC2Type:datetime_immutable)';


--
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: datong
--

CREATE SEQUENCE public.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_id_seq OWNER TO datong;

--
-- Name: page; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public.page (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    weight smallint
);


ALTER TABLE public.page OWNER TO datong;

--
-- Name: page_id_seq; Type: SEQUENCE; Schema: public; Owner: datong
--

CREATE SEQUENCE public.page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_id_seq OWNER TO datong;

--
-- Name: refund; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public.refund (
    id integer NOT NULL,
    ord_id integer NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    reason smallint NOT NULL,
    note character varying(255) DEFAULT NULL::character varying,
    sn character varying(255) NOT NULL,
    wx_refund_id character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.refund OWNER TO datong;

--
-- Name: COLUMN refund.created_at; Type: COMMENT; Schema: public; Owner: datong
--

COMMENT ON COLUMN public.refund.created_at IS '(DC2Type:datetime_immutable)';


--
-- Name: refund_id_seq; Type: SEQUENCE; Schema: public; Owner: datong
--

CREATE SEQUENCE public.refund_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refund_id_seq OWNER TO datong;

--
-- Name: region; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public.region (
    id integer NOT NULL,
    page_id integer,
    name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    count smallint NOT NULL,
    icon character varying(20) DEFAULT NULL::character varying,
    fields text,
    description character varying(255) DEFAULT NULL::character varying,
    weight smallint
);


ALTER TABLE public.region OWNER TO datong;

--
-- Name: COLUMN region.fields; Type: COMMENT; Schema: public; Owner: datong
--

COMMENT ON COLUMN public.region.fields IS '(DC2Type:simple_array)';


--
-- Name: region_id_seq; Type: SEQUENCE; Schema: public; Owner: datong
--

CREATE SEQUENCE public.region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.region_id_seq OWNER TO datong;

--
-- Name: spec; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public.spec (
    id integer NOT NULL,
    node_id integer NOT NULL,
    name character varying(25) NOT NULL,
    value character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.spec OWNER TO datong;

--
-- Name: spec_id_seq; Type: SEQUENCE; Schema: public; Owner: datong
--

CREATE SEQUENCE public.spec_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spec_id_seq OWNER TO datong;

--
-- Name: tag; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public.tag (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    label character varying(255) NOT NULL
);


ALTER TABLE public.tag OWNER TO datong;

--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: datong
--

CREATE SEQUENCE public.tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_id_seq OWNER TO datong;

--
-- Name: user; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(180) NOT NULL,
    roles json NOT NULL,
    password character varying(255) NOT NULL,
    plain_password character varying(255) DEFAULT NULL::character varying,
    openid character varying(255) DEFAULT NULL::character varying,
    name character varying(255) DEFAULT NULL::character varying,
    phone character varying(255) DEFAULT NULL::character varying,
    avatar character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public."user" OWNER TO datong;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: datong
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO datong;

--
-- Name: user_node; Type: TABLE; Schema: public; Owner: datong
--

CREATE TABLE public.user_node (
    user_id integer NOT NULL,
    node_id integer NOT NULL
);


ALTER TABLE public.user_node OWNER TO datong;

--
-- Name: messenger_messages id; Type: DEFAULT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.messenger_messages ALTER COLUMN id SET DEFAULT nextval('public.messenger_messages_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public.category (id, name, label) FROM stdin;
3	政府	zhengfu
2	企业	qiye
1	个人	geren
\.


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public.comment (id, node_id, author_id, body, created_at, up, down, deleted) FROM stdin;
\.


--
-- Data for Name: conf; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public.conf (id, language_id, sitename, keywords, description, address, phone, email, logo, updated_at, note) FROM stdin;
1	\N	湖北大同保险经纪有限公司	大同保险	湖北大同保险经纪有限公司	湖北省武汉市武昌区水果湖街中北路126号尚城国际/栋5层20室-1	027-59301692	info@hbdtjj.com	\N	\N	鄂ICP备19016530号-3
\.


--
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20241007034449	2024-10-07 03:44:56	396
DoctrineMigrations\\Version20241016152337	2024-10-16 15:45:29	6
DoctrineMigrations\\Version20241016152656	2024-10-16 15:45:29	0
DoctrineMigrations\\Version20241019163325	2024-11-09 11:46:33	44
DoctrineMigrations\\Version20241019164126	2024-11-09 11:46:33	3
DoctrineMigrations\\Version20241019164514	2024-11-09 11:46:33	12
DoctrineMigrations\\Version20241019164819	2024-11-09 11:46:33	3
DoctrineMigrations\\Version20241019164951	2024-11-09 11:46:33	1
DoctrineMigrations\\Version20241020082629	2024-11-09 11:46:33	14
\.


--
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public.feedback (id, node_id, firstname, lastname, email, phone, title, body, country, sex, province, city, note, name, type) FROM stdin;
1	\N	\N	\N	dotcra@gmail.com	\N	11	11	\N	\N	\N	\N	\N	11	\N
2	\N	\N	\N	dotcra@gmail.com	11	44	afasdf	\N	\N	44	44	\N	aa	\N
3	\N	\N	\N	dotcra@gmail.com	aa	aa	aa	\N	\N	aa	aa	\N	aa	\N
4	\N	\N	\N	a@b.com	\N	aa	aa	\N	\N	\N	\N	\N	aa	\N
5	\N	\N	\N	a@b.com	\N	aa	aa	\N	\N	\N	\N	\N	aa	\N
6	\N	\N	\N	z@alz.ee	\N	aa	aa	\N	\N	\N	\N	\N	aa	\N
7	\N	\N	\N	dotcra@gmail.com	\N	a	a	\N	\N	\N	\N	\N	a	\N
8	\N	\N	\N	dotcra@gmail.com	\N	aa	aa	\N	\N	\N	\N	\N	aa	\N
9	\N	\N	\N	dotcra@gmail.com	\N	aa	aa	\N	\N	\N	\N	\N	aa	\N
10	\N	\N	\N	z@alz.ee	\N	aa	aa	\N	\N	\N	\N	\N	aa	\N
11	\N	\N	\N	dotcra@gmail.com	\N	aa	aa	\N	\N	\N	\N	\N	aa	\N
12	\N	\N	\N	z@alz.ee	\N	aa	aa	\N	\N	\N	\N	\N	aa	\N
22	\N	\N	\N	z@alz.ee	\N	a	a	\N	\N	\N	\N	\N	a	0
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public.image (id, node_id, image, title) FROM stdin;
\.


--
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public.language (id, language, prefix, locale) FROM stdin;
\.


--
-- Data for Name: link; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public.link (id, menu_id, title, link, weight) FROM stdin;
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public.menu (id, name, label) FROM stdin;
\.


--
-- Data for Name: messenger_messages; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public.messenger_messages (id, body, headers, queue_name, created_at, available_at, delivered_at) FROM stdin;
\.


--
-- Data for Name: node; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public.node (id, language_id, category_id, parent_id, title, body, image, summary, video, audio, qr, phone, latitude, longitude, address, price, created_at, updated_at, author_id, up, down, deleted) FROM stdin;
4	\N	\N	\N	2021年度年中工作会议	<figure class="image"><img style="aspect-ratio:1440/1080;" src="/images/670cc079a4f10-微信图片_20210916160938.jpg" width="1440" height="1080"></figure><figure class="image"><img style="aspect-ratio:1440/1080;" src="/images/670cc0849a4e9-微信图片_20210916160907.jpg" width="1440" height="1080"></figure><p>为做好2021年1-8月份业务经营工作分析，部署规划2021年度下阶段工作，大同经纪于2021年9月15日-16日在武汉召开“大同经纪2021年度年中工作会议”。会议对2021年1-8月份各分支机构经营情况进行分析；结合银保监局监管规定及要求，规范财务、业务、人事和行政等各项工作；规划展望2021年度下阶段工作。</p>	1-670e92812aea8515819708.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 06:56:07	2024-10-15 16:04:17	\N	\N	\N	\N
9	\N	\N	\N	2019年度半年工作会议	<figure class="image"><img style="aspect-ratio:1440/1080;" src="/images/670cc3cca6227-微信图片_20190814112102.jpg" width="1440" height="1080"></figure><figure class="image"><img style="aspect-ratio:1440/1080;" src="/images/670cc3ccbf64b-微信图片_20190814112045.jpg" width="1440" height="1080"></figure><p>2019年8月1日-2日，大同经纪在武汉召开2019年度半年工作会议，会议分析近期市场动态、监管方向，总结2019年度上半年公司工作得失，研讨、部署2019年度下半年工作目标、规划和举措。</p>	wei-xin-tu-pian-20190814112045-670cc3d172cf6328450425.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 07:10:08	2024-10-14 07:10:09	\N	\N	\N	\N
10	\N	\N	\N	郧阳医调简报[ 2019]第1期(2)	<h3 style="text-align:center;">十堰南化中心卫生院“2.10”医疗纠纷群体聚集事件经调解结案</h3><p>2 月 12 日下午 5:30,经过两昼一夜连续奋战的调解工作，南化中心卫生院“2.10”叶永强猝死医疗纠纷案的医方、患方代表以及郧阳区医患纠纷人民调解委调解员，在协议书上郑重签字，医患双方同意经调解结案。因案在十堰市南化中心卫生院聚集的两百多人逐渐散去。</p><p>事由起于 2019 年 2 月 10 日，患者叶永强当日因“间断反复发作胸痛 2 天”在南化中心卫生院就诊，其既往有高血压病、糖尿病、吸烟史，行心电图检查提示：窦性心动过缓、ST 段水平延长、TШ倒置，心肌酶正常。就诊后患者自行回家，在家中突然意识丧失，再次入院抢救时急查心电图为一条直线。医院立即组织行一系列抢救措施，经抢救无效死亡。根据相关病史、辅检回顾，初步会诊诊断意见为：冠心病急性冠脉综合症（不稳定型心绞痛、急性心肌梗死）心脏性猝死可能性大，确诊需行尸体解剖检查明确，但家属不同意作司法鉴定。</p><p>患者在卫生院病亡，家属认定属院方诊疗不力，未给予入院 2 收治或转上级医院治疗导致贻误最佳抢救时机，提出高额赔偿要求。次日清晨，患方家属及亲人乡邻等200 余人聚集南化中心卫生院，患方群体因亡者缘故而言行明显偏激，事态随时可能进一步激化。南化中心卫生院迅速将情况向上级部门报告。</p><p>鉴于群体聚集随时可能向恶性事件演变，郧阳区政法委迅速召集区卫计局、区公安局、南化镇政府、区医患纠纷调解委和医疗专家等人员，两个小时后的上午10 时就赶到南化中心卫生院。到场的还有南化派出所、关帝村委的负责同志。相关部门人员到场后，争执混乱的场面逐步得以控制，但引导双方理性地坐下来谈，到析因辨理、弥合差距，殊是不易。</p><p>首先是患方情绪较为激动，执传统的“死者为大”为由，提出高额赔偿条件不容讨论，甚至任何人都“无资格”说话。“政府、卫生、公安和所谓医疗专家，要么是连带关系官官相护，要么是只知控制场面息事宁人，维护群众利益时候没有一个可信！”患方家属放言，而且谁要说话就对谁挥拳相向。这时，区医患纠纷调解委的同志毫不回避地顶在最前面。冒着被袭的风险，刘道成、肖阳文调解员首先站出来与患方进行沟通。患方在对医调组织设立的宗旨、调解员身份，以及第三方人民调解组织的专业医疗调解、中立不涉利益的情况了解后，才同意推选代表参与调解。&nbsp;</p><p>其次是调解过程曲折，现场多次受到冲击，统一双方认识并弥合赔偿差距异常艰难。亡者时值49 岁，尚有妻子和三个子女，亲属对家中顶梁柱的壮年去世难以接受，且有家庭经济困难的实际情况。对于患者最终死亡，认为院方诊疗处置不到位是主要原因，故提出高额赔偿要求。而患者当地家族群体大，多人的参与也导致了意见难以统一，群体一直处于较为躁动的状态，以至于患方外围人员三次冲击调解现场质疑调解工作人员，两 3 次变更参与调解的代表。</p><p>&nbsp;秉着公平、公正、公开的原则，肩负人民内部矛盾只能化解不可激化的责任，医疗专家在应患方要求不作尸检司法鉴定的条件下，认真仔细地对患者既往和当前病症、对医院诊疗操作进行梳理分析，调解员耐心地与医患双方沟通，双方最终统一意见：叶永强猝死主要原因系自身急性心脏疾病，看诊医生经验不足致其处置方式不够周密，也负有一定责任。综合考虑到患方家庭的实际困难，由医方给予患方一次性经济赔偿及补偿。维稳调解队伍历经两昼一夜的连续奋战，争议、鉴定、调解，数次把可能失控的场面稳定下来，使得医患双方能理性地了解事件过程真相，认清患者病亡的原因，以及认识非理性行为可能带来的后果，双方终于达成调解协议。</p><p>这次南化中心卫生院“2.10”医疗纠纷群体聚集事件的顺利解决，是在区政法委的正确领导下，迅速组织地方政府、卫生、公安部门和专业人民调解组织共同协作完成，是对郧阳区高度重视法制建设，紧抓人民调解，化解社会矛盾，提升综合治理能力的一次检验。事实表明，在处理极端的专业纠纷和群体事件中，专业有效的调解工作和强大的外部震慑力量缺一不可。借此契机，郧阳区在民政、教育等多领域推动专业人民调解建设工作正在进行中。&nbsp;</p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 07:13:45	2024-10-14 07:13:45	\N	\N	\N	\N
11	\N	\N	\N	大同经纪2018年度工作会议纪要	<figure class="image"><img style="aspect-ratio:1920/1080;" src="/images/670cc51912ab9-微信图片_20180301165611.jpg" width="1920" height="1080"></figure><figure class="image"><img style="aspect-ratio:1920/1080;" src="/images/670cc5192d249-微信图片_20180301165436.jpg" width="1920" height="1080"></figure><p style="text-align:justify;">2月27日，大同经纪在武汉总部召开2018年度工作会议。参加会议的有联合融汇集团副总裁刘纯德、大同经纪执行董事兼总经理刘波、副总经理兼武汉市分公司总经理罗瑄、副总经理陈寅尧，公司各部门及分支机构负责人、公司2017年度优秀员工以及总部全体员工。现将会议事项纪要如下：</p><p style="text-align:justify;">一、会议回顾大同经纪重组以来四年的工作历程，指出公司当前进入管理升级、提速增长的新阶段</p><p style="text-align:justify;">2014重组后的两年内由于公司发展的步子较大，全省密集的网点与市场需求短期内不能有效对接而产生效益，在此情况下，2016年公司从受支持性发展一步跨入独立，经历了调整的阵痛。低谷时期，大同核心团队仍然坚持集团正确的发展方向，不忘初心播下种子，坚守岗位打好基础，2017年实现了大多数分支机构行业风险管理业务的突破，领先的机构继续巩固做强、形成模式，正在经营的机构全面实现“自己养活自己”的短期目标。公司全年业务保费1亿元，佣金1700万元，圆满完成年初制订的经营目标任务。</p><p style="text-align:justify;">站在今天，我们有理由展望业务从点扩大到成片，队伍从数个壮大到成行，公司进入一个新的发展阶段。因此我们应该能正确地理解，公司在特定时期实行的粗放式管理，为的是让核心团队充分发挥想象力，放开手脚大胆探索，形成突破总结经验，然后把模式成片推广到更大的范围，形成更大的规模效益。业务量增长了、人员增加了，将来的工作就更需要协同步调，因此大家要主动调整和适应规范管理，保证业务提速增长的实现。</p><p style="text-align:justify;">二、会议总结过往成绩，审视存在的不足，揭示了改进的方向</p><p style="text-align:justify;">企业的发展没有一帆风顺，历经风雨、顽强拼搏的大同经纪已不是一无所有！</p><p style="text-align:justify;">战略上，当初建立城市风险管理服务体系的集团企业目标已成为国家意志；业务发展上，有以咸宁、黄冈、宜昌、潜江几家分公司为代表在“一主两副”行业业务上探索形成的工作办法和规模效益，以总部业务为代表的大项目，以武汉、黄石为代表的合作业务，以襄阳、随州为代表的承包经营；人力上，形成41名基础员工、60名风险管理员、200名经纪代理人三个互补支撑的员工队伍，共同为公司长足发展奠定了坚实的基础！</p><p style="text-align:justify;">同时我们要看到存在的不足，也是未来工作改进的方向：</p><p style="text-align:justify;">1、业务发展不平衡。反映在：（1）全年业务发展不平衡，上半年业务增速高达 515 %，保费列全省第14位；下半年业务增速不到上半年的 80 %，没有抓住保险行业旺季，后期发力不足。（2）各机构之间发展不平衡，强者更强，两极分化趋势明显。</p><p style="text-align:justify;">2、管理成本居高，效益低。2017年，公司营业收入 1719.41 万元，费用支出 1692.41 万元，利润 27 万元。</p><p style="text-align:justify;">3、合规经营不容忽视。2017年公司经营情况提升的同时，在合规经营自查自纠中也发现了一些问题，如有些机构不能正确处理合规经营和可持续发展之间的关系，或对公司充满怨言，或信誓旦旦而缺乏长期经营、稳定发展的意识。</p><p style="text-align:justify;">4、队伍建设有待加强。主要表现在具有一定业务能力和沟通能力的优秀人才储备不足，部分地方还是孤军作战，单打独斗，这与办大公司，开创大场面的愿景完全不相匹配，公司的专业化水准和整体实力完全得不到体现，造成公司发展后劲不足。</p><p style="text-align:justify;">三、会议明确今后一个时期的业务发展规划</p><p style="text-align:justify;">业务工作是企业赖以生存的生命线！前瞻性的业务规划告诉我们未来活动的领域，有利于工作中心无旁骛，集中精力和资源。</p><p style="text-align:justify;">1、以行业体系为主线。体系建设是发展之基、立司之本，我们必须坚定不移地沿着这个方向去推动，这就是“一主两副”。即全省以医疗卫生行业为主线，各地因地制宜以民政养老、环境保护、食品安全、安全生产、质量监督等行业中优选两个行业作为两翼，然后尽可能多地发展其它行业，最后形成多头多点的行业体系建设格局。</p><p style="text-align:justify;">2、以体系建设为纽带开拓大项目。每个市州在2018年必须有一到两个重大项目的突破，开拓新项目同时巩固既有大项目。</p><p style="text-align:justify;">3、发展经代合作为渠道。与拥有成熟保险资源和渠道的机构或团队合作，整合传统产寿险业务，迅速扩大经营规模，提升企业影响力。</p><p style="text-align:justify;">4、打造网销平台。要学习和利用新兴网络技术，结合保险专业技术能力和营销手段，打通线上线下的壁垒，实现其相互结合与促进，服务体系建设。</p><p style="text-align:justify;">四、会议提出2018年度工作思路、任务目标和主要措施</p><p style="text-align:justify;">1、<strong>2018年公司工作整体思路</strong></p><p style="text-align:justify;">以集团年会精神为指导，以“建立中国城市风险管理服务体系，致力于成为全球领先的风险管理综合服务平台”为使命，坚持“稳、健”的总体经营思路不动摇，强化管理升级，推动价值发展，全面提升“业务发展、成本管控、队伍建设、客户服务”四大能力。</p><p style="text-align:justify;">以加快行业业务（大客户业务）发展、扩面为主线，以优化经营效益为中心，以坚持合规经营为保障，以加快队伍建设为动力，以提升优质服务为突破，不断提高公司核心竞争力，确保2018年目标达成，实现公司健康、稳定、可持续发展。</p><p style="text-align:justify;"><strong>2、2018年的主要工作目标</strong></p><p style="text-align:justify;">优化业务结构，使得行业体系业务占比30%、大项目业务占比20%、传统产寿险占比50%；实现保费1.7亿元，佣金收入3500万，利润280万。</p><p style="text-align:justify;"><strong>3、2018年主要工作措施</strong></p><ol><li><p style="text-align:justify;"><strong>坚持一条发展主线</strong></p></li></ol><p style="text-align:justify;">当前公司还存在三个不匹配的现象：发展速度与业内先进公司的标准不匹配，规模与公司做大做强的目标不匹配，员工成长、薪酬待遇提高与大家的期望不匹配。做企业如逆水行舟不进则退，没有一定的增长速度，就没有企业成长、队伍进步和经营盈利的实现。要跻身一流公司行列，最终实现公司战略目标，我们就必须高标准、严要求，保持高于市场平均水平的发展速度，这是公司所有员工义不容辞的责任。</p><ol><li><p style="text-align:justify;"><strong>解决守住一条合规红线</strong></p></li></ol><p style="text-align:justify;">今后行业监管的<span style="background-color:#ffffff;color:#444444;">力度将会越来越大，底线要求也会越来越高，查得也会越来越细。希望大家在平时工作中，不要为了蝇头小利去触碰法规红线。今年，要把合规经营贯穿到企业经营的各个环节之中。业务上严格按照流程来开展业务工作，做好台账备查；财务上实行集中管理，部分资金统筹使用，发挥有效资金的最大作用，支持各级机构业务发展。</span></p><ol><li><p style="text-align:justify;"><strong>唱响一曲服务之歌</strong></p></li></ol><p style="text-align:justify;"><span style="background-color:#ffffff;color:#444444;">作为专业经纪公司，我们所有的工作就是服务，服务就是我们的产品。对外服务是公司发展的根基，对内服务是保证各个系统正常运行的保障。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#444444;">一是公司为客户服务。服务的最高境界是培养客户对公司的忠诚和信赖。</span>201<span style="background-color:#ffffff;color:#444444;">8年，我们要以行业风险管理、社区风险管理为落地抓手，加强与重点客户零距离接触频率，深入推进各项服务举措不断取得实效，把提升客户满意度作为工作目标（先期预警、事前预防、事中控制、事后转移）。学会运用大数据，为客户排查风险，出具风险清单，出具分析报告，点对点配合行业或责任人进行风险点管理，降低风险发生率。</span><br><span style="background-color:#ffffff;color:#444444;">二是宣传为发展服务。目前公司在业内知名度不高，在市民阶层就更不为人知。2018年，各机构要抓住点滴机会，在服务中树立企业形象，提升公司品牌辐射力，使更多的潜在客户知晓、了解、走进、体验大同服务。如以社区风险管理服务为载体做资料宣传，也可通过其他方式如微信公众号、媒体广告、社区宣传栏等。</span><br><span style="background-color:#ffffff;color:#444444;">三是总部为机构服务。总部与机构是鱼和水的关系。总部各部门要坚持主动服务，成为服务的榜样；坚持周到服务，部门职能交叉时我们必须讲风格讲大局，绝不允许互相推诿；坚持高效服务，要养成一个习惯当日事当日毕，凡是下班前机构上报的各种请示必须当天处理完毕；坚持优质服务，对机构提交资料中存在的问题和差错，不能简单地退回了事，必须详细地说明为什么退回，应该怎么做，指导落地。</span></p><ol><li><p style="text-align:justify;"><strong>实现一个效益高峰</strong></p></li></ol><p style="text-align:justify;">好收成源于好行动，正确的行为带来合理的结果！效益高峰是要达成的目标，是大家能够分享的果实，而365天里我们更要关注的是如何“实现”，也是我们这里要详述的进一步改进工作方法、优化配置资源。</p><p style="text-align:justify;"><strong>改进工作方法，就是学用“一比、二问、三想、四复盘”</strong>：</p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#444444;">一比：比就是比较，是发现问题的基本方法之一。学会与竞争对手比，与兄弟公司比，要敢于和善于和一切比我们先进的公司比。公司之间、部门内部、同事之间都要比贡献、比能力、比才干，大家都来你追我赶，公司的正气就自然上来了。</span><br><span style="background-color:#ffffff;color:#444444;">二问：问就是调查研究。要善于向行业内的专业人士请教，向兄弟公司、先进单位学习，向一线的人员了解情况，把握细节，了解过程，提升自己的处事能力。</span><br><span style="background-color:#ffffff;color:#444444;">三想：想就是思考。对比较、调查的结果进行深层次的思考分析，制定自己的工作思路。在管理上，没有一成不变的办法可以照搬，也没有一劳永逸的经验可以套用，但是隔行不隔理，思路决定出路，只要下功夫，办法总比困难多。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#444444;">四复盘：复盘就是对已完成的工作进行重新梳理与总结。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#444444;">这四种方法中，比和问是提高发现问题的能力，想和复盘是提高解决问题的水平。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#444444;"><strong>优化资源配置，就是公司提出的</strong></span><strong>2017年实行财务集中管理：</strong></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#444444;">大同经纪是市场经济的弄潮儿，不吃“大锅饭”，这点大家在此前的工作中非常清楚，各机构的工作付出与成果有账可查。站在大局，公司的发展需要经营管理能力全面、地区发展平衡，这就需要一定资源的先期投入，因此实行财务集中管理的方式才有可能把分散的资金集中起来，集中资源办要事、办大事，以必要的投入扶持薄弱地区机构加快成长。</span></p><p style="text-align:justify;"><strong>五、会议号召大家提振精神，做有事业心、永远在奋斗路上的大同人。</strong></p><p style="text-align:justify;">会议号召大家始终要有一股子精气神，大同人要不忘初心，重整旗鼓再出发；大同人要保持旺盛斗志，永远在路上。对大同历经四年发展和其间两年艰苦调整，建立起的打不垮、拖不烂的核心团队，尤其是队伍中大量具有强烈奉献精神的老同志给予了高度评价，对大同的年轻人的迅速成长给予了鼓励。</p><p style="text-align:justify;">会议再次重申了在新的征程上对大同人磨砺自我、提升格局的几点期望，这就是“五个意识、三个作为”。要继续强化战略意识、强化合规意识、强化公司意识、强化服务意识、强化目标意识，要主动作为、创新作为、有效作为，努力成为具有一技之长、宽广的知识面、高尚的职业道德情操的“长宽高”型人才。</p><p style="text-align:justify;"><br>&nbsp;</p><p style="text-align:justify;"><strong>六、会议其它事项及工作布置</strong></p><p style="text-align:justify;">会上，刘纯德副总裁、刘波总经理分别向2017年度公司先进集体和先进个人授奖。刘波总代表公司与各分支机构签订2018年经营目标责任状，1.7亿元保费，3500万元佣金的经营任务分解到户，宣布了公司领导班子片区负责督导安排。</p><p style="text-align:justify;">刘纯德副总裁向大家传达了集团计划将大同经纪打造成集团标杆企业、行业示范企业的信息，布置了为迎接集团一季度工作会在大同经纪召开所要做的准备工作任务。</p><p style="text-align:justify;">咸宁分公司黄幼青总经理、宜昌分公司刘洋副总经理分别作为2017年度先进单位和先进个人代表发言，公司行政部罗兰主管为大家进行钉钉办公软件的使用培训。</p><p style="text-align:justify;">各分支机构负责人作年度工作汇报并进行讨论。大家表示，这次会是提神争气会，是总结过去展望未来的会。大家交流了挫折和成功经验，明确了目标和措施，统一了锐意进取、合规经营思想，表达了一张蓝图绘到底的决心。</p>	wei-xin-tu-pian-20180301165436-670cc5263f489296185389.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 07:15:49	2024-10-14 07:15:50	\N	\N	\N	\N
12	\N	\N	\N	2018年度半年工作会议	<figure class="image"><img style="aspect-ratio:800/524;" src="/images/670cc55cca250-微信图片_20180727150131.jpg" width="800" height="524"></figure><figure class="image"><img style="aspect-ratio:800/533;" src="/images/670cc55ce2a05-微信图片_20180727150126.jpg" width="800" height="533"></figure><p>2018年7月9日，大同经纪2018年度半年工作会议在武汉举行。联合融汇集团董事长兼总裁易辉、集团副总裁兼业务发展部总经理刘纯德与会指导工作。参加会议的有大同经纪执行董事兼总经理刘波、副总经理陈寅尧、副总经理兼武汉分公司总经理罗瑄以及各分支机构负责人，大同经纪总部员工列席会议。会议由副总经理陈寅尧主持。</p><p>会上，陈寅尧副总经理首先代表公司作大同经纪2018年度半年工作报告，集团董事长（总裁）易辉、副总裁刘纯德分别作重要讲话，大同经纪总经理刘波从公司战略、队伍建设、机构发展、内控管理、责任担当等五个方面也做了重要引领，分支机构负责人就半年工作情况分别作汇报发言。本着每次以会代训的原则，总部职能部门还进行了财务规范、制度建设和“钉钉”办公软件使用的业务培训。</p>	wei-xin-tu-pian-20180727150126-670cc56eaeed0644842206.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 07:17:01	2024-10-14 07:17:02	\N	\N	\N	\N
16	\N	\N	\N	保险经纪人监管规定	<p style="text-align:center;"><span style="background-color:#fefefe;color:#333333;">保险经纪人监管规定</span></p><p style="text-align:center;"><span style="background-color:#fefefe;color:#333333;">保监会令〔</span>2018〕3号</p><p><span style="background-color:#fefefe;color:#333333;">《保险经纪人监管规定》已经</span>2018年1月17日中国保险监督管理委员会第6次主席办公会审议通过，现予公布，自2018年5月1日起实施。</p><p style="text-align:right;"><span style="background-color:#fefefe;color:#333333;">副主席 陈文辉</span></p><p style="text-align:right;"><span style="background-color:#fefefe;color:#333333;">2018</span><span style="color:#333333;">年2月1日</span></p><p><span style="background-color:#fefefe;color:#333333;">&nbsp;</span></p><p style="text-align:center;"><span style="background-color:#fefefe;color:#333333;"><strong>保险经纪人监管规定</strong></span></p><p><br><br>&nbsp;</p><p style="text-align:center;"><span style="background-color:#fefefe;color:#333333;"><strong>第一章 总 则</strong></span></p><p><br><br>&nbsp;</p><p><span style="background-color:#fefefe;color:#333333;"><strong>第一条</strong> 为了规范保险经纪人的经营行为，保护投保人、被保险人和受益人的合法权益，维护市场秩序，根据《中华人民共和国保险法》（以下简称《保险法》）等法律、行政法规，制定本规定。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第二条</strong> 本规定所称保险经纪人是指基于投保人的利益，为投保人与保险公司订立保险合同提供中介服务，并依法收取佣金的机构，包括保险经纪公司及其分支机构。</span></p><p><span style="background-color:#fefefe;color:#333333;">本规定所称保险经纪从业人员是指在保险经纪人中，为投保人或者被保险人拟订投保方案、办理投保手续、协助索赔的人员，或者为委托人提供防灾防损、风险评估、风险管理咨询服务、从事再保险经纪等业务的人员。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第三条</strong> 保险经纪公司在中华人民共和国境内经营保险经纪业务，应当符合中国保险监督管理委员会（以下简称中国保监会）规定的条件，取得经营保险经纪业务许可证（以下简称许可证）。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第四条</strong> 保险经纪人应当遵守法律、行政法规和中国保监会有关规定，遵循自愿、诚实信用和公平竞争的原则。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第五条</strong> 中国保监会根据《保险法》和国务院授权，对保险经纪人履行监管职责。</span></p><p><span style="background-color:#fefefe;color:#333333;">中国保监会派出机构在中国保监会授权范围内履行监管职责。</span></p><p><span style="background-color:#fefefe;color:#333333;">&nbsp;</span></p><p style="text-align:center;"><span style="background-color:#fefefe;color:#333333;"><strong>第二章 市场准入</strong></span></p><p><span style="background-color:#fefefe;color:#333333;">&nbsp;</span></p><p style="text-align:center;"><span style="background-color:#fefefe;color:#333333;"><strong>第一节 业务许可</strong></span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第六条</strong> 除中国保监会另有规定外，保险经纪人应当采取下列组织形式：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）有限责任公司；</span></p><p><span style="background-color:#fefefe;color:#333333;">（二）股份有限公司。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第七条</strong> 保险经纪公司经营保险经纪业务，应当具备下列条件：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）股东符合本规定要求，且出资资金自有、真实、合法，不得用银行贷款及各种形式的非自有资金投资；</span></p><p><span style="background-color:#fefefe;color:#333333;">（二）注册资本符合本规定第十条要求，且按照中国保监会的有关规定托管；</span></p><p><span style="background-color:#fefefe;color:#333333;">（三）营业执照记载的经营范围符合中国保监会的有关规定；</span></p><p><span style="background-color:#fefefe;color:#333333;">（四）公司章程符合有关规定；</span></p><p><span style="background-color:#fefefe;color:#333333;">（五）公司名称符合本规定要求；</span></p><p><span style="background-color:#fefefe;color:#333333;">（六）高级管理人员符合本规定的任职资格条件；</span></p><p><span style="background-color:#fefefe;color:#333333;">（七）有符合中国保监会规定的治理结构和内控制度，商业模式科学合理可行；</span></p><p><span style="background-color:#fefefe;color:#333333;">（八）有与业务规模相适应的固定住所；</span></p><p><span style="background-color:#fefefe;color:#333333;">（九）有符合中国保监会规定的业务、财务信息管理系统；</span></p><p><span style="background-color:#fefefe;color:#333333;">（十）法律、行政法规和中国保监会规定的其他条件。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第八条</strong> 单位或者个人有下列情形之一的，不得成为保险经纪公司的股东：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）最近</span>5年内受到刑罚或者重大行政处罚；</p><p><span style="background-color:#fefefe;color:#333333;">（二）因涉嫌重大违法犯罪正接受有关部门调查；</span></p><p><span style="background-color:#fefefe;color:#333333;">（三）因严重失信行为被国家有关单位确定为失信联合惩戒对象且应当在保险领域受到相应惩戒，或者最近</span>5年内具有其他严重失信不良记录；</p><p><span style="background-color:#fefefe;color:#333333;">（四）依据法律、行政法规不能投资企业；</span></p><p><span style="background-color:#fefefe;color:#333333;">（五）中国保监会根据审慎监管原则认定的其他不适合成为保险经纪公司股东的情形。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第九条</strong> 保险公司的工作人员、保险专业中介机构的从业人员投资保险经纪公司的，应当提供其所在机构知晓投资的书面证明；保险公司、保险专业中介机构的董事、监事或者高级管理人员投资保险经纪公司的，应当根据有关规定取得股东会或者股东大会的同意。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第十条 </strong>经营区域不限于工商注册登记地所在省、自治区、直辖市、计划单列市的保险经纪公司的注册资本最低限额为5000</span><span style="color:#333333;">万元。</span></p><p><span style="background-color:#fefefe;color:#333333;">经营区域为工商注册登记地所在省、自治区、直辖市、计划单列市的保险经纪公司的注册资本最低限额为</span>1000万元。</p><p><span style="background-color:#fefefe;color:#333333;">保险经纪公司的注册资本必须为实缴货币资本。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第十一条</strong> 保险经纪人的名称中应当包含“保险经纪”字样。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪人的字号不得与现有的保险专业中介机构相同，与保险专业中介机构具有同一实际控制人的保险经纪人除外。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第十二条</strong> 保险经纪公司申请经营保险经纪业务，应当在领取营业执照后，及时按照中国保监会的要求提交申请材料，并进行相关信息披露。</span></p><p><span style="background-color:#fefefe;color:#333333;">中国保监会及其派出机构按照法定的职责和程序实施行政许可。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第十三条</strong> 中国保监会及其派出机构收到经营保险经纪业务申请后，应当采取谈话、函询、现场验收等方式了解、审查申请人股东的经营记录以及申请人的市场发展战略、业务发展计划、内控制度建设、人员结构、信息系统配置及运行等有关事项，并进行风险测试和提示。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第十四条</strong> 中国保监会及其派出机构依法作出批准保险经纪公司经营保险经纪业务的决定的，应当向申请人颁发许可证。申请人取得许可证后，方可开展保险经纪业务，并应当及时在中国保监会规定的监管信息系统中登记相关信息。</span></p><p><span style="background-color:#fefefe;color:#333333;">中国保监会及其派出机构决定不予批准的，应当作出书面决定并说明理由。申请人应当自收到中国保监会及其派出机构书面决定之日起</span>15日内书面报告工商注册登记所在地的工商行政管理部门。公司继续存续的，不得从事保险经纪业务，并应当依法办理名称、营业范围和公司章程等事项的工商变更登记，确保其名称中无“保险经纪”字样。</p><p><span style="background-color:#fefefe;color:#333333;"><strong>第十五条</strong> 经营区域不限于工商注册登记地所在省、自治区、直辖市、计划单列市的保险经纪公司可以在中华人民共和国境内从事保险经纪活动。</span></p><p><span style="background-color:#fefefe;color:#333333;">经营区域不限于工商注册登记地所在省、自治区、直辖市、计划单列市的保险经纪公司向工商注册登记地以外派出保险经纪从业人员，为投保人或者被保险人是自然人的保险业务提供服务的，应当在当地设立分支机构。设立分支机构时应当首先设立省级分公司，指定其负责办理行政许可申请、监管报告和报表提交等相关事宜，并负责管理其他分支机构。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪公司分支机构包括分公司、营业部。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第十六条</strong> 保险经纪公司新设分支机构经营保险经纪业务，应当符合下列条件：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）保险经纪公司及其分支机构最近</span>1年内没有受到刑罚或者重大行政处罚；</p><p><span style="background-color:#fefefe;color:#333333;">（二）保险经纪公司及其分支机构未因涉嫌违法犯罪正接受有关部门调查；</span></p><p><span style="background-color:#fefefe;color:#333333;">（三）保险经纪公司及其分支机构最近</span>1年内未引发30人以上群访群诉事件或者100人以上非正常集中退保事件；</p><p><span style="background-color:#fefefe;color:#333333;">（四）最近</span>2年内设立的分支机构不存在运营未满1年退出市场的情形；</p><p><span style="background-color:#fefefe;color:#333333;">（五）具备完善的分支机构管理制度；</span></p><p><span style="background-color:#fefefe;color:#333333;">（六）新设分支机构有符合要求的营业场所、业务财务信息系统，以及与经营业务相匹配的其他设施；</span></p><p><span style="background-color:#fefefe;color:#333333;">（七）新设分支机构主要负责人符合本规定的任职条件；</span></p><p><span style="background-color:#fefefe;color:#333333;">（八）中国保监会规定的其他条件。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪公司因严重失信行为被国家有关单位确定为失信联合惩戒对象且应当在保险领域受到相应惩戒的，或者最近</span>5年内具有其他严重失信不良记录的，不得新设分支机构经营保险经纪业务。</p><p><span style="background-color:#fefefe;color:#333333;"><strong>第十七条</strong> 保险经纪公司分支机构应当在营业执照记载的登记之日起15</span><span style="color:#333333;">日内，书面报告中国保监会派出机构，在中国保监会规定的监管信息系统中登记相关信息，按照规定进行公开披露，并提交主要负责人的任职资格核准申请材料或者报告材料。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第十八条</strong> 保险经纪人有下列情形之一的，应当自该情形发生之日起5</span><span style="color:#333333;">日内，通过中国保监会规定的监管信息系统报告，并按照规定进行公开披露：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）变更名称、住所或者营业场所；</span></p><p><span style="background-color:#fefefe;color:#333333;">（二）变更股东、注册资本或者组织形式；</span></p><p><span style="background-color:#fefefe;color:#333333;">（三）股东变更姓名或者名称、出资额；</span></p><p><span style="background-color:#fefefe;color:#333333;">（四）修改公司章程；</span></p><p><span style="background-color:#fefefe;color:#333333;">（五）股权投资，设立境外保险类机构及非营业性机构；</span></p><p><span style="background-color:#fefefe;color:#333333;">（六）分立、合并、解散，分支机构终止保险经纪业务活动；</span></p><p><span style="background-color:#fefefe;color:#333333;">（七）变更省级分公司以外分支机构主要负责人；</span></p><p><span style="background-color:#fefefe;color:#333333;">（八）受到行政处罚、刑罚或者涉嫌违法犯罪正接受调查；</span></p><p><span style="background-color:#fefefe;color:#333333;">（九）中国保监会规定的其他报告事项。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪人发生前款规定的相关情形，应当符合中国保监会相关规定。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第十九条</strong> 保险经纪公司变更事项涉及许可证记载内容的，应当按照《保险许可证管理办法》等有关规定办理许可证变更登记，交回原许可证，领取新许可证，并进行公告。</span></p><p style="text-align:center;"><span style="background-color:#fefefe;color:#333333;"><strong>第二节 任职资格</strong></span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第二十条</strong> 本规定所称保险经纪人高级管理人员是指下列人员：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）保险经纪公司的总经理、副总经理；</span></p><p><span style="background-color:#fefefe;color:#333333;">（二）省级分公司主要负责人；</span></p><p><span style="background-color:#fefefe;color:#333333;">（三）对公司经营管理行使重要职权的其他人员。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪人高级管理人员应当在任职前取得中国保监会派出机构核准的任职资格。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第二十一条</strong> 保险经纪人高级管理人员应当具备下列条件：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）大学专科以上学历；</span></p><p><span style="background-color:#fefefe;color:#333333;">（二）从事金融工作</span>3年以上或者从事经济工作5年以上；</p><p><span style="background-color:#fefefe;color:#333333;">（三）具有履行职责所需的经营管理能力，熟悉保险法律、行政法规及中国保监会的相关规定；</span></p><p><span style="background-color:#fefefe;color:#333333;">（四）诚实守信，品行良好。</span></p><p><span style="background-color:#fefefe;color:#333333;">从事金融工作</span>10年以上的人员，学历要求可以不受第一款第（一）项的限制。</p><p><span style="background-color:#fefefe;color:#333333;">保险经纪人任用的省级分公司以外分支机构主要负责人应当具备前两款规定的条件。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第二十二条</strong> 有下列情形之一的人员，不得担任保险经纪人高级管理人员和省级分公司以外分支机构主要负责人：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）担任因违法被吊销许可证的保险公司或者保险中介机构的董事、监事或者高级管理人员，并对被吊销许可证负有个人责任或者直接领导责任的，自许可证被吊销之日起未逾</span>3年；</p><p><span style="background-color:#fefefe;color:#333333;">（二）因违法行为或者违纪行为被金融监管机构取消任职资格的金融机构的董事、监事或者高级管理人员，自被取消任职资格之日起未逾</span>5年；</p><p><span style="background-color:#fefefe;color:#333333;">（三）被金融监管机构决定在一定期限内禁止进入金融行业的，期限未满；</span></p><p><span style="background-color:#fefefe;color:#333333;">（四）受金融监管机构警告或者罚款未逾</span>2年；</p><p><span style="background-color:#fefefe;color:#333333;">（五）正在接受司法机关、纪检监察部门或者金融监管机构调查；</span></p><p><span style="background-color:#fefefe;color:#333333;">（六）因严重失信行为被国家有关单位确定为失信联合惩戒对象且应当在保险领域受到相应惩戒，或者最近</span>5年内具有其他严重失信不良记录；</p><p><span style="background-color:#fefefe;color:#333333;">（七）法律、行政法规和中国保监会规定的其他情形。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第二十三条</strong> 保险经纪人应当与其高级管理人员、省级分公司以外分支机构主要负责人建立劳动关系，订立书面劳动合同。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第二十四条</strong> 保险经纪人高级管理人员和省级分公司以外分支机构主要负责人不得兼任2</span><span style="color:#333333;">家以上分支机构的主要负责人。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪人高级管理人员和省级分公司以外分支机构主要负责人兼任其他经营管理职务的，应当具有必要的时间履行职务。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第二十五条</strong> 非经股东会或者股东大会批准，保险经纪人的高级管理人员和省级分公司以外分支机构主要负责人不得在存在利益冲突的机构中兼任职务。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第二十六条</strong> 保险经纪人向中国保监会派出机构提出高级管理人员任职资格核准申请的，应当如实填写申请表、提交相关材料。</span></p><p><span style="background-color:#fefefe;color:#333333;">中国保监会派出机构可以对保险经纪人拟任高级管理人员进行考察或者谈话。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第二十七条</strong> 保险经纪人高级管理人员应当通过中国保监会认可的保险法规及相关知识测试。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第二十八条</strong> 保险经纪人的高级管理人员在同一保险经纪人内部调任、兼任其他职务，无须重新核准任职资格。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪人调整、免除高级管理人员和省级分公司以外分支机构主要负责人职务，应当自决定作出之日起</span>5日内在中国保监会规定的监管信息系统中登记相关信息。</p><p><span style="background-color:#fefefe;color:#333333;"><strong>第二十九条</strong> 保险经纪人的高级管理人员和省级分公司以外分支机构主要负责人因涉嫌犯罪被起诉的，保险经纪人应当自其被起诉之日起5</span><span style="color:#333333;">日内和结案之日起5日内在中国保监会规定的监管信息系统中登记相关信息。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第三十条</strong> 保险经纪人高级管理人员和省级分公司以外分支机构主要负责人有下列情形之一，保险经纪人已经任命的，应当免除其职务；经核准任职资格的，其任职资格自动失效：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）获得核准任职资格后，保险经纪人超过</span>2个月未任命；</p><p><span style="background-color:#fefefe;color:#333333;">（二）从该保险经纪人离职；</span></p><p><span style="background-color:#fefefe;color:#333333;">（三）受到中国保监会禁止进入保险业的行政处罚；</span></p><p><span style="background-color:#fefefe;color:#333333;">（四）因贪污、受贿、侵占财产、挪用财产或者破坏社会主义市场秩序，被判处刑罚执行期满未逾</span>5年，或者因犯罪被剥夺政治权利，执行期满未逾5年；</p><p><span style="background-color:#fefefe;color:#333333;">（五）担任破产清算的公司、企业的董事或者厂长、经理，对该公司、企业的破产负有个人责任的，自该公司、企业破产清算完结之日起未逾</span>3年；</p><p><span style="background-color:#fefefe;color:#333333;">（六）担任因违法被吊销营业执照、责令关闭的公司、企业的法定代表人，并负有个人责任的，自该公司、企业被吊销营业执照之日起未逾</span>3年；</p><p><span style="background-color:#fefefe;color:#333333;">（七）个人所负数额较大的债务到期未清偿。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第三十一条</strong> 保险经纪人出现下列情形之一，可以任命临时负责人，但临时负责人任职时间最长不得超过3</span><span style="color:#333333;">个月，并且不得就同一职务连续任命临时负责人：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）原负责人辞职或者被撤职；</span></p><p><span style="background-color:#fefefe;color:#333333;">（二）原负责人因疾病、意外事故等原因无法正常履行工作职责；</span></p><p><span style="background-color:#fefefe;color:#333333;">（三）中国保监会认可的其他特殊情况。</span></p><p><span style="background-color:#fefefe;color:#333333;">临时负责人应当具有与履行职责相当的能力，并应当符合本规定第二十一条、第二十二条的相关要求。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪人任命临时负责人的，应当自决定作出之日起</span>5日内在中国保监会规定的监管信息系统中登记相关信息。</p><p><span style="background-color:#fefefe;color:#333333;">&nbsp;</span></p><p style="text-align:center;"><span style="background-color:#fefefe;color:#333333;"><strong>第三节 从业人员</strong></span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第三十二条</strong> 保险经纪人应当聘任品行良好的保险经纪从业人员。有下列情形之一的，保险经纪人不得聘任：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）因贪污、贿赂、侵占财产、挪用财产或者破坏社会主义市场经济秩序，被判处刑罚，执行期满未逾</span>5年；</p><p><span style="background-color:#fefefe;color:#333333;">（二）被金融监管机构决定在一定期限内禁止进入金融行业，期限未满；</span></p><p><span style="background-color:#fefefe;color:#333333;">（三）因严重失信行为被国家有关单位确定为失信联合惩戒对象且应当在保险领域受到相应惩戒，或者最近</span>5年内具有其他严重失信不良记录；</p><p><span style="background-color:#fefefe;color:#333333;">（四）法律、行政法规和中国保监会规定的其他情形。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第三十三条</strong> 保险经纪从业人员应当具有从事保险经纪业务所需的专业能力。保险经纪人应当加强对保险经纪从业人员的岗前培训和后续教育，培训内容至少应当包括业务知识、法律知识及职业道德。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪人可以委托保险中介行业自律组织或者其他机构组织培训。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪人应当建立完整的保险经纪从业人员培训档案。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第三十四条</strong> 保险经纪人应当按照规定为其保险经纪从业人员进行执业登记。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪从业人员只限于通过一家保险经纪人进行执业登记。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪从业人员变更所属保险经纪人的，新所属保险经纪人应当为其进行执业登记，原所属保险经纪人应当及时注销执业登记。</span></p><p style="text-align:center;"><span style="background-color:#fefefe;color:#333333;"><strong>第三章 经营规则</strong></span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第三十五条</strong> 保险经纪公司应当将许可证、营业执照置于住所或者营业场所显著位置。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪公司分支机构应当将加盖所属法人公章的许可证复印件、营业执照置于营业场所显著位置。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪人不得伪造、变造、出租、出借、转让许可证。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第三十六条</strong> 保险经纪人可以经营下列全部或者部分业务：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）为投保人拟订投保方案、选择保险公司以及办理投保手续；</span></p><p><span style="background-color:#fefefe;color:#333333;">（二）协助被保险人或者受益人进行索赔；</span></p><p><span style="background-color:#fefefe;color:#333333;">（三）再保险经纪业务；</span></p><p><span style="background-color:#fefefe;color:#333333;">（四）为委托人提供防灾、防损或者风险评估、风险管理咨询服务；</span></p><p><span style="background-color:#fefefe;color:#333333;">（五）中国保监会规定的与保险经纪有关的其他业务。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第三十七条</strong> 保险经纪人从事保险经纪业务不得超出承保公司的业务范围和经营区域；从事保险经纪业务涉及异地共保、异地承保和统括保单，中国保监会另有规定的，从其规定。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第三十八条</strong> 保险经纪人及其从业人员不得销售非保险金融产品，经相关金融监管部门审批的非保险金融产品除外。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪人及其从业人员销售符合条件的非保险金融产品前，应当具备相应的资质要求。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第三十九条</strong> 保险经纪人应当根据法律、行政法规和中国保监会的有关规定，依照职责明晰、强化制衡、加强风险管理的原则，建立完善的公司治理结构和制度；明确管控责任，构建合规体系，注重自我约束，加强内部追责，确保稳健运营。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第四十条</strong> 保险经纪从业人员应当在所属保险经纪人的授权范围内从事业务活动。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第四十一条</strong> 保险经纪人通过互联网经营保险经纪业务，应当符合中国保监会的规定。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第四十二条</strong> 保险经纪人应当建立专门账簿，记载保险经纪业务收支情况。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第四十三条</strong> 保险经纪人应当开立独立的客户资金专用账户。下列款项只能存放于客户资金专用账户：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）投保人支付给保险公司的保险费；</span></p><p><span style="background-color:#fefefe;color:#333333;">（二）为投保人、被保险人和受益人代领的退保金、保险金。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪人应当开立独立的佣金收取账户。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪人开立、使用其他银行账户的，应当符合中国保监会的规定。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第四十四条</strong> 保险经纪人应当建立完整规范的业务档案，业务档案至少应当包括下列内容：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）通过本机构签订保单的主要情况，包括保险人、投保人、被保险人名称或者姓名，保单号，产品名称，保险金额，保险费，缴费方式，投保日期，保险期间等；</span></p><p><span style="background-color:#fefefe;color:#333333;">（二）保险合同对应的佣金金额和收取方式等；</span></p><p><span style="background-color:#fefefe;color:#333333;">（三）保险费交付保险公司的情况，保险金或者退保金的代领以及交付投保人、被保险人或者受益人的情况；</span></p><p><span style="background-color:#fefefe;color:#333333;">（四）为保险合同签订提供经纪服务的从业人员姓名，领取报酬金额、领取报酬账户等；</span></p><p><span style="background-color:#fefefe;color:#333333;">（五）中国保监会规定的其他业务信息。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪人的记录应当真实、完整。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第四十五条</strong> 保险经纪人应当按照中国保监会的规定开展再保险经纪业务。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪人从事再保险经纪业务，应当设立专门部门，在业务流程、财务管理与风险管控等方面与其他保险经纪业务实行隔离。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第四十六条</strong> 保险经纪人从事再保险经纪业务，应当建立完整规范的再保险业务档案，业务档案至少应当包括下列内容：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）再保险安排确认书；</span></p><p><span style="background-color:#fefefe;color:#333333;">（二）再保险人接受分入比例。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪人应当对再保险经纪业务和其他保险经纪业务分别建立账簿记载业务收支情况。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第四十七条</strong> 保险经纪人应当向保险公司提供真实、完整的投保信息，并应当与保险公司依法约定对投保信息保密、合理使用等事项。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第四十八条</strong> 保险经纪人从事保险经纪业务，应当与委托人签订委托合同，依法约定双方的权利义务及其他事项。委托合同不得违反法律、行政法规及中国保监会有关规定。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第四十九条</strong> 保险经纪人从事保险经纪业务，涉及向保险公司解付保险费、收取佣金的，应当与保险公司依法约定解付保险费、支付佣金的时限和违约赔偿责任等事项。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第五十条</strong> 保险经纪人在开展业务过程中，应当制作并出示规范的客户告知书。客户告知书至少应当包括以下事项：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）保险经纪人的名称、营业场所、业务范围、联系方式；</span></p><p><span style="background-color:#fefefe;color:#333333;">（二）保险经纪人获取报酬的方式，包括是否向保险公司收取佣金等情况；</span></p><p><span style="background-color:#fefefe;color:#333333;">（三）保险经纪人及其高级管理人员与经纪业务相关的保险公司、其他保险中介机构是否存在关联关系；</span></p><p><span style="background-color:#fefefe;color:#333333;">（四）投诉渠道及纠纷解决方式。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第五十一条</strong> 保险经纪人应当妥善保管业务档案、会计账簿、业务台账、客户告知书以及佣金收入的原始凭证等有关资料，保管期限自保险合同终止之日起计算，保险期间在1</span><span style="color:#333333;">年以下的不得少于5年，保险期间超过1年的不得少于10年。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第五十二条</strong> 保险经纪人为政策性保险业务、政府委托业务提供服务的，佣金收取不得违反中国保监会的规定。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第五十三条</strong> 保险经纪人向投保人提出保险建议的，应当根据客户的需求和风险承受能力等情况，在客观分析市场上同类保险产品的基础上，推荐符合其利益的保险产品。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪人应当按照中国保监会的要求向投保人披露保险产品相关信息。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第五十四条</strong> 保险经纪公司应当按规定将监管费交付到中国保监会指定账户。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第五十五条</strong> 保险经纪公司应当自取得许可证之日起20</span><span style="color:#333333;">日内投保职业责任保险或者缴存保证金。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪公司应当自投保职业责任保险或者缴存保证金之日起</span>10日内，将职业责任保险保单复印件或者保证金存款协议复印件、保证金入账原始凭证复印件报送中国保监会派出机构，并在中国保监会规定的监管信息系统中登记相关信息。</p><p><span style="background-color:#fefefe;color:#333333;"><strong>第五十六条</strong> 保险经纪公司投保职业责任保险的，该保险应当持续有效。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪公司投保的职业责任保险对一次事故的赔偿限额不得低于人民币</span>100万元；一年期保单的累计赔偿限额不得低于人民币1000万元，且不得低于保险经纪人上年度的主营业务收入。</p><p><span style="background-color:#fefefe;color:#333333;"><strong>第五十七条</strong> 保险经纪公司缴存保证金的，应当按注册资本的5%</span><span style="color:#333333;">缴存，保险经纪公司增加注册资本的，应当按比例增加保证金数额。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪公司应当足额缴存保证金。保证金应当以银行存款形式专户存储到商业银行，或者以中国保监会认可的其他形式缴存。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第五十八条</strong> 保险经纪公司有下列情形之一的，可以动用保证金：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）注册资本减少；</span></p><p><span style="background-color:#fefefe;color:#333333;">（二）许可证被注销；</span></p><p><span style="background-color:#fefefe;color:#333333;">（三）投保符合条件的职业责任保险；</span></p><p><span style="background-color:#fefefe;color:#333333;">（四）中国保监会规定的其他情形。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪公司应当自动用保证金之日起</span>5日内书面报告中国保监会派出机构。</p><p><span style="background-color:#fefefe;color:#333333;"><strong>第五十九条</strong> 保险经纪公司应当在每一会计年度结束后聘请会计师事务所对本公司的资产、负债、利润等财务状况进行审计，并在每一会计年度结束后4</span><span style="color:#333333;">个月内向中国保监会派出机构报送相关审计报告。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪公司应当根据规定向中国保监会派出机构提交专项外部审计报告。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第六十条</strong> 保险经纪人应当按照中国保监会的有关规定及时、准确、完整地报送报告、报表、文件和资料，并根据要求提交相关的电子文本。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪人报送的报告、报表、文件和资料应当由法定代表人、主要负责人或者其授权人签字，并加盖机构印章。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第六十一条</strong> 保险经纪人不得委托未通过本机构进行执业登记的个人从事保险经纪业务。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第六十二条</strong> 保险经纪人应当对保险经纪从业人员进行执业登记信息管理，及时登记个人信息及授权范围等事项以及接受处罚、聘任关系终止等情况，确保执业登记信息的真实、准确、完整。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第六十三条</strong> 保险经纪人及其从业人员在办理保险业务活动中不得有下列行为：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）欺骗保险人、投保人、被保险人或者受益人；</span></p><p><span style="background-color:#fefefe;color:#333333;">（二）隐瞒与保险合同有关的重要情况；</span></p><p><span style="background-color:#fefefe;color:#333333;">（三）阻碍投保人履行如实告知义务，或者诱导其不履行如实告知义务；</span></p><p><span style="background-color:#fefefe;color:#333333;">（四）给予或者承诺给予投保人、被保险人或者受益人保险合同约定以外的利益；</span></p><p><span style="background-color:#fefefe;color:#333333;">（五）利用行政权力、职务或者职业便利以及其他不正当手段强迫、引诱或者限制投保人订立保险合同；</span></p><p><span style="background-color:#fefefe;color:#333333;">（六）伪造、擅自变更保险合同，或者为保险合同当事人提供虚假证明材料；</span></p><p><span style="background-color:#fefefe;color:#333333;">（七）挪用、截留、侵占保险费或者保险金；</span></p><p><span style="background-color:#fefefe;color:#333333;">（八）利用业务便利为其他机构或者个人牟取不正当利益；</span></p><p><span style="background-color:#fefefe;color:#333333;">（九）串通投保人、被保险人或者受益人，骗取保险金；</span></p><p><span style="background-color:#fefefe;color:#333333;">（十）泄露在业务活动中知悉的保险人、投保人、被保险人的商业秘密。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第六十四条</strong> 保险经纪人及其从业人员在开展保险经纪业务过程中，不得索取、收受保险公司或者其工作人员给予的合同约定之外的酬金、其他财物，或者利用执行保险经纪业务之便牟取其他非法利益。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第六十五条</strong> 保险经纪人不得以捏造、散布虚假事实等方式损害竞争对手的商业信誉，不得以虚假广告、虚假宣传或者其他不正当竞争行为扰乱保险市场秩序。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第六十六条</strong> 保险经纪人不得与非法从事保险业务或者保险中介业务的机构或者个人发生保险经纪业务往来。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第六十七条</strong> 保险经纪人不得以缴纳费用或者购买保险产品作为招聘从业人员的条件，不得承诺不合理的高额回报，不得以直接或者间接发展人员的数量或者销售业绩作为从业人员计酬的主要依据。</span></p><p><span style="background-color:#fefefe;color:#333333;">&nbsp;</span></p><p style="text-align:center;"><span style="background-color:#fefefe;color:#333333;"><strong>第四章 市场退出</strong></span></p><p><span style="background-color:#fefefe;color:#333333;">&nbsp;</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第六十八条</strong> 保险经纪公司经营保险经纪业务许可证的有效期为3</span><span style="color:#333333;">年。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪公司应当在许可证有效期届满</span>30日前，按照规定向中国保监会派出机构申请延续许可。</p><p><span style="background-color:#fefefe;color:#333333;"><strong>第六十九条</strong> 保险经纪公司申请延续许可证有效期的，中国保监会派出机构在许可证有效期届满前对保险经纪人前3</span><span style="color:#333333;">年的经营情况进行全面审查和综合评价，并作出是否准予延续许可证有效期的决定。决定不予延续的，应当书面说明理由。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪公司不符合本规定第七条有关经营保险经纪业务的条件，或者不符合法律、行政法规、中国保监会规定的延续保险经纪业务许可应当具备的其他条件的，中国保监会派出机构不予延续许可证有效期。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第七十条</strong> 保险经纪公司应当自收到不予延续许可证有效期的决定之日起10</span><span style="color:#333333;">日内向中国保监会派出机构缴回原证；准予延续有效期的，应当自收到决定之日起10日内领取新许可证。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第七十一条</strong> 保险经纪公司退出保险经纪市场，应当遵守法律、行政法规及其他相关规定。保险经纪公司有下列情形之一的，中国保监会派出机构依法注销许可证，并予以公告：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）许可证有效期届满未延续的；</span></p><p><span style="background-color:#fefefe;color:#333333;">（二）许可证依法被撤回、撤销或者吊销的；</span></p><p><span style="background-color:#fefefe;color:#333333;">（三）因解散或者被依法宣告破产等原因依法终止的；</span></p><p><span style="background-color:#fefefe;color:#333333;">（四）法律、行政法规规定的其他情形。</span></p><p><span style="background-color:#fefefe;color:#333333;">被注销许可证的保险经纪公司应当及时交回许可证原件；许可证无法交回的，中国保监会派出机构在公告中予以说明。</span></p><p><span style="background-color:#fefefe;color:#333333;">被注销许可证的保险经纪公司应当终止其保险经纪业务活动，并自许可证注销之日起</span>15日内书面报告工商注册登记所在地的工商行政管理部门。公司继续存续的，不得从事保险经纪业务，并应当依法办理名称、营业范围和公司章程等事项的工商变更登记，确保其名称中无“保险经纪”字样。</p><p><span style="background-color:#fefefe;color:#333333;"><strong>第七十二条</strong> 有下列情形之一的，保险经纪人应当在5</span><span style="color:#333333;">日内注销保险经纪从业人员执业登记：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）保险经纪从业人员受到禁止进入保险业的行政处罚的；</span></p><p><span style="background-color:#fefefe;color:#333333;">（二）保险经纪从业人员因其他原因终止执业的；</span></p><p><span style="background-color:#fefefe;color:#333333;">（三）保险经纪人停业、解散或者因其他原因不再继续经营保险经纪业务的；</span></p><p><span style="background-color:#fefefe;color:#333333;">（四）法律、行政法规和中国保监会规定的其他情形。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第七十三条</strong> 保险经纪人终止保险经纪业务活动，应当妥善处理债权债务关系，不得损害投保人、被保险人、受益人的合法权益。</span></p><p><span style="background-color:#fefefe;color:#333333;">&nbsp;</span></p><p style="text-align:center;"><span style="background-color:#fefefe;color:#333333;"><strong>第五章 行业自律</strong></span></p><p><span style="background-color:#fefefe;color:#333333;">&nbsp;</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第七十四条</strong> 保险经纪人自愿加入保险中介行业自律组织。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险中介行业自律组织依法制定保险经纪人自律规则，依据法律法规和自律规则，对保险经纪人实行自律管理。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险中介行业自律组织依法制定章程，并按照规定报中国保监会或其派出机构备案。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第七十五条</strong> 保险中介行业自律组织应当根据法律法规、国家有关规定和自律组织章程，组织会员单位及其保险经纪从业人员进行教育培训。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第七十六条</strong> 保险中介行业自律组织应当通过互联网等渠道加强信息披露，并可以组织会员就保险经纪行业的发展、运作及有关内容进行研究，收集整理、发布保险经纪相关信息，提供会员服务，组织行业交流。</span></p><p><span style="background-color:#fefefe;color:#333333;">&nbsp;</span></p><p style="text-align:center;"><span style="background-color:#fefefe;color:#333333;"><strong>第六章 监督检查</strong></span></p><p><span style="background-color:#fefefe;color:#333333;">&nbsp;</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第七十七条</strong> 中国保监会派出机构按照属地原则负责辖区内保险经纪人的监管。</span></p><p><span style="background-color:#fefefe;color:#333333;">中国保监会派出机构应当注重对辖区内保险经纪人的行为监管，依法进行现场检查和非现场监管，并实施行政处罚和其他监管措施。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第七十八条</strong> 中国保监会及其派出机构根据监管需要，可以对保险经纪人高级管理人员及相关人员进行监管谈话，要求其就经营活动中的重大事项作出说明。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第七十九条</strong> 中国保监会及其派出机构根据监管需要，可以委派监管人员列席保险经纪公司的股东会或者股东大会、董事会。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第八十条</strong> 保险经纪公司分支机构经营管理混乱，从事重大违法违规活动的，保险经纪公司应当根据中国保监会及其派出机构的监管要求，对分支机构采取限期整改、停业、撤销等措施。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第八十一条</strong> 中国保监会及其派出机构依法对保险经纪人进行现场检查，主要包括下列内容：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）业务许可及相关事项是否依法获得批准或者履行报告义务；</span></p><p><span style="background-color:#fefefe;color:#333333;">（二）资本金是否真实、足额；</span></p><p><span style="background-color:#fefefe;color:#333333;">（三）保证金是否符合规定；</span></p><p><span style="background-color:#fefefe;color:#333333;">（四）职业责任保险是否符合规定；</span></p><p><span style="background-color:#fefefe;color:#333333;">（五）业务经营是否合法；</span></p><p><span style="background-color:#fefefe;color:#333333;">（六）财务状况是否良好；</span></p><p><span style="background-color:#fefefe;color:#333333;">（七）向中国保监会及其派出机构提交的报告、报表及资料是否及时、完整和真实；</span></p><p><span style="background-color:#fefefe;color:#333333;">（八）内控制度是否符合中国保监会的有关规定；</span></p><p><span style="background-color:#fefefe;color:#333333;">（九）任用高级管理人员和省级分公司以外分支机构主要负责人是否符合规定；</span></p><p><span style="background-color:#fefefe;color:#333333;">（十）是否有效履行从业人员管理职责；</span></p><p><span style="background-color:#fefefe;color:#333333;">（十一）对外公告是否及时、真实；</span></p><p><span style="background-color:#fefefe;color:#333333;">（十二）业务、财务信息管理系统是否符合中国保监会的有关规定；</span></p><p><span style="background-color:#fefefe;color:#333333;">（十三）中国保监会规定的其他事项。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第八十二条</strong> 中国保监会及其派出机构依法履行职责，被检查、调查的单位和个人应当配合。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第八十三条</strong> 中国保监会及其派出机构可以在现场检查中，委托会计师事务所等社会中介机构提供相关服务；委托上述中介机构提供服务的，应当签订书面委托协议。</span></p><p><span style="background-color:#fefefe;color:#333333;">中国保监会及其派出机构应当将委托事项告知被检查的保险经纪人。</span></p><p><span style="background-color:#fefefe;color:#333333;">&nbsp;</span></p><p style="text-align:center;"><span style="background-color:#fefefe;color:#333333;"><strong>第七章 法律责任</strong></span></p><p><br><br>&nbsp;</p><p><span style="background-color:#fefefe;color:#333333;"><strong>第八十四条</strong> 未取得许可证，非法从事保险经纪业务的，由中国保监会及其派出机构予以取缔，没收违法所得，并处违法所得1</span><span style="color:#333333;">倍以上5倍以下罚款；没有违法所得或者违法所得不足5万元的，处5万元以上30万元以下罚款。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第八十五条</strong> 行政许可申请人隐瞒有关情况或者提供虚假材料申请保险经纪业务许可或者申请其他行政许可的，中国保监会及其派出机构不予受理或者不予批准，并给予警告，申请人在1</span><span style="color:#333333;">年内不得再次申请该行政许可。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第八十六条</strong> 被许可人通过欺骗、贿赂等不正当手段取得保险经纪业务许可或者其他行政许可的，由中国保监会及其派出机构予以撤销，并依法给予行政处罚；申请人在3</span><span style="color:#333333;">年内不得再次申请该行政许可。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第八十七条</strong> 保险经纪人聘任不具有任职资格的人员的，由中国保监会及其派出机构责令改正，处2</span><span style="color:#333333;">万元以上10万元以下罚款；对该机构直接负责的主管人员和其他直接责任人员，给予警告，并处1万元以上10万元以下罚款，情节严重的，撤销任职资格。</span></p><p><span style="background-color:#fefefe;color:#333333;">保险经纪人未按规定聘任省级分公司以外分支机构主要负责人或者未按规定任命临时负责人的，由中国保监会及其派出机构责令改正，给予警告，并处</span>1万元以下罚款;对该机构直接负责的主管人员和其他直接责任人员，给予警告，并处1万元以下罚款。</p><p><span style="background-color:#fefefe;color:#333333;"><strong>第八十八条</strong> 保险经纪人未按规定聘任保险经纪从业人员，或者未按规定进行执业登记和管理的，由中国保监会及其派出机构责令改正，给予警告，并处1</span><span style="color:#333333;">万元以下罚款；对该机构直接负责的主管人员和其他直接责任人员，给予警告，并处1万元以下罚款。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第八十九条</strong> 保险经纪人出租、出借或者转让许可证的，由中国保监会及其派出机构责令改正，处1</span><span style="color:#333333;">万元以上10万元以下罚款；情节严重的，责令停业整顿或者吊销许可证；对该机构直接负责的主管人员和其他直接责任人员，给予警告，并处1万元以上10万元以下罚款，情节严重的，撤销任职资格。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第九十条</strong> 保险经纪人在许可证使用过程中，有下列情形之一的，由中国保监会及其派出机构责令改正，给予警告，没有违法所得的，处1</span><span style="color:#333333;">万元以下罚款，有违法所得的，处违法所得3倍以下罚款，但最高不得超过3万元；对该机构直接负责的主管人员和其他直接责任人员，给予警告，并处1万元以下罚款：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）未按规定在住所或者营业场所放置许可证或者其复印件；</span></p><p><span style="background-color:#fefefe;color:#333333;">（二）未按规定办理许可证变更登记；</span></p><p><span style="background-color:#fefefe;color:#333333;">（三）未按规定交回许可证；</span></p><p><span style="background-color:#fefefe;color:#333333;">（四）未按规定进行公告。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第九十一条</strong> 保险经纪人有下列情形之一的，由中国保监会及其派出机构责令改正，处2</span><span style="color:#333333;">万元以上10万元以下罚款；情节严重的，责令停业整顿或者吊销许可证；对该机构直接负责的主管人员和其他直接责任人员，给予警告，并处1万元以上10万元以下罚款，情节严重的，撤销任职资格：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）未按规定缴存保证金或者投保职业责任保险的；</span></p><p><span style="background-color:#fefefe;color:#333333;">（二）未按规定设立专门账簿记载业务收支情况的。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第九十二条</strong> 保险经纪人超出规定的业务范围、经营区域从事业务活动的，或者与非法从事保险业务或者保险中介业务的单位或者个人发生保险经纪业务往来的，由中国保监会及其派出机构责令改正，给予警告，没有违法所得的，处1</span><span style="color:#333333;">万元以下罚款，有违法所得的，处违法所得3倍以下罚款，但最高不得超过3万元；对该机构直接负责的主管人员和其他直接责任人员，给予警告，并处1万元以下罚款。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第九十三条</strong> 保险经纪人违反本规定第三十七条，由中国保监会及其派出机构责令改正，给予警告，没有违法所得的，处1</span><span style="color:#333333;">万元以下罚款，有违法所得的，处违法所得3倍以下罚款，但最高不得超过3万元；对该机构直接负责的主管人员和其他直接责任人员，给予警告，并处1万元以下罚款。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第九十四条</strong> 保险经纪人违反本规定第四十七条，由中国保监会及其派出机构责令改正，给予警告，并处1</span><span style="color:#333333;">万元以下罚款；对该机构直接负责的主管人员和其他直接责任人员，给予警告，并处1万元以下罚款。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第九十五条</strong> 保险经纪人违反本规定第五十条，由中国保监会及其派出机构责令改正，给予警告，并处1</span><span style="color:#333333;">万元以下罚款；对该机构直接负责的主管人员和其他直接责任人员，给予警告，并处1万元以下罚款。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第九十六条</strong> 保险经纪人有本规定第六十三条所列情形之一的，由中国保监会及其派出机构责令改正，处5</span><span style="color:#333333;">万元以上30万元以下罚款；情节严重的，吊销许可证；对该机构直接负责的主管人员和其他直接责任人员，给予警告，并处1万元以上10万元以下罚款，情节严重的，撤销任职资格。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第九十七条</strong> 保险经纪人违反本规定第六十四条，由中国保监会及其派出机构责令改正，给予警告，并处1</span><span style="color:#333333;">万元以下罚款；对该机构直接负责的主管人员和其他直接责任人员，给予警告，并处1万元以下罚款。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第九十八条</strong> 保险经纪人违反本规定第六十五条、第六十七条，由中国保监会及其派出机构责令改正，给予警告，没有违法所得的，处1</span><span style="color:#333333;">万元以下罚款，有违法所得的，处违法所得3倍以下罚款，但最高不得超过3万元；对该机构直接负责的主管人员和其他直接责任人员，给予警告，并处1万元以下罚款。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第九十九条</strong> 保险经纪人未按本规定报送或者保管报告、报表、文件、资料的，或者未按规定提供有关信息、资料的，由中国保监会及其派出机构责令限期改正；逾期不改正的，处1</span><span style="color:#333333;">万元以上10万元以下罚款；对该机构直接负责的主管人员和其他直接责任人员，给予警告，并处1万元以上10万元以下罚款，情节严重的，撤销任职资格。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第一百条</strong> 保险经纪人有下列情形之一的，由中国保监会及其派出机构责令改正，处10</span><span style="color:#333333;">万元以上50万元以下罚款；情节严重的，可以限制其业务范围、责令停止接受新业务或者吊销许可证；对该机构直接负责的主管人员和其他直接责任人员，给予警告，并处1万元以上10万元以下罚款，情节严重的，撤销任职资格：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）编制或者提供虚假的报告、报表、文件或者资料；</span></p><p><span style="background-color:#fefefe;color:#333333;">（二）拒绝、妨碍依法监督检查。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第一百零一条</strong> 保险经纪人有下列情形之一的，由中国保监会及其派出机构责令改正，给予警告，没有违法所得的，处1</span><span style="color:#333333;">万元以下罚款，有违法所得的，处违法所得3倍以下罚款，但最高不得超过3万元；对该机构直接负责的主管人员和其他直接责任人员，给予警告，并处1万元以下罚款：</span></p><p><span style="background-color:#fefefe;color:#333333;">（一）未按规定托管注册资本；</span></p><p><span style="background-color:#fefefe;color:#333333;">（二）未按规定设立分支机构经营保险经纪业务；</span></p><p><span style="background-color:#fefefe;color:#333333;">（三）未按规定开展互联网保险经纪业务；</span></p><p><span style="background-color:#fefefe;color:#333333;">（四）未按规定开展再保险经纪业务；</span></p><p><span style="background-color:#fefefe;color:#333333;">（五）未按规定建立或者管理业务档案；</span></p><p><span style="background-color:#fefefe;color:#333333;">（六）未按规定使用银行账户；</span></p><p><span style="background-color:#fefefe;color:#333333;">（七）违反规定动用保证金；</span></p><p><span style="background-color:#fefefe;color:#333333;">（八）未按规定进行信息披露；</span></p><p><span style="background-color:#fefefe;color:#333333;">（九）未按规定缴纳监管费。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第一百零二条</strong> 违反法律和行政法规的规定，情节严重的，中国保监会及其派出机构可以禁止有关责任人员一定期限直至终身进入保险业。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第一百零三条</strong> 保险经纪人的高级管理人员、省级分公司以外分支机构主要负责人或者从业人员，离职后被发现在原工作期间违反中国保监会及其派出机构有关规定的，应当依法追究其责任。</span></p><p><span style="background-color:#fefefe;color:#333333;">&nbsp;</span></p><p style="text-align:center;"><span style="background-color:#fefefe;color:#333333;"><strong>第八章 附 则</strong></span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第一百零四条</strong> 本规定所称保险专业中介机构是指保险专业代理机构、保险经纪人和保险公估人。</span></p><p><span style="background-color:#fefefe;color:#333333;">本规定所称保险中介机构是指保险专业中介机构和保险兼业代理机构。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第一百零五条</strong> 经中国保监会批准经营保险经纪业务的外资保险经纪人适用本规定，我国参加的有关国际条约和中国保监会另有规定的，适用其规定。</span></p><p><span style="background-color:#fefefe;color:#333333;">采取公司以外的组织形式的保险经纪人的设立和管理参照适用本规定，中国保监会另有规定的，适用其规定。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第一百零六条</strong> 本规定施行前依法设立的保险经纪公司继续保留，不完全具备本规定条件的，具体适用办法由中国保监会另行规定。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第一百零七条</strong> 本规定要求提交的各种表格格式由中国保监会制定。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第一百零八条</strong> 本规定有关“5</span><span style="color:#333333;">日”“10日”“15日”“20日”的规定是指工作日，不含法定节假日。</span></p><p><span style="background-color:#fefefe;color:#333333;">本规定所称“以上”“以下”均含本数。</span></p><p><span style="background-color:#fefefe;color:#333333;"><strong>第一百零九条</strong> 本规定自2018</span><span style="color:#333333;">年5月1日起施行，中国保监会2009年9月25日发布的《保险经纪机构监管规定》（保监会令2009年第6号）、2013年1月6日发布的《保险经纪从业人员、保险公估从业人员监管办法》（保监会令2013年第3号）、2013年4月27日发布的《中国保险监督管理委员会关于修改〈保险经纪机构监管规定〉的决定》（保监会令2013年第6号）同时废止。</span></p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 07:23:26	2024-10-14 07:23:26	\N	\N	\N	\N
17	\N	\N	\N	银行保险机构许可证管理办法	<p style="text-align:center;"><span style="background-color:#ffffff;color:#333333;">(2021</span><span style="color:#333333;">年4月28日中国银行保险监督管理委员会令2021年第3号公布 自2021年7月1日起施行)</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第一条 为了加强银行保险机构许可证管理，促进银行保险机构依法经营，根据《中华人民共和国行政许可法》《中华人民共和国银行业监督管理法》《中华人民共和国商业银行法》《中华人民共和国保险法》等有关法律规定，制定本办法。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第二条 本办法所称许可证是指中国银行保险监督管理委员会（以下简称银保监会）依法颁发的特许银行保险机构经营金融业务的法律文件。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">许可证的颁发、换发、收缴等由银保监会及其授权的派出机构依法行使，其他任何单位和个人不得行使上述职权。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第三条 本办法所称银行保险机构包括政策性银行、大型银行、股份制银行、城市商业银行、民营银行、外资银行、农村中小银行机构等银行机构及其分支机构，保险集团（控股）公司、保险公司、保险资产管理公司、金融资产管理公司、信托公司、企业集团财务公司、金融租赁公司、汽车金融公司、货币经纪公司、消费金融公司、银行理财公司、金融资产投资公司以及经银保监会及其派出机构批准设立的其他非银行金融机构及其分支机构，保险代理集团（控股）公司、保险经纪集团（控股）公司、保险专业代理公司、保险经纪公司、保险兼业代理机构等保险中介机构。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">上述银行保险机构开展金融业务，应当依法取得许可证和市场监督管理部门颁发的营业执照。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第四条<strong> </strong>本办法所称许可证包括下列几种类型：</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（一）金融许可证；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（二）保险许可证；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（三）保险中介许可证。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">金融许可证适用于政策性银行、大型银行、股份制银行、城市商业银行、民营银行、外资银行、农村中小银行机构等银行机构及其分支机构，以及金融资产管理公司、信托公司、企业集团财务公司、金融租赁公司、汽车金融公司、货币经纪公司、消费金融公司、银行理财公司、金融资产投资公司等非银行金融机构及其分支机构。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">保险许可证适用于保险集团（控股）公司、保险公司、保险资产管理公司等保险机构及其分支机构。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">保险中介许可证适用于保险代理集团（控股）公司、保险经纪集团（控股）公司、保险专业代理公司、保险经纪公司、保险兼业代理机构等保险中介机构。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第五条 银保监会对银行保险机构许可证实行分级管理。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">银保监会负责其直接监管的政策性银行、大型银行、股份制银行、外资银行，保险集团（控股）公司、保险公司、保险资产管理公司、保险代理集团（控股）公司、保险经纪集团（控股）公司，金融资产管理公司、银行理财公司、金融资产投资公司、保险兼业代理机构等银行保险机构许可证的颁发与管理。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">银保监会派出机构根据上级管理单位授权，负责辖内银行保险机构许可证的颁发与管理。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第六条 银保监会及其派出机构根据行政许可决定或备案、报告信息向银行保险机构颁发、换发、收缴许可证。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">经批准设立的银行保险机构应当自收到行政许可决定之日起</span><span style="color:#333333;">10日内到银保监会或其派出机构领取许可证。对于采取备案或报告管理的机构设立事项，银行保险机构应当在完成报告或备案后10日内到银保监会或其派出机构领取许可证。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第七条 许可证载明下列内容：</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（一）机构编码；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（二）机构名称；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（三）业务范围；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（四）批准日期；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（五）机构住所；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（六）颁发许可证日期；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（七）发证机关。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">机构编码按照银保监会有关编码规则确定。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">金融许可证和保险许可证的批准日期为机构批准设立日期。保险中介许可证的批准日期为保险中介业务资格批准日期。对于采取备案或报告管理的机构设立事项，批准日期为发证机关收到完整备案或报告材料的日期。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第八条<strong> </strong>银行保险机构领取许可证时，应当提交下列材料：</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（一）银行保险机构介绍信或委托书；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（二）领取许可证人员的合法有效身份证明。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第九条<strong> </strong>许可证记载事项发生变更的，银行保险机构应当向发证机关缴回原证，并领取新许可证。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">前款所称事项变更须经发证机关许可的，银行保险机构应当自收到行政许可决定之日起</span><span style="color:#333333;">10日内到发证机关领取新许可证。前款所称变更事项须向发证机关备案或报告的，银行保险机构应当在完成备案或报告后10日内到发证机关领取新许可证。前款所称变更事项无须许可或备案、报告的，银行保险机构应当自变更之日起15日内到发证机关领取新许可证。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第十条 许可证破损的，银行保险机构应当自发现之日起7</span><span style="color:#333333;">日内向发证机关缴回原证，并领取新许可证。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第十一条 许可证遗失，银行保险机构应立即报告发证机关，并于发现之日起7</span><span style="color:#333333;">日内发布遗失声明公告、重新领取许可证。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">报告内容包括机构名称、地址、批准日期，许可证流水号、编码、颁发日期，当事人、失控的时间、地点、事发原因、过程等情况。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">发布遗失声明公告的方式同新领、换领许可证。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">许可证遗失的，银行保险机构向发证机关领取新许可证时，除应提交本办法第八条规定的材料外，还应当提交遗失声明公告及对该事件的处理结果报告。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第十二条<strong> </strong>银行保险机构行政许可被撤销，被吊销许可证，或者机构解散、关闭、被撤销、被宣告破产的，应当在收到银保监会及其派出机构有关文件、法律文书或人民法院宣告破产裁定书之日起15</span><span style="color:#333333;">日内，将许可证缴回发证机关；逾期不缴回的，由发证机关在缴回期满后5日内依法收缴。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第十三条<strong> </strong>新领、换领许可证，银行保险机构应于30</span><span style="color:#333333;">日内进行公告。银行保险机构应采取下列一种或多种方式进行公告：</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（一）在公开发行报刊上公告；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（二）在银行保险机构官方网站上公告；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（三）其他有效便捷的公告方式。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">公告的具体内容应当包括：事由、机构名称、机构住所、机构编码、联系电话。公告的知晓范围应至少与机构开展业务经营的地域范围相匹配。银行保险机构应保留相关公告材料备查。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第十四条<strong> </strong>银行保险机构应当在营业场所的显著位置公示许可证原件。保险中介机构分支机构应当在营业场所的显著位置公示加盖法人机构公章的许可证复印件。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">银行保险机构应当依据行政许可决定文件和上级管理单位授权文件，在营业场所的显著位置以适当方式公示其业务范围、经营区域、主要负责人。通过网络平台开展业务的，应当在相关网络页面及功能模块以清晰、醒目的方式展示上述内容。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">上述公示事项内容发生变更，银行保险机构应当自变更之日起</span><span style="color:#333333;">10日内更换公示内容。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第十五条 银行保险机构应当妥善保管和依法使用许可证。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">任何单位和个人不得伪造、变造、转让、出租、出借银行保险机构许可证。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第十六条 银保监会及其派出机构应当加强银行保险机构许可证的信息管理，建立完善的许可证管理信息系统，依法披露许可证的有关信息。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第十七条 银保监会及其派出机构依法对银行保险机构许可证管理、公告和公示等情况进行监督与检查。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第十八条 银行保险机构违反本办法，有下列情形之一的，依照《中华人民共和国银行业监督管理法》《中华人民共和国商业银行法》《中华人民共和国保险法》有关规定进行处罚；法律、行政法规没有规定的，由银保监会及其派出机构责令改正，予以警告，对有违法所得的处以违法所得一倍以上三倍以下罚款，但最高不超过三万元，对没有违法所得的处以一万元以下罚款；构成犯罪的，依法追究刑事责任：</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（一）转让、出租、出借、伪造、变造许可证；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（二）未按规定新领、换领、缴回许可证；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（三）损坏许可证；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（四）因管理不善导致许可证遗失；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（五）遗失许可证未按规定向发证机关报告；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（六）未按规定公示许可证、业务范围、经营区域、主要负责人；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（七）新领、换领许可证等未按规定进行公告；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">（八）新领、换领许可证后未按规定向市场监督管理部门办理登记，领取、换领营业执照。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第十九条<strong> </strong>银行保险机构许可证由银保监会统一印制和管理。颁发时加盖发证机关的单位印章方可生效。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">银保监会及其派出机构应按照行政审批与许可证管理适当分离的原则，对许可证进行专门管理。许可证保管、打印、颁发等职能应相互分离、相互制约，同时建立许可证颁发、收缴、销毁登记制度。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">对于许可证颁发管理过程中产生的废证、收回的旧证、依法缴回和吊销的许可证，应加盖“作废”章，作为重要凭证专门收档，定期销毁。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第二十条 银保监会根据电子证照相关法律法规、国家标准和全国一体化在线政务服务平台标准，制定银行保险机构许可证电子证照标准，推进银行保险机构许可证电子化。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">银行保险机构许可证电子证的签发、使用、管理等，按国家和银保监会有关规定执行。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第二十一条 本办法规定的有关期限，均以工作日计算。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#333333;">第二十二条<strong> </strong>本办法由银保监会负责解释。本办法自2021</span><span style="color:#333333;">年7月1日起施行，《金融许可证管理办法》（银监会令2007年第8号修订）和《保险许可证管理办法》（保监会令2007年第1号）同时废止。</span></p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 07:24:03	2024-10-14 07:24:03	\N	\N	\N	\N
18	\N	\N	\N	保险销售行为管理办法	<p style="text-align:center;"><span style="background-color:#fefefe;color:#333333;">保险销售行为管理办法</span></p><p style="text-align:center;"><span style="background-color:#fefefe;color:#333333;">(2023</span><span style="color:#333333;">年9月20日国家金融监督管理总局令2023年第2号公布 自2024年3月1日起施行)</span></p><p style="text-align:center;"><span style="background-color:#fefefe;color:#666666;">第一章 总 则</span></p><p><span style="background-color:#fefefe;color:#666666;">第一条 为保护投保人、被保险人、受益人的合法权益，规范保险销售行为，统一保险销售行为监管要求，根据《中华人民共和国保险法》《国务院办公厅关于加强金融消费者权益保护工作的指导意见》等法律、行政法规和文件，制定本办法。</span></p><p><span style="background-color:#fefefe;color:#666666;">第二条 保险公司为订立保险合同所开展的销售行为，保险中介机构、保险销售人员受保险公司委托或者与保险公司合作为订立保险合同所开展的销售行为，应当遵守本办法的规定。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">本办法所称保险公司不包括再保险公司。</span></p><p><span style="background-color:#fefefe;color:#666666;">本办法所称保险中介机构包括：保险代理机构和保险经纪人。保险代理机构包括专业代理机构和兼业代理机构。</span></p><p><span style="background-color:#fefefe;color:#666666;">本办法所称保险销售人员包括：保险公司中从事保险销售的员工、个人保险代理人及纳入销售人员管理的其他用工形式的人员，保险代理机构中从事保险代理的人员，保险经纪人中从事保险经纪业务的人员。</span></p><p><span style="background-color:#fefefe;color:#666666;">第三条 除下列机构和人员外，其他机构和个人不得从事保险销售行为：</span></p><p><span style="background-color:#fefefe;color:#666666;">（一）保险公司和保险中介机构；</span></p><p><span style="background-color:#fefefe;color:#666666;">（二）保险销售人员。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险公司、保险中介机构应当为其所属的保险销售人员办理执业登记。</span></p><p><span style="background-color:#fefefe;color:#666666;">第四条 保险销售行为应当遵循依法合规、平等自愿、公平适当、诚实守信等原则，尊重和保障投保人、被保险人、受益人的合法权益。</span></p><p><span style="background-color:#fefefe;color:#666666;">第五条 本办法所称保险销售行为包括保险销售前行为、保险销售中行为和保险销售后行为。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险销售前行为是指保险公司及受其委托或者与其合作的保险中介机构、保险销售人员为订立保险合同创造环境、准备条件、招揽保险合同相对人的行为。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险销售中行为是指保险公司及受其委托或者与其合作的保险中介机构、保险销售人员与特定相对人为订立保险合同就合同内容进行沟通、商谈，作出要约或承诺的行为。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险销售后行为是指保险公司及受其委托或者与其合作的保险中介机构、保险销售人员履行依照法律法规和监管制度规定的以及基于保险合同订立而产生的保单送达、回访、信息通知等附随义务的行为。</span></p><p><span style="background-color:#fefefe;color:#666666;">第六条 保险公司、保险中介机构应当以适当方式、通俗易懂的语言定期向公众介绍保险知识、发布保险消费风险提示，重点讲解保险条款中的专业性词语、集中性疑问、容易引发争议纠纷的行为以及保险消费中的各类风险等内容。</span></p><p><span style="background-color:#fefefe;color:#666666;">第七条 保险公司、保险中介机构应当按照合法、正当、必要、诚信的原则收集处理投保人、被保险人、受益人以及保险业务活动相关当事人的个人信息，并妥善保管，防止信息泄露；未经该个人同意，保险公司、保险中介机构、保险销售人员不得向他人提供该个人的信息，法律法规规章另有规定以及开展保险业务所必需的除外。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险公司、保险中介机构应当加强对与其合作的其他机构收集处理投保人、被保险人、受益人以及保险业务活动相关当事人个人信息的行为管控，在双方合作协议中明确其他机构的信息收集处理行为要求，定期了解其他机构执行协议要求情况，发现其他机构存在违反协议要求情形时，应当及时采取措施予以制止和督促纠正，并依法追究该机构责任。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">第八条 保险公司、保险中介机构应当履行销售管理主体责任，建立健全保险销售各项管理制度，加强对与其有委托代理关系的保险销售人员身份和保险销售业务真实性管理，定期自查、评估制度有效性和落实情况；应当明确各级机构及其高级管理人员销售管理责任，建立销售制度执行、销售管控和内部责任追究机制，不得违法违规开展保险销售业务，不得利用开展保险销售业务为其他机构或者个人牟取不正当利益。</span></p><p><span style="background-color:#fefefe;color:#666666;">第九条 具有保险销售业务合作关系的保险公司、保险中介机构应当在相关协议中确定合作范围，明确双方的权利义务。保险公司与保险中介机构的保险销售业务合作关系应当真实，不得通过虚假合作套取费用。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险中介机构应当依照相关法律法规规定及双方业务合作约定，并以相关业务开展所必需为限，将所销售的保险业务相关信息以及投保人、被保险人、受益人信息如实完整及时地提供给与其具有保险销售业务合作关系的保险公司，以利于保险公司与投保人订立保险合同。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险公司应当支持与其具有保险销售业务合作关系的保险中介机构为投保人提供专业服务，依照相关法律法规规定及双方业务合作约定，并以相关业务开展所必需为限，将该保险中介机构所销售的保险业务相关保单存续期管理信息如实完整及时地提供给该保险中介机构，以利于该保险中介机构为投保人提供后续服务。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险公司应当加强对与其具有保险销售业务合作关系的保险中介机构保险销售行为合规性监督，定期了解该保险中介机构在合作范围内的保险销售行为合规情况，发现该保险中介机构在从事保险销售中存在违反法律法规及合作协议要求情形时，应当及时采取措施予以制止和督促纠正，并依法追究该保险中介机构责任。</span></p><p><span style="background-color:#fefefe;color:#666666;">具有保险销售业务合作关系的保险公司、保险中介机构应当通过技术手段，实现双方业务信息系统的互联互通、数据对接。</span></p><p><span style="background-color:#fefefe;color:#666666;">第十条 国家金融监督管理总局（以下简称金融监管总局）依据《中华人民共和国保险法》，对保险销售行为履行监督管理职责。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">金融监管总局派出机构依据授权对保险销售行为履行监督管理职责。</span></p><p style="text-align:center;"><span style="background-color:#fefefe;color:#666666;">第二章 保险销售前行为管理</span></p><p><span style="background-color:#fefefe;color:#666666;">第十一条 保险公司、保险中介机构不得超出法律法规和监管制度规定以及监管机构批准核准的业务范围和区域范围从事保险销售行为。保险销售人员不得超出所属机构的授权范围从事保险销售行为。</span></p><p><span style="background-color:#fefefe;color:#666666;">第十二条 保险公司、保险中介机构开展保险销售行为，应当具备相应的业务、财务、人员等信息管理系统和核心业务系统，确保系统数据准确、完整、更新及时，并与监管机构要求录入各类监管信息系统中的数据信息保持一致。</span></p><p><span style="background-color:#fefefe;color:#666666;">第十三条 保险公司应当依法依规制订保险合同条款，不得违反法律法规和监管制度规定，确保保险合同双方权利义务公平合理；按照要素完整、结构清晰、文字准确、表述严谨、通俗易懂等原则制订保险合同条款，推进合同文本标准化。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险合同及相关文件中使用的专业名词术语，其含义应当符合国家标准、行业标准或者通用标准。</span></p><p><span style="background-color:#fefefe;color:#666666;">第十四条 保险公司应当按照真实、准确、完整的原则，在其官方网站、官方APP</span><span style="color:#666666;">等官方线上平台公示本公司现有保险产品条款信息和该保险产品说明。保险产品说明应当重点突出该产品所使用条款的审批或者备案名称、保障范围、保险期间、免除或者减轻保险人责任条款以及保单预期利益等内容。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险产品条款发生变更的，保险公司应当于变更条款正式实施前更新所对外公示的该保险产品条款信息和该保险产品说明。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险公司决定停止使用保险产品条款的，除法律法规及监管制度另有规定的外，应当在官方线上平台显著位置和营业场所公告，并在公示的该保险产品条款信息和该保险产品说明的显著位置标明停止使用的起始日期，该起始日期不得早于公告日期。</span></p><p><span style="background-color:#fefefe;color:#666666;">第十五条 保险公司应当建立保险产品分级管理制度，根据产品的复杂程度、保险费负担水平以及保单利益的风险高低等标准，对本机构的保险产品进行分类分级。</span></p><p><span style="background-color:#fefefe;color:#666666;">第十六条 保险公司、保险中介机构应当支持行业自律组织发挥优势推动保险销售人员销售能力分级工作，在行业自律组织制定的销售能力分级框架下，结合自身实际情况建立本机构保险销售能力资质分级管理体系，以保险销售人员的专业知识、销售能力、诚信水平、品行状况等为主要标准，对所属保险销售人员进行分级，并与保险公司保险产品分级管理制度相衔接，区分销售能力资质实行差别授权，明确所属各等级保险销售人员可以销售的保险产品。</span></p><p><span style="background-color:#fefefe;color:#666666;">第十七条 保险公司、保险中介机构应当建立保险销售宣传管理制度，确保保险销售宣传符合下列要求：</span></p><p><span style="background-color:#fefefe;color:#666666;">（一）在形式上和实质上未超出保险公司、保险中介机构合法经营资质所载明的业务许可范围及区域；</span></p><p><span style="background-color:#fefefe;color:#666666;">（二）明示所销售宣传的是保险产品；</span></p><p><span style="background-color:#fefefe;color:#666666;">（三）不得引用不真实、不准确的数据和资料，不得隐瞒限制条件，不得进行虚假或者夸大表述，不得使用偷换概念、不当类比、隐去假设等不当宣传手段；</span></p><p><span style="background-color:#fefefe;color:#666666;">（四）不得以捏造、散布虚假事实等手段恶意诋毁竞争对手，不得通过不当评比、不当排序等方式进行宣传，不得冒用、擅自使用与他人相同或者近似等可能引起混淆的注册商标、字号、宣传册页；</span></p><p><span style="background-color:#fefefe;color:#666666;">（五）不得利用监管机构对保险产品的审核或者备案程序，不得使用监管机构为该保险产品提供保证等引人误解的不当表述；</span></p><p><span style="background-color:#fefefe;color:#666666;">（六）不得违反法律、行政法规和监管制度规定的其他行为。</span></p><p><span style="background-color:#fefefe;color:#666666;">第十八条 保险销售人员未经授权不得发布保险销售宣传信息。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险公司、保险中介机构对所属保险销售人员发布保险销售宣传信息的行为负有管理主体责任，对保险销售人员发布的保险销售宣传信息，应当进行事前审核及授权发布；发现保险销售人员自行编发或者转载未经其审核授权发布的保险销售宣传信息的，应当及时予以制止并采取有效措施进行处置。</span></p><p><span style="background-color:#fefefe;color:#666666;">第十九条 保险公司决定停止销售某一保险产品或者调整某一保险产品价格的，应当在官方线上平台显著位置和营业场所公告，但保险公司在经审批或者备案的费率浮动区间或者费率参数调整区间内调整价格的除外。公告内容应当包括停止销售或者调整价格的保险产品名称、停止销售或者价格调整的起始日期等信息，其中起始日期不得早于公告日期。</span></p><p><span style="background-color:#fefefe;color:#666666;">前款公告的停止销售或者调整价格的起始日期经过后，保险公司应当按照公告内容停止销售相应保险产品或者调整相应保险产品价格。</span></p><p><span style="background-color:#fefefe;color:#666666;">在保险公司未就某一保险产品发出停止销售或者调整价格的公告前，保险销售人员不得在保险销售中向他人宣称某一保险产品即将停止销售或者调整价格。</span></p><p><span style="background-color:#fefefe;color:#666666;">第二十条 保险公司、保险中介机构应当加强保险销售渠道业务管理，落实对保险销售渠道业务合规性的管控责任，完善保险销售渠道合规监督，不得利用保险销售渠道开展违法违规活动。</span></p><p style="text-align:center;"><span style="background-color:#fefefe;color:#666666;">第三章 保险销售中行为管理</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">第二十一条 保险公司应当通过合法方式，了解投保人的保险需求、风险特征、保险费承担能力、已购买同类保险的情况以及其他与销售保险产品相关的信息，根据前述信息确定该投保人可以购买本公司保险产品类型和等级范围，并委派合格保险销售人员销售该等级范围内的保险产品。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险中介机构应当协助所合作的保险公司了解前款规定的投保人相关信息，并按照所合作保险公司确定的该投保人可以购买的保险产品类型和等级范围，委派合格保险销售人员销售该等级范围内的保险产品。</span></p><p><span style="background-color:#fefefe;color:#666666;">第二十二条 保险公司、保险中介机构销售人身保险新型产品的，应当向投保人提示保单利益的不确定性，并准确、全面地提示相关风险；法律、行政法规和监管制度规定要求对投保人进行风险承受能力测评的，应当进行测评，并根据测评结果销售相适应的保险产品。</span></p><p><span style="background-color:#fefefe;color:#666666;">第二十三条 保险公司、保险中介机构及其保险销售人员不得使用强制搭售、信息系统或者网页默认勾选等方式与投保人订立保险合同。</span></p><p><span style="background-color:#fefefe;color:#666666;">前款所称强制搭售是指因保险公司、保险中介机构的原因，致使投保人不能单独就某一个保险产品或者产品组合与保险公司订立保险合同的情形，以及自然人、法人、非法人组织在购买某一非保险类金融产品或者金融服务时，在未被告知保险产品或者保险服务的存在、未被提供自主选择权利行使条件的情况下，被要求必须同时与指定保险公司就指定保险产品订立保险合同的情形。</span></p><p><span style="background-color:#fefefe;color:#666666;">第二十四条 保险公司、保险中介机构以互联网方式销售保险产品的，应当向对方当事人提示本机构足以识别的名称。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险销售人员以面对面方式销售保险产品的，应当向对方当事人出示执业证件；以非面对面方式销售保险产品的，应当向对方当事人说明本人姓名、所属保险公司或者保险中介机构全称、本人执业证件编号。</span></p><p><span style="background-color:#fefefe;color:#666666;">第二十五条 订立保险合同，采用保险公司提供的格式条款的，保险公司或者受其委托及与其合作的保险中介机构、保险销售人员应当在投保人投保前以适当方式向投保人提供格式条款及该保险产品说明，并就以下内容向投保人作出明确提示：</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">（一）双方订立的是保险合同；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">（二）保险合同的基本内容，包括保险产品名称、主要条款、保障范围、保险期间、保险费及交费方式、赔偿限额、免除或者减轻保险人责任的条款、索赔程序、退保及其他费用扣除、人身保险的现金价值、犹豫期、宽限期、等待期、保险合同效力中止与恢复等；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">（三）提示投保人违反如实告知义务的后果；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">（四）保险公司、保险中介机构服务电话，以及咨询、报案、投诉等的途径方式；</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">（五）金融监管总局规定的其他提示内容。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">保险公司、保险中介机构在销售保险产品时，经投保人同意，对于权利义务简单且投保人在三个月内再次投保同一保险公司的同一保险产品的，可以合理简化相应的提示内容。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">第二十六条 订立保险合同时，保险公司及受其委托及与其合作的保险中介机构、保险销售人员应当对免除或者减轻保险人责任的条款，以足以引起投保人注意的文字、字体、符号或者其他明显标志作出提示，并对有关免除保险人责任条款的概念、内容及其法律后果以书面或者口头形式向投保人作出明确的常人能够理解的解释说明。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">免除或者减轻保险人责任的条款包括责任免除条款、免赔额、免赔率、比例赔付或者给付等。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">第二十七条 订立保险合同，保险公司应当提示投保人履行如实告知义务。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">保险公司及受其委托及与其合作的保险中介机构、保险销售人员应当就保险标的或者被保险人的有关情况提出有具体内容的询问，以投保单询问表方式进行询问的，投保单询问表中不得有概括性条款，但该概括性条款有具体内容的除外。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">投保人的如实告知义务限于保险公司及受其委托的保险中介机构、保险销售人员询问范围和内容，法律法规另有规定的除外。</span></p><p><span style="background-color:#fefefe;color:#666666;">第二十八条 保险公司、保险中介机构、保险销售人员在销售保险时，发现投保人具有下列情形之一的，应当建议投保人终止投保：</span></p><p><span style="background-color:#fefefe;color:#666666;">（一）投保人的保险需求与所销售的保险产品明显不符的；</span></p><p><span style="background-color:#fefefe;color:#666666;">（二）投保人持续承担保险费的能力明显不足的；</span></p><p><span style="background-color:#fefefe;color:#666666;">（三）投保人已购买以补偿损失为目的的同类型保险，继续投保属于重复保险或者超额保险的。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">投保人不接受终止投保建议，仍然要求订立保险合同的，保险公司、保险中介机构应当向投保人说明有关风险，并确认销售行为的继续是出于投保人的自身意愿。</span></p><p><span style="background-color:#fefefe;color:#666666;">第二十九条 保险公司、保险中介机构应当按照有关法律法规和监管制度规定，要求投保人以书面或者其他可保存的形式，签署或者确认投保声明、投保提示书、免除或者减轻保险人责任条款的说明等文件，以及监管规定的相关文书材料。通过电话销售保险的，可以以签署投保单或者电话录音等方式确认投保人投保意愿。通过互联网开展保险销售的，可以通过互联网保险销售行为可回溯方式确认投保人投保意愿，并符合监管制度规定。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">投保文书材料应当由投保人或者其书面委托的人员以签字、盖章或者其他法律法规认可的方式进行确认。保险销售人员不得代替保险业务活动相关当事人在订立保险合同的有关文书材料中确认。</span></p><p><span style="background-color:#fefefe;color:#666666;">第三十条 保险公司、保险中介机构应当严格按照经金融监管总局及其派出机构审批或者备案的保险条款和保险费率销售保险产品。</span></p><p><span style="background-color:#fefefe;color:#666666;">第三十一条 保险公司、保险中介机构应当按照相关监管制度规定，根据不同销售方式，采取录音、录像、销售页面管理和操作轨迹记录等方法，对保险产品销售行为实施可回溯管理。对可回溯管理过程中产生的视听资料及电子资料，应当做好备份存档。</span></p><p><span style="background-color:#fefefe;color:#666666;">第三十二条 保险公司、保险中介机构应当加强资金管理，建立资金管理机制，严格按照相关规定进行资金收付管理。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险销售人员不得接受投保人、被保险人、受益人委托代缴保险费、代领退保金、代领保险金，不得经手或者通过非投保人、被保险人、受益人本人账户支付保险费、领取退保金、领取保险金。</span></p><p><span style="background-color:#fefefe;color:#666666;">第三十三条 投保人投保后，保险销售人员应当将所销售的保险业务相关信息以及投保人、被保险人、受益人信息如实完整及时地提供给其所在的保险公司、保险中介机构，以利于保险公司与投保人订立保险合同。</span></p><p style="text-align:center;"><span style="background-color:#fefefe;color:#666666;">第四章 保险销售后行为管理</span></p><p><span style="background-color:#fefefe;color:#666666;">第三十四条 保险公司在核保通过后应当及时向投保人提供纸质或者电子保单，并按照相关政策提供发票。电子保单应当符合国家电子签名相关法律规定。保险公司应当在官方线上平台设置保单查询功能。</span></p><p><span style="background-color:#fefefe;color:#666666;">第三十五条 保险合同订立后，保险公司应当按照有关监管制度规定，通过互联网、电话等方式对金融监管总局规定的相关保险产品业务进行回访。回访内容包括确认投保人身份和投保信息的真实性、是否完整知悉合同主要内容以及其他应当披露的信息等。在回访中，保险公司工作人员应当如实与投保人进行答问，不得有误导、欺骗、隐瞒等行为，并如实记录回访过程。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险公司在回访中发现存在销售误导的，应当按照规定及时予以处理。</span></p><p><span style="background-color:#fefefe;color:#666666;">按照相关监管制度规定，对保险产品销售行为实施可回溯管理，且对有关信息已确认的，可以根据监管规定合理简化回访要求。</span></p><p><span style="background-color:#fefefe;color:#666666;">第三十六条 保险公司、保险中介机构与其所属的保险销售人员解除劳动合同及其他用工合同或者委托合同，通过该保险销售人员签订的一年期以上的人身保险合同尚未履行完毕的，保险公司、保险中介机构应当在该保险销售人员的离职手续办理完成后的30</span><span style="color:#666666;">日内</span><span style="background-color:#fefefe;color:#666666;">明确通知投保人或者被保险人有关该保险销售人员的离职信息、保险合同状况以及获得后续服务的途径，不因保险销售人员离职损害投保人、被保险人合法利益。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险公司与保险中介机构终止合作，通过该保险中介机构签订的一年期以上的人身保险合同尚未履行完毕的，保险公司应当在与该保险中介机构终止合作后的</span>30日内<span style="background-color:#fefefe;color:#666666;">明确通知投保人或者被保险人有关该保险公司与该保险中介机构终止合作的信息、保险合同状况以及获得后续服务的途径，不因终止合作损害投保人、被保险人合法利益。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险销售人员因工作岗位变动无法继续提供服务的，适用上述条款规定。</span></p><p><span style="background-color:#fefefe;color:#666666;">第三十七条 保险销售人员离职后、保险中介机构与保险公司终止合作后，不得通过怂恿退保等方式损害投保人合法利益。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险公司、保险中介机构应当在与保险销售人员签订劳动、劳务等用工合同或者委托合同时，保险公司应当在与保险中介机构签订委托合同时，要求保险销售人员或者保险中介机构就不从事本条第一款规定的禁止性行为作出书面承诺。</span></p><p><span style="background-color:#fefefe;color:#666666;">第三十八条 行业自律组织应当针对本办法第三十六条、第三十七条的规定建立行业自律约束机制，并督促成员单位及相关人员切实执行。</span></p><p><span style="background-color:#fefefe;color:#666666;">第三十九条 任何机构、组织或者个人不得违法违规开展保险退保业务推介、咨询、代办等活动，诱导投保人退保，扰乱保险市场秩序。</span></p><p><span style="background-color:#fefefe;color:#666666;">第四十条 保险公司应当健全退保管理制度，细化各项保险产品的退保条件标准，优化退保流程，不得设置不合法不合理的退保阻却条件。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险公司应当在官方线上平台披露各项保险产品的退保条件标准和退保流程时限，并在保险合同签订前明确提示投保人该保险产品的退保条件标准和退保流程时限。</span></p><p><span style="background-color:#fefefe;color:#666666;">保险公司应当设立便捷的退保渠道，在收到投保人的退保申请后，及时一次性告知投保人办理退保所需要的全部材料。</span></p><p><span style="background-color:#fefefe;color:#666666;">第四十一条 保险公司、保险中介机构应当建立档案管理制度，妥善保管业务档案、会计账簿、业务台账、人员档案、投保资料以及开展可回溯管理产生的视听资料、电子数据等档案资料，明确管理责任，规范归档资料和数据的保管、保密和调阅程序。档案保管期限应当符合相关法律法规及监管制度规定。</span></p><p style="text-align:center;"><span style="background-color:#fefefe;color:#666666;">第五章 监督管理</span></p><p><span style="background-color:#fefefe;color:#666666;">第四十二条 保险公司、保险中介机构应当按照金融监管总局及其派出机构的规定，记录、保存、报送有关保险销售的报告、报表、文件和资料。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">第四十三条 违反本办法第三条、第三十九条规定的，由金融监管总局及其派出机构依照《中华人民共和国保险法》等法律法规和监管制度的相关规定处理。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">第四十四条 保险公司、保险中介机构、保险销售人员违反本办法规定和金融监管总局关于财产保险、人身保险、保险中介销售管理的其他相关规定，情节严重或者造成严重后果的，由金融监管总局及其派出机构依照法律、行政法规进行处罚；法律、行政法规没有规定的，金融监管总局及其派出机构可以视情况给予警告或者通报批评，处以一万元以上十万元以下罚款。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">第四十五条 保险公司、保险中介机构违反本办法规定和金融监管总局关于财产保险、人身保险、保险中介销售管理的其他相关规定，情节严重或者造成严重后果的，金融监管总局及其派出机构除分别依照本办法有关规定对该单位给予处罚外，对其直接负责的主管人员和其他直接责任人员依照法律、行政法规进行处罚；法律、行政法规没有规定的，金融监管总局及其派出机构对其直接负责的主管人员和其他直接责任人员可以视情况给予警告或者通报批评，处以一万元以上十万元以下罚款。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">第四十六条 违反本办法第三十六条、第三十七条规定的，金融监管总局及其派出机构可以视情况予以通报并督促行业自律组织对相关人员、保险公司、保险中介机构给予行业自律约束处理。</span></p><p style="text-align:center;"><span style="background-color:#fefefe;color:#666666;">第六章 附 则</span></p><p><span style="background-color:#fefefe;color:#666666;">第四十七条 保险公司、保险中介机构开展保险销售行为，除遵守本办法相关规定外，应当符合法律法规和金融监管总局关于财产保险、人身保险、保险中介销售管理的其他相关规定。</span></p><p style="text-align:justify;"><span style="background-color:#fefefe;color:#666666;">第四十八条 相互保险组织、外国保险公司分公司、保险集团公司适用本办法。</span></p><p><span style="background-color:#fefefe;color:#666666;">第四十九条 本办法由金融监管总局负责解释。</span></p><p><span style="background-color:#fefefe;color:#666666;">第五十条 本办法自2024</span><span style="color:#666666;">年3月1日起施行。</span></p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 07:24:40	2024-10-14 07:24:40	\N	\N	\N	\N
19	\N	\N	\N	湖北省保险行业协会 湖北省保险中介行业协会	<p>鄂保协发〔2024〕9号</p><p><strong>关于印发《湖北省保险销售人员执业规范</strong> <strong>指引》的通知</strong></p><p>各会员公司：</p><p style="text-align:justify;">为贯彻落实国家金融监督管理总局《保险销售行为管理 办法》,进一步加强全省保险销售人员诚信体系建设，将诚 信执业规范落实到保险销售全流程。根据国家金融监督管理 总局湖北监管局相关工作安排，经过全省保险业共同探讨交 流和征求意见，湖北省保险行业协会(以下简称“湖北保协”)、 湖北省保险中介行业协会(以下简称“中介协会”)共同编 制了《湖北省保险销售人员执业规范指引》(以下简称“《执 业规范指引》”),现将《执业规范指引》予以印发，并就 有关事项通知如下：</p><p><strong>一、高度重视提高认识</strong></p><p>保险销售行为直接影响保险消费者权益，近年来监管部</p><p>门、行业协会收到了大量因保险销售不规范导致的纠纷投诉。 《执业规范执引》的制定正是基于当前我省保险行业销售从 业人员诚信自律管理的实际需要，旨在帮助保险销售人员更 好地掌握合规要求，提升保险机构内控合规及操作风险管理 水平，保护保险合同当事人的合法权益。各会员单位要充分 认识规范保险销售执业行为和加强行业诚信建设的重要性、</p><p>紧迫性，以行业诚信建设为基石，以《执业规范指引》为准 绳，进一步规范保险销售行为。</p><p><strong>二、严格执行落实责任</strong></p><p style="text-align:justify;">《执业规范指引》对保险销售售前、售中及售后的行为 均作出正面指引，可操作性强，各会员单位应认真对照各项 条款的具体内容，进一步规范从业人员保险销售“全链条” 执业行为，全面履行销售职责，进一步明确监管要求，严格 落实公司对销售行为的管理责任。</p><p><strong>三</strong> <strong>、组织学习加强培训</strong></p><p style="text-align:justify;">各会员单位诚信建设领导小组在收到本通知后，应尽快 组织公司内外勤认真学习《执业规范指引》内容，开展一次 专项培训，湖北保协、中介协会将对辖内机构和从业人员的 学习情况开展相关督导抽查工作。各会员单位在落实和推进 《执业规范指引》过程中发现有好的经验做法或存在的问题， 应及时向协会反映。</p><p>&nbsp;</p><p><strong>第一章总则</strong></p><p>第 一条【目的】为帮助保险销售人员更好掌握合规要求，规范销售行为，提升保险机构内控合规及操作风险管理水平，保护保险合同当事人的合法权益，不断促进保险行业高质量发展，根据《中华人民共和国保险法》《保险代理人监管规定》《保险经纪人监管规定》《保险销售行为管理办法》《互 联网保险业务监管办法》《银行保险机构消费者权益保护管 理办法》等相关法律法规和监管规定，特制定本指引。</p><p style="text-align:justify;">第二条【销售人员定义】本文所称销售人员是指保险公 司中从事保险销售的员工、个人保险代理人及纳入销售人员 管理的其他用工形式的人员，保险代理机构中从事保险代理 业务的人员，保险经纪人中从事保险经纪业务的人员。</p><p style="text-align:justify;">第三条【保险机构定义】本文所称保险机构是指保险公 司、保险代理机构和保险经纪人。保险代理机构包括专业代 理机构和兼业代理机构。</p><p style="text-align:justify;">第四条【销售行为定义】本文所称保险销售行为是指销 售人员取得合法销售资质后开展的营销宣传，联系招揽潜在 客户，就保险合同内容进行沟通、商谈，接受咨询，收集投 保信息，协助订立保险合同、回访、续保、理赔、保全，以 及提供保单送达、通知、提醒等后续保险合同随附服务等活动。</p><p style="text-align:justify;">第五条【客户合法权益】保险机构及其保险销售人员实 施保险销售行为，应当遵循依法合规、平等自愿、诚实守信 等原则，充分尊重并自觉保障保险消费者的基本权利，包括 知情权、自主选择权、公平交易权、财产安全权、依法求偿 权、受教育权和受尊重权、信息安全权等。</p><p><br>&nbsp;</p><p><br>&nbsp;</p><p><strong>第二章售前行为规范</strong></p><p><br>&nbsp;</p><p>第六条【销售资质】保险销售人员应选择取得监管部门 业务许可的保险机构进行执业登记。根据执业登记所属保险 机构的要求，提供本人真实身份信息，签订劳动合同、代理 合同或其他形式用工协议。销售人员应接受机构合规管理， 遵守管理制度，积极参加所属机构组织的保险法律法规、监 管规章制度、从业规则标准、职业道德规范的培训教育，通 过所属机构的入职培训考核评估。</p><p>第七条【个人营销宣传】保险销售人员通过各类平台、 渠道开展销售宣传，发布的保险销售宣传信息应当事前经过 所属保险机构的审核及授权，转载信息应保证真实可靠以及 信息源可追溯。</p><p>第八条【营销信息发送】保险销售人员通过电话呼叫、 信息群发、网络推送等方式向客户发送营销信息，客户明确 表示拒绝投保的，应当立即停止主动营销，避免干扰其正常</p><p>工作和生活。</p><p style="text-align:justify;">第九条【客户告知】保险销售人员接洽客户时应主动说 明所属保险机构全称、机构属性和业务性质，主动向客户展 示执业登记信息及查询渠道。保险代理机构、经纪人的保险 销售人员还应出示统一制定的客户告知书，作为投保资料留 存客户签章的回执。</p><p><strong>第三章销售行为规范</strong></p><p><br>&nbsp;</p><p><strong>第十条</strong>【投保方案拟定】保险销售人员应当周全、妥当 地为客户拟定投保方案：</p><p>(一)【需求分析】主动询问和收集客户既有保障、历 年出险和赔付情况，交由保险机构结合其他客户信息形成是 否适合所销售保险产品的评估结果，作为投保资料保存；</p><p>(二)【方案调整】根据客户保险需求和保险保障缺口， 提出保险建议、拟订投保方案；充分听取客户对投保方案的 意见，如根据客户要求调整投保方案的，应提醒、说明调整 的内容并提出专业化建议；投保方案应取得客户认可；</p><p>(三)【风险提示】对缴费能力可能不足、重复购买或 超额购买²的客户应进行风险提示并调整投保方案或中止投</p><p><br>&nbsp;</p><p><br>&nbsp;</p><p style="text-align:justify;">1【机构全称】是指保险机构营业执照、业务许可证上登记的公司名称，互联网保险业务应告知具备合法 保险销售资质的运营主体的机构全称。后续环节采用简称的，应当使用“XX保险公司/XX银行/XX 保险代理 /XX保险经纪”等规范简称，不得使用“某某保险”等混淆主体身份类别的简称。</p><p>【机构属性】是指保险公司、专业代理机构、兼业代理机构或经纪人。 【业务性质】是指保险销售业务。</p><p>²【范例1】对于缴费期限超过退休年限、家庭年收入少于年缴保费金额的客户重点询问是否具备缴费能力， 提示保费断缴风险，调整保额并取得客户书面同意文件，规避后期因保单失效引发的合同纠纷或投诉举报。 【范例2】为避免道德风险，《中国保监会关于父母为其未成年子女投保以死亡为给付保险金条件人身保 险有关问题的通知(保监发〔2015〕90号)》对投保人为其未成年子女购买的以被保险人死亡为给付条件</p><p>保。</p><p>销售短期保险产品的，可根据所属保险机构要求，适当 简化上述第(一)(二)项流程。</p><p>第十一条【产品讲解】保险销售人员在介绍产品时，应 主动告知客户保险产品的全称及产品类型，主动提供保险产 品条款，并就条款重点内容进行明确说明³ ,帮助客户正确理 解保险产品。</p><p>第十二条【条款重要内容】保险销售人员应提醒投保人 仔细完整地阅读保险条款，完整准确地介绍保险责任、责任 免除、投保人及被保险人的权利和义务、免赔额或免赔率、 赔付比例的计算、申请保险金的手续等重要内容。</p><p>第十三条【产品对比】客户对保险产品收益情况与银行 存款、理财产品进行对比时，保险销售人员应明确告知保险 产品与银行存款、理财产品等其他非保险金融产品的区别⁵ , 避免容易引人误解的表述。⁶</p><p><strong>第十四条</strong>【缴费方式】保险销售人员应完整准确地告知 客户保险期限、犹豫期、现金价值等关键内容。应明确告知</p><p><img src="file:///tmp/lu27915cntxj.tmp/lu27915cnu4n_tmp_ea8a3539564fd492.png" width="195" height="1">&nbsp;<br>&nbsp;</p><p>的保险金总和规定了上限(10岁以下20万元，10-18岁50万元)。</p><p>【相关法规】《健康保险管理办法》第四十一条：保险公司不得诱导投保人为同一被保险人重复购买保障 功能相同或者类似的费用补偿型医疗保险产品。</p><p style="text-align:justify;">3【范例】根据保险合同条款和保险公司宣传文案进行说明，假如对客户提出有关保险产品的问题当场不 能解答的，销售人员对不确定的内容不擅自解读，应收集客户对相关产品疑问后联系公司客服、产品或培 训相关部门人员协助解答。</p><p>4【范例】该保险条款第x 条是保险责任及责任免除的内容，对您的权益有重要关系，请重点关注。具体 为xxx (口述应完整陈述条款内容，不得遗漏特别约定，避免进行不准确的简化解读)。</p><p>5【范例话术】:“这是一款保险产品，承保保险公司为xxx, 销售渠道为xxx, 与银行存款、基金等其他 非保险金融产品不同”。</p><p>6【范例】避免使用利益返还、存款、本金、利息等表述，而应使用保额、保险金、保险费、现金价值、 投资账户收益等保险规范用语。</p><p style="text-align:justify;">投保人交费方式、年交保费金额，提示客户确认是否有稳定 的缴费能力并明确说明保费断缴对其权益的不良影响。保险 产品有现金价值垫交续期保费条款的，应明确告知投保人。</p><p style="text-align:justify;"><strong>第十五条</strong>【非保证续保产品】保险销售人员对于非保证 续保的保险合同，应明确告知客户续保条件、续保保费、可 能变动情形，以及续保时保险公司是否有权调整保险费率或 决定是否接受续保等事项。</p><p><strong>第十六条</strong>【投保提示书】保险销售人员应当向投保人提 供经保险机构统一制定的投保提示书，由客户签章确认。</p><p><strong>第十七条</strong>【健康保险】保险销售人员应根据条款明确向 客户说明医疗费用补偿原则、免赔额或赔付比例、疾病观察 期(等待期)、指定医疗机构、续保政策与条件，疾病定义 以及是否有附条件赔付或除外情形等内容；应向投保人询问 被保险人是否拥有公费医疗、基本医疗保险或者其他费用补 偿型医疗保险的情况；应询问客户是否有既往病史、住院记 录等影响核保核赔的相关信息。</p><p><strong>第十八条【</strong>新型人身保险产品特别提示】保险销售人员 销售分红保险、投资连结保险、万能保险等人身保险新型产 品，应取得所属保险机构授权，进一步提示投保人关注下列 事项并亲笔签署风险提示语句：</p><p>(一)【分红保险】保险销售人员应根据条款向客户明确 说明“红利分配是不确定的，产品说明书或保险利益测算书</p><p style="text-align:justify;">中关于未来保险合同利益的预测是基于精算假设而非承诺 收益。历史分红情况可以查阅相关保险公司官方网站的公开 披露信息”。</p><p>(二)【投资连结保险】保险销售人员应根据条款向客户 明确说明费用扣除情况，包括初始费用、买入卖出差价、死 亡风险保险费、保单管理费、资产管理费、手续费、退保费 用等；明确说明投资连结保险账户价值的计算方法；提醒投 保人“投资回报具有不确定性，可能出现亏损，投资风险全 部由投保人承担”。</p><p>(三)【万能保险】保险销售人员应根据条款向客户明确 说明费用扣除情况，包括初始费用、死亡风险保险费、保单 管理费、手续费、退保费用等；明确说明万能保险账户价值 的详细计算方法及收益的不确定性；明确说明“最低保证利 率仅针对投资账户中的资金”。</p><p style="text-align:justify;"><strong>第十九条</strong>【投保信息收集】保险销售人员应告知客户由 其本人如实完整地填写投保单的投保信息，重点包括投保人 和被保险人的姓名、性别、出生日期、身份证号、联系方式、 工作单位、住址、年收入、既往病史等内容，明确告知客户 应当履行如实告知义务并说明未如实告知的法律后果，确保 保险公司取得的客户信息真实有效。</p><p><strong>第二十条【</strong>可回溯】保险销售人员应按照有关法律法规</p><p><img src="file:///tmp/lu27915cntxj.tmp/lu27915cnu4n_tmp_a8971e6d7a7de408.jpg" width="195" height="1">&nbsp;<br>&nbsp;</p><p>⁷【相关法规】《中国保监会关于印发&lt;保险销售行为可回溯管理暂行办法&gt;的通知(保监发(2017)54号)》 《中国银保监会关于规范互联网保险销售行为可回溯管理的通知(银保监发(2020)26号)》</p><p>配合保险机构做好可回溯信息收集工作，取得客户同意后对 销售过程关键环节以同步录音录像的方式予以记录。</p><p><strong>第二十一条</strong>【签名】保险销售人员应确认投保提示书、 投保单、保险合同回执等文本资料由投保人或被保险人亲自 填写和签名(被保险人为无民事行为能力人时由其监护人签 署)。客户无法履行本人签署要求、提出协助需求的，保险 销售人员应当报经所属保险机构同意后，取得客户(投保人、 被保险人)有效书面授权或在录音录像情况下的口头授权， 由保险机构审核授权资料真实性后作为投保资料留存。</p><p><strong>第二十二条</strong>【电话销售】保险销售人员通过电话向客户 销售保险时，讲解保险产品应严格按照所属保险机构统一制 定的标准话术，向客户进行告知并明确说明保险合同的重要 内容⁸,通过客户签署投保单或电话录音的方式确认投保人投 保意愿。通过银行转账方式或其他电子支付方式收取保险费 的，应通过书面或电话录音的方式明确说明并取得客户授权 同意'。</p><p style="text-align:justify;"><strong>第二十三条【</strong>互联网销售】客户通过保险机构自营平台 或互联网投保链接等互联网保险渠道投保时提出服务需求 的，保险销售人员根据客户需求明确说明，对互联网保险产 品属性、特点、投保流程的关键环节0等内容予以重点说明，</p><p>由客户自主完成投保过程。</p><p>8参照本文第十一至十八条要求执行。</p><p>9《人身保险电话销售业务管理办法》(保监发(2013)40号)第三十条、第三十一条。 10参照本文第十一至十八条要求执行。</p><p style="text-align:justify;">第二十四条【产品停售】保险销售人员销售即将停售或 调整价格的保险产品，应根据保险公司发出的停售或者调整 价格的公告，向客户明确说明停售产品名称、停售时间，不 得炒作停售、调整价格等信息诱导客户投保。</p><p><strong>第四章售后服务规范</strong></p><p><br>&nbsp;</p><p><strong>第二十五条【</strong>咨询答复】对于客户后期咨询，保险销售 人员应当按照销售规范进行解答。不能详细解答的，应当提 供保险机构客服电话引导客户通过官方渠道咨询解答疑问， 避免对客户做出笼统、易引人误解的表述。</p><p><strong>第二十六条【</strong>保单送达】保险销售人员接受保险机构委 托送达保单，应取得客户保险合同签收回执，交由保险机构 保管。保险机构提供电子保单的，应当告知客户电子保单或 纸质保单的申领方式。</p><p style="text-align:justify;"><strong>第二十七条【</strong>回访提示】保险销售人员应告知投保人在 犹豫期内注意接听回访电话或点击回访链接，如实回答回访 问 题 。</p><p style="text-align:justify;"><strong>第二十八条【</strong>续保申请】保险销售人员可提醒客户及时 向保险公司发出续保申请，协助客户及保险公司完成保单或 批单的出具和送达工作。保险销售人员可在缴费日前三十天 提醒客户及时续缴保费，保险合同因保费断缴失效的，应提</p><p>11【话术范例】签署保险合同后有15天犹豫期，为保障客户权益，期间保险公司会通过电话或电子方式</p><p><img src="file:///tmp/lu27915cntxj.tmp/lu27915cnu4n_tmp_5182665c7a4b6d9.png" width="195" height="1">&nbsp;<br>&nbsp;</p><p>对你进行回访，对销售过程和合同重要内容知晓情况进行确认。请保持联系方式畅通，如实回答相关问题。 不得采用“请对回访问题说明白了、清楚了、知道了”等诱导客户不真实回答回访问题的表述。</p><p>示客户保险合同中断的风险，积极配合客户办理保单复效或 退保手续。</p><p style="text-align:justify;"><strong>第二十九条【</strong>协助批改/保全】保险销售人员应提醒客户 及时履行保险合同约定的告知义务，在保险合同有效期内发 生联系方式、通讯地址及职业变更，保险标的增减、名称变 更、占用性质改变、风险状况变化、权利转让等约定告知情 况的，协助客户向保险公司申请办理批改/保全手续。</p><p style="text-align:justify;"><strong>第三十条【</strong>协助理赔】保险销售人员知悉客户发生保险 合同约定的赔付/给付责任后，应当及时提醒客户向保险公 司报案，协助客户收集理赔资料、办理保险金领取等相关手 续，不得擅自承诺理赔责任。</p><p><strong>第三十一条</strong>【投诉举报】保险销售人员所售保单出现投 诉举报的，应配合保险机构调查，及时妥善处理客户诉求。</p><p><strong>第三十二条</strong>【退保】客户提出退保的，保险销售人员应 当向客户再次说明退保条款以及可能导致的损失和风险，并 协助客户办理有关手续。</p><p style="text-align:justify;"><strong>第三十三条【</strong>离职告知】²保险机构应当对一年期以上尚 未履行完毕的人身保险合同的销售人员离职手续办理完成 后的30 日内告知其所售保单的投保人或者被保险人原销 售人员的离职信息、保单状况以及获得后续服务的途径。</p><p><img src="file:///tmp/lu27915cntxj.tmp/lu27915cnu4n_tmp_24e7c88120def536.png" width="194" height="1">&nbsp;<br>&nbsp;</p><p style="text-align:justify;">12【商业银行保险销售人员离职】根据《中国银监会湖北监管局办公室关于加强银行业员工行为“十大” 风险管控的通知》第九条第三点“销售人员离职所在机构应按照要求立即以短信通知、客户电话通知或在 其解除或终止劳动关系后至少10个工作日在网点公示等形式及时告知该销售人员原管理的客户，并安排新 的销售人员及时对接，做好客户的解释及后期维护工作。”</p><p><br>&nbsp;</p><p><br>&nbsp;</p><p><strong>第五章禁止行为</strong></p><p><br>&nbsp;</p><p><strong>第三十四条【</strong>销售禁止行为】保险销售人员在执业过程 中不得有以下行为¹³ :</p><p>(一)【无资质展业】未持有《执业证书》从事保险销售， 或超出保险机构授权范围开展保险销售业务；为不具备合法 资质的机构或个人提供出单渠道；</p><p>(二)【违规宣传】混淆产品属性，将保险产品利益与银 行存款、国债等其他金融产品的收益进行片面比较，或套用</p><p style="text-align:justify;">“本金、利息、存款”等概念；混淆销售主体，以其他保险 机构及销售人员名义开展保险营销宣传；自行编发或者转载 未经所属机构审核授权发布的保险销售宣传信息4;</p><p>(三)【销售误导】夸大保险责任或保证收益；故意隐瞒 关于保险责任、责任免除、犹豫期、观察期、退保损失、缴 费期限等保险合同重要信息，进行不实陈述或误导性描述， 片面宣传或虚假宣传，使用易与其他金融产品混淆的描述， 发布片面比较保险产品价格和简单排名的内容，影响客户合 法权益的；</p><p>(四)【退旧买新】以“产品保障不全”“保单升级”“减</p><p>额交清”“赠送保险”等为由，误导客户通过保单退保、保</p><p>&nbsp;</p><p>13【主要依据】《中华人民共和国保险法》第一百三十一条</p><p>14【主动消除不良影响】未经审核发布存在误导内容的宣传资料，保险销售人员应当主动消除不良影响， 对误导内容进行明确说明更正，并删除不当内容。</p><p>单贷款等方式购买新保险产品，损害客户合法权益；</p><p>(五)【代理退保】从事或变相从事代理退保黑产，以“全 额退保”“代理退保维权”名义误导客户进行投诉举报；</p><p>(六)【阻碍如实告知】阻碍投保人履行如实告知义务或 者诱导其不履行如实告知义务¹5;</p><p>(七)【返佣】以诱导客户投保为目的，直接或间接地给 予或承诺给予保险合同约定以外的利益；</p><p>(八)【捆绑强制销售】利用职务或者职业便利以及其他 不正当手段强迫、限制投保人订立保险合同；使用强制搭售、 网页或者信息系统默认勾选等方式与投保人订立保险合同；</p><p>(九)【提供虚假投保信息】诱导客户填写虚假的联系方 式、地址、保险标的等投保信息，或提供虚假的体检报告、 收入证明、验标文件等资料；</p><p>(十)【代签名】未经授权代替客户确认保险风险提示语、 签署投保单、保险合同回执以及其他需要由投保人、被保险 人亲笔签署的文件；</p><p style="text-align:justify;">(十一)【超时】接受委托后未在规定时间内向客户送达 保险合同或其他有效单证；未及时协助客户向保险公司递交 投保、核保、保全、理赔等相关材料；</p><p>(<img src="file:///tmp/lu27915cntxj.tmp/lu27915cnu4n_tmp_52cfe36438432b34.png" width="193" height="1"> 十二)【未经授权】未经客户授权代为办理保全/批改、 退保、满期给付、红利领取、保单贷(借)款等手续，或擅</p><p>15【范例】某投保人主动告诉销售人员其直系亲属有高血压等遗传病史，销售人员告知投保人此类情况不 属于需要告知的内容，让投保人在投保单告知事项栏目中不如实填写。</p><p>自伪造、变造保险合同导致客户利益受到损害；</p><p>(十三)【不配合调查】对于涉访涉诉案件拒绝配合监管 部门或保险机构的调查；</p><p>(十四)【买卖信息】非法收集、使用、加工、提供、买 卖客户个人信息、商业秘密；</p><p style="text-align:justify;">(十五)【保险诈骗】通过编造保险事故、虚构保险合同 或夸大保险事故损失等手段串通投保人、被保险人、受益人 进行虚假理赔，骗取保险金或牟取其他不正当利益；</p><p>(十六)【侵占资金】侵占、截留、挪用保险费、保险金、 保单贷款等；</p><p>(十七)【非法活动】非法销售非保险类金融产品，或利 用职场、营销渠道和客户资源从事传销、非法集资、洗钱、 电信诈骗等活动；</p><p style="text-align:justify;">(十八)【破坏秩序】唆使、伙同客户或他人冲击、围堵 办公职场，严重影响正常秩序；伪造、散布虚假信息诋毁同 业、误导社会公众，或以其他不正当竞争行为扰乱保险市场 秩序。</p><p><br>&nbsp;</p><p><br>&nbsp;</p><p><strong>第六章机构管理职责</strong></p><p><br>&nbsp;</p><p style="text-align:justify;">第三十五条【内控管理】保险机构应当建立健全覆盖保 险销售行为的销售管理制度，包括但不限于保险销售人员教 育培训、宣传授权、销售适当性、销售品质、售后服务等重</p><p style="text-align:justify;">点内容，明确管理责任人，建立内控制度执行自查机制，严 格对制度执行情况的考核及责任追究，确保制度有效、落实 到位。</p><p><strong>第三十六条</strong>【综合考核】保险机构应加强保单继续率、 投诉情况等业务合规考核指标权重，建立健全佣金套利防范 工作机制，合理制定佣金及各项奖励延时发放和追溯扣回机 制，强化业务品质管理。确保各销售人员获取的当期佣金及 综合奖励收益、保单退保现金价值之和不超过当期保费。</p><p><strong>第三十七条【</strong>人员招录】保险机构应严格保险销售人员 招录管理，加强团队建设规划，坚持审慎有序、严格选人、 持续育人、事业留人导向，制定人员招录管理办法，规范招 录信息发布。</p><p style="text-align:justify;"><strong>第<img src="file:///tmp/lu27915cntxj.tmp/lu27915cnu4n_tmp_c0529d250813e657.png" width="194" height="1"> 三十八条</strong>【人员培训】保险机构应严格保险销售人员 培训管理，切实加强保险销售人员合规守法教育。法律法规、 监管规则、职业道德规范等内容的培训应当开展考核并记录 成绩，培训时间每年不得低于30小时¹⁶。保险机构应建立完 整的保险销售人员培训档案，在信息系统中完整记录培训情 况。保险机构授权保险销售人员销售新的保险产品前应组织 开展专项培训和适销性评估。</p><p style="text-align:justify;">16中国银保监会办公厅关于切实加强保险专业中介机构从业人员管理的通知(银保监办发(2020)42号) 中国银保监会办公厅关于落实保险公司主体责任加强保险销售人员管理的通知(银保监办发〔2020〕41号) 中国银保监会办公厅关于印发《商业银行代理保险业务管理办法》的通知(银保监办发〔2019〕179号)</p><p>【商业银行销售人员培训】:根据《商业银行代理保险业务管理办法》商业银行应当加强对其保险销售从 业人员的岗前培训和后续教育，组织其定期接受法律法规、业务知识、职业道德、消费者权益保护等相关 培训。其中，商业银行保险销售从业人员销售投资连结型保险产品还应至少有1年以上的保险销售经验， 每年接受不少于40小时的专项培训，并无不良记录。</p><p style="text-align:justify;">第三十九条【执业登记】保险机构应当按照规定在保险 销售人员签订合同/协议后、正式开展保险销售活动前进行 执业登记。保险销售人员变更所属保险机构的，原所属机构 应当在合同/协议约定时间内及时注销执业登记，再由新所 属机构为其进行执业登记。</p><p><strong>第四十条</strong>【权益保护】保险机构应当切实履行消费者权 益保护职责，建立健全投诉处理工作机制，畅通投诉渠道， 规范投诉处理流程，加强投诉统计分析。积极主动与消费者 协商解决矛盾纠纷，提示客户依法通过调解、仲裁、诉讼等 方式促进矛盾纠纷化解，以避免客户反复投诉、升级投诉、 群访群诉或出现媒体负面舆情等情况。如因代理退保黑产或 其他原因无法及时妥善处理的，应向客户讲解代理退保黑产 风险，积极主动收集代理退保黑产证据后由所属保险机构向 公安机关进行报案，并将相关情况报送监管部门。</p><p>第四十一条【销售品质管理】保险机构应加强销售品质 管理，将投保资料审核和存档情况、回访成功率、保单继续 率、投诉率等指标作为销售品质管理的重要内容。销售品质 管理结果应纳入保险机构、相关管理人员和保险销售人员考 核管理体系，对销售品质出现重大问题的保单，应建立薪酬 和佣金追溯扣回机制。</p><p><strong>第四十二条【</strong>诚信管理】保险机构应严格保险销售人员 诚信管理，积极配合行业协会做好诚信自律建设工作，对保</p><p style="text-align:justify;">险销售人员违法违规行为要进行及时惩戒和内部追责，并在 行业协会诚信自律平台以及中介监管信息系统中准确、及时、 完整地录入获得表彰奖励、违反诚信自律公约、受到监管行 政处罚等相关信息。</p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 07:26:55	2024-10-14 07:26:55	\N	\N	\N	\N
20	\N	\N	\N	中华人民共和国保险法	<p style="text-align:center;"><span style="background-color:#ffffff;color:#333333;">中华人民共和国保险法</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（</span><span style="color:#333333;">1995年6月30日第八届全国人民代表大会常务委员会第十四次会议通过 根据2002年10月28日第九届全国人民代表大会常务委员会第三十次会议《关于修改〈中华人民共和国保险法〉的决定》第一次修正 2009年2月28日第十一届全国人民代表大会常务委员会第七次会议修订 根据2014年8月31日第十二届全国人民代表大会常务委员会第十次会议《关于修改〈中华人民共和国保险法〉等五部法律的决定》第二次修正 根据2015年4月24日第十二届全国人民代表大会常务委员会第十四次会议《关于修改〈中华人民共和国计量法〉等五部法律的决定》第三次修正）</span></p><p style="text-align:center;"><span style="background-color:#ffffff;color:#333333;"><strong>目 录</strong></span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">第一章 总则</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">第二章 保险合同</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">第一节 一般规定</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">第二节 人身保险合同</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">第三节 财产保险合同</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">第三章 保险公司</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">第四章 保险经营规则</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">第五章 保险代理人和保险经纪人</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">第六章 保险业监督管理</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">第七章 法律责任</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">第八章 附则</span></p><p style="text-align:center;"><span style="background-color:#ffffff;color:#333333;">第一章 总则</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一条</strong> 为了规范保险活动，保护保险活动当事人的合法权益，加强对保险业的监督管理，维护社会经济秩序和社会公共利益，促进保险事业的健康发展，制定本法。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第二条</strong> 本法所称保险，是指投保人根据合同约定，向保险人支付保险费，保险人对于合同约定的可能发生的事故因其发生所造成的财产损失承担赔偿保险金责任，或者当被保险人死亡、伤残、疾病或者达到合同约定的年龄、期限等条 件时承担给付保险金责任的商业保险行为。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第三条</strong> 在中华人民共和国境内从事保险活动，适用本法。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第四条 </strong>从事保险活动必须遵守法律、行政法规，尊重社会公德，不得损害社会公共利益。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第五条 </strong>保险活动当事人行使权利、履行义务应当遵循诚实信用原则。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第六条 </strong>保险业务由依照本法设立的保险公司以及法律、行政法规规定的其他保险组织经营，其他单位和个人不得经营保险业务。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第七条 </strong>在中华人民共和国境内的法人和其他组织需要办理境内保险的，应当向中华人民共和国境内的保险公司投保。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第八条 </strong>保险业和银行业、证券业、信托业实行分业经营、分业管理，保险公司与银行、证券、信托业务机构分别设立。国家另有规定的除外。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第九条 </strong>国务院保险监督管理机构依法对保险业实施监督管理。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">国务院保险监督管理机构根据履行职责的需要设立派出机构。派出机构按照国务院保险监督管理机构的授权履行监督管理职责。</span></p><p style="text-align:center;"><span style="background-color:#ffffff;color:#333333;">第二章 保险合同</span></p><p style="text-align:center;"><span style="background-color:#ffffff;color:#333333;"><strong>第一节 一般规定</strong></span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第十条</strong> 保险合同是投保人与保险人约定保险权利义务关系的协议。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">投保人是指与保险人订立保险合同，并按照合同约定负有支付保险费义务的人。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险人是指与投保人订立保险合同，并按照合同约定承担赔偿或者给付保险金责任的保险公司。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第十一条</strong> 订立保险合同，应当协商一致，遵循公平原则确定各方的权利和义务。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">除法律、行政法规规定必须保险的外，保险合同自愿订立。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第十二条</strong> 人身保险的投保人在保险合同订立时，对被保险人应当具有保险利益。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">财产保险的被保险人在保险事故发生时，对保险标的应当具有保险利益。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">人身保险是以人的寿命和身体为保险标的的保险。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">财产保险是以财产及其有关利益为保险标的的保险。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">被保险人是指其财产或者人身受保险合同保障，享有保险金请求权的人。投保人可以为被保险人。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险利益是指投保人或者被保险人对保险标的具有的法律上承认的利益。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第十三条</strong> 投保人提出保险要求，经保险人同意承保，保险合同成立。保险人应当及时向投保人签发保险单或者其他保险凭证。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险单或者其他保险凭证应当载明当事人双方约定的合同内容。当事人也可以约定采用其他书面形式载明合同内容。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">依法成立的保险合同，自成立时生效。投保人和保险人可以对合同的效力约定附条件或者附期限。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第十四条 </strong>保险合同成立后，投保人按照约定交付保险费，保险人按照约定的时间开始承担保险责任。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第十五条 </strong>除本法另有规定或者保险合同另有约定外，保险合同成立后，投保人可以解除合同，保险人不得解除合同。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第十六条 </strong>订立保险合同，保险人就保险标的或者被保险人的有关情况提出询问的，投保人应当如实告知。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">投保人故意或者因重大过失未履行前款规定的如实告知义务，足以影响保险人决定是否同意承保或者提高保险费率的，保险人有权解除合同。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">前款规定的合同解除权，自保险人知道有解除事由之日起，超过三十日不行使而消灭。自合同成立之日起超过二年的，保险人不得解除合同；发生保险事故的，保险人应当承担赔偿或者给付保险金的责任。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">投保人故意不履行如实告知义务的，保险人对于合同解除前发生的保险事故，不承担赔偿或者给付保险金的责任，并不退还保险费。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">投保人因重大过失未履行如实告知义务，对保险事故的发生有严重影响的，保险人对于合同解除前发生的保险事故，不承担赔偿或者给付保险金的责任，但应当退还保险费。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险人在合同订立时已经知道投保人未如实告知的情况的，保险人不得解除合同；发生保险事故的，保险人应当承担赔偿或者给付保险金的责任。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险事故是指保险合同约定的保险责任范围内的事故。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第十七条 </strong>订立保险合同，采用保险人提供的格式条款的，保险人向投保人提供的投保单应当附格式条款，保险人应当向投保人说明合同的内容。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">对保险合同中免除保险人责任的条款，保险人在订立合同时应当在投保单、保险单或者其他保险凭证上作出足以引起投保人注意的提示，并对该条款的内容以书面或者口头形式向投保人作出明确说明；未作提示或者明确说明的，该条款不产生效力。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第十八条 </strong>保险合同应当包括下列事项：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）保险人的名称和住所；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）投保人、被保险人的姓名或者名称、住所，以及人身保险的受益人的姓名或者名称、住所；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（三）保险标的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（四）保险责任和责任免除；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（五）保险期间和保险责任开始时间；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（六）保险金额；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（七）保险费以及支付办法；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（八）保险金赔偿或者给付办法；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（九）违约责任和争议处理；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（十）订立合同的年、月、日。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">投保人和保险人可以约定与保险有关的其他事项。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">受益人是指人身保险合同中由被保险人或者投保人指定的享有保险金请求权的人。投保人、被保险人可以为受益人。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险金额是指保险人承担赔偿或者给付保险金责任的最高限额。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第十九条 </strong>采用保险人提供的格式条款订立的保险合同中的下列条款无效：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）免除保险人依法应承担的义务或者加重投保人、被保险人责任的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）排除投保人、被保险人或者受益人依法享有的权利的。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第二十条 </strong>投保人和保险人可以协商变更合同内容。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">变更保险合同的，应当由保险人在保险单或者其他保险凭证上批注或者附贴批单，或者由投保人和保险人订立变更的书面协议。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第二十一条 </strong>投保人、被保险人或者受益人知道保险事故发生后，应当及时通知保险人。故意或者因重大过失未及时通知，致使保险事故的性质、原因、损失程度等难以确定的，保险人对无法确定的部分，不承担赔偿或者给付保险金的责任，但保险人通过其他途径已经及时知道或者应当及时知道保险事故发生的除外。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第二十二条</strong> 保险事故发生后，按照保险合同请求保险人赔偿或者给付保险金时，投保人、被保险人或者受益人应当向保险人提供其所能提供的与确认保险事故的性质、原因、损失程度等有关的证明和资料。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险人按照合同的约定，认为有关的证明和资料不完整的，应当及时一次性通知投保人、被保险人或者受益人补充提供。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第二十三条</strong> 保险人收到被保险人或者受益人的赔偿或者给付保险金的请求后，应当及时作出核定；情形复杂的，应当在三十日内作出核定，但合同另有约定的除外。保险人应当将核定结果通知被保险人或者受益人；对属于保险责任的，在与被保险人或者受益人达成赔偿或者给付保险金的协议后十日内，履行赔偿或者给付保险金义务。保险合同对赔偿或者给付保险金的期限有约定的，保险人应当按照约定履行赔偿或者给付保险金义务。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险人未及时履行前款规定义务的，除支付保险金外，应当赔偿被保险人或者受益人因此受到的损失。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">任何单位和个人不得非法干预保险人履行赔偿或者给付保险金的义务，也不得限制被保险人或者受益人取得保险金的权利。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第二十四条 </strong>保险人依照本法第二十三条的规定作出核定后，对不属于保险责任的，应当自作出核定之日起三日内向被保险人或者受益人发出拒绝赔偿或者拒绝给付保险金通知书，并说明理由。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第二十五条</strong> 保险人自收到赔偿或者给付保险金的请求和有关证明、资料之日起六十日内，对其赔偿或者给付保险金的数额不能确定的，应当根据已有证明和资料可以确定的数额先予支付；保险人最终确定赔偿或者给付保险金的数额后，应当支付相应的差额。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第二十六条 </strong>人寿保险以外的其他保险的被保险人或者受益人，向保险人请求赔偿或者给付保险金的诉讼时效期间为二年，自其知道或者应当知道保险事故发生之日起计算。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">人寿保险的被保险人或者受益人向保险人请求给付保险金的诉讼时效期间为五年，自其知道或者应当知道保险事故发生之日起计算。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第二十七条 </strong>未发生保险事故，被保险人或者受益人谎称发生了保险事故，向保险人提出赔偿或者给付保险金请求的，保险人有权解除合同，并不退还保险费。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">投保人、被保险人故意制造保险事故的，保险人有权解除合同，不承担赔偿或者给付保险金的责任；除本法第四十三条规定外，不退还保险费。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险事故发生后，投保人、被保险人或者受益人以伪造、变造的有关证明、资料或者其他证据，编造虚假的事故原因或者夸大损失程度的，保险人对其虚报的部分不承担赔偿或者给付保险金的责任。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">投保人、被保险人或者受益人有前三款规定行为之一，致使保险人支付保险金或者支出费用的，应当退回或者赔偿。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第二十八条 </strong>保险人将其承担的保险业务，以分保形式部分转移给其他保险人的，为再保险。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">应再保险接受人的要求，再保险分出人应当将其自负责任及原保险的有关情况书面告知再保险接受人。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第二十九条 </strong>再保险接受人不得向原保险的投保人要求支付保险费。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">原保险的被保险人或者受益人不得向再保险接受人提出赔偿或者给付保险金的请求。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">再保险分出人不得以再保险接受人未履行再保险责任为由，拒绝履行或者迟延履行其原保险责任。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第三十条 </strong>采用保险人提供的格式条款订立的保险合同，保险人与投保人、被保险人或者受益人对合同条款有争议的，应当按照通常理解予以解释。对合同条款有两种以上解释的，人民法院或者仲裁机构应当作出有利于被保险人和受益人的解释。</span></p><p style="text-align:center;"><span style="background-color:#ffffff;color:#333333;"><strong>第二节 人身保险合同</strong></span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第三十一条 </strong>投保人对下列人员具有保险利益：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）本人；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）配偶、子女、父母；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（三）前项以外与投保人有抚养、赡养或者扶养关系的家庭其他成员、近亲属；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（四）与投保人有劳动关系的劳动者。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">除前款规定外，被保险人同意投保人为其订立合同的，视为投保人对被保险人具有保险利益。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">订立合同时，投保人对被保险人不具有保险利益的，合同无效。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第三十二条 </strong>投保人申报的被保险人年龄不真实，并且其真实年龄不符合合同约定的年龄限制的，保险人可以解除合同，并按照合同约定退还保险单的现金价值。保险人行使合同解除权，适用本法第十六条第三款、第六款的规定。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">投保人申报的被保险人年龄不真实，致使投保人支付的保险费少于应付保险费的，保险人有权更正并要求投保人补交保险费，或者在给付保险金时按照实付保险费与应付保险费的比例支付。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">投保人申报的被保险人年龄不真实，致使投保人支付的保险费多于应付保险费的，保险人应当将多收的保险费退还投保人。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第三十三条 </strong>投保人不得为无民事行为能力人投保以死亡为给付保险金条件的人身保险，保险人也不得承保。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">父母为其未成年子女投保的人身保险，不受前款规定限制。但是，因被保险人死亡给付的保险金总和不得超过国务院保险监督管理机构规定的限额。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第三十四条</strong> 以死亡为给付保险金条件的合同，未经被保险人同意并认可保险金额的，合同无效。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">按照以死亡为给付保险金条件的合同所签发的保险单，未经被保险人书面同意，不得转让或者质押。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">父母为其未成年子女投保的人身保险，不受本条第一款规定限制。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第三十五条 </strong>投保人可以按照合同约定向保险人一次支付全部保险费或者分期支付保险费。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第三十六条</strong> 合同约定分期支付保险费，投保人支付首期保险费后，除合同另有约定外，投保人自保险人催告之日起超过三十日未支付当期保险费，或者超过约定的期限六十日未支付当期保险费的，合同效力中止，或者由保险人按照合同约定的条件减少保险金额。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">被保险人在前款规定期限内发生保险事故的，保险人应当按照合同约定给付保险金，但可以扣减欠交的保险费。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第三十七条</strong> 合同效力依照本法第三十六条规定中止的，经保险人与投保人协商并达成协议，在投保人补交保险费后，合同效力恢复。但是，自合同效力中止之日起满二年双方未达成协议的，保险人有权解除合同。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险人依照前款规定解除合同的，应当按照合同约定退还保险单的现金价值。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第三十八条 </strong>保险人对人寿保险的保险费，不得用诉讼方式要求投保人支付。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第三十九条 </strong>人身保险的受益人由被保险人或者投保人指定。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">投保人指定受益人时须经被保险人同意。投保人为与其有劳动关系的劳动者投保人身保险，不得指定被保险人及其近亲属以外的人为受益人。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">被保险人为无民事行为能力人或者限制民事行为能力人的，可以由其监护人指定受益人。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第四十条 </strong>被保险人或者投保人可以指定一人或者数人为受益人。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">受益人为数人的，被保险人或者投保人可以确定受益顺序和受益份额；未确定受益份额的，受益人按照相等份额享有受益权。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第四十一条 </strong>被保险人或者投保人可以变更受益人并书面通知保险人。保险人收到变更受益人的书面通知后，应当在保险单或者其他保险凭证上批注或者附贴批单。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">投保人变更受益人时须经被保险人同意。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第四十二条 </strong>被保险人死亡后，有下列情形之一的，保险金作为被保险人的遗产，由保险人依照《中华人民共和国继承法》的规定履行给付保险金的义务：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）没有指定受益人，或者受益人指定不明无法确定的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）受益人先于被保险人死亡，没有其他受益人的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（三）受益人依法丧失受益权或者放弃受益权，没有其他受益人的。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">受益人与被保险人在同一事件中死亡，且不能确定死亡先后顺序的，推定受益人死亡在先。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第四十三条 </strong>投保人故意造成被保险人死亡、伤残或者疾病的，保险人不承担给付保险金的责任。投保人已交足二年以上保险费的，保险人应当按照合同约定向其他权利人退还保险单的现金价值。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">受益人故意造成被保险人死亡、伤残、疾病的，或者故意杀害被保险人未遂的，该受益人丧失受益权。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第四十四条 </strong>以被保险人死亡为给付保险金条件的合同，自合同成立或者合同效力恢复之日起二年内，被保险人自杀的，保险人不承担给付保险金的责任，但被保险人自杀时为无民事行为能力人的除外。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险人依照前款规定不承担给付保险金责任的，应当按照合同约定退还保险单的现金价值。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第四十五条 </strong>因被保险人故意犯罪或者抗拒依法采取的刑事强制措施导致其伤残或者死亡的，保险人不承担给付保险金的责任。投保人已交足二年以上保险费的，保险人应当按照合同约定退还保险单的现金价值。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第四十六条 </strong>被保险人因第三者的行为而发生死亡、伤残或者疾病等保险事故的，保险人向被保险人或者受益人给付保险金后，不享有向第三者追偿的权利，但被保险人或者受益人仍有权向第三者请求赔偿。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第四十七条</strong> 投保人解除合同的，保险人应当自收到解除合同通知之日起三十日内，按照合同约定退还保险单的现金价值。</span></p><p style="text-align:center;"><span style="background-color:#ffffff;color:#333333;"><strong>第三节 财产保险合同</strong></span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第四十八条 </strong>保险事故发生时，被保险人对保险标的不具有保险利益的，不得向保险人请求赔偿保险金。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第四十九条</strong> 保险标的转让的，保险标的的受让人承继被保险人的权利和义务。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险标的转让的，被保险人或者受让人应当及时通知保险人，但货物运输保险合同和另有约定的合同除外。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">因保险标的转让导致危险程度显著增加的，保险人自收到前款规定的通知之日起三十日内，可以按照合同约定增加保险费或者解除合同。保险人解除合同的，应当将已收取的保险费，按照合同约定扣除自保险责任开始之日起至合同解除之日止应收的部分后，退还投保人。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">被保险人、受让人未履行本条第二款规定的通知义务的，因转让导致保险标的危险程度显著增加而发生的保险事故，保险人不承担赔偿保险金的责任。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第五十条 </strong>货物运输保险合同和运输工具航程保险合同，保险责任开始后，合同当事人不得解除合同。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第五十一条 </strong>被保险人应当遵守国家有关消防、安全、生产操作、劳动保护等方面的规定，维护保险标的的安全。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险人可以按照合同约定对保险标的的安全状况进行检查，及时向投保人、被保险人提出消除不安全因素和隐患的书面建议。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">投保人、被保险人未按照约定履行其对保险标的的安全应尽责任的，保险人有权要求增加保险费或者解除合同。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险人为维护保险标的的安全，经被保险人同意，可以采取安全预防措施。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第五十二条 </strong>在合同有效期内，保险标的的危险程度显著增加的，被保险人应当按照合同约定及时通知保险人，保险人可以按照合同约定增加保险费或者解除合同。保险人解除合同的，应当将已收取的保险费，按照合同约定扣除自保险责任开始之日起至合同解除之日止应收的部分后，退还投保人。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">被保险人未履行前款规定的通知义务的，因保险标的的危险程度显著增加而发生的保险事故，保险人不承担赔偿保险金的责任。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第五十三条</strong> 有下列情形之一的，除合同另有约定外，保险人应当降低保险费，并按日计算退还相应的保险费：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）据以确定保险费率的有关情况发生变化，保险标的的危险程度明显减少的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）保险标的的保险价值明显减少的。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第五十四条 </strong>保险责任开始前，投保人要求解除合同的，应当按照合同约定向保险人支付手续费，保险人应当退还保险费。保险责任开始后，投保人要求解除合同的，保险人应当将已收取的保险费，按照合同约定扣除自保险责任开始之日起至合同解除之日止应收的部分后，退还投保人。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第五十五条 </strong>投保人和保险人约定保险标的的保险价值并在合同中载明的，保险标的发生损失时，以约定的保险价值为赔偿计算标准。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">投保人和保险人未约定保险标的的保险价值的，保险标的发生损失时，以保险事故发生时保险标的的实际价值为赔偿计算标准。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险金额不得超过保险价值。超过保险价值的，超过部分无效，保险人应当退还相应的保险费。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险金额低于保险价值的，除合同另有约定外，保险人按照保险金额与保险价值的比例承担赔偿保险金的责任。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第五十六条 </strong>重复保险的投保人应当将重复保险的有关情况通知各保险人。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">重复保险的各保险人赔偿保险金的总和不得超过保险价值。除合同另有约定外，各保险人按照其保险金额与保险金额总和的比例承担赔偿保险金的责任。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">重复保险的投保人可以就保险金额总和超过保险价值的部分，请求各保险人按比例返还保险费。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">重复保险是指投保人对同一保险标的、同一保险利益、同一保险事故分别与两个以上保险人订立保险合同，且保险金额总和超过保险价值的保险。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第五十七条 </strong>保险事故发生时，被保险人应当尽力采取必要的措施，防止或者减少损失。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险事故发生后，被保险人为防止或者减少保险标的的损失所支付的必要的、合理的费用，由保险人承担；保险人所承担的费用数额在保险标的损失赔偿金额以外另行计算，最高不超过保险金额的数额。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第五十八条</strong> 保险标的发生部分损失的，自保险人赔偿之日起三十日内，投保人可以解除合同；除合同另有约定外，保险人也可以解除合同，但应当提前十五日通知投保人。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">合同解除的，保险人应当将保险标的未受损失部分的保险费，按照合同约定扣除自保险责任开始之日起至合同解除之日止应收的部分后，退还投保人。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第五十九条</strong> 保险事故发生后，保险人已支付了全部保险金额，并且保险金额等于保险价值的，受损保险标的的全部权利归于保险人；保险金额低于保险价值的，保险人按照保险金额与保险价值的比例取得受损保险标的的部分权利。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第六十条</strong> 因第三者对保险标的的损害而造成保险事故的，保险人自向被保险人赔偿保险金之日起，在赔偿金额范围内代位行使被保险人对第三者请求赔偿的权利。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">前款规定的保险事故发生后，被保险人已经从第三者取得损害赔偿的，保险人赔偿保险金时，可以相应扣减被保险人从第三者已取得的赔偿金额。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险人依照本条第一款规定行使代位请求赔偿的权利，不影响被保险人就未取得赔偿的部分向第三者请求赔偿的权利。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第六十一条 </strong>保险事故发生后，保险人未赔偿保险金之前，被保险人放弃对第三者请求赔偿的权利的，保险人不承担赔偿保险金的责任。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险人向被保险人赔偿保险金后，被保险人未经保险人同意放弃对第三者请求赔偿的权利的，该行为无效。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">被保险人故意或者因重大过失致使保险人不能行使代位请求赔偿的权利的，保险人可以扣减或者要求返还相应的保险金。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第六十二条</strong> 除被保险人的家庭成员或者其组成人员故意造成本法第六十条第一款规定的保险事故外，保险人不得对被保险人的家庭成员或者其组成人员行使代位请求赔偿的权利。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第六十三条</strong> 保险人向第三者行使代位请求赔偿的权利时，被保险人应当向保险人提供必要的文件和所知道的有关情况。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第六十四条 </strong>保险人、被保险人为查明和确定保险事故的性质、原因和保险标的的损失程度所支付的必要的、合理的费用，由保险人承担。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第六十五条 </strong>保险人对责任保险的被保险人给第三者造成的损害，可以依照法律的规定或者合同的约定，直接向该第三者赔偿保险金。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">责任保险的被保险人给第三者造成损害，被保险人对第三者应负的赔偿责任确定的，根据被保险人的请求，保险人应当直接向该第三者赔偿保险金。被保险人怠于请求的，第三者有权就其应获赔偿部分直接向保险人请求赔偿保险金。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">责任保险的被保险人给第三者造成损害，被保险人未向该第三者赔偿的，保险人不得向被保险人赔偿保险金。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">责任保险是指以被保险人对第三者依法应负的赔偿责任为保险标的的保险。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第六十六条 </strong>责任保险的被保险人因给第三者造成损害的保险事故而被提起仲裁或者诉讼的，被保险人支付的仲裁或者诉讼费用以及其他必要的、合理的费用，除合同另有约定外，由保险人承担。</span></p><p style="text-align:center;"><span style="background-color:#ffffff;color:#333333;">第三章 保险公司</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第六十七条</strong> 设立保险公司应当经国务院保险监督管理机构批准。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">国务院保险监督管理机构审查保险公司的设立申请时，应当考虑保险业的发展和公平竞争的需要。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">第六十八条 设立保险公司应当具备下列条件：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）主要股东具有持续盈利能力，信誉良好，最近三年内无重大违法违规记录，净资产不低于人民币二亿元；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）有符合本法和《中华人民共和国公司法》规定的章程；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（三）有符合本法规定的注册资本；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（四）有具备任职专业知识和业务工作经验的董事、监事和高级管理人员；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（五）有健全的组织机构和管理制度；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（六）有符合要求的营业场所和与经营业务有关的其他设施；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（七）法律、行政法规和国务院保险监督管理机构规定的其他条件。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">第六十九条 设立保险公司，其注册资本的最低限额为人民币二亿元。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">国务院保险监督管理机构根据保险公司的业务范围、经营规模，可以调整其注册资本的最低限额，但不得低于本条第一款规定的限额。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险公司的注册资本必须为实缴货币资本。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第七十条 </strong>申请设立保险公司，应当向国务院保险监督管理机构提出书面申请，并提交下列材料：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）设立申请书，申请书应当载明拟设立的保险公司的名称、注册资本、业务范围等；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）可行性研究报告；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（三）筹建方案；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（四）投资人的营业执照或者其他背景资料，经会计师事务所审计的上一年度财务会计报告；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（五）投资人认可的筹备组负责人和拟任董事长、经理名单及本人认可证明；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（六）国务院保险监督管理机构规定的其他材料。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第七十一条</strong> 国务院保险监督管理机构应当对设立保险公司的申请进行审查，自受理之日起六个月内作出批准或者不批准筹建的决定，并书面通知申请人。决定不批准的，应当书面说明理由。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第七十二条 </strong>申请人应当自收到批准筹建通知之日起一年内完成筹建工作；筹建期间不得从事保险经营活动。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第七十三条</strong> 筹建工作完成后，申请人具备本法第六十八条规定的设立条件的，可以向国务院保险监督管理机构提出开业申请。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">国务院保险监督管理机构应当自受理开业申请之日起六十日内，作出批准或者不批准开业的决定。决定批准的，颁发经营保险业务许可证；决定不批准的，应当书面通知申请人并说明理由。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第七十四条 </strong>保险公司在中华人民共和国境内设立分支机构，应当经保险监督管理机构批准。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险公司分支机构不具有法人资格，其民事责任由保险公司承担。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第七十五条 </strong>保险公司申请设立分支机构，应当向保险监督管理机构提出书面申请，并提交下列材料：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）设立申请书；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）拟设机构三年业务发展规划和市场分析材料；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（三）拟任高级管理人员的简历及相关证明材料；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（四）国务院保险监督管理机构规定的其他材料。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第七十六条 </strong>保险监督管理机构应当对保险公司设立分支机构的申请进行审查，自受理之日起六十日内作出批准或者不批准的决定。决定批准的，颁发分支机构经营保险业务许可证；决定不批准的，应当书面通知申请人并说明理由。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第七十七条</strong> 经批准设立的保险公司及其分支机构，凭经营保险业务许可证向工商行政管理机关办理登记，领取营业执照。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第七十八条</strong> 保险公司及其分支机构自取得经营保险业务许可证之日起六个月内，无正当理由未向工商行政管理机关办理登记的，其经营保险业务许可证失效。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第七十九条</strong> 保险公司在中华人民共和国境外设立子公司、分支机构，应当经国务院保险监督管理机构批准。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第八十条 </strong>外国保险机构在中华人民共和国境内设立代表机构，应当经国务院保险监督管理机构批准。代表机构不得从事保险经营活动。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第八十一条 </strong>保险公司的董事、监事和高级管理人员，应当品行良好，熟悉与保险相关的法律、行政法规，具有履行职责所需的经营管理能力，并在任职前取得保险监督管理机构核准的任职资格。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险公司高级管理人员的范围由国务院保险监督管理机构规定。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第八十二条 </strong>有《中华人民共和国公司法》第一百四十六条规定的情形或者下列情形之一的，不得担任保险公司的董事、监事、高级管理人员：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）因违法行为或者违纪行为被金融监督管理机构取消任职资格的金融机构的董事、监事、高级管理人员，自被取消任职资格之日起未逾五年的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）因违法行为或者违纪行为被吊销执业资格的律师、注册会计师或者资产评估机构、验证机构等机构的专业人员，自被吊销执业资格之日起未逾五年的。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第八十三条 </strong>保险公司的董事、监事、高级管理人员执行公司职务时违反法律、行政法规或者公司章程的规定，给公司造成损失的，应当承担赔偿责任。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第八十四条 </strong>保险公司有下列情形之一的，应当经保险监督管理机构批准：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）变更名称；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）变更注册资本；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（三）变更公司或者分支机构的营业场所；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（四）撤销分支机构；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（五）公司分立或者合并；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（六）修改公司章程；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（七）变更出资额占有限责任公司资本总额百分之五以上的股东，或者变更持有股份有限公司股份百分之五以上的股东；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（八）国务院保险监督管理机构规定的其他情形。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第八十五条 </strong>保险公司应当聘用专业人员，建立精算报告制度和合规报告制度。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第八十六条 </strong>保险公司应当按照保险监督管理机构的规定，报送有关报告、报表、文件和资料。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险公司的偿付能力报告、财务会计报告、精算报告、合规报告及其他有关报告、报表、文件和资料必须如实记录保险业务事项，不得有虚假记载、误导性陈述和重大遗漏。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第八十七条 </strong>保险公司应当按照国务院保险监督管理机构的规定妥善保管业务经营活动的完整账簿、原始凭证和有关资料。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">前款规定的账簿、原始凭证和有关资料的保管期限，自保险合同终止之日起计算，保险期间在一年以下的不得少于五年，保险期间超过一年的不得少于十年。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第八十八条 </strong>保险公司聘请或者解聘会计师事务所、资产评估机构、资信评级机构等中介服务机构，应当向保险监督管理机构报告；解聘会计师事务所、资产评估机构、资信评级机构等中介服务机构，应当说明理由。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第八十九条</strong> 保险公司因分立、合并需要解散，或者股东会、股东大会决议解散，或者公司章程规定的解散事由出现，经国务院保险监督管理机构批准后解散。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">经营有人寿保险业务的保险公司，除因分立、合并或者被依法撤销外，不得解散。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险公司解散，应当依法成立清算组进行清算。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第九十条 </strong>保险公司有《中华人民共和国企业破产法》第二条规定情形的，经国务院保险监督管理机构同意，保险公司或者其债权人可以依法向人民法院申请重整、和解或者破产清算；国务院保险监督管理机构也可以依法向人民法院申请对该保险公司进行重整或者破产清算。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第九十一条 </strong>破产财产在优先清偿破产费用和共益债务后，按照下列顺序清偿：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）所欠职工工资和医疗、伤残补助、抚恤费用，所欠应当划入职工个人账户的基本养老保险、基本医疗保险费用，以及法律、行政法规规定应当支付给职工的补偿金；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）赔偿或者给付保险金；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（三）保险公司欠缴的除第（一）项规定以外的社会保险费用和所欠税款；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（四）普通破产债权。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">破产财产不足以清偿同一顺序的清偿要求的，按照比例分配。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">破产保险公司的董事、监事和高级管理人员的工资，按照该公司职工的平均工资计算。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第九十二条</strong> 经营有人寿保险业务的保险公司被依法撤销或者被依法宣告破产的，其持有的人寿保险合同及责任准备金，必须转让给其他经营有人寿保险业务的保险公司；不能同其他保险公司达成转让协议的，由国务院保险监督管理机构指定经营有人寿保险业务的保险公司接受转让。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">转让或者由国务院保险监督管理机构指定接受转让前款规定的人寿保险合同及责任准备金的，应当维护被保险人、受益人的合法权益。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第九十三条</strong> 保险公司依法终止其业务活动，应当注销其经营保险业务许可证。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第九十四条</strong> 保险公司，除本法另有规定外，适用《中华人民共和国公司法》的规定。</span></p><p style="text-align:center;"><span style="background-color:#ffffff;color:#333333;">第四章 保险经营规则</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第九十五条 </strong>保险公司的业务范围：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）人身保险业务，包括人寿保险、健康保险、意外伤害保险等保险业务；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）财产保险业务，包括财产损失保险、责任保险、信用保险、保证保险等保险业务；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（三）国务院保险监督管理机构批准的与保险有关的其他业务。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险人不得兼营人身保险业务和财产保险业务。但是，经营财产保险业务的保险公司经国务院保险监督管理机构批准，可以经营短期健康保险业务和意外伤害保险业务。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险公司应当在国务院保险监督管理机构依法批准的业务范围内从事保险经营活动。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第九十六条 </strong>经国务院保险监督管理机构批准，保险公司可以经营本法第九十五条规定的保险业务的下列再保险业务：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）分出保险；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）分入保险。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第九十七条</strong> 保险公司应当按照其注册资本总额的百分之二十提取保证金，存入国务院保险监督管理机构指定的银行，除公司清算时用于清偿债务外，不得动用。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第九十八条</strong> 保险公司应当根据保障被保险人利益、保证偿付能力的原则，提取各项责任准备金。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险公司提取和结转责任准备金的具体办法，由国务院保险监督管理机构制定。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第九十九条 </strong>保险公司应当依法提取公积金。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百条 </strong>保险公司应当缴纳保险保障基金。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险保障基金应当集中管理，并在下列情形下统筹使用：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）在保险公司被撤销或者被宣告破产时，向投保人、被保险人或者受益人提供救济；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）在保险公司被撤销或者被宣告破产时，向依法接受其人寿保险合同的保险公司提供救济；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（三）国务院规定的其他情形。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险保障基金筹集、管理和使用的具体办法，由国务院制定。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百零一条 </strong>保险公司应当具有与其业务规模和风险程度相适应的最低偿付能力。保险公司的认可资产减去认可负债的差额不得低于国务院保险监督管理机构规定的数额；低于规定数额的，应当按照国务院保险监督管理机构的要求采取相应措施达到规定的数额。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百零二条 </strong>经营财产保险业务的保险公司当年自留保险费，不得超过其实有资本金加公积金总和的四倍。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百零三条 </strong>保险公司对每一危险单位，即对一次保险事故可能造成的最大损失范围所承担的责任，不得超过其实有资本金加公积金总和的百分之十；超过的部分应当办理再保险。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险公司对危险单位的划分应当符合国务院保险监督管理机构的规定。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百零四条 </strong>保险公司对危险单位的划分方法和巨灾风险安排方案，应当报国务院保险监督管理机构备案。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百零五条 </strong>保险公司应当按照国务院保险监督管理机构的规定办理再保险，并审慎选择再保险接受人。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百零六条</strong> 保险公司的资金运用必须稳健，遵循安全性原则。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险公司的资金运用限于下列形式：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）银行存款；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）买卖债券、股票、证券投资基金份额等有价证券；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（三）投资不动产；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（四）国务院规定的其他资金运用形式。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险公司资金运用的具体管理办法，由国务院保险监督管理机构依照前两款的规定制定。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百零七条 </strong>经国务院保险监督管理机构会同国务院证券监督管理机构批准，保险公司可以设立保险资产管理公司。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险资产管理公司从事证券投资活动，应当遵守《中华人民共和国证券法》等法律、行政法规的规定。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险资产管理公司的管理办法，由国务院保险监督管理机构会同国务院有关部门制定。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百零八条 </strong>保险公司应当按照国务院保险监督管理机构的规定，建立对关联交易的管理和信息披露制度。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百零九条</strong> 保险公司的控股股东、实际控制人、董事、监事、高级管理人员不得利用关联交易损害公司的利益。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百一十条 </strong>保险公司应当按照国务院保险监督管理机构的规定，真实、准确、完整地披露财务会计报告、风险管理状况、保险产品经营情况等重大事项。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百一十一条 </strong>保险公司从事保险销售的人员应当品行良好，具有保险销售所需的专业能力。保险销售人员的行为规范和管理办法，由国务院保险监督管理机构规定。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百一十二条</strong> 保险公司应当建立保险代理人登记管理制度，加强对保险代理人的培训和管理，不得唆使、诱导保险代理人进行违背诚信义务的活动。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百一十三条 </strong>保险公司及其分支机构应当依法使用经营保险业务许可证，不得转让、出租、出借经营保险业务许可证。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百一十四条 </strong>保险公司应当按照国务院保险监督管理机构的规定，公平、合理拟订保险条款和保险费率，不得损害投保人、被保险人和受益人的合法权益。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险公司应当按照合同约定和本法规定，及时履行赔偿或者给付保险金义务。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百一十五条</strong> 保险公司开展业务，应当遵循公平竞争的原则，不得从事不正当竞争。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百一十六条</strong> 保险公司及其工作人员在保险业务活动中不得有下列行为：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）欺骗投保人、被保险人或者受益人；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）对投保人隐瞒与保险合同有关的重要情况；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（三）阻碍投保人履行本法规定的如实告知义务，或者诱导其不履行本法规定的如实告知义务；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（四）给予或者承诺给予投保人、被保险人、受益人保险合同约定以外的保险费回扣或者其他利益；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（五）拒不依法履行保险合同约定的赔偿或者给付保险金义务；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（六）故意编造未曾发生的保险事故、虚构保险合同或者故意夸大已经发生的保险事故的损失程度进行虚假理赔，骗取保险金或者牟取其他不正当利益；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（七）挪用、截留、侵占保险费；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（八）委托未取得合法资格的机构从事保险销售活动；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（九）利用开展保险业务为其他机构或者个人牟取不正当利益；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（十）利用保险代理人、保险经纪人或者保险评估机构，从事以虚构保险中介业务或者编造退保等方式套取费用等违法活动；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（十一）以捏造、散布虚假事实等方式损害竞争对手的商业信誉，或者以其他不正当竞争行为扰乱保险市场秩序；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（十二）泄露在业务活动中知悉的投保人、被保险人的商业秘密；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（十三）违反法律、行政法规和国务院保险监督管理机构规定的其他行为。</span></p><p style="text-align:center;"><span style="background-color:#ffffff;color:#333333;">第五章 保险代理人和保险经纪人</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百一十七条</strong> 保险代理人是根据保险人的委托，向保险人收取佣金，并在保险人授权的范围内代为办理保险业务的机构或者个人。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险代理机构包括专门从事保险代理业务的保险专业代理机构和兼营保险代理业务的保险兼业代理机构。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百一十八条 </strong>保险经纪人是基于投保人的利益，为投保人与保险人订立保险合同提供中介服务，并依法收取佣金的机构。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百一十九条</strong> 保险代理机构、保险经纪人应当具备国务院保险监督管理机构规定的条件，取得保险监督管理机构颁发的经营保险代理业务许可证、保险经纪业务许可证。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百二十条</strong> 以公司形式设立保险专业代理机构、保险经纪人，其注册资本最低限额适用《中华人民共和国公司法》的规定。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">国务院保险监督管理机构根据保险专业代理机构、保险经纪人的业务范围和经营规模，可以调整其注册资本的最低限额，但不得低于《中华人民共和国公司法》规定的限额。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险专业代理机构、保险经纪人的注册资本或者出资额必须为实缴货币资本。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百二十一条 </strong>保险专业代理机构、保险经纪人的高级管理人员，应当品行良好，熟悉保险法律、行政法规，具有履行职责所需的经营管理能力，并在任职前取得保险监督管理机构核准的任职资格。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百二十二条 </strong>个人保险代理人、保险代理机构的代理从业人员、保险经纪人的经纪从业人员，应当品行良好，具有从事保险代理业务或者保险经纪业务所需的专业能力。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百二十三条 </strong>保险代理机构、保险经纪人应当有自己的经营场所，设立专门账簿记载保险代理业务、经纪业务的收支情况。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百二十四条 </strong>保险代理机构、保险经纪人应当按照国务院保险监督管理机构的规定缴存保证金或者投保职业责任保险。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百二十五条 </strong>个人保险代理人在代为办理人寿保险业务时，不得同时接受两个以上保险人的委托。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百二十六条 </strong>保险人委托保险代理人代为办理保险业务，应当与保险代理人签订委托代理协议，依法约定双方的权利和义务。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百二十七条 </strong>保险代理人根据保险人的授权代为办理保险业务的行为，由保险人承担责任。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险代理人没有代理权、超越代理权或者代理权终止后以保险人名义订立合同，使投保人有理由相信其有代理权的，该代理行为有效。保险人可以依法追究越权的保险代理人的责任。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百二十八条 </strong>保险经纪人因过错给投保人、被保险人造成损失的，依法承担赔偿责任。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百二十九条 </strong>保险活动当事人可以委托保险公估机构等依法设立的独立评估机构或者具有相关专业知识的人员，对保险事故进行评估和鉴定。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">接受委托对保险事故进行评估和鉴定的机构和人员，应当依法、独立、客观、公正地进行评估和鉴定，任何单位和个人不得干涉。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">前款规定的机构和人员，因故意或者过失给保险人或者被保险人造成损失的，依法承担赔偿责任。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百三十条 </strong>保险佣金只限于向保险代理人、保险经纪人支付，不得向其他人支付。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百三十一条 </strong>保险代理人、保险经纪人及其从业人员在办理保险业务活动中不得有下列行为：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）欺骗保险人、投保人、被保险人或者受益人；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）隐瞒与保险合同有关的重要情况；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（三）阻碍投保人履行本法规定的如实告知义务，或者诱导其不履行本法规定的如实告知义务；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（四）给予或者承诺给予投保人、被保险人或者受益人保险合同约定以外的利益；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（五）利用行政权力、职务或者职业便利以及其他不正当手段强迫、引诱或者限制投保人订立保险合同；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（六）伪造、擅自变更保险合同，或者为保险合同当事人提供虚假证明材料；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（七）挪用、截留、侵占保险费或者保险金；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（八）利用业务便利为其他机构或者个人牟取不正当利益；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（九）串通投保人、被保险人或者受益人，骗取保险金；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（十）泄露在业务活动中知悉的保险人、投保人、被保险人的商业秘密。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百三十二条 </strong>本法第八十六条第一款、第一百一十三条的规定，适用于保险代理机构和保险经纪人。</span></p><p style="text-align:center;"><span style="background-color:#ffffff;color:#333333;">第六章 保险业监督管理</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百三十三条</strong> 保险监督管理机构依照本法和国务院规定的职责，遵循依法、公开、公正的原则，对保险业实施监督管理，维护保险市场秩序，保护投保人、被保险人和受益人的合法权益。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百三十四条</strong> 国务院保险监督管理机构依照法律、行政法规制定并发布有关保险业监督管理的规章 。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百三十五条 </strong>关系社会公众利益的保险险种、依法实行强制保险的险种和新开发的人寿保险险种等的保险条款和保险费率，应当报国务院保险监督管理机构批准。国务院保险监督管理机构审批时，应当遵循保护社会公众利益和防止不正当竞争的原则。其他保险险种的保险条款和保险费率，应当报保险监督管理机构备案。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险条款和保险费率审批、备案的具体办法，由国务院保险监督管理机构依照前款规定制定。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百三十六条</strong> 保险公司使用的保险条款和保险费率违反法律、行政法规或者国务院保险监督管理机构的有关规定的，由保险监督管理机构责令停止使用，限期修改；情节 严重的，可以在一定期限内禁止申报新的保险条 款和保险费率。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百三十七条 </strong>国务院保险监督管理机构应当建立健全保险公司偿付能力监管体系，对保险公司的偿付能力实施监控。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百三十八条 </strong>对偿付能力不足的保险公司，国务院保险监督管理机构应当将其列为重点监管对象，并可以根据具体情况采取下列措施：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）责令增加资本金、办理再保险；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）限制业务范围；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（三）限制向股东分红；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（四）限制固定资产购置或者经营费用规模；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（五）限制资金运用的形式、比例；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（六）限制增设分支机构；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（七）责令拍卖不良资产、转让保险业务；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（八）限制董事、监事、高级管理人员的薪酬水平；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（九）限制商业性广告；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（十）责令停止接受新业务。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百三十九条 </strong>保险公司未依照本法规定提取或者结转各项责任准备金，或者未依照本法规定办理再保险，或者严重违反本法关于资金运用的规定的，由保险监督管理机构责令限期改正，并可以责令调整负责人及有关管理人员。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百四十条 </strong>保险监督管理机构依照本法第一百三十九条的规定作出限期改正的决定后，保险公司逾期未改正的，国务院保险监督管理机构可以决定选派保险专业人员和指定该保险公司的有关人员组成整顿组，对公司进行整顿。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">整顿决定应当载明被整顿公司的名称、整顿理由、整顿组成员和整顿期限，并予以公告。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百四十一条 </strong>整顿组有权监督被整顿保险公司的日常业务。被整顿公司的负责人及有关管理人员应当在整顿组的监督下行使职权。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百四十二条 </strong>整顿过程中，被整顿保险公司的原有业务继续进行。但是，国务院保险监督管理机构可以责令被整顿公司停止部分原有业务、停止接受新业务，调整资金运用。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百四十三条</strong> 被整顿保险公司经整顿已纠正其违反本法规定的行为，恢复正常经营状况的，由整顿组提出报告，经国务院保险监督管理机构批准，结束整顿，并由国务院保险监督管理机构予以公告。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百四十四条</strong> 保险公司有下列情形之一的，国务院保险监督管理机构可以对其实行接管：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）公司的偿付能力严重不足的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）违反本法规定，损害社会公共利益，可能严重危及或者已经严重危及公司的偿付能力的。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">被接管的保险公司的债权债务关系不因接管而变化。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百四十五条 </strong>接管组的组成和接管的实施办法，由国务院保险监督管理机构决定，并予以公告。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百四十六条 </strong>接管期限届满，国务院保险监督管理机构可以决定延长接管期限，但接管期限最长不得超过二年。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百四十七条 </strong>接管期限届满，被接管的保险公司已恢复正常经营能力的，由国务院保险监督管理机构决定终止接管，并予以公告。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百四十八条 </strong>被整顿、被接管的保险公司有《中华人民共和国企业破产法》第二条规定情形的，国务院保险监督管理机构可以依法向人民法院申请对该保险公司进行重整或者破产清算。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百四十九条</strong> 保险公司因违法经营被依法吊销经营保险业务许可证的，或者偿付能力低于国务院保险监督管理机构规定标准，不予撤销将严重危害保险市场秩序、损害公共利益的，由国务院保险监督管理机构予以撤销并公告，依法及时组织清算组进行清算。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百五十条</strong> 国务院保险监督管理机构有权要求保险公司股东、实际控制人在指定的期限内提供有关信息和资料。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百五十一条</strong> 保险公司的股东利用关联交易严重损害公司利益，危及公司偿付能力的，由国务院保险监督管理机构责令改正。在按照要求改正前，国务院保险监督管理机构可以限制其股东权利；拒不改正的，可以责令其转让所持的保险公司股权。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百五十二条 </strong>保险监督管理机构根据履行监督管理职责的需要，可以与保险公司董事、监事和高级管理人员进行监督管理谈话，要求其就公司的业务活动和风险管理的重大事项作出说明。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百五十三条</strong> 保险公司在整顿、接管、撤销清算期间，或者出现重大风险时，国务院保险监督管理机构可以对该公司直接负责的董事、监事、高级管理人员和其他直接责任人员采取以下措施：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）通知出境管理机关依法阻止其出境；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）申请司法机关禁止其转移、转让或者以其他方式处分财产，或者在财产上设定其他权利。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百五十四条 </strong>保险监督管理机构依法履行职责，可以采取下列措施：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）对保险公司、保险代理人、保险经纪人、保险资产管理公司、外国保险机构的代表机构进行现场检查；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）进入涉嫌违法行为发生场所调查取证；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（三）询问当事人及与被调查事件有关的单位和个人，要求其对与被调查事件有关的事项作出说明；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（四）查阅、复制与被调查事件有关的财产权登记等资料；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（五）查阅、复制保险公司、保险代理人、保险经纪人、保险资产管理公司、外国保险机构的代表机构以及与被调查事件有关的单位和个人的财务会计资料及其他相关文件和资料；对可能被转移、隐匿或者毁损的文件和资料予以封存；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（六）查询涉嫌违法经营的保险公司、保险代理人、保险经纪人、保险资产管理公司、外国保险机构的代表机构以及与涉嫌违法事项有关的单位和个人的银行账户；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（七）对有证据证明已经或者可能转移、隐匿违法资金等涉案财产或者隐匿、伪造、毁损重要证据的，经保险监督管理机构主要负责人批准，申请人民法院予以冻结或者查封。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险监督管理机构采取前款第（一）项、第（二）项、第（五）项措施的，应当经保险监督管理机构负责人批准；采取第（六）项措施的，应当经国务院保险监督管理机构负责人批准。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险监督管理机构依法进行监督检查或者调查，其监督检查、调查的人员不得少于二人，并应当出示合法证件和监督检查、调查通知书；监督检查、调查的人员少于二人或者未出示合法证件和监督检查、调查通知书的，被检查、调查的单位和个人有权拒绝。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百五十五条</strong> 保险监督管理机构依法履行职责，被检查、调查的单位和个人应当配合。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百五十六条 </strong>保险监督管理机构工作人员应当忠于职守，依法办事，公正廉洁，不得利用职务便利牟取不正当利益，不得泄露所知悉的有关单位和个人的商业秘密。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百五十七条 </strong>国务院保险监督管理机构应当与中国人民银行、国务院其他金融监督管理机构建立监督管理信息共享机制。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险监督管理机构依法履行职责，进行监督检查、调查时，有关部门应当予以配合。</span></p><p style="text-align:center;"><span style="background-color:#ffffff;color:#333333;">第七章 法律责任</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百五十八条</strong> 违反本法规定，擅自设立保险公司、保险资产管理公司或者非法经营商业保险业务的，由保险监督管理机构予以取缔，没收违法所得，并处违法所得一倍以上五倍以下的罚款；没有违法所得或者违法所得不足二十万元的，处二十万元以上一百万元以下的罚款。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百五十九条 </strong>违反本法规定，擅自设立保险专业代理机构、保险经纪人，或者未取得经营保险代理业务许可证、保险经纪业务许可证从事保险代理业务、保险经纪业务的，由保险监督管理机构予以取缔，没收违法所得，并处违法所得一倍以上五倍以下的罚款；没有违法所得或者违法所得不足五万元的，处五万元以上三十万元以下的罚款。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百六十条 </strong>保险公司违反本法规定，超出批准的业务范围经营的，由保险监督管理机构责令限期改正，没收违法所得，并处违法所得一倍以上五倍以下的罚款；没有违法所得或者违法所得不足十万元的，处十万元以上五十万元以下的罚款。逾期不改正或者造成严重后果的，责令停业整顿或者吊销业务许可证。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百六十一条 </strong>保险公司有本法第一百一十六条规定行为之一的，由保险监督管理机构责令改正，处五万元以上三十万元以下的罚款；情节 严重的，限制其业务范围、责令停止接受新业务或者吊销业务许可证。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百六十二条 </strong>保险公司违反本法第八十四条规定的，由保险监督管理机构责令改正，处一万元以上十万元以下的罚款。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百六十三条 </strong>保险公司违反本法规定，有下列行为之一的，由保险监督管理机构责令改正，处五万元以上三十万元以下的罚款：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">(</span><span style="color:#333333;">一)超额承保，情节严重的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">(</span><span style="color:#333333;">二)为无民事行为能力人承保以死亡为给付保险金条件的保险的。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百六十四条 </strong>违反本法规定，有下列行为之一的，由保险监督管理机构责令改正，处五万元以上三十万元以下的罚款；情节严重的，可以限制其业务范围、责令停止接受新业务或者吊销业务许可证：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）未按照规定提存保证金或者违反规定动用保证金的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）未按照规定提取或者结转各项责任准备金的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（三）未按照规定缴纳保险保障基金或者提取公积金的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（四）未按照规定办理再保险的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（五）未按照规定运用保险公司资金的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（六）未经批准设立分支机构的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（七）未按照规定申请批准保险条款、保险费率的。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百六十五条 </strong>保险代理机构、保险经纪人有本法第一百三十一条规定行为之一的，由保险监督管理机构责令改正，处五万元以上三十万元以下的罚款；情节严重的，吊销业务许可证。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百六十六条</strong> 保险代理机构、保险经纪人违反本法规定，有下列行为之一的，由保险监督管理机构责令改正，处二万元以上十万元以下的罚款；情节严重的，责令停业整顿或者吊销业务许可证：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">(</span><span style="color:#333333;">一)未按照规定缴存保证金或者投保职业责任保险的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">(</span><span style="color:#333333;">二)未按照规定设立专门账簿记载业务收支情况的。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百六十七条</strong> 违反本法规定，聘任不具有任职资格的人员的，由保险监督管理机构责令改正，处二万元以上十万元以下的罚款。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百六十八条</strong> 违反本法规定，转让、出租、出借业务许可证的，由保险监督管理机构处一万元以上十万元以下的罚款；情节严重的，责令停业整顿或者吊销业务许可证。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百六十九条</strong> 违反本法规定，有下列行为之一的，由保险监督管理机构责令限期改正；逾期不改正的，处一万元以上十万元以下的罚款：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">(</span><span style="color:#333333;">一)未按照规定报送或者保管报告、报表、文件、资料的，或者未按照规定提供有关信息、资料的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">(</span><span style="color:#333333;">二)未按照规定报送保险条款、保险费率备案的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">(</span><span style="color:#333333;">三)未按照规定披露信息的。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百七十条 </strong>违反本法规定，有下列行为之一的，由保险监督管理机构责令改正，处十万元以上五十万元以下的罚款；情节严重的，可以限制其业务范围、责令停止接受新业务或者吊销业务许可证：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">(</span><span style="color:#333333;">一)编制或者提供虚假的报告、报表、文件、资料的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">(</span><span style="color:#333333;">二)拒绝或者妨碍依法监督检查的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">(</span><span style="color:#333333;">三)未按照规定使用经批准或者备案的保险条款、保险费率的。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百七十一条 </strong>保险公司、保险资产管理公司、保险专业代理机构、保险经纪人违反本法规定的，保险监督管理机构除分别依照本法第一百六十条至第一百七十条的规定对该单位给予处罚外，对其直接负责的主管人员和其他直接责任人员给予警告，并处一万元以上十万元以下的罚款；情节严重的，撤销任职资格。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百七十二条 </strong>个人保险代理人违反本法规定的，由保险监督管理机构给予警告，可以并处二万元以下的罚款；情节严重的，处二万元以上十万元以下的罚款。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百七十三条 </strong>外国保险机构未经国务院保险监督管理机构批准，擅自在中华人民共和国境内设立代表机构的，由国务院保险监督管理机构予以取缔，处五万元以上三十万元以下的罚款。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">外国保险机构在中华人民共和国境内设立的代表机构从事保险经营活动的，由保险监督管理机构责令改正，没收违法所得，并处违法所得一倍以上五倍以下的罚款；没有违法所得或者违法所得不足二十万元的，处二十万元以上一百万元以下的罚款；对其首席代表可以责令撤换；情节严重的，撤销其代表机构。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百七十四条</strong> 投保人、被保险人或者受益人有下列行为之一，进行保险诈骗活动，尚不构成犯罪的，依法给予行政处罚：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（一）投保人故意虚构保险标的，骗取保险金的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（二）编造未曾发生的保险事故，或者编造虚假的事故原因或者夸大损失程度，骗取保险金的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">（三）故意造成保险事故，骗取保险金的。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险事故的鉴定人、评估人、证明人故意提供虚假的证明文件，为投保人、被保险人或者受益人进行保险诈骗提供条件的，依照前款规定给予处罚。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百七十五条 </strong>违反本法规定，给他人造成损害的，依法承担民事责任。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百七十六条 </strong>拒绝、阻碍保险监督管理机构及其工作人员依法行使监督检查、调查职权，未使用暴力、威胁方法的，依法给予治安管理处罚。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百七十七条 </strong>违反法律、行政法规的规定，情节严重的，国务院保险监督管理机构可以禁止有关责任人员一定期限直至终身进入保险业。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百七十八条</strong> 保险监督管理机构从事监督管理工作的人员有下列情形之一的，依法给予处分：</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">(</span><span style="color:#333333;">一)违反规定批准机构的设立的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">(</span><span style="color:#333333;">二)违反规定进行保险条款、保险费率审批的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">(</span><span style="color:#333333;">三)违反规定进行现场检查的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">(</span><span style="color:#333333;">四)违反规定查询账户或者冻结资金的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">(</span><span style="color:#333333;">五)泄露其知悉的有关单位和个人的商业秘密的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">(</span><span style="color:#333333;">六)违反规定实施行政处罚的；</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">(</span><span style="color:#333333;">七)滥用职权、玩忽职守的其他行为。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百七十九条 </strong>违反本法规定，构成犯罪的，依法追究刑事责任。</span></p><p style="text-align:center;"><span style="background-color:#ffffff;color:#333333;">第八章 附则</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百八十条 </strong>保险公司应当加入保险行业协会。保险代理人、保险经纪人、保险公估机构可以加入保险行业协会。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">保险行业协会是保险业的自律性组织，是社会团体法人。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百八十一条</strong> 保险公司以外的其他依法设立的保险组织经营的商业保险业务，适用本法。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百八十二条</strong> 海上保险适用《中华人民共和国海商法》的有关规定；《中华人民共和国海商法》未规定的，适用本法的有关规定。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百八十三条</strong> 中外合资保险公司、外资独资保险公司、外国保险公司分公司适用本法规定；法律、行政法规另有规定的，适用其规定。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百八十四条 </strong>国家支持发展为农业生产服务的保险事业。农业保险由法律、行政法规另行规定。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;">强制保险，法律、行政法规另有规定的，适用其规定。</span></p><p style="text-align:justify;"><span style="background-color:#ffffff;color:#333333;"><strong>第一百八十五条 </strong>本法自2009</span><span style="color:#333333;">年10月1日起施行。</span></p><p><br>&nbsp;</p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 07:27:27	2024-10-14 07:27:27	\N	\N	\N	\N
1	\N	\N	\N	网点分布	\N	map-670e812b772e2401479077.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 06:46:56	2024-10-15 14:50:19	\N	\N	\N	\N
5	\N	\N	\N	湖北大同保险经纪有限公司2020年度工作总结暨2021年度工作会	<figure class="image"><img style="aspect-ratio:1440/1080;" src="/images/670cc0c42a747-微信图片_20210409144516.jpg" width="1440" height="1080"></figure><figure class="image"><img style="aspect-ratio:1440/1080;" src="/images/670cc0ceddf44-微信图片_20210409144452.jpg" width="1440" height="1080"></figure>	1-670e929eabd2c138511670.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 06:57:24	2024-10-15 16:04:46	\N	\N	\N	\N
6	\N	\N	\N	2021.12.14信息系统培训	<figure class="image"><img style="aspect-ratio:1705/1279;" src="/images/670cc0f9d2d5d-微信图片_20211217162019.jpg" width="1705" height="1279"></figure><figure class="image"><img style="aspect-ratio:1705/1279;" src="/images/670cc0f9ec62a-微信图片_20211217162013.jpg" width="1705" height="1279"></figure>	1-670e92b49e673663661422.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 06:58:11	2024-10-15 16:05:08	\N	\N	\N	\N
7	\N	\N	\N	湖北大同保险经纪有限公司2020年度年中工作会议（简报）	<p>为总结2020年1-7月份成绩，安排部署2020年下半年工作，8月14日，湖北大同保险经纪有限公司在武汉召开2020年度年中工作会议。总部领导、各分公司班子成员、各直属营业部负责人及总部全体员工参加了会议。集团副总裁、高级顾问刘纯德亲临会场，并作了重要讲话。&nbsp;</p><figure class="image"><img style="aspect-ratio:1440/1080;" src="/images/670cc181a12f9-微信图片_20200814161716.jpg" width="1440" height="1080"></figure><p>会上，集团副总裁、高级顾问刘纯德代表集团宣读了易辉总裁致湖北大同全体干部员工的慰问信，集团对湖北大同2020年上半年工作给予了充分的肯定和支持；会上，刘纯德副总裁和全体同仁畅谈发展、谋划未来，并语重心长告诫建立行业风险管理体系的发展方向及战略意义，并寄语湖北大同全体员同仁：不忘初心，牢记战略；与时俱进，科学发展；培训队伍，继往开来。陈寅尧副总经理代表公司总经理室对2020年1-7月份工作进行了回顾和业务点评；各机构负责人对上半年工作进行了全面梳理和小结，并对体系建设业务作了工作经验介绍和交流。罗瑄副总经理再次强调重申合规经营对一个公司发展的重要性和必要性。廖纪求经理对财务工作中出现的问题进行全面的梳理归纳，对下一步财务工作的合规作了进一步强调和安排。最后，湖北大同总经理刘波作了总结讲话。他客观总结了2020年1-7月份湖北大同各方面工作，深入分析了当前形势及<span style="background-color:#ffffff;">发展的机遇，并就今后的业务、财务、合规管理及公司战略等方面工作</span>进行了安排部署。<strong>刘总要求，</strong>湖北大同今后的工作都要紧紧围绕“抓落实，结硬账”开展工作，<strong>一是</strong>要增强危机意识，坚定不移推进行业风险管理服务<span style="color:#000000;">体系建设，夯实基础，发挥功能拼命干。体系建设是集团赋予我们的根本责任和历史使命，同时也是我们湖北大同的安身之本，立司之根。各分支机构要坚定不移以行业</span><span style="background-color:#ffffff;color:#000000;">体系建设为主线，发挥现有的基本功能，</span><span style="color:#000000;">注重做深做实，做优做大，主动、创新、有效的开展工作。<strong>二是</strong>要增强市场意识，加大服务力度，齐心协力对标干。湖北大同要建立自己的核心竞争力，建立“一主、二辅、多极”的市场经营理念，从多点中积累经验，找到符合湖北大同发展的新路子和新方向。<strong>三是</strong>强化成本意识，创新服务手段，精准发力拼智干。各分支机构从现在起，必须严格贯彻落实公司各项财务管理制度，要建立一体化绩效工资评价体系，实现</span><span style="background-color:#ffffff;color:#000000;">业务、效益、工资三挂钩的管理考核体系，逐步实现内部精细化管理，让湖北大同健康、稳定、可持续发展。</span><span style="color:#000000;"><strong>四是</strong>增强集约意识，强化规范管理，降本增效科学干。各分支机构切忌闭关自守，顾小家成大家，打破小农意识，不要自己顾自己；内控管理是红线，绝不可动摇；严格经营管理，控制成本。<strong>五是</strong>增强合规意识，健全责任体系，警钟长鸣务实干。合规是红线，切不可碰，各分支机构要强化合规意识，大同内部要建体系明责任，签订风险承担机制目标责任书，各尽其能，各司其职，确保湖北大同经营管理的合规合法。</span></p><figure class="image"><img style="aspect-ratio:4032/3024;" src="/images/670cc19b5435e-微信图片_20200818100831.jpg" width="4032" height="3024"></figure><figure class="image"><img style="aspect-ratio:4032/3024;" src="/images/670cc1ca32566-1.jpg" width="4032" height="3024"></figure><p><span style="color:#000000;">刘总最后希望湖北大同各分支机构要坚定发展信心，为今年的责任目标早谋划、早部署、早落实，紧密团结，携手共进，为大同的明天共创辉煌！</span></p>	2-670e930254dac349855725.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 07:02:31	2024-10-15 16:06:26	\N	\N	\N	\N
8	\N	\N	\N	大同经纪召开2019 年一季度工作暨合规经营培训会议	<figure class="image"><img style="aspect-ratio:1920/1080;" src="/images/670cc37de46fb-微信图片_20190313164317.jpg" width="1920" height="1080"></figure><figure class="image"><img style="aspect-ratio:2386/1080;" src="/images/670cc37e087e8-微信图片_20190313162219.jpg" width="2386" height="1080"></figure><p>3 月 6 日，湖北大同保险经纪有限公司2019 年一季度工作暨合规经营培训会在武汉总部会议室召开。大同经纪执行董事兼总经理刘波、副总经理陈寅尧、副总经理兼武汉分公司总经理罗瑄、省内各分支机构负责人和负责行政业务内勤工作同志，以及总部全体员工等 50 余人参加会议，会议由副总经理陈寅尧主持。&nbsp;</p><p>首先，刘波总对 2019 年公司的发展思路和目标任务作阐述与分解，并代表公司与 24 个机构负责人签署年度经营目标责任书。</p><p>&nbsp;随后，陈寅尧副总经理、财务部廖纪求经理、人力部陈艳萍经理、行政部罗兰主管分别就公司业务、财务、人力和行政管理规范进行了为期一天的授课。这次会议是公司对门店布局战略调整以来最大规模的一次工作会，对照2014 年重组后五年发展历程的背景，具有重要意义。</p><p>“以行业风险管理为立司之基，一主两辅，一地一特色”、“长线谋发展，短线作补充，以短辅长”，自2016年以来的公司发展战略调整初见成效！尤其是在2018 年，通过公司上下齐心共同奋斗，行业风险管理方面实现了医疗调解与医责险拓展的协同模式多地成功复制，燃气、机场等项目开花结实并具规模，通过“寻找同路人”成功牵手省内外多个在寿险、车险和项目方面各有擅长的优秀业务团队，充实和组建了多家分支机构，实现了机构、人员和业务总量同步快速发展！当前，我们最迫切任务是如何抓住公司当前有利发展形势，将新老员工的思想统一起来，积极性调动起来，各项优势资源整合起来。</p><p><strong>刘波总指出这次工作会的目的：一是整合共有资源，支持所有机构共同健康发展；二是鼓舞士气，开好局，稳中求进。</strong>简化成 12 个字就是“立规矩、找朋友、共携手、再发展”。</p><p>今年初，集团工作会议对大同经纪未予指定具体的年度目标任务，正是对我司目前探索经纪人的多险种齐头并进、相互支撑、互学致用的发展模式予以呵护和信任。实际情况也是如此！有别于其他保险经纪公司，或者股东业务为主，或者仅车险、寿险、行业险某一专业方向的发展模式，大同经纪通过培育和引进，涌现出多家在各自专攻方向颇具建树的机构，也使得我们有机会尝试综合性保险经纪公司的发展路子。同时我们也注意到，由于业务多元使得公司管理复杂性的增加，甚至不啻于一家中型保险公司，对于大同经纪一家基础员工尚不满百的公司具有极大挑战。&nbsp;</p><p>大同经纪的发展历经曲折，大好局面来之不易，更加懂得掌控复杂局面、把握良好机遇的重要。尽管有难度，但职责所在，不容回避！任何创新惟有大胆尝试、小心求证下才能闯出一片天地，因此，对这次下达的经营目标任务，公司管理层是经历了较长时间的酝酿，本着客观、科学的原则，对各机构业务形态特点和历年数据仔细推敲而制订的。签署目标责任书，就是要明确年度目标任务和行动方向。在前进的路上，通过科学管 3 理、优化调配，业务领先机构贡献利润帮助后发阶段的机构，成长阶段的机构贡献业务规模，实现共同健康发展！</p><p>2019 年，公司总体经营目标是保费2 亿元，佣金6千万，毛利 4 百万，机构数量从 24 家增长至30 家。经营管理上从此前的“自主经营，养活自己”，转向“提升业务质量，提高管理水平，落实奖惩机制”。有省内机构的共同参与，有省外机构的助力，我们有足够的信心全面实现公司各项年度目标。</p><p>“公司是大家施展才华的事业平台，做工作既要目光高远，又要脚踏实地” ，刘波总对与会同志提出如下要求：</p><p>一、定好位&nbsp;</p><p>作为一个职业保险经纪人，首先我们要知道自己是干什么的！我们不是保险公司的业务员，也不是代理公司的销售员，我们不推销保险，也不卖保险，我们是风险管理师。虽然常常落地在保险上，但那只是风险管理过程中化解、转移风险损失的重要手段。所以，我们在日常工作中一定要给自己定好位，特别是在跟客户打交道的时候，始终把客户的利益放在首位，一切以客户需求为中心，依法合规提供差异性的贴心服务。只有这样，才能展示我们的专业性，才能区别于专业代理公司和保险公司，才能与客户建立割不断的联系，成人达己，实现公司业务可持续发展。&nbsp;</p><p>二、谋好事&nbsp;</p><p>首先要加强学习，自己首先要懂，开展业务才能够专业。做好事、做对事，不要一味地追求利益，却砸了牌子。找好载体，做一些差异性的服务，提升客户信任度，增强客户粘性。也就是，“嘴要专（业）、腿要勤、找准点、会讲故事”。 4三、守住线&nbsp;</p><p>业务、财务、人事、行政等内控工作是公司正常运转的基础，如果说经营业绩如鲜花果实，运营内控工作则如根茎，默默支撑和保证大树的枝繁叶茂。2018 年，通过保监部门的外部检查，暴露出我们过去管理工作的严重不足，值得深刻反省。放长眼光看，在银保监合并后强监管的大环境下，也是促进我司苦练内功、实现长远发展的一个契机。守住线，就是要守住合规经营这条底线！&nbsp;</p><p>四、再发展</p><p>&nbsp;5 年来，公司在实践中不断修正发展方向，也希望各机构因地制宜谋划好自己的一亩三分地。借助兄弟公司的成功经验，有条件的可以复制，没条件的可以拓展思路，找准行业风险点，开疆辟土，谋划一片新天地。总而言之，所有东西不要照搬照靠，都要有差异性的地方特色，只有这样不断创新提升，公司发展才能集聚新的生产力，实现长远发展。</p>	1-670e9318cd3d0968065393.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 07:07:44	2024-10-15 16:06:48	\N	\N	\N	\N
21	\N	\N	\N	法律法规 （链接网址）	<ol><li><strong>中华人民共和国保险法：</strong>http://www.cbirc.gov.cn/cn/view/pages/governmentDetail.html?docId=879931&amp;itemId=860&amp;generaltype=0</li><li><strong>保险经纪人监管规定：</strong>http://www.cbirc.gov.cn/cn/view/pages/ItemDetail.html?docId=372937&amp;itemId=928&amp;generaltype=0</li><li><strong>互联网保险业务监管办法：</strong> http://www.cbirc.gov.cn/cn/view/pages/governmentDetail.html?docId=949137&amp;itemId=861&amp;generaltype=1</li><li><strong>银行保险机构许可证管理办法：</strong>http://www.cbirc.gov.cn/cn/view/pages/rulesDetail.html?docId=981958&amp;itemId=4214&amp;generaltype=1</li><li><strong>保险中介行政许可及备案实施办法：</strong>http://www.cbirc.gov.cn/cn/view/pages/rulesDetail.html?docId=1016457&amp;itemId=4214&amp;generaltype=1</li><li><strong>银行保险机构消费者权益保护管理办法：</strong>http://www.cbirc.gov.cn/cn/view/pages/rulesDetail.html?docId=1087524&amp;itemId=4214&amp;generaltype=1</li><li><strong>人身保险业务基本服务规定：</strong>http://www.cbirc.gov.cn/cn/view/pages/ItemDetail.html?docId=372817&amp;itemId=928&amp;generaltype=0</li><li><strong>保险销售行为管理办法：</strong>http://www.cbirc.gov.cn/cn/view/pages/ItemDetail.html?docId=1129945&amp;itemId=928&amp;generaltype=0</li><li><strong>中国银保监会办公厅关于发展独立个人保险代理人有关事项的通知：</strong>http://www.cbirc.gov.cn/cn/view/pages/governmentDetail.html?docId=953491&amp;itemId=861&amp;generaltype=1</li><li><strong>中国银保监会办公厅关于印发《保险中介机构信息化工作监管办法》的通知：</strong>http://www.cbirc.gov.cn/cn/view/pages/governmentDetail.html?docId=958343&amp;itemId=861&amp;generaltype=1</li><li><strong>中国银保监会办公厅关于切实加强保险专业中介机构从业人员管理的通知：</strong>http://www.cbirc.gov.cn/cn/view/pages/governmentDetail.html?docId=904814&amp;itemId=861&amp;generaltype=1</li><li>关于上线新版执业登记系统更加规范从业人员执业管理有关事项的通知:</li><li>中国银保监会办公厅关于开展保险机构销售人员互联网营销宣传合规性自查整改工作的通知</li><li>中国保监会关于保险中介从业人员管理有关问题的通知</li></ol>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 07:28:16	2024-10-14 07:28:16	\N	\N	\N	\N
2	\N	\N	\N	请走进湖北大同保险经纪	<p style="text-align:justify;">怀抱“经世济民，天下大同”的美好愿景，十九年前的那个春天，大同经纪在荆楚大地播下了希望的种子。十九年后的今天，历经楚风汉雨的滋润和洗礼，大同经纪凤凰涅槃，在精彩的绽放中实现了华丽转身，在林林总总的保险中介机构中，独树一帜，引领风潮。</p><p style="text-align:justify;">作为湖北地区注册的保险经纪一级法人机构，经过十九年的探索、传承和丰富发展，大同经纪已经形成了风险管理、风险转移、损失善后等诸多保险经纪服务的成熟经营模式。选择大同，牵手大同，无疑是智者的首选。因为，相比于同业，大同经纪至少具有六大显著优势：</p><p style="text-align:justify;"><strong>一是资本实力优势。</strong>大同经纪注册资本金5000万元。控股股东联想控股集团创办于1984年，2012年综合营业额2266亿元，总资产1872亿元，是世界500强企业。联保投资集团是全产业链的大型金融保险服务集团，注册资本金1.2亿元，是国家保监会第一批批准筹建的五家保险中介集团之一。</p><p style="text-align:justify;"><strong>二是理论技术优势。</strong>雄厚的经济实力支撑和推动了深入的理论研究。在教育、医疗卫生、环境保护等领域的风险管理研究方面纂写了13个行业的风险管理报告，拥有同业公司无法企及的理论水平和技术实力。</p><p style="text-align:justify;"><strong>三是类似项目经验优势。</strong>大同经纪积极参与湖北省教育、医疗、环保等行业风险管理服务方面的研究与实践，在诸多行业建立并完善了“政府推动、政策引导、多方参与、市场运作”的行业风险管理服务体系，<strong>迄今已与湖北省内17个县市行业行政主管部门，以及67家企业或行业协会、163个居民社区签订风险管理服务协议。</strong></p><p style="text-align:justify;">2022年公司实现保险经纪保费5.5亿元，实现营收1.23亿元，在全国同业排名第33名。公司响应“保险新国十条”精神，着手保险之于社会治理重要功能，积极参与医疗、民政、教育、环境等行业风险管理。尤其是在咸宁、十堰、荆州多地通过“保险+调解”参与推动医疗纠纷第三方人民调解，以保险作为风险转移工具，真正实现了“群众满意、政府省心、社会和谐”，得到社会各方的肯定。在此基础上，迅速扩展到交通、校园纠纷调解和风险管理服务。此外公司还致力于涉及国计民生的重大建设项目和法人客户业务开发，近三年已为包括中建三局、中国燃气、东风集团、湖南高速等大型企业或项目提供保险经纪服务。</p><p style="text-align:justify;">大同经纪对行业风险管理服务体系建设有着自己独特的推广方式和管理经验，并集合了一大批有经验的保险经纪和风险管理专业人员。</p><p style="text-align:justify;"><strong>四是总部区位优势。大同经纪成立于2004年5月，是湖北地区第一家获批的全国性保险经纪公司。</strong>湖北省人民政府金融办为公司的设立专门发文督办支持并寄予厚望，武汉市政府及省保监局对公司的设立也给予了大力支持和高度关注。湖北大同总部位于武汉，相对于同业，其决策程序高效，服务速度快捷，资源倾斜力度有保证，本地公共关系紧密，突发事件应对能力强的优势非常明显。</p><p style="text-align:justify;"><strong>五是机构网络优势。</strong>2014年，大同经纪资产重组后，在省政府及各职能部门的全力支持下，高点起步，快速布局，在全省各市州设立了分支机构，形成了在全省范围内通行达业、通城达镇、通乡达村、通街达巷的城乡经纪服务网络。目前，公司机构已根植湖北走向全国：下辖28家机构，其中湖北省内分公司18家，省外分公司6家，省内营业部 4 家。&nbsp;</p><p style="text-align:justify;"><strong>六是服务能力优势。</strong>建设行业风险管理服务体系，既是一项功在千秋的利民工程，又是一项社会涉及面广的科学系统工程。唯有同时具备理论研究能力、合作协调能力、风险管理能力和服务基层能力的现代企业方能肩负起这样的历史使命。大同经纪在风险识别、风险估测、风险评价、风险控制、风险管理和风险转移等环节展示过自己的思想理念、专业能力与风采。</p><p style="text-align:justify;">公司与湖北当地34家省级保险公司签订合作协议，并与多家保险公司完成了系统与网络的对接，是为数不多实现与保险公司网络数据互联互通、相互对接的经纪公司，也是湖北地区合作伙伴最为广泛的保险经纪公司。</p><p style="text-align:justify;"><strong>我公司的业务范围是为投保人拟定投保方案、选择保险人、办理投保手续；协助被保险人进行索赔；为委托人提供防灾、防损或风险评估、风险管理咨询服务等。</strong></p><p style="text-align:justify;">雄厚的资本实力，领先的理论研究水平、类似的项目经营经验、独特的总部区位优势、健全的机构服务网络、强大的风险服务能力成就了不同凡响的大同经纪。在各级政府部门的支持下，大同经纪正在纵深推进以教育、医疗、环保等为主体的行业风险管理服务体系建设，以最大限度的努力帮助各级政府和职能部门扭转“风险分散管理、责任集中承担”的不利局面，进而建立“风险集中管理、责任分散承担”的科学管理体系。分担医疗风险，大同经纪有责。我们将勇于担当，创新进取，以最快速度、最强技术支持、最贴近的服务方式、最极致的医疗风险管理服务体验，为湖北、为郧阳的和谐稳定和经济繁荣作出积极的贡献。</p><p style="text-align:justify;">感谢您的支持，祝您工作顺利！</p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 06:51:00	2024-10-14 06:51:00	\N	\N	\N	\N
22	\N	\N	\N	中国保险监督管理委员会文件	<p style="text-align:center;"><strong>中国保监会关于保险中介从业人员管理 有关问题的通知&nbsp;</strong></p><p>各保监局，中国保险行业协会，各保险公司，各保险中介机构：&nbsp;</p><p>2015 年 4 月 24 日，全国人民代表大会常务委员会第十四次会 议对《中华人民共和国保险法》部分条款作出了修改，取消了保 险销售（含保险代理）、保险经纪从业人员资格核准审批事项。为 确保新旧制度平稳过度，现将有关事项通知如下：&nbsp;</p><p>一、各保监局不得受理保险销售（含保险代理）、保险经纪从 业人员资格核准审批事项，并依法妥善做好后续工作。</p><p>&nbsp;二、根据《国务院审改办关于严肃纪律巩固行政审批制度改 革成果的通知》（审改办发〔2015〕2 号）相关要求，我会决定废 止《关于保险公估从业人员资格考试有关工作的通知》（保监中 介〔2014〕74 号），不再委托中国保险行业协会组织保险公估从 中国保险监督管理委员会文件 保监中介〔2015〕139 号 - 2 - 业人员资格考试，请各相关单位依法妥善做好后续工作。&nbsp;</p><p>三、保险中介从业人员执业前，所属公司应当为其在中国保 监会保险中介监管信息系统进行执业登记，资格证书不作为执业 登记管理的必要条件。&nbsp;</p><p>四、保险公司、保险中介机构应当按照修改后的保险法第 111 条和第 122 条规定，规范从业人员准入管理，认真对从业人员 进行甄选，加强专业培训，确保从业人员品行良好，具有相应的 专业能力。&nbsp;</p><p>五、保监局要认真督促辖内保险公司和保险中介机构严把准 入关，加强风险监控。对于把关不严，造成客户投诉率、保单退 保率等风险指标异常的机构，保监局应采取相关监管措施。 请各保监局将本通知内容及时转至辖内各有关单位，切实贯 彻保险中介从业人员资格核准审批制度改革工作，在放开前端的 同时，严格管控后端，做到无缝对接。中国保监会将尽快制定完 善保险中介从业人员相关管理制度,具体事项另行通知。</p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 07:42:10	2024-10-14 07:42:10	\N	\N	\N	\N
13	\N	\N	\N	营业执照	\N	l1-6731a3131a069918295630.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 07:19:10	2024-11-11 06:24:19	\N	\N	\N	\N
3	\N	\N	\N	大同经纪2022年度经营分析暨2023年度工作会议纪要	<figure class="image"><img style="aspect-ratio:1706/1280;" src="/images/670cbfff5fc71-微信图片_20230228143423.jpg" width="1706" height="1280"></figure><figure class="image"><img style="aspect-ratio:1706/1280;" src="/images/670cc00d780b8-石峰.jpg" width="1706" height="1280"></figure><p><span style="color:#000000;">2023</span>年2<span style="color:#000000;">月23日湖北大同保险经纪有限公司在咸宁召开“湖北大同保险经纪2022</span>年度经营分析暨2023年度工作会议<span style="color:#000000;">”。会议中，公司领导对2022</span>年度的经营情况进行了详细的分析和总结，指出了公司在<span style="color:#000000;">业务发展、客户服务、机构建设等方面取得的成绩和经验，并对存在的问题和不足提出了改进措施。同时，公司领导还对2023</span>年的工作进行了规划和部署，明确了公司的发展目标和重点工作，提出了具体的实施方案和工作要求。<span style="color:#000000;">总部领导、各分公司、直属营业部负责人及总部全体员工参加了会议。刘</span>纯德首席督导也亲临会场，并作了重要讲话。&nbsp;</p>	670cbfff5fc71-wei-xin-tu-pian-20230228143423-670e9264a0486712897950.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-14 06:52:56	2024-10-15 16:03:48	\N	\N	\N	\N
25	\N	\N	\N	法人治理结构	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-29 01:19:40	2024-10-29 01:19:40	\N	\N	\N	\N
26	\N	\N	\N	组织结构	\N	zu-zhi-jie-gou-6720384876ea3271212078.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-29 01:20:08	2024-10-29 01:20:08	\N	\N	\N	\N
27	\N	\N	\N	经世济民，天下大同	\N	slide1-673168dc0dfd5651074595.jpg	全国性保险经纪公司	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-10 11:29:45	2024-11-11 02:15:56	\N	0	0	f
29	\N	\N	\N	创造价值，同心同力，造福社会	\N	image-6731690b779fb529172332.jpg	做有责任有担当的行业保险服务供应商	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 02:16:42	2024-11-11 02:16:43	\N	0	0	f
28	\N	\N	\N	更专业的行业风险管理专家	\N	image-6731787c810da589805123.jpg	行业风险管理专家、保险产品设计专家、保险理赔助手	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 02:16:22	2024-11-11 03:22:36	\N	0	0	f
31	\N	3	\N	医疗责任险领域案例	<p>在湖北省黄冈市，全市及英山县医责险统保项目，江西宜春市医责险统保项目,大同保险在医责险领域，致力于为保障医疗行业的安全运营，大同保险在医责险领域致力于提供全面的风险管理和保险服务。展现了大同保险在此领域的专业实力和承诺。通过这些项目服务，大同保险不仅为医疗机构提供了必要的风险保障，还帮助它们优化风险管理，确保医疗服务的质量和患者安全，从而推动整个医疗行业的健康和可持续发展。</p><p>大同积累了丰富的医疗责任保险项目经验，深入了解医疗风险特点。自2010年以来，大同作为地方政府的保险顾问，统筹推进多个地区医责险的保险工作，持续完善核心技术和服务品牌，现已成长为国内领先的以来责任保险服务供应商。</p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 05:34:05	2024-11-11 05:34:05	\N	0	0	f
32	\N	3	\N	环保责任险案例	<p>由大同保险经纪有限公司统筹组织的湖北省潜江市环保责任保险项目，展示了大同保险在环保责任领域的专业承诺和执行力。该项目专门针对潜江市的环境保护需求，提供了针对性的保险解决方案，旨在为企业和组织在环境管理和潜在的环保责任中提供保障。通过这一项目，大同保险帮助相关企业预防和应对环境风险，减少潜在的财务损失，同时促进了企业对环境保护法规的遵守，提高了社会对环境保护的整体认识和责任感。</p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 05:37:44	2024-11-11 05:37:44	\N	0	0	f
33	\N	3	\N	养老机构责任保险	<p>大同保险经纪有限公司在养老机构责任保险领域积极拓展，与湖北宜昌等多个地市的民政部门展开合作。这种合作主要是为了为养老机构提供全面的责任保险服务，确保这些机构在提供养老服务过程中能得到充分的风险管理和财务保护。通过与地方民政部门的协作，大同保险不仅能更好地理解养老服务行业的特定需求，还能为养老机构量身定制保险解决方案，帮助他们应对可能的法律责任和操作风险，从而提高养老服务的质量和安全性，保障老年人的利益。这些举措也体现了大同保险在社会责任方面的承担和实际行动。</p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 05:38:13	2024-11-11 05:38:13	\N	0	0	f
24	\N	\N	\N	保险中介许可证	\N	l2-6731a33e011be157790204.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-10-16 07:05:16	2024-11-11 06:25:02	\N	\N	\N	\N
44	\N	\N	\N	2023年10月18号 陈寅尧在湖南 做的安全生产责任保险培训	<figure class="image"><img style="aspect-ratio:800/800;" src="/images/6731a47328312-微信图片_20241030095617.jpg" width="800" height="800"></figure><figure class="image"><img style="aspect-ratio:800/800;" src="/images/6731a47345846-微信图片_20241030095612.jpg" width="800" height="800"></figure>	wei-xin-tu-pian-20241030095617-6731a47d3b5e2683959375.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:30:20	2024-11-11 06:30:21	\N	0	0	f
35	\N	2	\N	企业财产保险与风险管理领域	<p>企业财产保险和风险管理不仅涵盖实物资产和运输物资，还包括生产责任、产品责任、环境污染责任等多种责任风险，以及企业可能面临的信用风险。</p><p>全球的实践表明，许多企业的风险管理部门或风险经理通常会通过保险经纪公司的专业服务来获得风险管理支持，因为保险经纪公司在保险与风险管理方面拥有丰富的专业经验和资源。大同将根据企业自身的保险管理情况和风险管理需求，提供全面的支持，协助企业构建完善的保险与风险管理体系，强化企业内部的风险管理功能，切实维护企业的利益。</p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 05:39:41	2024-11-11 05:39:41	\N	0	0	f
36	\N	2	\N	企事业单位员工福利保障方案	<p>为员工构建适合的保障体系，不仅是企业的社会责任，还能有效降低用工风险，提高员工的满意度和敬业度，从而增强企业在人才市场的竞争力。</p><p>除了由企业支付的福利项目外，大同还可以协助企业构建员工自选福利保障平台。这种模式让员工可以根据个人需求选择自购保险福利。企业通过团体议价的优势，为员工提供自愿、自选、自费的个人保险“团购”方案。在不增加企业成本的情况下，员工可以通过企业提供的渠道获得市面上难以获得或更具性价比的保险福利方案。</p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 05:40:11	2024-11-11 05:40:11	\N	0	0	f
41	\N	\N	\N	优势展示	<p>资质优势：公司拥有全国范围的保险经纪业务和政府采购代理双重资质，凭借多年的政府顾问经验，为政府在民生项目中的风险应对提供优质的策略支持。<br>专业优势：大同政保服务团队由一支具备专业技术与丰富实战经验的成员组成，涵盖政府采购、农业、保险、法律、贸易等多个专业领域。团队长期专注于为各级政府提供风险管理服务，在行业内享有较高的声誉。<br>技术优势：公司具备强大的数据分析和风险管理能力，通过专业的保险经纪技能，为政府提供包括风险咨询、数据核查、满意度调查、绩效评估等多项服务支持。<br>角色优势：根据法律规定，保险经纪人应以保护委托方利益为准则。我们秉持客户利益最大化的原则，公平公正地开展业务，确保服务质量。<br>内控优势：在国企风险控制和严格审计的要求下，公司在经营决策中更加严谨，服务流程更加规范透明，为客户提供可靠的服务保障。</p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:11:28	2024-11-11 06:11:28	\N	0	0	f
38	\N	1	\N	女职工安康保险案例	<p>大同保险经纪公司同工会组织开展了女职工安康保险项目，针对女性特种重大疾病保险，旨在为公司内部的女性员工提供更全面的健康保障措施。该保险项目专门覆盖了女性常见的重大疾病如乳腺癌、宫颈癌等，以及其他可能因性别特有的健康风险而引发的疾病。通过这一项目，希望能够提高女职工的健康意识，减轻因疾病带来的经济负担，同时促进工作场所的女职工权益保护和综合福利保障落实。</p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:05:10	2024-11-11 06:05:10	\N	0	0	f
39	\N	1	\N	医惠保手术意外保险案例	<p>大同保险经纪与医疗机构及医惠保公司紧密合作，通过技术驱动提升手术保险业务的效率和客户满意度。通过API接口，让保险服务在保险公司与医疗服务提供者之间无缝对接，从而加速了保险流程，快速投保、即时理赔处理和高效的客户服务。这种技术整合使得手术保险产品不仅更容易被患者接受，同时也简化了医疗机构在处理保险事务时的复杂性，促进医疗机构手术意外风险管理机制的建立，间接促进了和谐的医患关系。</p><p>此外，这种合作模式为保险业务引入了数据驱动的决策支持，通过分析合作医疗机构提供的临床数据，保险公司能够更精准地评估风险，优化保险产品设计。这不仅有助于降低欺诈风险，还能够确保保险覆盖更贴近患者的实际需要，进一步降低保费。</p><p>通过这种创新的合作和技术应用，大同保险经纪不仅提升了自身的市场竞争力，还为整个医疗意外保险行业提供了如何利用技术提高服务质量和效率的标杆思路。医疗垂直领域的保险产品和服务发展的方向，更加个性化、数据驱动和用户友好。</p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:06:00	2024-11-11 06:06:00	\N	0	0	f
40	\N	\N	\N	医惠保医院风险管理系统（手术保）	<p><a href="https://bx.hrisk.cn/yhb-mgr/">https://bx.hrisk.cn/yhb-mgr/</a></p><p>大同保险经纪有限公司与医惠保（武汉）医院管理有限公司联手，基于“专业、健康、守护”的理念，深耕医院医疗风险管理。通过先进的“医惠保”系统和术前谈话视频双录技术，我们积极配合临床科室进行术前风险评估，强化患者教育，并确保医疗意外保险的有效投保与理赔流程的完善。此合作模式已在多家医院成功落地，证实了其在降低医疗意外、保护医院与患者权益，以及优化就医环境方面的显著效益。此成熟的医疗意外风险管理服务方案，共同推进医疗服务质量的提升和医患关系的和谐。</p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:09:36	2024-11-11 06:09:36	\N	0	0	f
42	\N	\N	\N	华中港航物流集团有限公司2024年雇主责任险、财产综合险、货物运输险招标公告（招标编号：HBDTJJ202404001）	<p>一、&nbsp;招标条件</p><p>本项目华中港航物流集团有限公司2024年雇主责任险、财产综合险、货物运输险<br>集采项目&nbsp;已批准采购，项目资金来自&nbsp;自筹资金&nbsp;，招标人为湖北港口资本有限公司，项目已具备招标条件，现招标方式为邀请招标。</p><p>二、项目概况与招标内容</p><p>规模：华中港航物流集团有限公司2024年雇主责任险、财产综合险、货物运输险集采项目，具体见采购文件第五章“招标要求”。<br>范围：本项目招标划分为3个标段，本次招标3个标段:<br>其中（01）标段一、雇主责任保险，参保职工430人。<br>（02）标段二、企业财产保险，预算上限20241.00元。<br>（03）标段三、货物运输保险，货物保险价值预估人民币50亿元。<br>投标人可根据需要选择其中一个标段或全部标段投标。</p><p>三、投标人资格要求</p><p>1、投标人必须具有独立承担民事责任的能力。<br>2、投标人须是在湖北省内依法设立的公司、分公司、子公司、分支机构（同一保险公司的不同分（子）公司不得同时参加本项目投标）。<br>3、投标人必须是依照《中华人民共和国保险法》设立的保险公司，持有金融监管部门颁发的且年审合格的《中华人民共和国经营保险业务许可证》。<br>4、具有良好的商业信誉和健全的财务会计制度。<br>5、提供近三年类似保险项目业绩证明：近三年（2021 年 4月 1 日至投标递交截止时间，以合同签订时间为准）类似项目承保业绩，须提供有效合同履约证明(以投标人提供的合同或保单复印件加盖投标人单位公章为准)。<br>5、投标人未被列入“信用中国”网站(www.creditchina.gov.cn)失信被执行人、重大税收违法失信主体、政府采购严重违法失信行为记录名单以及中国政府采购网（http://www.ccgp.gov.cn）政府采购严重违法失信行为记录名单（提供承诺或网上查询结果截图并加盖投标单位公章）；<br>本项目不接受联合体投标。</p><p>四、招标文件的获取</p><p>1、获取时间：2024年&nbsp;4&nbsp;月&nbsp;8&nbsp;日至2024年&nbsp;4&nbsp;月&nbsp;12&nbsp;日，每日&nbsp;09&nbsp;时&nbsp;00&nbsp;分至&nbsp;17&nbsp;时&nbsp;00&nbsp;分（北京时间，下同）。<br>2、招标文件获取方式：<br>参与本次投标的保险公司，携带以下资料到指定地点获取招标文件：营业执照（复印件），法人授权委托书及被授权人身份证，前往地址：湖北大同保险经纪有限公司，武昌区中北路126号尚城国际5层20室，完成获取。<br>文件获取联系人及电话：晏经理15207127275<br>3、招标文件售价&nbsp;500&nbsp;元，售后不退。</p><p>五、投标文件的递交</p><p>1、&nbsp;投标文件递交的截止时间为&nbsp;2024&nbsp;年&nbsp;4&nbsp;月&nbsp;19&nbsp;日&nbsp;09&nbsp;时&nbsp;30&nbsp;分，地点为&nbsp;武昌区中北路126号尚城国际5层20室。<br>2、逾期送达的、未送达指定地点的或者不按照招标文件要求密封的投标文件，招标人将予以拒收。</p><p>六、开标时间及地点</p><p>开评标时间为2024&nbsp;年&nbsp;4&nbsp;月&nbsp;19&nbsp;日&nbsp;09&nbsp;时&nbsp;30&nbsp;分，地点为&nbsp;武昌区中北路126号尚城国际5层20室。</p><p>七、其他&nbsp;<br>1、保险服务期限：一年，以保险起止时间为准。<br>2、招标发布媒介：湖北大同保险经纪有限公司官方网站（http://www.hbdtjj.com/）。</p><p>八、联系方式</p><p>招标人:湖北港口资本有限公司<br>地址:武汉市江汉区新华路特8号7楼<br>联系人:冯军清<br>电话:15671629007<br>&nbsp;<br>保险经纪机构：湖北大同保险经纪有限公司<br>地址：武汉市武昌区中北路126号尚城国际5层20室<br>联系人:熊良松<br>电话：15072429714</p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:15:54	2024-11-11 06:15:54	\N	0	0	f
43	\N	\N	\N	政府采购优秀供应商	\N	l3-6731a3697e68a306716202.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:25:44	2024-11-11 06:25:45	\N	0	0	f
37	\N	\N	\N	个人风险解决方案	<p>程传铂18872226677（健康保险事业群） <a href="mailto:Chengcb369@163.com">Chengcb369@163.com</a></p><p>&nbsp;</p>	3-6731c11cc664b595655829.jpg	我们重视您的需求，更深谙您对生活的憧憬。安诺将从健康管理、疾病康复、出行保障、财富传承等多个维度提供友善建议，助您规划生涯、赢得人生。	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:01:34	2024-11-11 08:32:28	\N	0	0	f
45	\N	\N	\N	2023年7月12日湖北大同保险经纪有限公司湖南分公司陪同刘波总一行顶骄阳冒酷暑前往茶常高速项目3-4、14标段项目部进行风险巡查和“送清凉”工作	<figure class="image"><img style="aspect-ratio:888/500;" src="/images/6731a4af377bf-2.jpg" width="888" height="500"></figure><figure class="image"><img style="aspect-ratio:596/1060;" src="/images/6731a4af175ba-1.jpg" width="596" height="1060"></figure><figure class="image"><img style="aspect-ratio:1706/1280;" src="/images/6731a4af51d1b-微信图片_20241030095300.jpg" width="1706" height="1280"></figure><figure class="image"><img style="aspect-ratio:864/649;" src="/images/6731a4af6cd8c-3.jpg" width="864" height="649"></figure>	wei-xin-tu-pian-20241030095300-6731a4c3277c9007291316.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:31:30	2024-11-11 06:31:31	\N	0	0	f
46	\N	\N	\N	2022年6月9日十堰市卫健委二级巡视员曹博莅临郧阳区医患纠纷调解中心调研	<figure class="image"><img style="aspect-ratio:875/655;" src="/images/6731a4e7d43c7-1 (1).jpg" width="875" height="655"></figure>	1-1-6731a4ee8cb74857152652.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:32:13	2024-11-11 06:32:14	\N	0	0	f
47	\N	\N	\N	2023年3月19日咸安区市场监督管理总局做视屏安全责任保险培训	<figure class="image"><img style="aspect-ratio:1706/1279;" src="/images/6731a515c33a4-微信图片_20241030093154.jpg" width="1706" height="1279"></figure><figure class="image"><img style="aspect-ratio:1702/1276;" src="/images/6731a515a733b-微信图片_20241030093207.jpg" width="1702" height="1276"></figure>	wei-xin-tu-pian-20241030093207-6731a521af5dd305752970.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:33:05	2024-11-11 06:33:05	\N	0	0	f
48	\N	\N	\N	2022年10月10日在潜江市 环保局做的 环境污染责任保险培训	<figure class="image"><img style="aspect-ratio:1440/1080;" src="/images/6731a544b0418-微信图片_20241030095759.jpg" width="1440" height="1080"></figure><figure class="image"><img style="aspect-ratio:1440/1080;" src="/images/6731a544cc87c-微信图片_20241030095717.jpg" width="1440" height="1080"></figure><figure class="image"><img style="aspect-ratio:1440/1080;" src="/images/6731a544f1008-微信图片_20241030095734.jpg" width="1440" height="1080"></figure>	wei-xin-tu-pian-20241030095734-6731a551e6b49614806607.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:33:53	2024-11-11 06:33:53	\N	0	0	f
49	\N	\N	\N	2022年5月咸宁市分公司与咸宁市咸安区教育局共同组织并参与协办了咸安区“大同杯”青少年象棋比赛、“大同杯”足球比赛，同时全程冠名赞助咸安区第十届中小学生桂花艺术节	<figure class="image"><img style="aspect-ratio:800/362;" src="/images/6731a56e53f79-微信图片_20241030093518.jpg" width="800" height="362"></figure><figure class="image"><img style="aspect-ratio:2832/1280;" src="/images/6731a56e71b08-微信图片_20241030093523.jpg" width="2832" height="1280"></figure>	wei-xin-tu-pian-20241030093518-6731a5782694e516345481.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:34:31	2024-11-11 06:34:32	\N	0	0	f
50	\N	\N	\N	2024年8月21日 消防培训	<figure class="image"><img style="aspect-ratio:1706/1279;" src="/images/6731a598baae4-微信图片_20241030094017.jpg" width="1706" height="1279"></figure><figure class="image"><img style="aspect-ratio:1706/1279;" src="/images/6731a598d6471-微信图片_20241030094012.jpg" width="1706" height="1279"></figure>	wei-xin-tu-pian-20241030094012-6731a5a304bc0286448102.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:35:14	2024-11-11 06:35:15	\N	0	0	f
51	\N	\N	\N	2024年7月29日湖北大同保险经纪有限公司宜春医责险项目座谈会	<figure class="image"><img style="aspect-ratio:1702/1276;" src="/images/6731a5bbe214e-微信图片_20241030093945.jpg" width="1702" height="1276"></figure>	wei-xin-tu-pian-20241030093945-6731a5c1e7c69231620255.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:35:45	2024-11-11 06:35:45	\N	0	0	f
52	\N	\N	\N	大同简介	<p>湖北大同保险经纪有限公司（以下简称大同经纪）成立于2004年5月，是由华中电网有限公司发起组建的一家全国性保险经纪有限公司，也是湖北地区第一家获批的法人保险经纪公司。<br>&nbsp; &nbsp;2014年2月，大同经纪由联想控股核心成员企业——联保投资集团全资并购,成为联合保险经纪集团旗下，总部设在武汉，立足湖北，辐射全国的一级法人机构，注册资本5000万元。<br>&nbsp; &nbsp;资产重组后的大同经纪，在湖北省人民政府及保险监管部门的全力支持下快速布局、稳健发展，以“高起点、专业化”的形象介入市场。大同经纪在湖北省各市（州）设立分公司，县（市、区）设立营业部，形成了覆盖全省城乡的机构网络。<br>&nbsp; &nbsp;大同经纪拥有一批既懂保险，又熟知社会行业风险管理的复合型人才，着力打造一支“服务型、创新型、学习型、智慧型”的员工队伍，以雄厚的技术实力，精湛的专业技能，为客户提供“专业、便捷、贴心、周到”的风险管理、风险转移和损失善后服务。<br>&nbsp; &nbsp;大同经纪秉承“诚信、稳健、务实、求精”的经营理念，致力于推动社会行业风险管理服务体系、“三农”风险保障服务体系、传统产、寿险业务经纪人运作服务体系和助力政府社会公共服务平台推进的建设，使我们的风险管理和保险经纪服务通行达业、通街达巷、通乡达村、通城达镇，覆盖全省城市乡村。公司经营的主要产品包括财产险、工程险、车险、货物运输险、船舶险、船建险、责任险、巨灾险、农业险、信用险、健康险、意外险、人寿险、员工福利险及再保险等各类产寿险业务，并通过上述各类保险产品服务为我国保险事业和社会经济的稳定发展作出积极贡献。</p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:43:45	2024-11-11 06:43:45	\N	0	0	f
54	\N	\N	\N	国家主席习近平发表二〇二二年新年贺词	<figure class="image"><img style="aspect-ratio:640/417;" src="/images/6731a8487b6eb-image (1).jpeg" width="640" height="417"></figure><p>大家好，2022年即将到来。我在北京向大家致以新年祝福！</p><p>回首这一年，意义非凡。我们亲历了党和国家历史上具有里程碑意义的大事。“两个一百年”奋斗目标历史交汇，我们开启了全面建设社会主义现代化国家新征程，正昂首阔步行进在实现中华民族伟大复兴的道路上。</p><p>从年头到年尾，农田、企业、社区、学校、医院、军营、科研院所……大家忙了一整年，付出了，奉献了，也收获了。在飞逝的时光里，我们看到的、感悟到的中国，是一个坚韧不拔、欣欣向荣的中国。这里有可亲可敬的人民，有日新月异的发展，有赓续传承的事业。</p><p>七月一日，我们隆重庆祝中国共产党成立一百周年。站在天安门城楼上感慨系之，历史征程风云激荡，中国共产党人带领亿万人民经千难而百折不挠、历万险而矢志不渝，成就了百年大党的恢宏气象。不忘初心，方得始终。我们唯有踔厉奋发、笃行不怠，方能不负历史、不负时代、不负人民。</p><p>党的十九届六中全会通过了党的第三个历史决议。百年成就使人振奋，百年经验给人启迪。我曾谈到当年毛主席与黄炎培先生的“窑洞对”，我们只有勇于自我革命才能赢得历史主动。中华民族伟大复兴绝不是轻轻松松、敲锣打鼓就能实现的，也绝不是一马平川、朝夕之间就能到达的。我们要常怀远虑、居安思危，保持战略定力和耐心，“致广大而尽精微”。</p><p>大国之大，也有大国之重。千头万绪的事，说到底是千家万户的事。我调研了一些地方，看了听了不少情况，很有启发和收获。每到群众家中，常会问一问，还有什么困难，父老乡亲的话我都记在心里。</p><p>民之所忧，我必念之；民之所盼，我必行之。我也是从农村出来的，对贫困有着切身感受。经过一代代接续努力，以前贫困的人们，现在也能吃饱肚子、穿暖衣裳，有学上、有房住、有医保。全面小康、摆脱贫困是我们党给人民的交代，也是对世界的贡献。让大家过上更好生活，我们不能满足于眼前的成绩，还有很长的路要走。</p><p>黄河安澜是中华儿女的千年期盼。近年来，我走遍了黄河上中下游9省区。无论是黄河长江“母亲河”，还是碧波荡漾的青海湖、逶迤磅礴的雅鲁藏布江；无论是南水北调的世纪工程，还是塞罕坝林场的“绿色地图”；无论是云南大象北上南归，还是藏羚羊繁衍迁徙……这些都昭示着，人不负青山，青山定不负人。</p><p>这一年，还有很多难忘的中国声音、中国瞬间、中国故事。“请党放心、强国有我”的青春誓言，“清澈的爱、只为中国”的深情告白；“祝融”探火、“羲和”逐日、“天和”遨游星辰；运动健儿激情飞扬、奋勇争先；全国上下防控疫情坚决有力；受灾群众守望相助重建家园；人民解放军指战员、武警部队官兵矢志强军、保家卫国……无数平凡英雄拼搏奋斗，汇聚成新时代中国昂扬奋进的洪流。</p><p>祖国一直牵挂着香港、澳门的繁荣稳定。只有和衷共济、共同努力，“一国两制”才能行稳致远。实现祖国完全统一是两岸同胞的共同心愿。真诚期盼全体中华儿女携手向前，共创中华民族美好未来。</p><p>我同外国领导人及国际组织负责人电话沟通、视频连线时，他们多次赞扬中国抗疫和为全球疫情防控所作的贡献。截至目前，中国累计向120多个国家和国际组织提供20亿剂新冠疫苗。世界各国风雨同舟、团结合作，才能书写构建人类命运共同体的新篇章。</p><p>再过一个多月，北京冬奥会、冬残奥会就要开幕了。让更多人参与到冰雪运动中来，这也是奥林匹克运动的题中之义。我们将竭诚为世界奉献一届奥运盛会。世界期待中国，中国做好了准备。</p><p>新年的钟声即将敲响。我们的三位航天员正在浩瀚太空“出差”，海外同胞仍在辛勤耕耘，使领馆、中资企业等海外派驻人员和广大留学生仍在勇毅坚守，无数追梦人还在奋斗奉献。大家辛苦了，我向大家致以诚挚的新年问候！</p><p>让我们一起向未来！祝福国泰民安！</p>	image-1-6731a84ad753e979878636.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:46:34	2024-11-11 06:46:34	\N	0	0	f
53	\N	\N	\N	中国共产党	<figure class="image"><img style="aspect-ratio:1000/667;" src="/images/6731a8541fc59-image.jpeg" width="1000" height="667"></figure><p>中国共产党（英文名：the Communist Party of China，简写CPC），创建于1921年7月23日，1921年中国共产党成立后，确立了新民主主义革命的正确道路，让灾难深重的中国人民看到了新的希望、有了新的依靠。我们党探索出农村包围城市、武装夺取政权的正确革命道路，“唤起工农千百万”“夺过鞭子揍敌人”，经过土地革命战争、抗日战争、解放战争，推翻了压在中国人民头上的帝国主义、封建主义、官僚资本主义“三座大山”，建立了人民当家作主的中华人民共和国，彻底结束了近代以来中国内忧外患、积贫积弱的悲惨境地，开启了中华民族发展进步的新纪元。<br>&nbsp; &nbsp; &nbsp;&nbsp;中国共产党是中国工人阶级的先锋队，同时是中国人民和中华民族的先锋队，是中国特色社会主义事业的领导核心，代表中国先进生产力的发展要求，代表中国先进文化的前进方向，代表中国最广大人民的根本利益。党的最高理想和最终目标是实现共产主义。<br>&nbsp; &nbsp; &nbsp;&nbsp;中国共产党以马克思列宁主义、毛泽东思想、邓小平理论、“三个代表”重要思想、科学发展观、习近平新时代中国特色社会主义思想作为自己的行动指南。中国共产党领导是中国特色社会主义最本质的特征。<br>【政策宣示】<br>坚持党的指导思想和基本路线。<br>坚持解放思想，实事求是，与时俱进。<br>坚持全心全意为人民服务。<br>坚持民主集中制。<br>坚持以经济建设为中心。<br>坚持四项基本原则。<br>坚持改革开放。<br>坚持和平共处五项原则。<br>坚持党领导人民解放军等其他力量。<br>党的领导主要是政治，思想和组织的领导。</p>	image-6731a80c3a725590852888.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:45:31	2024-11-11 06:45:32	\N	0	0	f
55	\N	\N	\N	入党誓词	<figure class="image"><img style="aspect-ratio:1201/661;" src="/images/6731a87556658-image (1).png" width="1201" height="661"></figure>	image-1-6731a87708729763584224.png	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:47:18	2024-11-11 06:47:19	\N	0	0	f
56	\N	\N	\N	习近平同志《论中国共产党历史》主要篇目介绍	<p>中共中央党史和文献研究院编辑的习近平同志《论中国共产党历史》一书，收入习近平同志2012年11月29日至2020年11月24日期间关于中国共产党历史的重要文稿40篇。现将这部专题文集的主要篇目介绍如下。<br>&nbsp;《实现中华民族伟大复兴是中华民族近代以来最伟大的梦想》是2012年11月29日习近平同志在参观《复兴之路》展览时的讲话。指出：实现中华民族伟大复兴，就是中华民族近代以来最伟大的梦想。这个梦想，凝聚了几代中国人的夙愿，体现了中华民族和中国人民的整体利益，是每一个中华儿女的共同期盼。历史告诉我们，每个人的前途命运都与国家和民族的前途命运紧密相连。国家好，民族好，大家才会好。现在，我们比历史上任何时期都更接近中华民族伟大复兴的目标，比历史上任何时期都更有信心、有能力实现这个目标。<br>&nbsp;《正确认识改革开放前和改革开放后两个历史时期》是2013年1月5日习近平同志在新进中央委员会的委员、候补委员学习贯彻党的十八大精神研讨班上讲话的一部分。指出：我们党领导人民进行社会主义建设，有改革开放前和改革开放后两个历史时期，这是两个相互联系又有重大区别的时期，但本质上都是我们党领导人民进行社会主义建设的实践探索。不能用改革开放后的历史时期否定改革开放前的历史时期，也不能用改革开放前的历史时期否定改革开放后的历史时期。改革开放前的社会主义实践探索为改革开放后的社会主义实践探索积累了条件，改革开放后的社会主义实践探索是对前一个时期的坚持、改革、发展。<br>&nbsp;《知史爱党，知史爱国》是2013年3月至2020年8月期间习近平同志讲话中有关内容的节录。强调，历史是最好的教科书，是最好的老师。指出：要认真学习党史、国史，知史爱党，知史爱国。要了解我们党和国家事业的来龙去脉，汲取我们党和国家的历史经验，正确了解党和国家历史上的重大事件和重要人物。要围绕中国共产党为什么“能”、马克思主义为什么“行”、中国特色社会主义为什么“好”等重大问题，广泛开展宣传教育，加强思想舆论引导，坚定广大干部群众对中国特色社会主义的道路自信、理论自信、制度自信、文化自信。<br>&nbsp;《学习党史、国史是坚持和发展中国特色社会主义的必修课》是2013年6月25日习近平同志主持中共十八届中央政治局第七次集体学习时的讲话。指出：学习党史、国史，是我们坚持和发展中国特色社会主义、把党和国家各项事业继续推向前进的必修课。这门功课不仅必修，而且必须修好。强调，在新的历史条件下坚持和发展中国特色社会主义，必须坚持走自己的路，必须顺应世界大势，必须代表最广大人民根本利益，必须加强党的自身建设，必须坚定中国特色社会主义自信。<br>&nbsp;《中国革命历史是最好的营养剂》是2013年7月11日、12日习近平同志在河北调研指导党的群众路线教育实践活动时讲话的一部分。指出：西柏坡是革命圣地，党中央和毛泽东同志在这里指挥了三大战役，指导革命取得全国胜利，进而建立了新中国。毛泽东同志在这里提出了“两个务必”的重要思想。就拿我们现在开会的这间屋子来说，意义就非同寻常。这里是立规矩的地方。党的规矩的建立和执行，有力推动了党的作风建设和纪律建设。对毛泽东同志提出“两个务必”的深邃思想和战略考虑，我们要不断学习领会。我们要不断向全党严肃郑重地提出这个问题，始终做到谦虚谨慎、艰苦奋斗，使我们的党永远不变质、我们的红色江山永远不变色。<br>&nbsp;《讲好中国共产党的故事》是2013年9月至2020年9月期间习近平同志文稿中有关内容的节录。强调，会讲故事、讲好故事十分重要，要讲好中华民族的故事、中国共产党的故事、中华人民共和国的故事、中国特色社会主义的故事、改革开放的故事，特别是要讲好新时代的故事，引导广大党员、干部不断检视初心、滋养初心，不断锤炼忠诚干净担当的政治品格。<br>&nbsp;《革命精神是党和国家的宝贵财富》是2013年11月至2020年11月期间习近平同志文稿中有关内容的节录。指出：我们党的每一段革命历史，都是一部理想信念的生动教材。全党同志一定要不忘初心、继续前进，永远铭记为民族独立、人民解放抛头颅洒热血的革命先辈，永远保持中国共产党人的奋斗精神，永远保持对人民的赤子之心，努力为人民创造更美好、更幸福的生活。<br>&nbsp;《革命老区是党和人民军队的根》是2013年11月至2020年8月期间习近平同志讲话中有关内容的节录。指出：革命老区是党和人民军队的根。我每次到革命老区考察调研，都去瞻仰革命历史纪念场所，就是要告诫全党同志不能忘记红色政权是怎么来的、新中国是怎么来的、今天的幸福生活是怎么来的，就是要宣示中国共产党将始终高举红色的旗帜，坚定走中国特色社会主义道路，把先辈们开创的事业不断推向前进。<br>&nbsp;《在纪念毛泽东同志诞辰一百二十周年座谈会上的讲话》是2013年12月26日习近平同志的讲话。讲话全面科学地评价了毛泽东同志和毛泽东思想的历史功绩和历史地位，系统论述了毛泽东思想活的灵魂的基本内涵和时代要求，强调必须始终坚持马克思主义的立场观点方法，坚持全面正确的历史观，坚持实事求是、群众路线、独立自主，毫不动摇走党和人民在长期实践探索中开辟出来的正确道路，把中国特色社会主义伟大事业继续推向前进。<br>&nbsp;《崇尚英雄、学习英雄、关爱英雄》是2014年5月至2020年10月期间习近平同志文稿中有关内容的节录。指出：中华民族是崇尚英雄、成就英雄、英雄辈出的民族，和平年代同样需要英雄情怀。对一切为党、为国家、为人民作出奉献和牺牲的英雄模范人物，我们都要发扬他们的精神，从他们身上汲取奋发的力量。全党全社会要崇尚英雄、学习英雄、关爱英雄，大力弘扬英雄精神，汇聚实现中华民族伟大复兴的磅礴力量。<br>&nbsp;《在纪念邓小平同志诞辰一百一十周年座谈会上的讲话》是2014年8月20日习近平同志的讲话。讲话高度评价邓小平同志和邓小平理论的历史地位和历史功绩，从信念坚定、热爱人民、实事求是、开拓创新、战略思维、坦荡无私等方面深刻阐述邓小平同志的崇高精神风范。强调，邓小平同志留给我们的最重要的思想和政治遗产，就是他带领党和人民开创的中国特色社会主义，就是他创立的邓小平理论。号召全党坚定中国特色社会主义道路自信、理论自信、制度自信，在实现“两个一百年”奋斗目标、实现中华民族伟大复兴中国梦的征程上奋勇前进。<br>&nbsp;《古田会议奠基的我军政治工作对我军生存发展起到了决定性作用》是2014年10月31日习近平同志在全军政治工作会议上讲话的一部分。指出：古田会议纠正和肃清各种非无产阶级思想，形成了我党我军历史上著名的古田会议决议。这次会议确立了马克思主义建党建军原则，确立了我军政治工作的方针、原则、制度，提出了解决把以农民为主要成分的军队建设成为无产阶级性质的新型人民军队这个根本性问题的原则方向。古田会议使我们这支军队实现了浴火重生、凤凰涅槃。从那儿以后，在党领导下，我军由小到大、由弱到强，不断从胜利走向胜利。古田会议奠基的我军政治工作对我军生存发展起到了决定性作用。<br>&nbsp;《继续从延安精神中汲取力量》是2015年2月15日习近平同志在陕西考察工作结束时讲话的一部分。指出：延安是革命圣地。延安时期是我们党领导的中国革命事业从低潮走向高潮、实现历史性转折的时期。老一辈革命家和老一代共产党人在延安时期留下的优良传统和作风，培育形成的以坚定正确的政治方向、解放思想实事求是的思想路线、全心全意为人民服务的根本宗旨、自力更生艰苦奋斗的创业精神为主要内容的延安精神，是我们党的宝贵精神财富。今天，全面从严治党要继续从延安精神中汲取力量。<br>&nbsp;《总结党的历史经验，牢固树立“四个意识”》是2015年6月至2018年1月期间习近平同志文稿中有关内容的节录。指出：党的历史、新中国发展的历史都告诉我们，要治理好我们这个大党、治理好我们这个大国，保证党的团结和集中统一至关重要，维护党中央权威至关重要。经常喊看齐是我们党加强自身建设的规律和经验。要牢固树立政治意识、大局意识、核心意识、看齐意识，坚持以党的旗帜为旗帜、以党的方向为方向、以党的意志为意志，当政治上的明白人。<br>&nbsp;《把红色基因传承好，把红色江山世世代代传下去》是2016年1月至2020年6月期间习近平同志文稿中有关内容的节录。指出：新中国是无数革命先烈用鲜血和生命铸就的。要深刻认识红色政权来之不易，新中国来之不易，中国特色社会主义来之不易。光荣传统不能丢，丢了就丢了魂；红色基因不能变，变了就变了质。党员、干部要多学党史、新中国史，自觉接受红色传统教育，常学常新，不断感悟，巩固和升华理想信念。革命博物馆、纪念馆、党史馆、烈士陵园等是党和国家红色基因库。要讲好党的故事、革命的故事、根据地的故事、英雄和烈士的故事，加强革命传统教育、爱国主义教育、青少年思想道德教育，把红色基因传承好，确保红色江山永不变色。<br>&nbsp;《让井冈山精神放射出新的时代光芒》是2016年2月3日习近平同志在江西考察工作结束时讲话的一部分。指出：井冈山是中国革命的摇篮。井冈山时期留给我们最为宝贵的财富，就是跨越时空的井冈山精神。井冈山精神最重要的方面就是坚定信念、艰苦奋斗，实事求是、敢闯新路，依靠群众、勇于胜利。结合新的时代条件，让井冈山精神放射出新的时代光芒，最重要的是坚定执着追理想、实事求是闯新路、艰苦奋斗攻难关、依靠群众求胜利。<br>&nbsp;《在庆祝中国共产党成立九十五周年大会上的讲话》是2016年7月1日习近平同志的讲话。讲话全面回顾和总结了中国共产党九十五年来紧紧依靠人民为中华民族作出的伟大历史贡献和取得的重大历史经验，指出：我们党已经走过了九十五年的历程，但我们要永远保持建党时中国共产党人的奋斗精神，永远保持对人民的赤子之心。一切向前走，都不能忘记走过的路；走得再远、走到再光辉的未来，也不能忘记走过的过去，不能忘记为什么出发。面向未来，面对挑战，全党同志一定要不忘初心、继续前进。<br>&nbsp;《在纪念红军长征胜利八十周年大会上的讲话》是2016年10月21日习近平同志的讲话。指出：每一代人有每一代人的长征路，每一代人都要走好自己的长征路。今天，我们这一代人的长征，就是要实现“两个一百年”奋斗目标、实现中华民族伟大复兴的中国梦。长征永远在路上。一个不记得来路的民族，是没有出路的民族。不论我们的事业发展到哪一步，不论我们取得了多大成就，我们都要大力弘扬伟大长征精神，在新的长征路上继续奋勇前进。<br>&nbsp;《学好党史、新中国史、改革开放史、社会主义发展史》是2016年12月至2020年11月期间习近平同志文稿中有关内容的节录。强调，要深入学习党史、新中国史、改革开放史、社会主义发展史，教育引导广大党员、干部永葆初心、永担使命。要培育和践行社会主义核心价值观，不断增强各族群众对伟大祖国、中华民族、中华文化、中国共产党、中国特色社会主义的认同。<br>&nbsp;《在庆祝中国人民解放军建军九十周年大会上的讲话》是2017年8月1日习近平同志的讲话。指出：人民军队的历史辉煌，是鲜血生命铸就的，永远值得我们铭记。人民军队的历史经验，是艰辛探索得来的，永远需要我们弘扬。人民军队的历史发展，是忠诚担当推动的，永远激励我们向前。中华民族实现伟大复兴，中国人民实现更加美好生活，必须加快把人民军队建设成为世界一流军队。经过五年努力，人民军队实现了政治生态重塑、组织形态重塑、力量体系重塑、作风形象重塑，人民军队重整行装再出发，在中国特色强军之路上迈出了坚实步伐。我们要不忘初心、继续前进，坚定不移走中国特色强军之路，把强军事业不断推向前进。<br>&nbsp;《新时代中国共产党的历史使命》是2017年10月18日习近平同志在中国共产党第十九次全国代表大会上报告的一部分。指出：中国共产党一经成立，就把实现共产主义作为党的最高理想和最终目标，义无反顾肩负起实现中华民族伟大复兴的历史使命，团结带领人民进行了艰苦卓绝的斗争，谱写了气吞山河的壮丽史诗。中华民族伟大复兴，绝不是轻轻松松、敲锣打鼓就能实现的。全党必须准备付出更为艰巨、更为艰苦的努力。强调，实现伟大梦想，必须进行伟大斗争，建设伟大工程，推进伟大事业。伟大斗争，伟大工程，伟大事业，伟大梦想，紧密联系、相互贯通、相互作用，其中起决定性作用的是党的建设新的伟大工程。推进伟大工程，要结合伟大斗争、伟大事业、伟大梦想的实践来进行。<br>&nbsp;《走得再远都不能忘记来时的路》是2017年10月31日习近平同志在瞻仰上海中共一大会址和浙江嘉兴南湖红船时讲话的要点。指出：我们党的全部历史都是从中共一大开启的，我们走得再远都不能忘记来时的路。事业发展永无止境，共产党人的初心永远不能改变。唯有不忘初心，方可告慰历史、告慰先辈，方可赢得民心、赢得时代，方可善作善成、一往无前。只要全党全国各族人民团结一心、苦干实干，中华民族伟大复兴的巨轮就一定能够乘风破浪、胜利驶向光辉的彼岸。<br>&nbsp;《深刻总结经济特区建设的宝贵经验》是2018年4月13日习近平同志在庆祝海南建省办经济特区三十周年大会上讲话的一部分。强调，海南等经济特区的成功实践，充分证明了改革开放是决定当代中国命运的关键抉择，是当代中国发展进步的活力之源，是党和人民事业大踏步赶上时代的重要法宝，是坚持和发展中国特色社会主义、实现中华民族伟大复兴的必由之路。在决胜全面建成小康社会、夺取新时代中国特色社会主义伟大胜利的征程上，经济特区不仅要继续办下去，而且要办得更好、办出水平。新形势、新任务、新挑战，赋予经济特区新的历史使命，经济特区要不忘初心、牢记使命，把握好新的战略定位，成为改革开放的重要窗口、试验平台、开拓者和实干家。<br>&nbsp;《在庆祝改革开放四十周年大会上的讲话》是2018年12月18日习近平同志的讲话。讲话深刻总结了改革开放四十年来党和国家事业取得的伟大成就和宝贵经验，高度赞扬了中国人民为改革开放事业作出的杰出贡献，郑重宣示了改革开放只有进行时没有完成时、改革开放永远在路上、坚定不移将改革开放进行到底的信心和决心，明确提出了坚定不移全面深化改革、扩大对外开放、不断把新时代改革开放继续推向前进的目标要求。指出：改革开放是我们党的一次伟大觉醒，正是这个伟大觉醒孕育了我们党从理论到实践的伟大创造。改革开放是中国人民和中华民族发展史上一次伟大革命，正是这个伟大革命推动了中国特色社会主义事业的伟大飞跃！改革开放四十年积累的宝贵经验是党和人民弥足珍贵的精神财富，对新时代坚持和发展中国特色社会主义有着极为重要的指导意义，必须倍加珍惜、长期坚持，在实践中不断丰富和发展。<br>&nbsp;《在纪念五四运动一百周年大会上的讲话》是2019年4月30日习近平同志的讲话。指出：五四运动是中国旧民主主义革命走向新民主主义革命的转折点，在近代以来中华民族追求民族独立和发展进步的历史进程中具有里程碑意义。五四运动，孕育了以爱国、进步、民主、科学为主要内容的伟大五四精神，其核心是爱国主义精神。新时代中国青年要继续发扬五四精神，以实现中华民族伟大复兴为己任，不辜负党的期望、人民期待、民族重托，不辜负我们这个伟大时代。<br>&nbsp;《中国共产党的伟大革命精神跨越时空、永不过时》是2019年5月22日习近平同志在江西考察工作结束时讲话的一部分。指出：井冈山精神和苏区精神，承载着中国共产党人的初心和使命，铸就了中国共产党的伟大革命精神。这些伟大革命精神跨越时空、永不过时，是砥砺我们不忘初心、牢记使命的不竭精神动力。我们要从红色基因中汲取强大的信仰力量，增强“四个意识”，坚定“四个自信”，做到“两个维护”，自觉做共产主义远大理想和中国特色社会主义共同理想的坚定信仰者和忠实实践者，真正成为百折不挠、终生不悔的马克思主义战士。<br>&nbsp;《党在陕甘宁地区的革命活动，建立了光照千秋的历史功绩》是2019年8月22日习近平同志在甘肃考察工作结束时讲话的一部分。指出：甘肃是一片红色土地，在中国革命历史进程中发挥了不可替代的重要作用。陕甘革命根据地为党中央和各路长征红军提供了落脚点，为后来八路军主力奔赴抗日前线提供了出发点，成为土地革命战争后期全国硕果仅存的完整革命根据地。我们党在陕甘宁地区的革命活动，建立了光照千秋的历史功绩，其中一个重要原因就是我们党和军队得到了人民群众大力支持。<br>&nbsp;《以“赶考”的清醒和坚定答好新时代的答卷》是2019年9月12日习近平同志在视察北京香山革命纪念地时讲话的要点。指出：中共中央在北京香山虽然只有半年时间，但这里是我们党领导解放战争走向全国胜利、新民主主义革命取得伟大胜利的总指挥部，是中国革命重心从农村转向城市的重要标志，在中国共产党历史、中华人民共和国历史上具有非常重要的地位。强调，我们缅怀这段历史，就是要继承和发扬老一辈革命家“宜将剩勇追穷寇，不可沽名学霸王”的革命到底精神，坚持立党为公、执政为民的革命情怀，谦虚谨慎、不骄不躁、艰苦奋斗的优良作风，以“赶考”的清醒和坚定答好新时代的答卷。<br>&nbsp;《了解历史才能看得远，永葆初心才能走得远》是2019年9月18日习近平同志在河南考察工作结束时讲话的一部分。指出：鄂豫皖苏区根据地是我们党的重要建党基地，也是中国工农红军的诞生地之一。焦裕禄精神、红旗渠精神、大别山精神等都是我们党的宝贵精神财富。要抓好党史、新中国史的学习，用好红色资源，增强党性教育实效，让广大党员、干部在接受红色教育中守初心、担使命，把革命先烈为之奋斗、为之牺牲的伟大事业奋力推向前进。<br>&nbsp;《在庆祝中华人民共和国成立七十周年大会上的讲话》是2019年10月1日习近平同志的讲话。回顾了七十年前新中国成立这一伟大事件，赞扬了七十年来全国各族人民取得的令世界刮目相看的伟大成就，宣示了前进征程上不断创造新的历史伟业的坚强决心和坚定信心。指出：七十年来，全国各族人民同心同德、艰苦奋斗，取得了令世界刮目相看的伟大成就。今天，社会主义中国巍然屹立在世界东方，没有任何力量能够撼动我们伟大祖国的地位，没有任何力量能够阻挡中国人民和中华民族的前进步伐。中国的昨天已经写在人类的史册上，中国的今天正在亿万人民手中创造，中国的明天必将更加美好。<br>&nbsp;《始终做到初心如磐、使命在肩》是2020年1月8日习近平同志在“不忘初心、牢记使命”主题教育总结大会上讲话的一部分。指出：不忘初心、牢记使命，必须作为加强党的建设的永恒课题和全体党员、干部的终身课题常抓不懈。要以党的创新理论滋养初心、引领使命，从党的非凡历史中找寻初心、激励使命，在严肃党内政治生活中锤炼初心、体悟使命，把初心和使命变成锐意进取、开拓创新的精气神和埋头苦干、真抓实干的原动力。<br>&nbsp;《在纪念中国人民抗日战争暨世界反法西斯战争胜利七十五周年座谈会上的讲话》是2020年9月3日习近平同志的讲话。强调，中国人民抗日战争胜利是以爱国主义为核心的民族精神的伟大胜利，是中国共产党发挥中流砥柱作用的伟大胜利，是全民族众志成城奋勇抗战的伟大胜利，是中国人民同反法西斯同盟国以及各国人民并肩战斗的伟大胜利。指出：中国人民在抗日战争的壮阔进程中孕育出伟大抗战精神，向世界展示了天下兴亡、匹夫有责的爱国情怀，视死如归、宁死不屈的民族气节，不畏强暴、血战到底的英雄气概，百折不挠、坚忍不拔的必胜信念。伟大抗战精神，是中国人民弥足珍贵的精神财富，将永远激励中国人民克服一切艰难险阻、为实现中华民族伟大复兴而奋斗。<br>&nbsp;《牢记初心使命，走好新时代长征路》是2020年9月18日习近平同志在湖南考察工作结束时讲话的一部分。强调，湖南是一方红色热土，大批共产党人在这片热土谱写了感天动地的英雄壮歌。要教育引导广大党员、干部发扬革命传统，传承红色基因，牢记初心使命，走好新时代长征路。要坚定理想信念，筑牢信仰之基、把稳思想之舵、补足精神之钙。要站稳人民立场，密切联系群众，经常深入基层、深入实际了解群众的所思所盼、所急所忧，把工作抓到群众心坎上，力戒形式主义、官僚主义。要勇于攻坚克难，发扬斗争精神，增强斗争本领，敢打硬仗、善打胜仗，不断打开事业新局面。<br>&nbsp;《兴办经济特区是党和国家为推进改革开放和社会主义现代化建设进行的伟大创举》是2020年10月14日习近平同志在深圳经济特区建立四十周年庆祝大会上讲话的一部分。指出：深圳等经济特区四十年改革开放实践，创造了伟大奇迹，积累了宝贵经验，深化了我们对中国特色社会主义经济特区建设规律的认识。强调，必须坚持党对经济特区建设的领导，必须坚持和完善中国特色社会主义制度，必须坚持发展是硬道理，必须坚持全方位对外开放，必须坚持创新是第一动力，必须坚持以人民为中心的发展思想，必须坚持科学立法、严格执法、公正司法、全民守法，必须践行绿水青山就是金山银山的理念，必须全面准确贯彻“一国两制”基本方针，必须坚持在全国一盘棋中更好发挥经济特区辐射带动作用。<br>&nbsp;《在纪念中国人民志愿军抗美援朝出国作战七十周年大会上的讲话》是2020年10月23日习近平同志的讲话。指出：抗美援朝战争伟大胜利，是中国人民站起来后屹立于世界东方的宣言书，是中华民族走向伟大复兴的重要里程碑。伟大抗美援朝精神跨越时空、历久弥新，必须永续传承、世代发扬。我们要铭记抗美援朝战争的艰辛历程和伟大胜利，敢于斗争、善于斗争，知难而进、坚韧向前，把新时代中国特色社会主义伟大事业不断推向前进。<br>&nbsp;《中华民族伟大复兴历史进程的大跨越》是2020年10月29日习近平同志在中共十九届五中全会第二次全体会议上讲话的一部分。指出：进入新发展阶段，是中华民族伟大复兴历史进程的大跨越。中国共产党建立近百年来，团结带领中国人民所进行的一切奋斗，就是为了把我国建设成为现代化强国，实现中华民族伟大复兴。在这个过程中，我们党对建设社会主义现代化国家在认识上不断深入、在战略上不断成熟、在实践上不断丰富，加速了我国现代化发展进程，为新发展阶段全面建设社会主义现代化国家奠定了实践基础、理论基础、制度基础。<br>&nbsp;《在浦东开发开放三十周年庆祝大会上的讲话》是2020年11月12日习近平同志的讲话。指出：浦东开发开放三十年的历程，走的是一条解放思想、深化改革之路，是一条面向世界、扩大开放之路，是一条打破常规、创新突破之路。经过三十年发展，浦东已经从过去以农业为主的区域，变成了一座功能集聚、要素齐全、设施先进的现代化新城，可谓是沧桑巨变。浦东开发开放三十年取得的显著成就，为中国特色社会主义制度优势提供了最鲜活的现实明证，为改革开放和社会主义现代化建设提供了最生动的实践写照！</p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:48:15	2024-11-11 06:48:15	\N	0	0	f
57	\N	\N	\N	延安精神	<figure class="image"><img style="aspect-ratio:1440/810;" src="/images/6731a8d4bd7ad-image (2).jpeg" width="1440" height="810"></figure><p>坚定正确的政治方向<br>解放思想实事求是的思想路线<br>全心全意为人民服务的根本宗旨<br>自力更生艰苦奋斗的创业精神</p><p>延安精神及现实启示<br>&nbsp;延安精神是中国共产党人彻底的革命精神、是升华了的民族精神、是中国共产党人领导争取民族独立、人民解放的时代精神、是展示中国共产党人形象的群体精神。作为一种道德情操和精神风貌，是贯穿于党的理论与思想中的精神气质，是内化在党的优良传统和作风中的灵魂。</p><p>中国共产党人成就伟业的政治灵魂<br>&nbsp;坚定正确的政治方向是延安精神的灵魂。坚持坚定正确的政治方向对于马克思主义政党来说，必须把党的最高纲领和最低纲领统一起来，依据历史发展的客观要求和广大人民群众的愿望,从实际出发确定不同历史时期的主要任务及实现这一任务的有效途径, 并使自己正确的政治主张化为亿万群众的行动纲领；同时要培养和造就一支坚决贯彻执行党的政治路线的优秀人才。&nbsp;</p><p>中国共产党人成就伟业的思想基石<br>&nbsp;解放思想、实事求是是延安精神的思想精髓。中国共产党能够在短短的二十八年时间里，由一个仅仅五十余人的小党，成长为领导中国人民取得革命成功、缔造中华人民共和国的执政党，在西方人看来"几乎是不可想象的"、"难以置信的"，这与中国共产党不断总结以往的经验教训，并逐渐在全党确立实事求是的思想路线密不可分。</p><p>中国共产党人成就伟业的力量之源<br>&nbsp;全心全意为人民服务的根本宗旨是延安精神的本质体现。把全心全意为人民服务作为我们党的政治立场和行为准则，是由党的马克思主义政党性质决定的，是由党的世界观和指导思想以及党的伟大历史使命与奋斗目标决定的。</p><p>中国共产党人成就伟业的不竭动力<br>&nbsp;自力更生、艰苦奋斗是延安精神的显著特征。自力更生、艰苦奋斗的精神是自信、自强、自立的主体精神，是一种不畏艰险、顽强拼搏、奋发有为、昂扬向上的创造精神，是克勤克俭的高尚品德。</p>	image-2-6731a8f1abf8f843763350.jpg	坚定正确的政治方向\r\n解放思想实事求是的思想路线\r\n全心全意为人民服务的根本宗旨\r\n自力更生艰苦奋斗的创业精神	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:49:21	2024-11-11 06:49:21	\N	0	0	f
58	\N	\N	\N	井冈山精神	<figure class="image"><img style="aspect-ratio:550/376;" src="/images/6731a9093ea5a-image (3).jpeg" width="550" height="376"></figure><p>坚定执着追理想<br>实事求是闯新路<br>艰苦奋斗攻难关<br>依靠群众求胜利</p><p>&nbsp; &nbsp; &nbsp;&nbsp;井冈山精神是以毛泽东同志为代表的中国共产党人在井冈山创建革命根据地、开辟中国革命新道路、进行艰苦卓绝的革命斗争中培育和形成的革命精神。它是几千年来中华民族精神的创造性转化和升华，是值得全国人民珍视的精神瑰宝，是推进中国特色社会主义事业、实现中华民族伟大复兴的强大精神动力。<br>&nbsp; &nbsp; &nbsp;&nbsp;艰苦卓绝的铸就过程<br>&nbsp;井冈山是中国革命的摇篮。井冈山的革命斗争不仅点燃了中国革命的星星之火、开辟了中国革命的独特道路，而且孕育出伟大的井冈山精神。井冈山精神的产生，是中国近现代历史发展的必然结果。<br>&nbsp;土地革命时期，以毛泽东同志、朱德同志为代表的老一辈无产阶级革命家，在秋收起义和南昌起义遭到严重挫折的情况下，把马克思主义基本原理同中国革命具体实践相结合，审时度势，率领工农革命军进军井冈山，在白色政权的四面包围之中建立起全国第一个农村革命根据地。</p><p>&nbsp; &nbsp; &nbsp;丰富深邃的精神内涵<br>&nbsp;作为我们党在革命斗争的艰苦岁月中形成的伟大精神和马克思主义中国化的理论结晶，井冈山精神集中反映了我们党的优良传统和作风，有着极为丰富深邃的精神内涵。<br>&nbsp;坚定信念、艰苦奋斗，是井冈山精神的灵魂。大革命失败后，井冈山的革命斗争靠什么燃起“工农武装割据”的燎原之火、照亮中国革命的前程？靠的就是共产党人对中国革命光明未来的坚定信念和不懈追求。正是因为有了崇高的理想信念，才会产生在艰难困苦环境中战胜一切困难的超凡勇气，产生在战场上冲锋陷阵、英勇杀敌的顽强斗志，产生在敌人屠刀下慷慨就义、视死如归的英雄气概，才能经受住血雨腥风的洗礼和考验。</p><p>&nbsp; &nbsp; &nbsp;&nbsp;历久弥新的宝贵财富<br>&nbsp;井冈山精神是中华民族几千年来积淀的优秀传统与人文精神在革命战争年代的彰显和高扬。同时，井冈山精神又是具有原创意义的当代民族精神，是无产阶级革命精神和崇高风范的体现，是中国共产党优良精神传统的基础，是中国共产党革命精神之链的伟大开端。<br>&nbsp;井冈山精神最重要的价值，在于它在开创中国革命崭新时期和开辟中国革命独特道路上所具有的示范性和先导性。中国革命道路的开创和社会主义现代化建设的伟大创业之间，在历史进程上前后相继，在社会理想和目标追求上高度统一。因此，井冈山精神所具有的精神特质与品格在实现社会主义现代化的伟大历史进程中具有重要的指导意义和精神支撑作用。</p>	image-3-6731a92c6ddfd553752835.jpg	坚定执着追理想\r\n实事求是闯新路\r\n艰苦奋斗攻难关\r\n依靠群众求胜利	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:50:19	2024-11-11 06:50:20	\N	0	0	f
59	\N	\N	\N	红船精神	<figure class="image"><img style="aspect-ratio:500/281;" src="/images/6731a9428c5e6-image (2).png" width="500" height="281"></figure><p>开天辟地、敢为人先的首创精神<br>坚定理想、百折不挠的奋斗精神<br>立党为公、忠诚为民的奉献精神</p><p>&nbsp; &nbsp; &nbsp;1921年8月初，中国共产党第一次全国代表大会在浙江嘉兴南湖的一条游船上胜利闭幕，庄严宣告中国共产党的诞生。这条游船因而获得了一个永载中国革命史册的名字——红船。<br>&nbsp;红船，见证了中国历史上开天辟地的大事变，成为中国革命源头的象征。红船，一直接受着人们特别是共产党人的瞻仰。上世纪60年代，中共“一大”代表董必武同志两次重访南湖，即兴赋诗。改革开放以来，邓小平、江泽民、胡锦涛等党和国家领导人，亲切关怀党的诞生地，或瞻仰红船，或亲笔题词，勉励我们“沿着南湖红船开辟的革命航道奋勇前进”。2002年10月，我调任浙江后，即怀着无限崇敬的心情，专程到嘉兴南湖瞻仰红船，接受革命精神教育。今年春节后的第一个工作日，浙江省委理论学习中心组成员来到南湖瞻仰红船，举行保持共产党员先进性教育活动专题学习会。在先进性教育活动期间，成千上万的共产党员从祖国各地来到南湖，看一次展览，听一次党课，学一次党章，观一次专题片，瞻仰一次红船，重温一次入党誓词。嘉兴市广泛开展以“精神传承、思想升华”为主要内容的“红船精神”大讨论活动，有力地促进了先进性教育活动。<br>&nbsp;红船劈波行，精神聚人心。红船所代表和昭示的是时代高度，是发展方向，是奋进明灯，是铸就在中华儿女心中的永不褪色的精神丰碑。“红船精神”同井冈山精神、长征精神、延安精神、西柏坡精神等一道，伴随中国革命的光辉历程，共同构成我们党在前进道路上战胜各种困难和风险、不断夺取新胜利的强大精神力量和宝贵精神财富。80多年来，“红船精神”一直激励和鼓舞着我们党坚持站在历史的高度，走在时代的前列，勇当舵手，引领航向，不断取得革命、建设和改革的一个又一个胜利。<br>&nbsp;“红船精神”——党的先进性之源<br>&nbsp;一个大党诞生于一条小船。从此，中国共产党引领革命的航船，劈波斩浪，开天辟地，使中国革命的面貌焕然一新。伟大的革命实践产生伟大的革命精神。“红船精神”正是中国革命精神之源：中国共产党历史上形成的优良传统和革命精神，无不与之有着直接的渊源关系。中国共产党作为中国工人阶级和中华民族的先锋队，从这条红船扬帆起航，就始终代表着中国先进生产力的发展要求，代表着中国先进文化的前进方向，代表着最广大人民的根本利益，在推动中国历史前进中发挥着无可替代的领导核心作用。正如党的十六大报告所明确指出的，党的先进性“归根到底要看党在推动历史前进中的作用”。红船正是走在时代前列的象征，“红船精神”就充分体现了走在时代前列的精神，这也就集中体现了党的先进性，是党的先进性之源。<br>&nbsp;中国共产党沿着红船的航向，以开天辟地、敢为人先的首创精神，始终站在历史和时代发展的潮头。上世纪20年代的旧中国，是一个半封建半殖民地的社会。“十月革命”一声炮响给我们送来马克思列宁主义，“五四”运动中工人阶级登上政治舞台，这都为中国共产党的诞生作了思想和组织上的准备。中国共产党正是顺应求民族独立、谋人民解放的历史使命，勇立社会历史发展的潮头，在南湖红船上宣告成立，从此使中国革命的历史翻开了崭新的一页。对此，毛泽东同志称之为“开天辟地的大事变”。董必武同志在故地重游中欣然命笔：“烟雨楼台革命萌生，此间曾著星星火；风云世界逢春蛰起，到处皆闻殷殷雷。”南湖红船点燃的星星之火，形成了中国革命的燎原之势，使四海翻腾，五岳震荡。我们党从这里走向井冈山，走向延安，走向西柏坡，由一个领导人民为夺取政权而奋斗的党，成为领导人民掌握政权并长期执政的党。<br>&nbsp;中国共产党扬起红船的风帆，以坚定理想、百折不挠的奋斗精神，矢志推动中国革命和建设事业不断前进。中国共产党是以马克思主义理论武装起来的先进政党。中国共产党的诞生，使中国革命从此有了坚定的理想信念和强大的精神支柱。在惊涛骇浪不断的革命大潮中，红船在升腾，共产党人的信念也在升腾。当初，党的“一大”会议在白色恐怖中召开，由上海转至嘉兴，在南湖红船上完成缔造中国共产党的使命，靠的是坚定的理想信念和百折不挠的革命精神。之后，我们党在长期艰苦卓绝的奋斗中，历经曲折而不畏艰险，屡受考验而不变初衷，由小到大，由弱变强，靠的还是坚定的理想信念和百折不挠的革命精神。中国共产党人不管风吹浪打，不怕急流险滩，始终坚定自己的理想和信念，以压倒一切敌人、战胜一切困难的大无畏英雄气概，矢志推动中国革命和建设事业的大船劈波斩浪、不断奋进。<br>&nbsp;中国共产党载着红船的意愿，以立党为公、忠诚为民的奉献精神，努力维护好、实现好、发展好最广大人民的根本利益。“革命声传画舫中，诞生共党庆工农”。中国共产党从诞生那天起，从来就没有自己的私利，而是以全心全意为人民谋福利为根本宗旨。密切联系群众是我们党区别于其他任何一个政党的显著标志。依水行舟，忠诚为民，成为贯穿中国革命和建设全过程的一条红线，也是“红船精神”的本质所在。肩负为人民谋利益的神圣职责和崇高使命，中国共产党人以自己的身体力行，宣传、发动和引领全国各族人民团结一心，和衷共济，英勇奋战，在推进中国革命和建设的进程中，不断维护好、实现好、发展好最广大人民的根本利益。<br>&nbsp;开天辟地、敢为人先的首创精神，坚定理想、百折不挠的奋斗精神，立党为公、忠诚为民的奉献精神，是中国革命精神之源，也是“红船精神”的深刻内涵。我们要高举“三个代表”重要思想伟大旗帜，始终保持党的先进性，就必须永远铭记我们党的“母亲船”，重温红船的历史沧桑，在继承和弘扬“红船精神”中永葆党的先进性，进一步激发为中国特色社会主义事业而奋斗的信念和力量。<br>&nbsp;“红船精神”对党的先进性建设具有重要意义<br>&nbsp;新世纪新阶段，我国已踏上全面建设小康社会、加快推进社会主义现代化的伟大征程。保持党的先进性，既面临着新的要求，也面临着新的考验。在新的形势下，继承和弘扬“红船精神”，对于加强党的先进性建设，进一步巩固党的执政地位，完成党的执政使命，具有十分重要的理论意义和实践意义。<br>&nbsp;“红船精神”是激励我们把握发展这一时代主题和党执政兴国第一要务，大胆探索、创新创业的强大思想武器。发展是当今时代的一大主题，也是党执政兴国的第一要务。加强党的先进性建设，首要任务就是提高领导发展的能力。当今世界处于深刻变化之中，综合国力的竞争日趋激烈，我国全面建设小康社会的进程中也出现了许多前所未有的新情况、新问题。“红船精神”昭示我们，在社会发展的进程中，我们不能因循守旧，刻舟求剑，必须勇立潮头，敢为人先，以创新的精神永葆党的生机和活力。面对新挑战、新机遇和新形势、新任务，我们要坚持和发扬“红船精神”，有敢于突破前人的勇气和智慧，自觉克服安于现状、不思进取的思想观念，坚持用创新的理论成果武装头脑，用创新的思想观念谋划工作，紧紧扭住发展不放松，与时俱进，开拓创新，不断推进建设中国特色社会主义的伟大事业。<br>&nbsp;“红船精神”是鼓舞我们坚定共产主义理想和中国特色社会主义信念，不畏艰险、艰苦奋斗的强大精神支柱。中国革命的航船是在惊涛骇浪中到达成功的彼岸的，中国改革和建设事业的航程同样不会一帆风顺。建设中国特色社会主义是一项前无古人的创造性事业，全面建设小康社会是一项空前艰巨的宏图伟业，在推进其发展的漫漫征程中充满了重重困难和各种风险。“红船精神”昭示我们，逆水行舟，不进则退。面对我们的基本国情和我们党的历史使命，没有坚定的理想和必胜的信念，没有不畏艰辛、励精图治的精神状态和艰苦奋斗、顽强拼搏的作风，就难以克服前进道路上的重重困难，难以战胜前进道路上的风险和挑战。我们必须坚持和发扬“红船精神”，坚定理想信念，增强忧患意识，居安思危，处盛虑衰，以共产党人的胸襟和眼界观察世界、判断形势，恪尽职守、脚踏实地，不怕艰难、坚韧不拔，矢志拼搏、艰苦创业，努力谱写全面建设小康社会、加快推进社会主义现代化的新篇章。<br>&nbsp;“红船精神”是鞭策我们牢记立党为公、执政为民本质要求和全心全意为人民服务的根本宗旨，求真务实、一心为民的强大道德力量。作为马克思主义政党，我们党自诞生之日起就以解放全人类、实现共产主义为己任，以全心全意为人民服务为根本宗旨。坚持立党为公、执政为民，始终保持党同人民群众的血肉联系，是马克思主义政党与生俱来的政治品质和最高从政道德，是衡量党的先进性的根本标尺。“红船精神”昭示我们，党和人民的关系就好比舟和水的关系，“水可载舟，亦可覆舟”。革命战争年代，正是在“红船精神”引领下，我们党从民族大义和人民群众的根本利益出发，充分发动并紧紧依靠人民群众夺取了政权，从此成为在全国掌握政权并长期执政的执政党。改革开放以来，我们党经受着执政和改革开放的双重考验。党的先进性能否始终保持，党的执政地位能否不断巩固，根本取决于人民群众对党的信赖和拥护，而这又取决于我们党能否践行立党为公、执政为民的本质要求，取决于我们党能否团结带领人民群众求真务实、真抓实干。我们必须牢记“权为民所用、情为民所系、利为民所谋”的谆谆教诲，继续发扬“红船精神”，始终不渝地为最广大人民谋利益，坚持人民利益高于一切的政德，真正干出有利于党和人民事业的政绩。<br>&nbsp;在新的实践中继承和弘扬“红船精神”<br>&nbsp;“红船精神”是我们党创立时期坚持和实践自身先进性的一个历史明证。正如党的先进性不是与生俱来、一劳永逸的，“红船精神”也是具体的、历史的。我们要把“红船精神”贯穿于树立和落实科学发展观、构建社会主义和谐社会和加强党的先进性建设的实践上来。把握住这一点，就从根本上把握了“红船精神”的实质与核心，同时也就把握了党的先进性的真谛。<br>&nbsp;红船起航于浙江，既有历史的偶然性，也有历史的必然性。这是浙江的光荣，也是推进浙江发展的精神力量所在。联系浙江实际，我们要在新的实践中继承和弘扬“红船精神”，就必须结合当前正在开展的保持共产党员先进性教育活动，高扬理想的风帆，荡起奋发的双桨，乘着改革开放的浪潮，认真贯彻胡锦涛总书记对浙江工作提出的“努力在全面建设小康社会、加快推进社会主义现代化的进程中走在前列”的要求，做到学在深处，谋在新处，干在实处，再铸浙江改革开放和现代化建设新的辉煌。<br>&nbsp;第一，要深入实施“八八战略”，努力在树立和落实科学发展观方面走在前列。科学发展观是指导浙江实现更快更好发展的根本指南，深入实施“发挥八个方面优势、推进八个方面举措”的“八八战略”，是浙江落实科学发展观的具体实践。我们要不断深化对科学发展观的认识，不断提高用科学发展观来指导实践的自觉性和坚定性，不断推进“八八战略”的深化细化具体化，在经济社会发展中更加注重统筹兼顾、加强薄弱环节，更加注重经济增长的质量和效益，更加注重以人为本，实现和维护广大人民群众的切身利益。要坚持在贯彻中央宏观调控政策中把握经济发展全局，正确处理发挥市场机制作用与加强政府宏观调控的关系，确保经济平稳较快发展。要以主动的姿态推进经济结构调整和增长方式转变，切实把提高自主创新能力作为结构调整的中心环节，把建设节约型社会放在重要位置，把统筹城乡发展作为解决“三农”问题的着力点，把加快建设先进制造业基地和发展现代服务业作为结构调整的突破口，把深化改革、扩大开放作为根本动力，努力在更高层次上推动浙江的发展。<br>&nbsp;第二，要全面建设“平安浙江”，努力在构建社会主义和谐社会方面走在前列。构建社会主义和谐社会，是我们党根据当今时代社会实践发展的新要求和人民群众生产生活的新需要，而提出的建设中国特色社会主义的新战略、新举措。浙江在构建社会主义和谐社会方面具有较好的条件。特别是建设“平安浙江”的具体实践，为我省构建和谐社会打下了工作基础，积累了有益经验。我们要以建设“平安浙江”为载体，积极构建具有中国特色、时代特征、浙江特点的和谐社会。要建设“法治浙江”，发展社会主义民主政治，为构建和谐社会提供法制保障。要加快文化大省建设，增强构成浙江综合竞争力的软实力，为构建和谐社会提供智力支持和精神支撑。要坚持“效率优先、兼顾公平”，激发社会发展的活力和创造力，促进社会公平和正义，进一步做好关心群众生产生活特别是帮扶困难群众的各项工作，不断健全社会保障和社会救助体系，为构建和谐社会营造良好的氛围。要加强社会建设和管理，努力形成党委领导、政府负责、社会协同、公众参与的社会管理格局，高度重视并切实做好维护社会稳定的各项工作，为构建和谐社会提供良好的社会秩序。<br>&nbsp;第三，要切实增强执政本领，努力在加强党的先进性建设方面走在前列。党的先进性建设是关乎党生存、发展、壮大的根本性建设。要扎实抓好保持共产党员先进性教育活动，把“走在前列”的要求贯穿于先进性教育活动的全过程，做到谋划工作有“走在前列”的意识，学习动员有“走在前列”的内容，分析评议有“走在前列”的标准，整改提高有“走在前列”的要求，努力解决存在的突出问题，真正使我省先进性教育活动成为推进各级党组织自身建设的基础工程、提高党员思想政治水平和工作能力的素质工程、人民群众真正得到实惠的满意工程。要以改革的精神推进党的建设各项工作，围绕深化理论武装这一首要任务，深入研究如何全面贯彻“真学、真懂、真信、真用”的要求，坚定建设中国特色社会主义的理想信念问题；围绕建设高素质干部队伍这一总体要求，深入研究在选人用人、党管人才、政绩考核、能上能“下”、管理监督、基层基础等方面的一些难题，努力求突破、创特色、出成果；围绕保持党同人民群众的血肉联系这一核心，深入研究如何全面贯彻求真务实的要求，进一步转变作风，推进党风廉政建设和反腐败工作。同时，要把制度建设贯穿于党的思想、组织、作风建设之中。<br>&nbsp;总之，我们要在新的实践中继承和弘扬“红船精神”，在“红船精神”的激励和鼓舞下，不断强化前列意识，切实把“走在前列”的要求体现到精神状态上，贯彻到衡量标准上，落实到各项工作上，再接再厉，乘势而上，努力为全国大局作出积极的贡献。（习近平发表于2005年6月21日《光明日报》）</p><p>&nbsp;</p>	image-2-6731a97147b35692879455.png	开天辟地、敢为人先的首创精神\r\n坚定理想、百折不挠的奋斗精神\r\n立党为公、忠诚为民的奉献精神	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:51:28	2024-11-11 06:51:29	\N	0	0	f
60	\N	\N	\N	热烈庆祝中国共产党建党100周年	<p>&nbsp; &nbsp; &nbsp; &nbsp; 2021年是伟大的中国共产党100周年生日。100年沧桑巨变，100年风雨兼程，100年辉煌伟业。无论是顺境还是逆境，我们党都初心不改、矢志不渝。在中国共产党的英明领导下，我们正唱着春天的故事，昂首跨越新的时代。<br>&nbsp; &nbsp; &nbsp;&nbsp;1921年7月23日，中国共产党第一次全国代表大会在上海召开。由于会场受到法租界巡捕的搜查，最后一天的会议转移到浙江嘉兴南湖的游船上举行。<br>1921年8月3日黄昏，浙江嘉兴南湖的暑热逐渐散去。湖面上一艘中等大小的画舫内，气氛庄重肃穆。在“中国共产党万岁”的低声呼喊中，中国共产党第一次全国代表大会闭幕。<br>&nbsp; &nbsp; &nbsp; &nbsp;2021年是中国共产党百年华诞。中国站在“两个一百年”的历史交汇点，全面建设社会主义现代化国家新征程即将开启。世界将更多目光投向中国，聚焦中国共产党矢志不渝为人民谋幸福，为民族谋复兴，为世界谋大同。</p><p>&nbsp; &nbsp; &nbsp;&nbsp;党中央建党百年活动安排：<br>&nbsp; &nbsp; &nbsp;&nbsp;一是开展党史学习教育。将结合巩固深化“不忘初心、牢记使命”主题教育成果，在全体党员中开展党史学习教育。这次学习教育贯穿2021年全年，总的要求是学史明理、学史增信、学史崇德、学史力行，教育引导党员干部学党史、悟思想、办实事、开新局。<br>&nbsp; &nbsp; &nbsp;&nbsp;二是举行庆祝大会。将以中共中央名义，隆重举行庆祝中国共产党成立100周年大会，中共中央总书记、国家主席、中央军委主席习近平将发表重要讲话。<br>&nbsp; &nbsp; &nbsp;&nbsp;三是开展“七一勋章”评选颁授和全国“两优一先”评选表彰。将以中共中央名义，向为党作出杰出贡献、创造宝贵精神财富的党员授予“七一勋章”，由中共中央总书记、国家主席、中央军委主席习近平签发证书，颁授勋章。还将评选表彰全国优秀共产党员、全国优秀党务工作者、全国先进基层党组织；向健在的党龄达到50年、一贯表现良好的老党员颁发“光荣在党50年”纪念章。此外，还将组织开展走访慰问获得党内功勋荣誉表彰的党员、生活困难党员、老党员、老干部和烈士遗属、因公殉职党员干部的家属等活动。<br>&nbsp; &nbsp; &nbsp;&nbsp;四是举办大型主题展览。将举办“不忘初心、牢记使命”大型主题展览，全面、系统、生动、立体地展示中国共产党百年的光辉历程、伟大成就和宝贵经验。<br>&nbsp; &nbsp; &nbsp;&nbsp;五是举办文艺演出。将举办庆祝中国共产党成立100周年大型文艺演出，邀请党和国家领导人、获得功勋荣誉表彰的代表、基层党员和群众代表等各界人士来观看。<br>&nbsp; &nbsp; &nbsp;&nbsp;六是召开理论研讨会和座谈会。中央宣传部将会同中央组织部、中央党校（国家行政学院）、中央党史和文献研究院、教育部、中国社会科学院、军委政治工作部联合召开庆祝建党100周年理论研讨会；中央组织部将召开全国优秀共产党员、优秀党务工作者、先进基层党组织代表庆祝建党100周年座谈会，还要召开老党员老干部座谈会和党的建设历史经验研讨会；中央统战部将商各民主党派中央、无党派人士和全国工商联，召开各界人士庆祝中国共产党成立100周年座谈会。<br>&nbsp; &nbsp; &nbsp;&nbsp;七是创作推出一批文艺作品和出版物。将以中国共产党成立100年来的光辉历史、伟大成就和宝贵经验，以及各个历史时期涌现出来的先进典型为主要内容，制作播出大型文献专题片和专题节目。创作推出一批具有较高思想艺术水平的戏剧、音乐、舞蹈、电影、电视剧等各类优秀文艺作品。推出一批重点党史著作和理论文章，编写推出《中国共产党的100年》等重点出版物。此外，还将以庆祝建党100周年为主题，发行纪念邮票、纪念封和纪念币。<br>&nbsp; &nbsp; &nbsp;&nbsp;八是开展群众性主题宣传教育活动。将在全国城乡广泛开展“永远跟党走”群众性主题宣传教育活动。各地特别是在党的历史上具有重要意义的地方，将结合本地实际，围绕党史重要事件、重要活动和重要遗址旧址等组织开展丰富多彩的庆祝活动。</p>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 06:52:00	2024-11-11 06:52:00	\N	0	0	f
61	\N	\N	\N	企业风险解决方案	<p>晏琪 &nbsp;15207127275 &nbsp;2517906409@qq.com （财产险事业群）</p><p>&nbsp;中国企业在当前环境下面临前所未有的机遇和挑战企业在经营过程中不可避免地会遇到融资、生产、营销、服务以及研发等多方面的风险，尤其是生产制造和工程类企业，更是面对复杂多变的风险状况和特殊需求，因此需要专业的保险与风险管理支持。如何全面、精准、高效地应对企业客户的多样化风险，为客户提供优质的风险管理服务，是大同不断追求的方向。</p><p>&nbsp;大同企业服务团队深度参与了医疗、教育、食品、交通、环境，采矿，企业福利等多个行业的风险管理项目，积累了丰富的实战经验，能够满足企业在保险和风险管理上的各类需求。此外，大同在高风险及特殊行业与一般企业的不同需求基础上，通过专业的风险识别和分析，进一步细分风险类别，为相关行业提供更加专业和定制化的风险管理方案。</p>	2-6731c05a1fd47681628555.jpg	深度参与采矿业、制造业、建筑业、电力热力、交通运输、金属冶炼、水利、商贸等多个行业的企业风险管理项目，利用风险识别分析，细分风险类型，为相关行业提供专业化、定制型的风险管理服务。	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 08:25:02	2024-11-11 08:29:14	\N	0	0	f
62	\N	\N	\N	政府风险解决方案	<p>陈寅尧 &nbsp;17771801729 （政保业务事业群） 37775369@qq.com&nbsp;</p><p>中国目前正处于一个关键的经济转型新阶段，面对频繁且严峻的风险挑战。在全球层面上，公共社会风险正逐渐增加，表现出多样且复杂的特点。中国的经济发展模式已从追求高速增长转变为注重高质量发展，这一变化使得优化经济结构、改变发展方式以及转换增长动力变得更加迫切，经济转型的特征越来越显著。</p><p>&nbsp;在国内外环境的共同影响下，国内正面临一系列集中爆发的风险挑战，进入了一个风险频发的敏感期。借助于大同保险在风险管理研究领域的专业基础和丰富的服务经验，我们持续为政府和各企事业单位提供支持，通过增强风险管理能力，完善现代风险管理体系，推进社会治理中的保险产品和风险管理服务的创新，帮助构建一个多层次的社会保障系统。</p>	1-6731c01decf96572747748.jpg	依托常年服务政府、企事业单位丰富经验，积极协助有关部门，通过加强风险管理能力建设，建立健全现代风险管理体系，推动社会治理领域保险产品和风险管理服务创新，不断完善多层次社会保障体系。	\N	\N	\N	\N	\N	\N	\N	\N	2024-11-11 08:25:49	2024-11-11 08:28:13	\N	0	0	f
\.


--
-- Data for Name: node_region; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public.node_region (node_id, region_id) FROM stdin;
1	2
2	3
3	4
4	4
5	4
6	4
7	4
8	4
9	4
10	4
11	4
12	4
13	5
16	6
17	6
18	6
19	6
20	6
21	6
22	6
24	5
25	12
26	13
27	23
28	23
29	23
31	16
32	16
33	16
35	16
36	16
37	24
38	16
39	16
40	25
41	6
42	26
43	5
44	7
45	7
46	7
47	7
48	7
49	7
50	7
51	7
51	4
50	4
49	4
48	4
47	4
46	4
45	4
44	4
52	3
53	27
54	27
55	27
56	27
57	27
58	27
59	27
60	27
61	24
62	24
\.


--
-- Data for Name: node_tag; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public.node_tag (node_id, tag_id) FROM stdin;
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public."order" (id, node_id, consumer_id, quantity, amount, created_at, paid_at, used_at, status, price, cancelled_at, refunded_at, deleted_at, sn, wx_trans_id, bank_type, wx_prepay_id, deleted) FROM stdin;
\.


--
-- Data for Name: page; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public.page (id, name, label, weight) FROM stdin;
5	业务	business	\N
6	公告	announcement	\N
7	加入我们	hire	\N
11	业务咨询	feedback	\N
1	首页	home	1
2	关于我们	about	2
12	产品中心	products	3
15	企业文化	qiyewenhua	5
13	消保专栏	xiaobaozhuanlan	6
3	资讯中心	news	4
4	客户服务	services	7
10	联系我们	contact	8
9	信息披露	information	9
8	党建之窗	dangjian	11
16	招标公告	zhaobiao	10
\.


--
-- Data for Name: refund; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public.refund (id, ord_id, created_at, reason, note, sn, wx_refund_id) FROM stdin;
\.


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public.region (id, page_id, name, label, count, icon, fields, description, weight) FROM stdin;
6	3	消保专栏	xiaobao	6	list	body,image,summary,tags	\N	\N
1	\N	页脚	footer	1	list	body,image,summary,tags	\N	\N
8	1	通知公告	announcement	6	list	body,image,summary,tags	\N	\N
9	1	行业咨询	hangyezixun	6	list	body,image,summary,tags	\N	\N
10	1	客户培训	kehupeixun	6	list	body	\N	\N
11	1	风险索赔	fengxiansuopei	6	list	body,image,summary,tags	\N	\N
3	2	公司介绍	intro	1	list	body,image,summary,tags	\N	\N
12	2	法人治理机构	farenzhilijigou	6	list	body,image,summary,tags	\N	\N
13	2	组织结构	zuzhijiegou	6	list	body,image,summary,tags,specs	\N	\N
14	2	企业荣誉	qiyerongyu	6	list	body,image,summary,tags	\N	\N
15	2	公司宣传片	gongsixuanchuanpian	6	list	body,image,summary,tags,video	\N	\N
2	1	分支机构	branchs	1	list	body,image,summary,tags	\N	\N
17	15	发展策略	fazhancelve	5	list	image,summary,body	\N	0
18	13	法律法规	falvfagui	5	list	image,summary,body	\N	0
19	13	风险提示	fengxiantishi	5	list	image,summary,body	\N	0
20	13	常见问题	changjianwenti	5	list	image,summary,body	\N	0
21	4	各类培训	geleipeixun	5	list	image,summary,body	\N	0
22	4	协助索赔	xiezhusuopei	5	list	image,summary,body	\N	0
23	1	幻灯片1	huandengpian1	3	list	image,summary,body	\N	0
24	12	方案	fangan	5	list	image,summary,body	\N	0
16	12	产品	products	6	list	body,image,summary,tags,category	\N	\N
25	12	业务中心	yewuzhongxin	5	list	image,summary,body	\N	0
5	9	信息披露	disclosure	5	list	body,image,summary,tags	\N	\N
7	3	公司新闻	news	1	list	body,image,summary,tags,regions	\N	\N
4	3	会议纪要	meeting	1	list	body,image,summary,tags,regions	\N	\N
26	16	招标公告	zhaobiao	5	list	image,summary,body	\N	0
27	8	党建之窗	dangjian	5	list	image,summary,body	\N	0
28	3	集团新闻	jituan	5	list	image,summary,body	\N	0
29	3	行业新闻	hangye	5	list	image,summary,body	\N	0
30	3	下载中心	xiazai	5	list	image,summary,body	\N	0
\.


--
-- Data for Name: spec; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public.spec (id, node_id, name, value) FROM stdin;
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public.tag (id, name, label) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public."user" (id, username, roles, password, plain_password, openid, name, phone, avatar) FROM stdin;
1	root	["ROLE_SUPER_ADMIN"]	$2y$13$8Hifx6r/mJqnKAoccHLPleR3ZTF9s/HWyZrDX/3YF8hzxMlcBg2ia	\N	\N	root	\N	\N
2	admin	["ROLE_ADMIN"]	$2y$13$W/UaZrI/1KhBGmHAnl6gYePTOm5wIjpwKajSrrhBOyqI7YRIKXa/C	\N	\N	admin	\N	\N
\.


--
-- Data for Name: user_node; Type: TABLE DATA; Schema: public; Owner: datong
--

COPY public.user_node (user_id, node_id) FROM stdin;
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: datong
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: datong
--

SELECT pg_catalog.setval('public.comment_id_seq', 1, false);


--
-- Name: conf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: datong
--

SELECT pg_catalog.setval('public.conf_id_seq', 1, true);


--
-- Name: feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: datong
--

SELECT pg_catalog.setval('public.feedback_id_seq', 29, true);


--
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: datong
--

SELECT pg_catalog.setval('public.image_id_seq', 1, false);


--
-- Name: language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: datong
--

SELECT pg_catalog.setval('public.language_id_seq', 1, false);


--
-- Name: link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: datong
--

SELECT pg_catalog.setval('public.link_id_seq', 1, false);


--
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: datong
--

SELECT pg_catalog.setval('public.menu_id_seq', 1, false);


--
-- Name: messenger_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: datong
--

SELECT pg_catalog.setval('public.messenger_messages_id_seq', 1, false);


--
-- Name: node_id_seq; Type: SEQUENCE SET; Schema: public; Owner: datong
--

SELECT pg_catalog.setval('public.node_id_seq', 62, true);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: datong
--

SELECT pg_catalog.setval('public.order_id_seq', 1, false);


--
-- Name: page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: datong
--

SELECT pg_catalog.setval('public.page_id_seq', 16, true);


--
-- Name: refund_id_seq; Type: SEQUENCE SET; Schema: public; Owner: datong
--

SELECT pg_catalog.setval('public.refund_id_seq', 1, false);


--
-- Name: region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: datong
--

SELECT pg_catalog.setval('public.region_id_seq', 30, true);


--
-- Name: spec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: datong
--

SELECT pg_catalog.setval('public.spec_id_seq', 1, false);


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: datong
--

SELECT pg_catalog.setval('public.tag_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: datong
--

SELECT pg_catalog.setval('public.user_id_seq', 2, true);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- Name: conf conf_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.conf
    ADD CONSTRAINT conf_pkey PRIMARY KEY (id);


--
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);


--
-- Name: link link_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.link
    ADD CONSTRAINT link_pkey PRIMARY KEY (id);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);


--
-- Name: messenger_messages messenger_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.messenger_messages
    ADD CONSTRAINT messenger_messages_pkey PRIMARY KEY (id);


--
-- Name: node node_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.node
    ADD CONSTRAINT node_pkey PRIMARY KEY (id);


--
-- Name: node_region node_region_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.node_region
    ADD CONSTRAINT node_region_pkey PRIMARY KEY (node_id, region_id);


--
-- Name: node_tag node_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.node_tag
    ADD CONSTRAINT node_tag_pkey PRIMARY KEY (node_id, tag_id);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: page page_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.page
    ADD CONSTRAINT page_pkey PRIMARY KEY (id);


--
-- Name: refund refund_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.refund
    ADD CONSTRAINT refund_pkey PRIMARY KEY (id);


--
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);


--
-- Name: spec spec_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.spec
    ADD CONSTRAINT spec_pkey PRIMARY KEY (id);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: user_node user_node_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.user_node
    ADD CONSTRAINT user_node_pkey PRIMARY KEY (user_id, node_id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: idx_14f389a882f1baf4; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_14f389a882f1baf4 ON public.conf USING btree (language_id);


--
-- Name: idx_36ac99f1ccd7e912; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_36ac99f1ccd7e912 ON public.link USING btree (menu_id);


--
-- Name: idx_70ac95f8460d9fd7; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_70ac95f8460d9fd7 ON public.node_tag USING btree (node_id);


--
-- Name: idx_70ac95f8bad26311; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_70ac95f8bad26311 ON public.node_tag USING btree (tag_id);


--
-- Name: idx_75ea56e016ba31db; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_75ea56e016ba31db ON public.messenger_messages USING btree (delivered_at);


--
-- Name: idx_75ea56e0e3bd61ce; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_75ea56e0e3bd61ce ON public.messenger_messages USING btree (available_at);


--
-- Name: idx_75ea56e0fb7336f0; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_75ea56e0fb7336f0 ON public.messenger_messages USING btree (queue_name);


--
-- Name: idx_857fe84512469de2; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_857fe84512469de2 ON public.node USING btree (category_id);


--
-- Name: idx_857fe845727aca70; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_857fe845727aca70 ON public.node USING btree (parent_id);


--
-- Name: idx_857fe84582f1baf4; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_857fe84582f1baf4 ON public.node USING btree (language_id);


--
-- Name: idx_857fe845f675f31b; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_857fe845f675f31b ON public.node USING btree (author_id);


--
-- Name: idx_9474526c460d9fd7; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_9474526c460d9fd7 ON public.comment USING btree (node_id);


--
-- Name: idx_9474526cf675f31b; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_9474526cf675f31b ON public.comment USING btree (author_id);


--
-- Name: idx_bb70e4d3460d9fd7; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_bb70e4d3460d9fd7 ON public.node_region USING btree (node_id);


--
-- Name: idx_bb70e4d398260155; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_bb70e4d398260155 ON public.node_region USING btree (region_id);


--
-- Name: idx_c00e173e460d9fd7; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_c00e173e460d9fd7 ON public.spec USING btree (node_id);


--
-- Name: idx_c53d045f460d9fd7; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_c53d045f460d9fd7 ON public.image USING btree (node_id);


--
-- Name: idx_d2294458460d9fd7; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_d2294458460d9fd7 ON public.feedback USING btree (node_id);


--
-- Name: idx_f529939837fdbd6d; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_f529939837fdbd6d ON public."order" USING btree (consumer_id);


--
-- Name: idx_f5299398460d9fd7; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_f5299398460d9fd7 ON public."order" USING btree (node_id);


--
-- Name: idx_f62f176c4663e4; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_f62f176c4663e4 ON public.region USING btree (page_id);


--
-- Name: idx_fffea48c460d9fd7; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_fffea48c460d9fd7 ON public.user_node USING btree (node_id);


--
-- Name: idx_fffea48ca76ed395; Type: INDEX; Schema: public; Owner: datong
--

CREATE INDEX idx_fffea48ca76ed395 ON public.user_node USING btree (user_id);


--
-- Name: uniq_5b2c1458e636d3f5; Type: INDEX; Schema: public; Owner: datong
--

CREATE UNIQUE INDEX uniq_5b2c1458e636d3f5 ON public.refund USING btree (ord_id);


--
-- Name: uniq_8d93d649f85e0677; Type: INDEX; Schema: public; Owner: datong
--

CREATE UNIQUE INDEX uniq_8d93d649f85e0677 ON public."user" USING btree (username);


--
-- Name: messenger_messages notify_trigger; Type: TRIGGER; Schema: public; Owner: datong
--

CREATE TRIGGER notify_trigger AFTER INSERT OR UPDATE ON public.messenger_messages FOR EACH ROW EXECUTE FUNCTION public.notify_messenger_messages();


--
-- Name: conf fk_14f389a882f1baf4; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.conf
    ADD CONSTRAINT fk_14f389a882f1baf4 FOREIGN KEY (language_id) REFERENCES public.language(id);


--
-- Name: link fk_36ac99f1ccd7e912; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.link
    ADD CONSTRAINT fk_36ac99f1ccd7e912 FOREIGN KEY (menu_id) REFERENCES public.menu(id);


--
-- Name: refund fk_5b2c1458e636d3f5; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.refund
    ADD CONSTRAINT fk_5b2c1458e636d3f5 FOREIGN KEY (ord_id) REFERENCES public."order"(id);


--
-- Name: node_tag fk_70ac95f8460d9fd7; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.node_tag
    ADD CONSTRAINT fk_70ac95f8460d9fd7 FOREIGN KEY (node_id) REFERENCES public.node(id) ON DELETE CASCADE;


--
-- Name: node_tag fk_70ac95f8bad26311; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.node_tag
    ADD CONSTRAINT fk_70ac95f8bad26311 FOREIGN KEY (tag_id) REFERENCES public.tag(id) ON DELETE CASCADE;


--
-- Name: node fk_857fe84512469de2; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.node
    ADD CONSTRAINT fk_857fe84512469de2 FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: node fk_857fe845727aca70; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.node
    ADD CONSTRAINT fk_857fe845727aca70 FOREIGN KEY (parent_id) REFERENCES public.node(id);


--
-- Name: node fk_857fe84582f1baf4; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.node
    ADD CONSTRAINT fk_857fe84582f1baf4 FOREIGN KEY (language_id) REFERENCES public.language(id);


--
-- Name: node fk_857fe845f675f31b; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.node
    ADD CONSTRAINT fk_857fe845f675f31b FOREIGN KEY (author_id) REFERENCES public."user"(id);


--
-- Name: comment fk_9474526c460d9fd7; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fk_9474526c460d9fd7 FOREIGN KEY (node_id) REFERENCES public.node(id);


--
-- Name: comment fk_9474526cf675f31b; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fk_9474526cf675f31b FOREIGN KEY (author_id) REFERENCES public."user"(id);


--
-- Name: node_region fk_bb70e4d3460d9fd7; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.node_region
    ADD CONSTRAINT fk_bb70e4d3460d9fd7 FOREIGN KEY (node_id) REFERENCES public.node(id) ON DELETE CASCADE;


--
-- Name: node_region fk_bb70e4d398260155; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.node_region
    ADD CONSTRAINT fk_bb70e4d398260155 FOREIGN KEY (region_id) REFERENCES public.region(id) ON DELETE CASCADE;


--
-- Name: spec fk_c00e173e460d9fd7; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.spec
    ADD CONSTRAINT fk_c00e173e460d9fd7 FOREIGN KEY (node_id) REFERENCES public.node(id);


--
-- Name: image fk_c53d045f460d9fd7; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fk_c53d045f460d9fd7 FOREIGN KEY (node_id) REFERENCES public.node(id);


--
-- Name: feedback fk_d2294458460d9fd7; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT fk_d2294458460d9fd7 FOREIGN KEY (node_id) REFERENCES public.node(id);


--
-- Name: order fk_f529939837fdbd6d; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT fk_f529939837fdbd6d FOREIGN KEY (consumer_id) REFERENCES public."user"(id);


--
-- Name: order fk_f5299398460d9fd7; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT fk_f5299398460d9fd7 FOREIGN KEY (node_id) REFERENCES public.node(id);


--
-- Name: region fk_f62f176c4663e4; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT fk_f62f176c4663e4 FOREIGN KEY (page_id) REFERENCES public.page(id);


--
-- Name: user_node fk_fffea48c460d9fd7; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.user_node
    ADD CONSTRAINT fk_fffea48c460d9fd7 FOREIGN KEY (node_id) REFERENCES public.node(id) ON DELETE CASCADE;


--
-- Name: user_node fk_fffea48ca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: datong
--

ALTER TABLE ONLY public.user_node
    ADD CONSTRAINT fk_fffea48ca76ed395 FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

