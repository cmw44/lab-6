-- insert_funcs.sql
create or replace function add_question(_title text, _survey_code text,
   _question_text text)
   returns void as
   $func$
      declare
         _survey_id integer;
         rec record;
      begin
         select * into rec from surveys where survey_code=_survey_code;
         if not found then
            insert into surveys (title, survey_code) values
               (_title,_survey_code);
            _survey_id := currval('surveys_id_seq');
         else
            _survey_id := rec.id;
         end if;
         insert into questions (survey_id, question_text) values
            (_survey_id, _question_text);
      end;
   $func$
   language 'plpgsql';

create or replace function add_answers(_survey_code text,
   _question_text text, _num1 integer, _num2 integer, 
   _num3 integer, _num4 integer, _num5 integer)
   returns boolean as
   $func$
      declare
         _question_id integer;
         _survey_id integer;
         rec record;
         rec2 record;
      begin
         select * into rec from surveys where survey_code=_survey_code;
         if not found then
            return 'f';
         else
            _survey_id := rec.id;
            select * into rec2 from questions where 
               survey_id=_survey_id and question_text=_question_text;
            if not found then
               return 'f';
            else
               _question_id = rec2.id;
               insert into answers (question_id, num1, num2, num3,
                  num4, num5) values (_question_id, _num1, _num2,
                  _num3, _num4, _num5);
               return 't';
            end if;
         end if;
      end;
   $func$
   language 'plpgsql';
