drop type if exists mytype cascade;
create type mytype as (question_text text, average float);

create or replace function get_results()
   returns setof mytype as
   $func$
      declare
         rec record;
         rec2 record;
         _avg float;
         _top float;
         _bottom float;
      begin
      for rec in 
		select * from questions where survey_id=_survey_id;
		for rec2 in
			select * from answers where question_id=rec.id;
           loop
               _top := 1.0*rec.num1 + 2.0*rec.num2 + 3.0*rec.num3;
               _bottom := rec.num1 + rec.num2 + rec.num3;
               _avg := round((_top/_bottom)::numeric,2);
               return next (rec.question_text, _avg);
            end loop;
      end;
   $func$
   language 'plpgsql';
