create sequence hibernate_sequence start 100 increment 1;

create table answer
    (id int8 not null,
    filename varchar(255),
    tag varchar(255),
    text varchar(2048),
    author_id int8,
    poll_id int8,
    primary key (id));

create table poll
    (id int8 not null,
    name varchar(2048),
    author_id int8,
    primary key (id));

create table user_role
    (user_id int8 not null,
    roles varchar(255));

create table usr
    (id int8 not null,
    activation_code varchar(255),
    active boolean not null,
    email varchar(255),
    password varchar(255),
    username varchar(255),
    primary key (id));

create table vote
    (id int8 not null,
    vote_counter int8,
    answer_id int8,
    primary key (id));

alter table if exists answer
add constraint answer_user_fk foreign key (author_id) references usr;

alter table if exists answer
add constraint answer_poll_fk foreign key (poll_id) references poll;

alter table if exists poll
add constraint poll_user_fk foreign key (author_id) references usr;

alter table if exists user_role
add constraint user_role_user_fk foreign key (user_id) references usr;

alter table if exists vote
add constraint vote_answer_fk foreign key (answer_id) references answer;


