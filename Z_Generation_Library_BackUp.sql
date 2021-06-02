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
e17c93171ddf
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY books (id, title, category, name, place, keizai, hougaku, rigaku, kougaku, bungaku, igaku) FROM stdin;
1       君の膵臓をたべたい      恋愛    住野よる        A       12      15      3       3       8       18
2       深層学習型のロボット制御技術を開発      論文    尾形哲也        A       0       0       5       0       0       0
3       「2元表面アーキテクトニクス」による微細印刷エレクトロニクスを確立       論文    金原正幸        A       2       3       20  30       0       1
4       レクチャー離散数学―グラフの世界への招待 教材    木本 一史       A       10      2       36      3       4       15
5       世界初！ 腸内フローラによる前立腺がんの増殖メカニズムを解明　前立腺がんの予防及び新たな治療へつながることに期待 論文    藤田和利    A       0       0       3       3       1       42
6       世界の中心で、愛をさけぶ        恋愛    片山恭一        A       18      25      3       13      48      28
7       CO2排出を抑制する革新的な金属精製技術を開発 －ベリリウム鉱石精製が従来技術の1/1,000のエネルギー、常圧・低温で可能に-    論文中道 勝 A       1       0       23      43      3       8
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
31      スターウォーズ  SF      スティーブンスピルバーグ        A       3       22      33      44      55      66
32      図書館戦争      SF      有川 浩 B       11      22      33      44      35      66
33      日本沈没        SF      小松 左京       C       116     22      33      44      55      66
34      魍魎の匣        ホラー  京極 夏彦       A       41      22      33      44      55      66
35      着信アリ        ホラー  三池 崇史       B       11      22      78      34      55      66
36      百物語  ホラー  杉浦 日向子     C       31      22      33      44      55      66
37      花より男子      恋愛    神尾 葉子       A       11      21      33      44      55      66
38      恋愛依存症      恋愛    伊東 明 B       16      22      33      46      55      66
39      アオハライド    恋愛    金春 智子       C       88      22      33      44      55      26
40      プログラミング入門      教育    Linux Academy   A       19      22      63      44      55      46
41      日本語検定公式練習問題集        教育    日本語検定委員会        B       11      22      23      44      55      66
42      考える力学      教育    兵頭 俊夫       C       110     22      13      434     50      16
43      モンテカルロ法を用いた大貧民プログラムの相互干渉に関する研究    論文    藤木 喬介       A       21      11      33      44  55       66
44      超音波定在波を用いた液滴燃料の微細化    論文    山岸 裕太       B       13      24      80      42      55      66
45      位置関係マトリクスの数値エラー行に対する導出手順に基づいた体系的な修正手順の提案        論文    土橋 真希       C       11  22       33      44      55      66
46      FBGセンサーに向けた高感度反射検出       論文    平井 あかり     A       11      22      33      48      95      66
47      Re:ゼロから始める異世界生活     ラノベ  長月 達平       B       11      22      56      44      57      66
48      青春ブタ野郎はバニーガール先輩の夢を見ない      ラノベ  鴨志田一        C       11      22      33      424     55      66
49      Stiens;Gate     ラノベ  科学アドベンチャー      A       11      20      39      44      55      66
50      僕は友達が少ない        ラノベ  平坂読  C       9       21      333     44      50      6
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('books_id_seq', 50, true);


