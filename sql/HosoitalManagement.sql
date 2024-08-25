create database Hospital_management;

use Hospital_management;

create table Doctors(
	Doctor_id int auto_increment,
    Doctor_name varchar(100) not null,
    Doctor_dob date, 
    Doctor_specialty varchar(100) not null,
    Doctor_phone varchar(13) not null unique,
    Doctor_email varchar(100) not null unique,
    Doctor_joindate timestamp default current_timestamp,
    primary key(Doctor_id)
    
);

alter table Doctors
modify Doctor_dob date not null;


alter table Doctors
modify Doctor_email varchar(255) not null unique;

create table Patients(
	Patient_id int auto_increment,
    Patient_name varchar(100) not null,
    Patient_dob date not null,
    Patient_gender enum('male','female') not null,
    Patient_phone varchar(13) not null unique,
    Patient_email varchar(100) not null unique,
    Patient_joindate timestamp default current_timestamp,
    primary key(Patient_id)
    );

alter table Patients
modify Patient_gender enum('not specified','male','female') not null;

create table Appointments(
	Appointment_id int auto_increment,
    Doctor_id int not null,
    Patient_id int not null,
    Appointment_date_time datetime not null,
    Appointment_Reson varchar(255) not null,
    Appointment_status enum('Scheduled','Rescheduled','In-progress',"Completed","Cancelled") not null default 'In-progress',
    foreign key(Doctor_id) references Doctors(Doctor_id),
    foreign key(Patient_id) references Patients(Patient_id),
    primary key(Appointment_id)

);

alter table Appointments
modify Appointment_status enum('In-progress','Scheduled','Rescheduled',"Completed","Cancelled") not null;

insert into Doctors(Doctor_name,Doctor_dob,Doctor_specialty,Doctor_phone,Doctor_email)
values ("siva",'2003-11-03','ent','7418274757','sicanesan03@gamil.com'),('shakar','2004-03-11','cardilogy','9442500849','sivanesan@gmail.com');

insert into Patients(Patient_name,Patient_dob,Patient_gender,Patient_phone,Patient_email)
values ('karthi','2003-09-22','male','94423549','karthi@gmail.com'),('ponnu','2003-01-21','female','965784933','ponnu@gmail.com');

insert into Appointments(Doctor_id,Patient_id,Appointment_date_time,Appointment_Reson)
values (1,1,'2003-11-22 11:30',"vomiting"),(2,2,"2003-10-22 10:30","fever");

update Appointments
set Appointment_status = 'Scheduled' where Appointment_id = 1;

select Appointments.Appointment_id,Doctors.Doctor_name,Patients.Patient_name,Appointments.Appointment_date_time,Appointments.Appointment_Reson,Appointments.Appointment_status 
from Appointments inner join Doctors on Appointments.Appointment_id = Doctors.Doctor_id inner join Patients on Patients.Patient_id = Appointments.Appointment_id ;

update Doctors
set Doctor_name = "shanker" where Doctor_id =2; 

select * from Doctors;
select * from Patients;
select * from Appointments;
