PGDMP      #            	    |            lab4_design_web_services    16.3 (Debian 16.3-1.pgdg120+1)    16.4 >    ]           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ^           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            _           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            `           1262    16388    lab4_design_web_services    DATABASE     �   CREATE DATABASE lab4_design_web_services WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
 (   DROP DATABASE lab4_design_web_services;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            a           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16428 
   commentary    TABLE     A  CREATE TABLE public.commentary (
    commentary_id integer NOT NULL,
    participant_id integer,
    topic character varying(200),
    content character varying(3000),
    count_likes integer,
    theme_id integer,
    "timestamp" date,
    commentary_type boolean,
    reply_commentary_id integer,
    tag_id integer
);
    DROP TABLE public.commentary;
       public         heap    postgres    false    4            �            1259    16427    commentary_commentary_id_seq    SEQUENCE     �   CREATE SEQUENCE public.commentary_commentary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.commentary_commentary_id_seq;
       public          postgres    false    4    224            b           0    0    commentary_commentary_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.commentary_commentary_id_seq OWNED BY public.commentary.commentary_id;
          public          postgres    false    223            �            1259    16457    log    TABLE     �   CREATE TABLE public.log (
    log_id integer NOT NULL,
    type_of_logs integer,
    log_message character varying(3000),
    "timestamp" date
);
    DROP TABLE public.log;
       public         heap    postgres    false    4            �            1259    16456    log_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.log_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.log_log_id_seq;
       public          postgres    false    226    4            c           0    0    log_log_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.log_log_id_seq OWNED BY public.log.log_id;
          public          postgres    false    225            �            1259    16466    notification    TABLE     �   CREATE TABLE public.notification (
    notification_id integer NOT NULL,
    topic character varying(50),
    content character varying(500),
    sender_id integer,
    receiver_id integer
);
     DROP TABLE public.notification;
       public         heap    postgres    false    4            �            1259    16465     notification_notification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.notification_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.notification_notification_id_seq;
       public          postgres    false    4    228            d           0    0     notification_notification_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.notification_notification_id_seq OWNED BY public.notification.notification_id;
          public          postgres    false    227            �            1259    16390    participant    TABLE     �  CREATE TABLE public.participant (
    id integer NOT NULL,
    name character varying(60),
    email character varying(256),
    password character varying(64),
    oauth_code character varying(1024),
    status integer NOT NULL,
    role integer NOT NULL,
    avatar character varying(1024),
    CONSTRAINT participant_check CHECK (((((password)::text <> NULL::text) AND ((email)::text <> NULL::text)) OR ((oauth_code)::text <> NULL::text)))
);
    DROP TABLE public.participant;
       public         heap    postgres    false    4            �            1259    16389    participant_id_seq    SEQUENCE     �   CREATE SEQUENCE public.participant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.participant_id_seq;
       public          postgres    false    216    4            e           0    0    participant_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.participant_id_seq OWNED BY public.participant.id;
          public          postgres    false    215            �            1259    16400    section    TABLE     �   CREATE TABLE public.section (
    section_id integer NOT NULL,
    name character varying(100) NOT NULL,
    count_theme integer NOT NULL
);
    DROP TABLE public.section;
       public         heap    postgres    false    4            �            1259    16399    section_section_id_seq    SEQUENCE     �   CREATE SEQUENCE public.section_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.section_section_id_seq;
       public          postgres    false    4    218            f           0    0    section_section_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.section_section_id_seq OWNED BY public.section.section_id;
          public          postgres    false    217            �            1259    16421    tag    TABLE     Y   CREATE TABLE public.tag (
    tag_id integer NOT NULL,
    name character varying(30)
);
    DROP TABLE public.tag;
       public         heap    postgres    false    4            �            1259    16420    tag_tag_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tag_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.tag_tag_id_seq;
       public          postgres    false    222    4            g           0    0    tag_tag_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.tag_tag_id_seq OWNED BY public.tag.tag_id;
          public          postgres    false    221            �            1259    16407    theme    TABLE     �   CREATE TABLE public.theme (
    theme_id integer NOT NULL,
    name character varying(100) NOT NULL,
    section_id integer,
    first_message character varying(3000),
    count_message integer,
    "timestamp" date
);
    DROP TABLE public.theme;
       public         heap    postgres    false    4            �            1259    16406    theme_theme_id_seq    SEQUENCE     �   CREATE SEQUENCE public.theme_theme_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.theme_theme_id_seq;
       public          postgres    false    220    4            h           0    0    theme_theme_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.theme_theme_id_seq OWNED BY public.theme.theme_id;
          public          postgres    false    219            �           2604    16431    commentary commentary_id    DEFAULT     �   ALTER TABLE ONLY public.commentary ALTER COLUMN commentary_id SET DEFAULT nextval('public.commentary_commentary_id_seq'::regclass);
 G   ALTER TABLE public.commentary ALTER COLUMN commentary_id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    16460 
   log log_id    DEFAULT     h   ALTER TABLE ONLY public.log ALTER COLUMN log_id SET DEFAULT nextval('public.log_log_id_seq'::regclass);
 9   ALTER TABLE public.log ALTER COLUMN log_id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    16469    notification notification_id    DEFAULT     �   ALTER TABLE ONLY public.notification ALTER COLUMN notification_id SET DEFAULT nextval('public.notification_notification_id_seq'::regclass);
 K   ALTER TABLE public.notification ALTER COLUMN notification_id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    16393    participant id    DEFAULT     p   ALTER TABLE ONLY public.participant ALTER COLUMN id SET DEFAULT nextval('public.participant_id_seq'::regclass);
 =   ALTER TABLE public.participant ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    16403    section section_id    DEFAULT     x   ALTER TABLE ONLY public.section ALTER COLUMN section_id SET DEFAULT nextval('public.section_section_id_seq'::regclass);
 A   ALTER TABLE public.section ALTER COLUMN section_id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    16424 
   tag tag_id    DEFAULT     h   ALTER TABLE ONLY public.tag ALTER COLUMN tag_id SET DEFAULT nextval('public.tag_tag_id_seq'::regclass);
 9   ALTER TABLE public.tag ALTER COLUMN tag_id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    16410    theme theme_id    DEFAULT     p   ALTER TABLE ONLY public.theme ALTER COLUMN theme_id SET DEFAULT nextval('public.theme_theme_id_seq'::regclass);
 =   ALTER TABLE public.theme ALTER COLUMN theme_id DROP DEFAULT;
       public          postgres    false    219    220    220            V          0    16428 
   commentary 
   TABLE DATA           �   COPY public.commentary (commentary_id, participant_id, topic, content, count_likes, theme_id, "timestamp", commentary_type, reply_commentary_id, tag_id) FROM stdin;
    public          postgres    false    224    I       X          0    16457    log 
   TABLE DATA           M   COPY public.log (log_id, type_of_logs, log_message, "timestamp") FROM stdin;
    public          postgres    false    226   JI       Z          0    16466    notification 
   TABLE DATA           _   COPY public.notification (notification_id, topic, content, sender_id, receiver_id) FROM stdin;
    public          postgres    false    228   gI       N          0    16390    participant 
   TABLE DATA           b   COPY public.participant (id, name, email, password, oauth_code, status, role, avatar) FROM stdin;
    public          postgres    false    216   �I       P          0    16400    section 
   TABLE DATA           @   COPY public.section (section_id, name, count_theme) FROM stdin;
    public          postgres    false    218   �I       T          0    16421    tag 
   TABLE DATA           +   COPY public.tag (tag_id, name) FROM stdin;
    public          postgres    false    222   J       R          0    16407    theme 
   TABLE DATA           f   COPY public.theme (theme_id, name, section_id, first_message, count_message, "timestamp") FROM stdin;
    public          postgres    false    220   J       i           0    0    commentary_commentary_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.commentary_commentary_id_seq', 1, true);
          public          postgres    false    223            j           0    0    log_log_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.log_log_id_seq', 1, false);
          public          postgres    false    225            k           0    0     notification_notification_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.notification_notification_id_seq', 1, false);
          public          postgres    false    227            l           0    0    participant_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.participant_id_seq', 1, true);
          public          postgres    false    215            m           0    0    section_section_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.section_section_id_seq', 1, false);
          public          postgres    false    217            n           0    0    tag_tag_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tag_tag_id_seq', 1, false);
          public          postgres    false    221            o           0    0    theme_theme_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.theme_theme_id_seq', 3, true);
          public          postgres    false    219            �           2606    16435    commentary commentary_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.commentary
    ADD CONSTRAINT commentary_pkey PRIMARY KEY (commentary_id);
 D   ALTER TABLE ONLY public.commentary DROP CONSTRAINT commentary_pkey;
       public            postgres    false    224            �           2606    16464    log log_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.log
    ADD CONSTRAINT log_pkey PRIMARY KEY (log_id);
 6   ALTER TABLE ONLY public.log DROP CONSTRAINT log_pkey;
       public            postgres    false    226            �           2606    16473    notification notification_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (notification_id);
 H   ALTER TABLE ONLY public.notification DROP CONSTRAINT notification_pkey;
       public            postgres    false    228            �           2606    16398    participant participant_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.participant
    ADD CONSTRAINT participant_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.participant DROP CONSTRAINT participant_pkey;
       public            postgres    false    216            �           2606    16405    section section_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.section
    ADD CONSTRAINT section_pkey PRIMARY KEY (section_id);
 >   ALTER TABLE ONLY public.section DROP CONSTRAINT section_pkey;
       public            postgres    false    218            �           2606    16426    tag tag_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (tag_id);
 6   ALTER TABLE ONLY public.tag DROP CONSTRAINT tag_pkey;
       public            postgres    false    222            �           2606    16414    theme theme_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.theme
    ADD CONSTRAINT theme_pkey PRIMARY KEY (theme_id);
 :   ALTER TABLE ONLY public.theme DROP CONSTRAINT theme_pkey;
       public            postgres    false    220            �           2606    16436 )   commentary commentary_participant_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.commentary
    ADD CONSTRAINT commentary_participant_id_fkey FOREIGN KEY (participant_id) REFERENCES public.participant(id);
 S   ALTER TABLE ONLY public.commentary DROP CONSTRAINT commentary_participant_id_fkey;
       public          postgres    false    216    3242    224            �           2606    16446 .   commentary commentary_reply_commentary_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.commentary
    ADD CONSTRAINT commentary_reply_commentary_id_fkey FOREIGN KEY (reply_commentary_id) REFERENCES public.commentary(commentary_id);
 X   ALTER TABLE ONLY public.commentary DROP CONSTRAINT commentary_reply_commentary_id_fkey;
       public          postgres    false    224    3250    224            �           2606    16451 !   commentary commentary_tag_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.commentary
    ADD CONSTRAINT commentary_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(tag_id);
 K   ALTER TABLE ONLY public.commentary DROP CONSTRAINT commentary_tag_id_fkey;
       public          postgres    false    224    3248    222            �           2606    16441 #   commentary commentary_theme_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.commentary
    ADD CONSTRAINT commentary_theme_id_fkey FOREIGN KEY (theme_id) REFERENCES public.theme(theme_id);
 M   ALTER TABLE ONLY public.commentary DROP CONSTRAINT commentary_theme_id_fkey;
       public          postgres    false    3246    220    224            �           2606    16479 *   notification notification_receiver_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.participant(id);
 T   ALTER TABLE ONLY public.notification DROP CONSTRAINT notification_receiver_id_fkey;
       public          postgres    false    228    216    3242            �           2606    16474 (   notification notification_sender_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.participant(id);
 R   ALTER TABLE ONLY public.notification DROP CONSTRAINT notification_sender_id_fkey;
       public          postgres    false    3242    228    216            �           2606    16415    theme theme_section_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.theme
    ADD CONSTRAINT theme_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.section(section_id);
 E   ALTER TABLE ONLY public.theme DROP CONSTRAINT theme_section_id_fkey;
       public          postgres    false    3244    218    220            V   :   x�3�4��p�����t�����B\�B8���FF&���Ɯi�1~@����� ��      X      x������ � �      Z      x������ � �      N   ?   x�3�v��s�u�qq�u���
s������\8c�8�,�������� �      P      x�3�q�vu����4����� ?��      T      x������ � �      R   7   x�3�q�vu����4��p����uvtw��Ltt��b���� /�
�     