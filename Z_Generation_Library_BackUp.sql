--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: books; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE books (
    id integer NOT NULL,
    title character varying(64) NOT NULL,
    category character varying(64) NOT NULL,
    name character varying(64) NOT NULL,
    place character varying(64) NOT NULL,
    keizai integer,
    hougaku integer,
    rigaku integer,
    kougaku integer,
    bungaku integer,
    igaku integer
);


ALTER TABLE public.books OWNER TO postgres;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO postgres;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- Name: histories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE histories (
    id integer NOT NULL,
    book_id integer,
    user_id integer,
    datetime date NOT NULL
);


ALTER TABLE public.histories OWNER TO postgres;

--
-- Name: histories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.histories_id_seq OWNER TO postgres;

--
-- Name: histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE histories_id_seq OWNED BY histories.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    user_id character varying(64) NOT NULL,
    name character varying(64) NOT NULL,
    password character varying(64) NOT NULL,
    graduate integer NOT NULL,
    undergraduate character varying(64) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY histories ALTER COLUMN id SET DEFAULT nextval('histories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alembic_version (version_num) FROM stdin;
1c433de6c7de
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY books (id, title, category, name, place, keizai, hougaku, rigaku, kougaku, bungaku, igaku) FROM stdin;
1       君の膵臓をたべたい      恋愛    住野よる        A       12      15      3       3       8       18
2       深層学習型のロボット制御技術を開発      論文    尾形哲也        A       0       0       5       0       0       0
3       「2元表面アーキテクトニクス」による微細印刷エレクトロニクスを確立       論文    金原正幸        A       2       3       20      30      0       1
4       レクチャー離散数学―グラフの世界への招待 教材    木本 一史       A       10      2       36      3       4       15
5       世界初！ 腸内フローラによる前立腺がんの増殖メカニズムを解明　前立腺がんの予防及び新たな治療へつながることに期待 論文    藤田和利        A       0       0       3       3       1     42
6       世界の中心で、愛をさけぶ        恋愛    片山恭一        A       18      25      3       13      48      28
7       CO2排出を抑制する革新的な金属精製技術を開発 －ベリリウム鉱石精製が従来技術の1/1,000のエネルギー、常圧・低温で可能に-    論文    中道 勝 A       1       0       23      43      3     8
8       旅のラゴス      SF      筒井康隆        A       32      17      3       32      12      28
9       システム英単語  教材    霜 康司 A       16      25      35      36      28      38
10      虐殺器官        SF      伊藤計劃        A       22      35      23      13      28      11
11      公式TOEIC　Listening　＆　Reading問題集 教材    Educational Testing     B       52      45      33      53      68      38
12      阪急電車        恋愛    有川浩  B       82      45      63      43      118     58
13      転生したらスライムだった件      ラノベ  伏瀬    B       10      18      32      23      28      8
14      怪談狩り 黄泉からのメッセージ   ホラー  中山市朗        B       2       5       3       3       28      7
15      Molecular Biology of the Cell   教材    Bruce Alberts   B       11      15      13      23      4       2
16      いま、会いにゆきます    恋愛    市川拓司        B       62      45      33      23      50      24
17      オーバーロード  ラノベ  丸山くがね      B       16      18      33      2       87      24
18      新装版 殺戮にいたる病   ホラー  我孫子武丸      B       22      35      6       5       8       9
19      バナナ剥きには最適の日々        SF      円城 塔 B       1       5       32      23      48      19
20      ソードアート・オンライン        ラノベ  川原礫  B       11      14      22      31      84      21
21      リウマチ病診療ビジュアルテキスト        教材    上野 征夫       C       0       3       1       3       0       72
22      この素晴らしい世界に祝福を！    ラノベ  暁なつめ        C       5       14      3       23      18      4
23      舟を編む        恋愛    三浦しをん      C       86      73      66      54      108     22
24      黒い家  ホラー  貴志祐介        C       18      25      34      34      82      38
25      夜は短し歩けよ乙女      恋愛    森見登美彦      C       82      55      23      53      48      32
26      リング  ホラー  鈴木光司        C       10      25      43      63      38      11
27      伊藤真の法学入門        教材    伊藤 真 C       1       55      3       2       2       10
28      博士の愛した数式        恋愛    小川洋子        C       112     14      30      43      118     39
29      隣の家の少女    ホラー  ジャック ケッチャム     C       22      25      23      23      28      17
30      My Humanity     SF      長谷 敏司       C       11      22      33      44      55      66
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('books_id_seq', 30, true);


--
-- Data for Name: histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY histories (id, book_id, user_id, datetime) FROM stdin;
1       1       1       2021-01-23
2       1       1       2021-01-24
3       3       1       2021-01-25
4       3       1       2021-01-26
5       4       1       2021-01-27
6       5       1       2021-02-23
7       5       1       2021-02-26
8       6       1       2021-05-25
9       6       1       2021-06-23
10      6       1       2021-07-23
11      7       1       2021-07-23
12      7       1       2021-06-06
13      7       1       2021-02-04
14      7       1       2021-03-23
15      8       1       2021-03-23
16      8       1       2021-03-30
17      9       1       2021-04-23
18      10      1       2021-01-23
19      11      1       2021-02-23
20      11      1       2021-03-23
21      11      1       2021-04-23
22      11      2       2021-05-23
23      11      2       2021-01-23
24      11      2       2021-02-23
25      11      2       2021-03-23
26      14      2       2021-03-23
27      16      2       2021-04-23
28      17      2       2021-04-23
29      17      2       2021-05-23
30      17      2       2021-01-23
31      19      2       2021-02-23
32      19      2       2021-03-23
33      19      2       2021-04-23
34      19      2       2021-04-23
35      12      3       2021-05-23
36      12      3       2021-01-23
37      20      3       2021-02-23
38      20      3       2021-03-23
39      1       3       2021-01-23
40      20      3       2021-03-23
41      27      3       2021-02-23
42      27      3       2021-02-23
43      27      3       2021-02-23
44      27      3       2021-04-23
45      27      3       2021-05-25
46      27      4       2021-05-24
47      2       4       2021-05-23
48      24      4       2021-05-22
49      24      4       2021-05-21
50      25      4       2021-05-20
\.


--
-- Name: histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('histories_id_seq', 50, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, user_id, name, password, graduate, undergraduate) FROM stdin;
1       yuta    yuta yamagishi  yuta    4       工学部
2       akari   hirai akari     akari   3       理学部
3       kyosuke fujiki kyosuke  kyosuke 4       医学部
4       masaki  tuchihasi masaki        masaki  4       文学部
5       test    test test       test    4       経済学部
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 5, true);


--
-- Name: alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY histories
    ADD CONSTRAINT histories_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: histories_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY histories
    ADD CONSTRAINT histories_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(id);


--
-- Name: histories_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY histories
    ADD CONSTRAINT histories_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
