use db_spring_mvc;

drop table test_table;
create table test_table(
	val1 varchar(20),
    val2 varchar(20)
);

select * from test_table;

drop table people;
create table people(
	name varchar(10),
    age int
);

select * from people;

drop table member_table;
create table member_table(
	id bigint auto_increment,
    memberId varchar(20),
    memberPassword varchar(20),
    memberName varchar(20),
    memberAge int,
    memberPhone varchar(30),
    constraint pk_member primary key(id)
);

select * from member_table;


drop table board_table;
create table board_table(
	id bigint auto_increment,
    boardTitle varchar(50),
    boardWriter varchar(20),
    boardPassword varchar(20),
    boardContents varchar(500),
    boardHits int default 0,
    boardCreatedDate datetime,
    constraint pk_board primary key(id)
);

select * from board_table;

delete from board_table where id = 3;

select * from board_table where id='3' and boardPassword='1111';

update board_table set boardTitle='112121',boardContents = '21212' where id=4;

alter table board_table add boardFileName varchar(50);

select * from board_table where boardTitle like '%11%' order by id desc;

drop table comment_table;

create table comment_table(
	id bigint auto_increment,
    commentWriter varchar(20),
    commentContents varchar(200),
    commentCreatedDate datetime,
    boardId bigint,
    constraint pk_comment_table primary key(id)
);

select * from comment_table;


drop table member_table;

create table member_table(
	m_id bigint auto_increment,
    memberId varchar(20) unique not null,
    memberPassword varchar(20) not null,
    memberName varchar(20) not null,
    memberEmail varchar(20) not null,
    memberMobile varchar(20) not null,
    memberProfileName varchar(50) not null,
    constraint pk_table primary key(m_id)
);

select * from member_table;

drop table board_table;

create table board_table(
	b_id bigint auto_increment,
    m_id bigint not null,
    boardTitle varchar(50),
    boardWriter varchar(20),
    boardContents varchar(500),
    boardHits int default 0,
    boardCreatedDate datetime,
    boardFileName varchar(50),
    constraint pk_board primary key(b_id),
    constraint fk_id foreign key(m_id) references member_table(m_id) on delete cascade
);

select * from board_table;

drop table comment_table;

create table comment_table(
	c_id bigint auto_increment,
    b_id bigint not null,
    m_id bigint not null,
    commentWriter varchar(20),
    commentContents varchar(100),
    commentCreatedDate datetime,
    constraint pk_comment primary key(c_id),
    constraint fk_bid foreign key(b_id) references board_table(b_id) on delete cascade,
    constraint fk_writer foreign key(m_id) references member_table(m_id) on delete cascade
);
select * from comment_table;

select * from comment_table where b_id = '4';

-- 제약조건 확인/ 삭제/ 삽입
select * from information_schema.table_constraints where table_name='board_table';
alter table board_table add constraint fk_id foreign key(m_id) references member_table(m_id) on delete cascade;
alter table board_table drop foreign key fk_id;

update member_table set memberMobile = "010-1111-1111" where m_id = 1;

-- 여기서부터 project

drop table member_t;

create table member_t(
	m_id bigint auto_increment,
    memberId varchar(30) not null unique,
    memberPassword varchar(30) not null,
    memberName varchar(20) not null,
    memberEmail varchar(30),
    constraint pk_member primary key(m_id)
);

insert member_t(memberId, memberPassword, memberName, memberEmail)
	value ('admin','1234','admin',null);

select * from member_t;

drop table board_t;

create table board_t(
	b_id bigint auto_increment,
    memberId varchar(30),
    boardName varchar(30),
    boardExp varchar(50),
    boardSecret int default 1,
    boardPassword varchar(20),
    boardCreatedDate datetime,
    boardViews int default 0,
    constraint pk_board primary key(b_id),
    constraint fk_member foreign key(memberId) references member_t(memberId) on delete cascade
);

update board_t set boardViews = boardViews -1 where b_id = 42;

select * from board_t;

select last_insert_id();

select * from board_t;

set sql_safe_updates=0;
set sql_safe_updates=1;
delete from board_t where memberId is null;

drop table comment_t;

create table comment_t(
	c_id bigint auto_increment,
    memberId varchar(30) not null,
    b_id bigint not null,
    commentContents varchar(200) not null,
    commentCreatedDate datetime not null,
    constraint pk_comment primary key(c_id),
    constraint fk_board foreign key(b_id) references board_t(b_id) on delete cascade
);

select * from comment_t;

alter table comment_t modify commentContents varchar(200) not null;

drop table image_t;

create table image_t(
	i_id bigint auto_increment,
    b_id bigint not null,
    imageManageName varchar(100) not null,
    imageName varchar(100) not null,
    win bigint default 0,
    constraint pk_image primary key(i_id),
    constraint fk_board2 foreign key(b_id) references board_t(b_id)
);
alter table image_t modify imageName varchar(100);
select * from image_t where b_id = 42 order by win desc;

-- 제약조건 확인/ 삭제/ 삽입
select * from information_schema.table_constraints where table_name='image_t';
alter table image_t add constraint fk_board2 foreign key(b_id) references board_t(b_id) on delete cascade;
alter table image_t drop foreign key fk_board2;




select * from image_t where b_id = 42;

update image_t set win = win + 1 where b_id = 42 and i_id = 8;

select count(i_id) from image_t where b_id = 45 group by b_id;

select * from image_t;

select *, count(b_id) as 'count' from image_t group by b_id order by count(b_id) desc;

drop table rank_t;

create table rank_t(
	r_id bigint auto_increment,
    b_id bigint not null,
    i_id bigint not null,
    constraint pk_rank primary key(r_id),
    constraint fk_board3 foreign key(b_id) references board_t(b_id),
    constraint fk_image foreign key(i_id) references image_t(i_id)
);

select * from rank_t;
