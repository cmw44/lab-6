-- init.sql
drop table if exists surveys cascade;
drop table if exists questions cascade;
drop table if exists answers cascade;

create table surveys (
   id serial,
   title text,
   survey_code text unique,
   primary key (id)
);
create table questions (
   id serial,
   survey_id integer references surveys(id),
   question_text text,
   primary key (id)
);
create table answers (
   id serial,
   question_id integer references questions(id),
   num1 integer default 0,
   num2 integer default 0,
   num3 integer default 0,
   num4 integer default 0,
   num5 integer default 0,
   primary key (id)
);

create or replace view question_answers_view as
	select surveys.survey_code, surveys.title, surveys.id as sur_id, questions.question_text,
	questions.id as qid, answers.num1, answers.num2, answers.num3, answers.num4,
	answers.num5 from surveys join questions on surveys.id=questions.survey_id 
	join answers on questions.id=answers.question_id;




