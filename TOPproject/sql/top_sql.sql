DROP TABLE top_user; 
DROP TABLE friend_list;
DROP TABLE top_project;
DROP SEQUENCE p_num_seq;
DROP TABLE notice;
DROP TABLE memo;
DROP SEQUENCE s_u_seq; 
DROP TABLE schedule_user;
DROP SEQUENCE s_p_seq;
DROP TABLE schedule_project;
DROP TABLE chat;


CREATE TABLE top_user ( 
    id VARCHAR2(30), 
    pw VARCHAR2(30) NOT NULL, 
    email VARCHAR2(100) NOT NULL, 
    name VARCHAR2(50) NOT NULL, 
    nickname VARCHAR2(50), 
    company VARCHAR2(100),
    p_num_list VARCHAR2(1000),
    leavedate DATE,
    CONSTRAINT PK_top_user PRIMARY KEY(id)
);
    
CREATE TABLE friend_list ( 
    id VARCHAR2(30) NOT NULL, 
    fl CLOB,
    CONSTRAINT FK_top_user_fl FOREIGN KEY(id)
    REFERENCES top_user (id) on delete cascade
);

CREATE SEQUENCE p_num_seq
START WITH 1
MAXVALUE 2000;

CREATE TABLE top_project(
    p_num NUMBER NOT NULL,
    p_m_id VARCHAR2(30) NOT NULL,
    p_name VARCHAR2(30) NOT NULL,
    p_memberlist VARCHAR2(100) NOT NULL,
    p_indate DATE DEFAULT SYSDATE,
    p_deldate DATE,
    p_startdate DATE NOT NULL,
    p_enddate DATE NOT NULL,
    CONSTRAINT PK_top_project PRIMARY KEY(p_num)
);

CREATE TABLE notice(
    p_num NUMBER NOT NULL,
    n_content VARCHAR2(100) NOT NULL,
    n_indate DATE DEFAULT SYSDATE,
    n_deldate DATE,
    CONSTRAINT FK_top_project_notice FOREIGN KEY(p_num)
    REFERENCES top_project (p_num) on delete cascade
);

CREATE TABLE memo(
    id VARCHAR2(30) NOT NULL,
    n_content VARCHAR2(100) NOT NULL,
    n_indate DATE DEFAULT SYSDATE,
    n_deldate DATE,
    CONSTRAINT FK_top_user_memo FOREIGN KEY(id)
    REFERENCES top_user (id) on delete cascade
);

CREATE SEQUENCE s_u_seq
START WITH 1
MAXVALUE 2000;

CREATE TABLE schedule_user(
    id VARCHAR2(30) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    content VARCHAR2(30) NOT NULL,
    color VARCHAR2(30) DEFAULT 'BLUE',
    CONSTRAINT FK_top_user_sche FOREIGN KEY(id)
    REFERENCES top_user (id) on delete cascade
);

CREATE SEQUENCE s_p_seq
START WITH 1
MAXVALUE 2000;

CREATE TABLE schedule_project(
    p_num NUMBER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    content VARCHAR2(100) NOT NULL,
    color VARCHAR2(30) DEFAULT 'BLUE',
    CONSTRAINT FK_top_project_sche FOREIGN KEY(p_num)
    REFERENCES top_project (p_num) on delete cascade
);

CREATE TABLE chat(
    p_num NUMBER NOT NULL,
    log_num NUMBER NOT NULL,
    chat_log CLOB NOT NULL,
    CONSTRAINT FK_top_project_chat FOREIGN KEY(p_num)
    REFERENCES top_project (p_num) on delete cascade
);



