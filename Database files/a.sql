create table reg_user(
	name varchar(20),
	gender varchar(9),
	age varchar(10),
	mob_number varchar(15),
	password varchar(20),
	user_id varchar(30),
	primary key(user_id),
    securityq varchar(10),
    securitya varchar(20)
	);


create table fare
	(
train_type varchar(55),
km varchar(10),
s1 varchar(10),
c1 varchar(10),
ec1 varchar(10),
b1 varchar(10),
a1 varchar(10),
h1 varchar(10),
primary key(train_type)
);


create table train_info(
	train_no varchar(10),
	train_name varchar(50),
	type varchar(50),
	s_station_id varchar(6),
	d_station_id varchar(6),
	distance varchar(10),
	no_of_sleeper varchar(10),
    no_of_ac varchar(10),
    primary key(train_no),
    foreign key(type) references fare(train_type)
    );


create table train_schedule(
train_no varchar(10),
stop_no varchar(10),
station_id varchar(6),
km varchar(10) check(km>=0),
arrival_time_hr varchar(10),
arrival_time_min varchar(10) check(arrival_time_min<=59),
departure_time_hr varchar(10),
departure_time_min varchar(10) check(departure_time_min<=59),
primary key(train_no,stop_no,station_id),
foreign key(train_no) references train_info(train_no) on delete cascade 
);

create table coaches(
	train_no varchar(10),
	departure_date varchar(20),
	coach_no varchar(10),
    seat_no varchar(10) default 0,
  primary key(train_no,departure_date,coach_no),
  foreign key(train_no) references train_info(train_no) on delete cascade 
);

create table ticket_passenger(
	T_number varchar(20),
	PNR varchar(20),
	primary key(T_number,PNR),
	foreign key(T_number) references ticket_booking(T_number),
	foreign key(PNR) references passenger_info(PNR)
);

create table ticket_booking(
T_number varchar(10) primary key,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
user_id varchar(50),
train_no varchar(20),
departure_date varchar(20),
source varchar(20),       
destinaton varchar(20),
arrival_time_hr varchar(10),
arrival_time_min varchar(10) check(arrival_time_min<=59),
departure_time_hr varchar(10),
departure_time_min varchar(10) check(departure_time_min<=59),
ticket_amnt varchar(10),
foreign key(user_id) references reg_user(user_id) ,
foreign key(train_no) references train_info(train_no) on delete cascade
);


create table passenger_info(
	PNR varchar(15),
	coach_no varchar(10),
	seat_no varchar(10),
	name varchar(40),
	gender varchar(10),
	age varchar(10),
	primary key(PNR)
);

create table cancel_ticket(
T_number varchar(20) primary key,
cancel_date varchar(20),
refund_amount varchar(20),
foreign key(T_number) references ticket_booking(T_number)
);


create table admin(
emp_id varchar(50) primary key,
name varchar(40) ,
gender varchar(9),
age varchar(10) check(age>=0),
phone_no varchar(10) ,
email varchar(50)
);



create trigger tc 
after
insert or update or delete
on ticket_booking
when(new.PNR>0)
begin
