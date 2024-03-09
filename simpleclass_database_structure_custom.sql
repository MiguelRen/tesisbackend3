PGDMP  -                    |            simpleclass    16.0    16.0 /               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    16394    simpleclass    DATABASE     �   CREATE DATABASE simpleclass WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE simpleclass;
                postgres    false            !           0    0    DATABASE simpleclass    ACL     1   GRANT CONNECT ON DATABASE simpleclass TO miguel;
                   postgres    false    4896            �            1259    16407    link_userrole    TABLE     �   CREATE TABLE public.link_userrole (
    userrole_tabuserid_fk integer NOT NULL,
    userrole_listroleid_fk integer DEFAULT 6 NOT NULL
);
 !   DROP TABLE public.link_userrole;
       public         heap    miguel    false            �            1259    16415 	   list_role    TABLE     g   CREATE TABLE public.list_role (
    rol_rolename character varying,
    rol_roleid integer NOT NULL
);
    DROP TABLE public.list_role;
       public         heap    miguel    false            �            1259    16426    list_role_change_seq    SEQUENCE     �   CREATE SEQUENCE public.list_role_change_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.list_role_change_seq;
       public          miguel    false    218            "           0    0    list_role_change_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.list_role_change_seq OWNED BY public.list_role.rol_roleid;
          public          miguel    false    219            �            1259    24645    tab_employee    TABLE     �  CREATE TABLE public.tab_employee (
    emp_employeeid integer NOT NULL,
    emp_employee1name character(255),
    emp_employee2name character(255),
    emp_employee1lastname character(255),
    emp_employee2lastname character(255),
    emp_employeebirth date,
    emp_employeeadress character(255),
    emp_employeephone character(255),
    emp_employeestatus character(255),
    emp_employeetype character(255)
);
     DROP TABLE public.tab_employee;
       public         heap    miguel    false            �            1259    24638    tab_student    TABLE     �  CREATE TABLE public.tab_student (
    stu_studenid integer NOT NULL,
    stu_student1name character(255),
    stu_student2name character(255),
    stu_student1lastname character(255),
    stu_student2lastname character(255),
    stu_studentbirth date,
    stu_studentadress character(255),
    stu_studentemail character(255),
    stu_studentgender character(255),
    stu_studentphone integer
);
    DROP TABLE public.tab_student;
       public         heap    miguel    false            �            1259    16396    tab_user    TABLE     �   CREATE TABLE public.tab_user (
    use_userid integer NOT NULL,
    use_username character varying,
    use_userpassword character varying,
    use_useremail character varying
);
    DROP TABLE public.tab_user;
       public         heap    postgres    false            #           0    0    TABLE tab_user    ACL     .   GRANT ALL ON TABLE public.tab_user TO miguel;
          public          postgres    false    216            �            1259    24624 	   tabperiod    TABLE     p   CREATE TABLE public.tabperiod (
    perperiodid integer NOT NULL,
    peryearstart date,
    peryearend date
);
    DROP TABLE public.tabperiod;
       public         heap    miguel    false            �            1259    24623    tabperiod_perperiodid_seq    SEQUENCE     �   CREATE SEQUENCE public.tabperiod_perperiodid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.tabperiod_perperiodid_seq;
       public          miguel    false    223            $           0    0    tabperiod_perperiodid_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.tabperiod_perperiodid_seq OWNED BY public.tabperiod.perperiodid;
          public          miguel    false    222            �            1259    24619 
   tabquarter    TABLE     �   CREATE TABLE public.tabquarter (
    quaquarterid integer NOT NULL,
    quaquarterstart timestamp without time zone,
    quaquarterend timestamp without time zone
);
    DROP TABLE public.tabquarter;
       public         heap    miguel    false            �            1259    24618    tabquarter_quaquarterid_seq    SEQUENCE     �   CREATE SEQUENCE public.tabquarter_quaquarterid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tabquarter_quaquarterid_seq;
       public          miguel    false    221            %           0    0    tabquarter_quaquarterid_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tabquarter_quaquarterid_seq OWNED BY public.tabquarter.quaquarterid;
          public          miguel    false    220            �            1259    16395    tabuser_useuserid_seq    SEQUENCE     �   CREATE SEQUENCE public.tabuser_useuserid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tabuser_useuserid_seq;
       public          postgres    false    216            &           0    0    tabuser_useuserid_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tabuser_useuserid_seq OWNED BY public.tab_user.use_userid;
          public          postgres    false    215            '           0    0    SEQUENCE tabuser_useuserid_seq    ACL     G   GRANT SELECT,USAGE ON SEQUENCE public.tabuser_useuserid_seq TO miguel;
          public          postgres    false    215            m           2604    16427    list_role rol_roleid    DEFAULT     x   ALTER TABLE ONLY public.list_role ALTER COLUMN rol_roleid SET DEFAULT nextval('public.list_role_change_seq'::regclass);
 C   ALTER TABLE public.list_role ALTER COLUMN rol_roleid DROP DEFAULT;
       public          miguel    false    219    218            k           2604    16399    tab_user use_userid    DEFAULT     x   ALTER TABLE ONLY public.tab_user ALTER COLUMN use_userid SET DEFAULT nextval('public.tabuser_useuserid_seq'::regclass);
 B   ALTER TABLE public.tab_user ALTER COLUMN use_userid DROP DEFAULT;
       public          postgres    false    216    215    216            o           2604    24627    tabperiod perperiodid    DEFAULT     ~   ALTER TABLE ONLY public.tabperiod ALTER COLUMN perperiodid SET DEFAULT nextval('public.tabperiod_perperiodid_seq'::regclass);
 D   ALTER TABLE public.tabperiod ALTER COLUMN perperiodid DROP DEFAULT;
       public          miguel    false    222    223    223            n           2604    24622    tabquarter quaquarterid    DEFAULT     �   ALTER TABLE ONLY public.tabquarter ALTER COLUMN quaquarterid SET DEFAULT nextval('public.tabquarter_quaquarterid_seq'::regclass);
 F   ALTER TABLE public.tabquarter ALTER COLUMN quaquarterid DROP DEFAULT;
       public          miguel    false    220    221    221                      0    16407    link_userrole 
   TABLE DATA           V   COPY public.link_userrole (userrole_tabuserid_fk, userrole_listroleid_fk) FROM stdin;
    public          miguel    false    217   f8                 0    16415 	   list_role 
   TABLE DATA           =   COPY public.list_role (rol_rolename, rol_roleid) FROM stdin;
    public          miguel    false    218   �8                 0    24645    tab_employee 
   TABLE DATA           �   COPY public.tab_employee (emp_employeeid, emp_employee1name, emp_employee2name, emp_employee1lastname, emp_employee2lastname, emp_employeebirth, emp_employeeadress, emp_employeephone, emp_employeestatus, emp_employeetype) FROM stdin;
    public          miguel    false    225   �8                 0    24638    tab_student 
   TABLE DATA           �   COPY public.tab_student (stu_studenid, stu_student1name, stu_student2name, stu_student1lastname, stu_student2lastname, stu_studentbirth, stu_studentadress, stu_studentemail, stu_studentgender, stu_studentphone) FROM stdin;
    public          miguel    false    224   �9                 0    16396    tab_user 
   TABLE DATA           ]   COPY public.tab_user (use_userid, use_username, use_userpassword, use_useremail) FROM stdin;
    public          postgres    false    216    ;                 0    24624 	   tabperiod 
   TABLE DATA           J   COPY public.tabperiod (perperiodid, peryearstart, peryearend) FROM stdin;
    public          miguel    false    223   "<                 0    24619 
   tabquarter 
   TABLE DATA           R   COPY public.tabquarter (quaquarterid, quaquarterstart, quaquarterend) FROM stdin;
    public          miguel    false    221   z<       (           0    0    list_role_change_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.list_role_change_seq', 6, true);
          public          miguel    false    219            )           0    0    tabperiod_perperiodid_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.tabperiod_perperiodid_seq', 80, true);
          public          miguel    false    222            *           0    0    tabquarter_quaquarterid_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.tabquarter_quaquarterid_seq', 1, false);
          public          miguel    false    220            +           0    0    tabuser_useuserid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tabuser_useuserid_seq', 19, true);
          public          postgres    false    215            s           2606    16444     link_userrole link_userrole_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.link_userrole
    ADD CONSTRAINT link_userrole_pkey PRIMARY KEY (userrole_tabuserid_fk, userrole_listroleid_fk);
 J   ALTER TABLE ONLY public.link_userrole DROP CONSTRAINT link_userrole_pkey;
       public            miguel    false    217    217            u           2606    16451 0   link_userrole link_userrole_userid_roleid_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.link_userrole
    ADD CONSTRAINT link_userrole_userid_roleid_unique UNIQUE (userrole_tabuserid_fk, userrole_listroleid_fk);
 Z   ALTER TABLE ONLY public.link_userrole DROP CONSTRAINT link_userrole_userid_roleid_unique;
       public            miguel    false    217    217            w           2606    16453    list_role list_role_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.list_role
    ADD CONSTRAINT list_role_pkey PRIMARY KEY (rol_roleid);
 B   ALTER TABLE ONLY public.list_role DROP CONSTRAINT list_role_pkey;
       public            miguel    false    218            }           2606    24651    tab_employee tab_employee_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tab_employee
    ADD CONSTRAINT tab_employee_pkey PRIMARY KEY (emp_employeeid);
 H   ALTER TABLE ONLY public.tab_employee DROP CONSTRAINT tab_employee_pkey;
       public            miguel    false    225            {           2606    24644    tab_student tab_student_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.tab_student
    ADD CONSTRAINT tab_student_pkey PRIMARY KEY (stu_studenid);
 F   ALTER TABLE ONLY public.tab_student DROP CONSTRAINT tab_student_pkey;
       public            miguel    false    224            y           2606    24629    tabperiod tabperiod_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.tabperiod
    ADD CONSTRAINT tabperiod_pkey PRIMARY KEY (perperiodid);
 B   ALTER TABLE ONLY public.tabperiod DROP CONSTRAINT tabperiod_pkey;
       public            miguel    false    223            q           2606    16403    tab_user tabuser_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.tab_user
    ADD CONSTRAINT tabuser_pkey PRIMARY KEY (use_userid);
 ?   ALTER TABLE ONLY public.tab_user DROP CONSTRAINT tabuser_pkey;
       public            postgres    false    216            ~           2606    16454 7   link_userrole link_userrole_userrole_listroleid_fk_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.link_userrole
    ADD CONSTRAINT link_userrole_userrole_listroleid_fk_fkey FOREIGN KEY (userrole_listroleid_fk) REFERENCES public.list_role(rol_roleid);
 a   ALTER TABLE ONLY public.link_userrole DROP CONSTRAINT link_userrole_userrole_listroleid_fk_fkey;
       public          miguel    false    217    4727    218                       2606    16445 6   link_userrole link_userrole_userrole_tabuserid_fk_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.link_userrole
    ADD CONSTRAINT link_userrole_userrole_tabuserid_fk_fkey FOREIGN KEY (userrole_tabuserid_fk) REFERENCES public.tab_user(use_userid);
 `   ALTER TABLE ONLY public.link_userrole DROP CONSTRAINT link_userrole_userrole_tabuserid_fk_fkey;
       public          miguel    false    4721    217    216            �           2606    16438 0   link_userrole link_userrole_userrole_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.link_userrole
    ADD CONSTRAINT link_userrole_userrole_userid_fkey FOREIGN KEY (userrole_tabuserid_fk) REFERENCES public.tab_user(use_userid);
 Z   ALTER TABLE ONLY public.link_userrole DROP CONSTRAINT link_userrole_userrole_userid_fkey;
       public          miguel    false    216    4721    217                   x�34�4�24f��\� �%������ B�         .   x�+-.M,���4���OI-JL�/�4�JL����,.��͸b���� L�         �   x��1�0Eg��@��4��������")�����,\�V����'ߗ-��hC����G+dC�@���|G[��o�@(Wy��I��4��͙o���M��r�;��r�z6���_��̒e���3Tδ1Z[���@�ɏ��!r�'�P�.�{�@�����s�1�߱�5��}�m��)��^Y��a)V�B[A���B���Q�Ha�o���M�oO;+�         %  x��AN!�׏Sp����I�cLw����LP�6��x/&]yӷ�_���x	�\
�� 4���~�T\H:a;`�:lL���hV]�b�9����6eg�i�θ�.ҧ������S�0�y_"e�c�-���~�P�v��l�)��u��3H�J.����z[s<��������%��ZK �����_8�[8�ƨ�c\f�|;�[�ʔ^�-�"�V�^r���Nv�O.c+!�ƀ-��e2�8�/l,`�a�مX�/�$c�0�0^����z�$��~:�ь��-R(I-!�a_�4           x�M̱r�0 ����9g� ݬ� V-��D��(��{m�������7�)�	��Q�t��Y����8��0bE����Ι_���I�¨����	�2$�R�L)�x�c���v�8�Ъ�P�y_��u��ko�Ԣ��y"�d���a��>TC�`x@/>r�2�.L�Di���9�$ ��kHm;-�VS� ���[VJ���Taz�����ș2>�a�p�4�uGLc�<;L.��e,��[����D��y���*W^���'PU��uL         H   x�M�A
�0��/�l�e�/��*�V�a �T�,'Ì��F�P�;D�<�����Du�T�S��6RIu\;�Ϛh            x������ � �     