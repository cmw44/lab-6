-- add_initial_data.sql
select add_question('Survey A','sp2018_surv1',
	'The instructor knows the subject well.');
select add_question('Survey A','sp2018_surv1', 
	'The instructor makes the material interesting.');
select add_question('Survey A','sp2018_surv1',
	'The instructor uses class time well.');
select add_question('Survey B','sp2018_surv2',
	'The course textbook was useful.');
select add_question('Survey B','sp2018_surv2',
	'The course material was useful.');
select add_question('Survey B','sp2018_surv2',
	'The course hours were adequate.');

select add_answers('sp2018_surv1','The instructor knows the subject well.','0','0','3','2','2');
select add_answers('sp2018_surv1','The instructor makes the material interesting.','0','0','0','3','4');
select add_answers('sp2018_surv1','The instructor uses class time well.','0','0','2','4','1');

select add_answers('sp2018_surv2','The course textbook was useful.','3','2','2','0','0');
select add_answers('sp2018_surv2','The course material was useful.','0','0','2','2','3');
select add_answers('sp2018_surv2','The course hours were adequate.','0','0','1','3','3');
