CREATE TABLE public.authors (
    id bigint NOT NULL,
    first_name character varying(255),
    last_name character varying(255)
);


ALTER TABLE public.authors OWNER TO tutorial;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: tutorial
--

CREATE SEQUENCE public.authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO tutorial;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tutorial
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: tutorial
--

CREATE TABLE public.books (
    id bigint NOT NULL,
    isbn character varying(255),
    name character varying(255),
    price integer,
    author_id bigint
);


ALTER TABLE public.books OWNER TO tutorial;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: tutorial
--

CREATE SEQUENCE public.books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO tutorial;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tutorial
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: readers; Type: TABLE; Schema: public; Owner: tutorial
--

CREATE TABLE public.readers (
    id bigint NOT NULL,
    first_name character varying(255),
    last_name character varying(255)
);


ALTER TABLE public.readers OWNER TO tutorial;

--
-- Name: readers_id_seq; Type: SEQUENCE; Schema: public; Owner: tutorial
--

CREATE SEQUENCE public.readers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.readers_id_seq OWNER TO tutorial;

--
-- Name: readers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tutorial
--

ALTER SEQUENCE public.readers_id_seq OWNED BY public.readers.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: tutorial
--

CREATE TABLE public.reviews (
    id bigint NOT NULL,
    description character varying(255),
    title character varying(255),
    book_id bigint,
    reader_id bigint
);


ALTER TABLE public.reviews OWNER TO tutorial;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: tutorial
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO tutorial;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tutorial
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: tutorial
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: tutorial
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: readers id; Type: DEFAULT; Schema: public; Owner: tutorial
--

ALTER TABLE ONLY public.readers ALTER COLUMN id SET DEFAULT nextval('public.readers_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: tutorial
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: tutorial
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: tutorial
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: readers readers_pkey; Type: CONSTRAINT; Schema: public; Owner: tutorial
--

ALTER TABLE ONLY public.readers
    ADD CONSTRAINT readers_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: tutorial
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: books uk_pbshnn9d7xsxqert7fjrchpe0; Type: CONSTRAINT; Schema: public; Owner: tutorial
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT uk_pbshnn9d7xsxqert7fjrchpe0 UNIQUE (isbn);


--
-- Name: reviews fk1jvfn9t6bw2o7suyt67owb3wv; Type: FK CONSTRAINT; Schema: public; Owner: tutorial
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk1jvfn9t6bw2o7suyt67owb3wv FOREIGN KEY (reader_id) REFERENCES public.readers(id);


--
-- Name: reviews fk6a9k6xvev80se5rreqvuqr7f9; Type: FK CONSTRAINT; Schema: public; Owner: tutorial
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk6a9k6xvev80se5rreqvuqr7f9 FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- Name: books fkfjixh2vym2cvfj3ufxj91jem7; Type: FK CONSTRAINT; Schema: public; Owner: tutorial
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT fkfjixh2vym2cvfj3ufxj91jem7 FOREIGN KEY (author_id) REFERENCES public.authors(id);