--
-- Data for Name: histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY histories (id, book_id, user_id, datetime) FROM stdin;
1       4       1       2021-06-01
2       4       2       2021-06-01
3       5       1       2021-06-01
4       5       1       2021-06-01
5       5       2       2021-06-01
6       5       2       2021-06-01
7       6       1       2021-06-01
8       6       1       2021-06-01
9       6       1       2021-06-01
10      6       2       2021-06-01
11      6       2       2021-06-01
12      6       2       2021-06-01
13      3       1       2021-06-01
14      3       1       2021-06-01
15      3       1       2021-06-01
16      3       1       2021-06-01
17      3       2       2021-06-01
18      3       2       2021-06-01
19      3       2       2021-06-01
20      3       2       2021-06-01
21      1       1       2021-06-01
22      1       1       2021-06-01
23      1       1       2021-06-01
24      1       1       2021-06-01
25      1       1       2021-06-01
26      1       2       2021-06-01
27      1       2       2021-06-01
28      1       2       2021-06-01
29      1       2       2021-06-01
30      1       2       2021-06-01
31      2       1       2021-06-01
32      2       1       2021-06-01
33      2       1       2021-06-01
34      2       1       2021-06-01
35      2       1       2021-06-01
36      2       1       2021-06-01
37      2       2       2021-06-01
38      2       2       2021-06-01
39      2       2       2021-06-01
40      2       2       2021-06-01
41      2       2       2021-06-01
42      2       2       2021-06-01
43      7       1       2021-06-01
44      7       1       2021-06-01
45      7       1       2021-06-01
46      7       1       2021-06-01
47      7       1       2021-06-01
48      7       1       2021-06-01
49      7       1       2021-06-01
50      7       2       2021-06-01
51      7       2       2021-06-01
52      7       2       2021-06-01
53      7       2       2021-06-01
54      7       2       2021-06-01
55      7       2       2021-06-01
56      7       2       2021-06-01
57      8       1       2021-06-01
58      8       1       2021-06-01
59      8       1       2021-06-01
60      8       1       2021-06-01
61      8       1       2021-06-01
62      8       1       2021-06-01
63      8       1       2021-06-01
64      8       1       2021-06-01
65      8       2       2021-06-01
66      8       2       2021-06-01
67      8       2       2021-06-01
68      8       2       2021-06-01
69      8       2       2021-06-01
70      8       2       2021-06-01
71      8       2       2021-06-01
72      8       2       2021-06-01
73      9       1       2021-06-01
74      9       1       2021-06-01
75      9       1       2021-06-01
76      9       1       2021-06-01
77      9       1       2021-06-01
78      9       1       2021-06-01
79      9       1       2021-06-01
80      9       1       2021-06-01
81      9       1       2021-06-01
82      9       2       2021-06-01
83      9       2       2021-06-01
84      9       2       2021-06-01
85      9       2       2021-06-01
86      9       2       2021-06-01
87      9       2       2021-06-01
88      9       2       2021-06-01
89      9       2       2021-06-01
90      9       2       2021-06-01
91      10      1       2021-06-01
92      10      1       2021-06-01
93      10      1       2021-06-01
94      10      1       2021-06-01
95      10      1       2021-06-01
96      10      1       2021-06-01
97      10      1       2021-06-01
98      10      1       2021-06-01
99      10      1       2021-06-01
100     10      1       2021-06-01
101     10      2       2021-06-01
102     10      2       2021-06-01
103     10      2       2021-06-01
104     10      2       2021-06-01
105     10      2       2021-06-01
106     10      2       2021-06-01
107     10      2       2021-06-01
108     10      2       2021-06-01
109     10      2       2021-06-01
110     10      2       2021-06-01
111     11      3       2021-06-01
112     12      3       2021-06-01
113     12      3       2021-06-01
114     13      3       2021-06-01
115     13      3       2021-06-01
116     13      3       2021-06-01
117     14      3       2021-06-01
118     14      3       2021-06-01
119     14      3       2021-06-01
120     14      3       2021-06-01
121     15      3       2021-06-01
122     15      3       2021-06-01
123     15      3       2021-06-01
124     15      3       2021-06-01
125     15      3       2021-06-01
126     16      3       2021-06-01
127     16      3       2021-06-01
128     16      3       2021-06-01
129     16      3       2021-06-01
130     16      3       2021-06-01
131     16      3       2021-06-01
132     17      3       2021-06-01
133     17      3       2021-06-01
134     17      3       2021-06-01
135     17      3       2021-06-01
136     17      3       2021-06-01
137     17      3       2021-06-01
138     17      3       2021-06-01
139     18      3       2021-06-01
140     18      3       2021-06-01
141     18      3       2021-06-01
142     18      3       2021-06-01
143     18      3       2021-06-01
144     18      3       2021-06-01
145     18      3       2021-06-01
146     18      3       2021-06-01
147     19      3       2021-06-01
148     19      3       2021-06-01
149     19      3       2021-06-01
150     19      3       2021-06-01
151     19      3       2021-06-01
152     19      3       2021-06-01
153     19      3       2021-06-01
154     19      3       2021-06-01
155     19      3       2021-06-01
156     20      3       2021-06-01
157     20      3       2021-06-01
158     20      3       2021-06-01
159     20      3       2021-06-01
160     20      3       2021-06-01
161     20      3       2021-06-01
162     20      3       2021-06-01
163     20      3       2021-06-01
164     20      3       2021-06-01
165     20      3       2021-06-01
166     21      4       2021-06-01
167     22      4       2021-06-01
168     22      4       2021-06-01
169     23      4       2021-06-01
170     23      4       2021-06-01
171     23      4       2021-06-01
172     24      4       2021-06-01
173     24      4       2021-06-01
174     24      4       2021-06-01
175     24      4       2021-06-01
176     25      4       2021-06-01
177     25      4       2021-06-01
178     25      4       2021-06-01
179     25      4       2021-06-01
180     25      4       2021-06-01
181     26      4       2021-06-01
182     26      4       2021-06-01
183     26      4       2021-06-01
184     26      4       2021-06-01
185     26      4       2021-06-01
186     26      4       2021-06-01
187     27      4       2021-06-01
188     27      4       2021-06-01
189     27      4       2021-06-01
190     27      4       2021-06-01
191     27      4       2021-06-01
192     27      4       2021-06-01
193     27      4       2021-06-01
194     28      4       2021-06-01
195     28      4       2021-06-01
196     28      4       2021-06-01
197     28      4       2021-06-01
198     28      4       2021-06-01
199     28      4       2021-06-01
200     28      4       2021-06-01
201     28      4       2021-06-01
202     29      4       2021-06-01
203     29      4       2021-06-01
204     29      4       2021-06-01
205     29      4       2021-06-01
206     29      4       2021-06-01
207     29      4       2021-06-01
208     29      4       2021-06-01
209     29      4       2021-06-01
210     29      4       2021-06-01
211     30      4       2021-06-01
212     30      4       2021-06-01
213     30      4       2021-06-01
214     30      4       2021-06-01
215     30      4       2021-06-01
216     30      4       2021-06-01
217     30      4       2021-06-01
218     30      4       2021-06-01
219     30      4       2021-06-01
220     30      4       2021-06-01
221     31      5       2021-06-01
222     32      5       2021-06-01
223     32      5       2021-06-01
224     33      5       2021-06-01
225     33      5       2021-06-01
226     33      5       2021-06-01
227     34      5       2021-06-01
228     34      5       2021-06-01
229     34      5       2021-06-01
230     34      5       2021-06-01
231     35      5       2021-06-01
232     35      5       2021-06-01
233     35      5       2021-06-01
234     35      5       2021-06-01
235     35      5       2021-06-01
236     36      5       2021-06-01
237     36      5       2021-06-01
238     36      5       2021-06-01
239     36      5       2021-06-01
240     36      5       2021-06-01
241     36      5       2021-06-01
242     37      5       2021-06-01
243     37      5       2021-06-01
244     37      5       2021-06-01
245     37      5       2021-06-01
246     37      5       2021-06-01
247     37      5       2021-06-01
248     37      5       2021-06-01
249     38      5       2021-06-01
250     38      5       2021-06-01
251     38      5       2021-06-01
252     38      5       2021-06-01
253     38      5       2021-06-01
254     38      5       2021-06-01
255     38      5       2021-06-01
256     38      5       2021-06-01
257     39      5       2021-06-01
258     39      5       2021-06-01
259     39      5       2021-06-01
260     39      5       2021-06-01
261     39      5       2021-06-01
262     39      5       2021-06-01
263     39      5       2021-06-01
264     39      5       2021-06-01
265     39      5       2021-06-01
266     40      5       2021-06-01
267     40      5       2021-06-01
268     40      5       2021-06-01
269     40      5       2021-06-01
270     40      5       2021-06-01
271     40      5       2021-06-01
272     40      5       2021-06-01
273     40      5       2021-06-01
274     40      5       2021-06-01
275     40      5       2021-06-01
276     41      6       2021-06-01
277     42      6       2021-06-01
278     42      6       2021-06-01
279     43      6       2021-06-01
280     43      6       2021-06-01
281     43      6       2021-06-01
282     44      6       2021-06-01
283     44      6       2021-06-01
284     44      6       2021-06-01
285     44      6       2021-06-01
286     45      6       2021-06-01
287     45      6       2021-06-01
288     45      6       2021-06-01
289     45      6       2021-06-01
290     45      6       2021-06-01
291     46      6       2021-06-01
292     46      6       2021-06-01
293     46      6       2021-06-01
294     46      6       2021-06-01
295     46      6       2021-06-01
296     46      6       2021-06-01
297     47      6       2021-06-01
298     47      6       2021-06-01
299     47      6       2021-06-01
300     47      6       2021-06-01
301     47      6       2021-06-01
302     47      6       2021-06-01
303     47      6       2021-06-01
304     48      6       2021-06-01
305     48      6       2021-06-01
306     48      6       2021-06-01
307     48      6       2021-06-01
308     48      6       2021-06-01
309     48      6       2021-06-01
310     48      6       2021-06-01
311     48      6       2021-06-01
312     49      6       2021-06-01
313     49      6       2021-06-01
314     49      6       2021-06-01
315     49      6       2021-06-01
316     49      6       2021-06-01
317     49      6       2021-06-01
318     49      6       2021-06-01
319     49      6       2021-06-01
320     49      6       2021-06-01
321     50      6       2021-06-01
322     50      6       2021-06-01
323     50      6       2021-06-01
324     50      6       2021-06-01
325     50      6       2021-06-01
326     50      6       2021-06-01
327     50      6       2021-06-01
328     50      6       2021-06-01
329     50      6       2021-06-01
330     50      6       2021-06-01
\.


--
-- Name: histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('histories_id_seq', 330, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, user_id, name, password, graduate, undergraduate) FROM stdin;
1       test    test test       test    4       経済学部
2       test2   test test test  test    4       経済学部
3       inage   稲毛 亮 inage   8       文学部
4       mori    森 雄大 mori    8       理学部
5       abe     阿部 祐香       abe     8       医学部
6       aoyagi  青柳 司 aoyagi  8       工学部
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 6, true);


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
