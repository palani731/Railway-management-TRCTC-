
create table fare(train_type varchar(55),
km number,
sl number,
cc number,
ecc number,
ac_three_tier number,
ac_two_tier number,
ac_first_class number,
primary key(train_type)
);


create table train_info(
	train_no number,
	train_name varchar(50),
	type varchar(50),
	s_station_id varchar(6),
	d_station_id varchar(6),
	distance number,
	no_of_sleeper number,
    no_of_ac number,
    primary key(train_no),
    foreign key(type) references fare(train_type)
    );


create table train_schedule(
train_no number,
stop_no number,
station_id varchar(6),
km number check(km>=0),
arrival_time_hr number,
arrival_time_min number check(arrival_time_min<=59),
departure_time_hr number,
departure_time_min number check(departure_time_min<=59),
primary key(train_no,stop_no,station_id),
foreign key(train_no) references train_info(train_no) on delete cascade 
);

create table coaches(
	train_no number,
	departure_date date,
	coach_no varchar(10),
  seat_no1 varchar(16) DEFAULT NULL,
  seat_no2 varchar(16) DEFAULT NULL,
  seat_no3 varchar(16) DEFAULT NULL,
  seat_no4 varchar(16) DEFAULT NULL,
  seat_no5 varchar(16) DEFAULT NULL,
  seat_no6 varchar(16) DEFAULT NULL,
  seat_no7 varchar(16) DEFAULT NULL,
  seat_no8 varchar(16) DEFAULT NULL,
  seat_no9 varchar(16) DEFAULT NULL,
  seat_no10 varchar(16) DEFAULT NULL,
  seat_no11 varchar(16) DEFAULT NULL,
  seat_no12 varchar(16) DEFAULT NULL,
  seat_no13 varchar(16) DEFAULT NULL,
  seat_no14 varchar(16) DEFAULT NULL,
  seat_no15 varchar(16) DEFAULT NULL,
  seat_no16 varchar(16) DEFAULT NULL,
  waiting_list1 varchar(16) DEFAULT NULL,
  waiting_list2 varchar(16) DEFAULT NULL,
  waiting_list3 varchar(16) DEFAULT NULL,
  waiting_list4 varchar(16) DEFAULT NULL,
  waiting_list5 varchar(16) DEFAULT NULL,
  primary key(train_no,departure_date,coach_no),
  foreign key(train_no) references train_info(train_no) on delete cascade 
);

create table ticket_booking(
PNR number primary key,
user_id varchar(50),
train_no number,
class varchar(20),
departure_date date,
source varchar(20),       
destinaton varchar(20),
arrival_time_hr number,
arrival_time_min number check(arrival_time_min<=59),
departure_time_hr number,
departure_time_min number check(departure_time_min<=59),
no_of_seats number,
ticket_amnt number,
foreign key(user_id) references reg_user(user_id) ,
foreign key(train_no) references train_info(train_no) on delete cascade
);


create table passenger_info(
	PNR number,
	no_of_seats number,
	s_no number ,
	coach_no number,
	seat_no number,
	name varchar(40),
	gender varchar(10),
	age number check(age>=0),
	quota varchar(20),
	foreign  key(PNR) references ticket_booking(PNR),
	primary key(PNR,coach_no,seat_no)
);

create table cancel_ticket(
PNR number primary key,
cancel_date date,
refund_amount number,
foreign key(PNR) references ticket_booking(PNR)
);

create table admin(
emp_id varchar(50) primary key,
name varchar(40) ,
gender varchar(9),
age number check(age>=0),
phone_no number ,
email varchar(50)
);



create trigger tc 
after
insert or update or delete
on ticket_booking
when(new.PNR>0)
begin
