select t.train_no,t.train_name,
s.departure_time_hr,s.departure_time_min,
s.arrival_time_hr,s.arrival_time_min
 from  train_info t 
inner join train_schedule s on t.train_no=s.train_no 
where s.station_id='NZM' and 
s.stop_no < any (select distinct w.stop_no from train_info q inner join train_schedule  w  on q.train_no=w.train_no 
	where q.train_no=s.train_no and w.station_id='MAS');


//////LIST TRAIN	
select t.train_no,t.train_name,
s.departure_time_hr,s.departure_time_min,
w.arrival_time_hr,w.arrival_time_min,
((select km  from train_schedule where train_no=t.train_no and station_id='TBM')-
(select km  from train_schedule where train_no=t.train_no and station_id='MDU'))
as distance
from  train_info t 
inner join train_schedule s on t.train_no=s.train_no 
inner join train_schedule w on t.train_no=w.train_no
where s.station_id='MDU' and  w.station_id='TBM' and
s.stop_no < any (select distinct w.stop_no from train_info q inner join train_schedule  w  on q.train_no=w.train_no 
where q.train_no=s.train_no and w.station_id='TBM');


declare 
a FARE%rowtype;
b train_schedule.km%type;
c train_schedule.km%type;
d train_schedule.km%type;
procedure fared(trainno in VARCHAR2,src in VARCHAR2,dest in VARCHAR2) IS
begin
select *into a from fare where train_type=(select type from train_info where train_no=trainno);
select km into b from train_schedule where train_no=1111 and station_id=dest;
select km into c from train_schedule where train_no=1111 and station_id=src;
d:=b-c;
dbms_output.put_line('distance' || d);
--dbms_output.put_line(' ' || a.sl||'  ' ||a.cc ||' '|| a.ecc ||'  '|| a.ac_three_tier ||'  '|| a.ac_two_tier ||'  '|| a.ac_first_class);

if(a.s1!=0) then
dbms_output.put_line('Sleeper fare :' || d*a.s1);
END IF;
if(a.c1!=0) then
dbms_output.put_line('Chair car fare:' || a.c1*d);
END IF;
if(a.ec1!=0) then
dbms_output.put_line('Executive Chair car fare:' || a.ec1*d);
END IF;
if(a.b1!=0) then
dbms_output.put_line('AC three tier fare:' || a.b1*d);
END IF;
if(a.a1!=0) then
dbms_output.put_line('AC two tier fare:' || a.a1*d);
END IF;
if(a.h1!=0) then
dbms_output.put_line('AC First Class fare:' || a.h1*b);
END IF;
end;
begin
fared('1111','ms','mdu');
end;








declare
a coaches%rowtype;
b number(2):=0;
c number(2):=0;
d number(2);
e number(2):=5;
f number(2):=16;
z number(2):=0;

begin
select * into a from coaches where train_no=1111  and coach_no='s1' and departure_date='01-dec-2019';
if a.seat_no1=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no2=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no3=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no4=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no5=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no6=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no7=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no8=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no9=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no10=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no11=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no12=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no13=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no14=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no15=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no16=1 then
   z:=0;
   else
   b:=b+1;
end if;
dbms_output.put_line('Available : '||b);
end;




select train_no,departure_date,coach_no from coaches where train_no=1111 and departure_date='01-dec-2019' and coach_no='s1';


select distinct * from coaches where train_no=1111 and departure_date='01-dec-2019' and coach_no='s1';



select  distinct * from coaches where train_no=1111 and coach_no='s1' and departure_date='01-dec-2019';


update coaches set seat_no1=1 where train_no=1111 and coach_no='s1' and departure_date='01-dec-2019';
update coaches set seat_no2=1 where train_no=1111 and coach_no='s1' and departure_date='01-dec-2019';
update coaches set seat_no3=1 where train_no=1111 and coach_no='s1' and departure_date='01-dec-2019';
update coaches set seat_no4=1 where train_no=1111 and coach_no='s1' and departure_date='01-dec-2019';
update coaches set seat_no5=1 where train_no=1111 and coach_no='s1' and departure_date='01-dec-2019';
update coaches set seat_no6=1 where train_no=1111 and coach_no='s1' and departure_date='01-dec-2019';
update coaches set seat_no7=1 where train_no=1111 and coach_no='s1' and departure_date='01-dec-2019';	
update coaches set seat_no8=1 where train_no=1111 and coach_no='s1' and departure_date='01-dec-2019';
update coaches set seat_no9=1 where train_no=1111 and coach_no='s1' and departure_date='01-dec-2019';
update coaches set seat_no10=1 where train_no=1111 and coach_no='s1' and departure_date='01-dec-2019';
update coaches set seat_no11=1 where train_no=1111 and coach_no='s1' and departure_date='01-dec-2019';
update coaches set seat_no12=1 where train_no=1111 and coach_no='s1' and departure_date='01-dec-2019';
update coaches set seat_no13=1 where train_no=1111 and coach_no='s1' and departure_date='01-dec-2019';
update coaches set seat_no14=1 where train_no=1111 and coach_no='s1' and departure_date='01-dec-2019';
update coaches set seat_no15=1 where train_no=1111 and coach_no='s1' and departure_date='01-dec-2019';
update coaches set seat_no16=1 where train_no=1111 and coach_no='s1' and departure_date='01-dec-2019';






insert into ticket_booking(user_id,train_no,class,departure_date,source,destination,);

CREATE OR REPLACE FUNCTION AVAIL(TRAIN_NUM IN VARCHAR2,COACH IN VARCHAR2,DAT IN VARCHAR2)
RETURN number IS 
b NUMBER(4); 
BEGIN
declare
a coaches%rowtype;
c number(2):=0;
d number(2);
e number(2):=5;
f number(2):=16;
z number(2):=0;

begin
b:=0;
select * into a from coaches where train_no=TRAIN_NUM and coach_no=COACH and departure_date=DAT;
if a.seat_no1=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no2=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no3=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no4=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no5=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no6=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no7=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no8=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no9=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no10=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no11=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no12=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no13=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no14=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no15=1 then
   z:=0;
   else
   b:=b+1;
end if;
if a.seat_no16=1 then
   z:=0;
   else
   b:=b+1;
end if;
dbms_output.put_line('Available : '||b);
end;
RETURN b;
END;
select distinct((select km  from train_schedule where train_no=1121 and station_id='TBM')-(select km  from train_schedule where train_no=1121 and station_id='MDU')) as dist;



alter table fare rename column sl to s1;
alter table fare rename column cc to c1;
alter table fare rename column ecc to ec1;
alter table fare rename column ac_three_tier to b1;
alter table fare rename column ac_two_tier to a1;
alter table fare rename column ac_first_class to h1;


