-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION pg_database_owner;

COMMENT ON SCHEMA public IS 'standard public schema';
-- public.doctors определение

-- Drop table

-- DROP TABLE doctors;

CREATE TABLE doctors (
	id_doctors smallserial NOT NULL,
	doctor_first_name varchar NOT NULL,
	doctor_middle_name varchar NOT NULL,
	doctor_last_name varchar NULL,
	specialization varchar NOT NULL,
	price numeric NOT NULL,
	percentage int4 NOT NULL,
	CONSTRAINT doctors_pk PRIMARY KEY (id_doctors)
);

-- Permissions

ALTER TABLE doctors OWNER TO postgres;
GRANT ALL ON TABLE doctors TO postgres;


-- public.patients определение

-- Drop table

-- DROP TABLE patients;

CREATE TABLE patients (
	id_patients smallserial NOT NULL,
	patient_first_name varchar NOT NULL,
	patient_middle_name varchar NOT NULL,
	patient_last_name varchar NULL,
	birthday date NOT NULL,
	address varchar NOT NULL,
	CONSTRAINT patients_pk PRIMARY KEY (id_patients)
);

-- Permissions

ALTER TABLE patients OWNER TO postgres;
GRANT ALL ON TABLE patients TO postgres;


-- public.admission_of_patients определение

-- Drop table

-- DROP TABLE admission_of_patients;

CREATE TABLE admission_of_patients (
	id_admission smallserial NOT NULL,
	date_of_admission date NULL,
	id_doctors smallserial NOT NULL,
	id_patients smallserial NOT NULL,
	CONSTRAINT admission_of_patients_pk PRIMARY KEY (id_admission),
	CONSTRAINT admission_of_patients_doctors_fk FOREIGN KEY (id_doctors) REFERENCES doctors(id_doctors) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT admission_of_patients_patients_fk FOREIGN KEY (id_patients) REFERENCES patients(id_patients) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Permissions

ALTER TABLE admission_of_patients OWNER TO postgres;
GRANT ALL ON TABLE admission_of_patients TO postgres;




-- Permissions

GRANT ALL ON SCHEMA public TO pg_database_owner;
GRANT USAGE ON SCHEMA public TO public;

INSERT INTO public.doctors (id_doctors,doctor_first_name,doctor_middle_name,doctor_last_name,specialization,price,percentage) VALUES
	 (1,'Антонов','Николай','Анатольевич','Уролог',5000,15),
	 (2,'Конникова ','Булгун','Кануровна','Терапевт',2000,10),
	 (3,'Балтыкова','Валентина','Цереновна','физиотерапевт',2500,16),
	 (4,'Китидова','Нюдля','Николаевна','Инфекционист',3500,25),
	 (5,'Устиева','Тамара','Ляляевна','Лаборант',1500,20),
	 (6,'Бембеева','Марина','Юрьевна','Дерматолог',2000,10),
	 (7,'Далантаев','Сергей','Убушаевич','Стоматолог',10000,5),
	 (8,'Шараев','Бадма','Борисович','Хирург',5500,15),
	 (9,'Одгаева','Анна','Иосифовна','Невролог',3000,10),
	 (10,'Фомичева','Таисия','Самойловна','Ортопед',1500,25);
INSERT INTO public.patients (id_patients,patient_first_name,patient_middle_name,patient_last_name,birthday,address) VALUES
	 (1,'Ардаков','Игорь','Герасимович','2001-04-25','Озерная ул., д. 24'),
	 (2,'Дылдин','Алексей','Валерьевич','2005-04-06','Сельская ул., д. 6'),
	 (3,'Девин','Игорь','Владимирович','2002-02-08','Пролетарская ул., д. 24'),
	 (4,'Зюлькин','Григорий','Александрович','2002-03-13','Хуторская ул., д. 7'),
	 (5,'Романова','Татьяна','Станиславовна','2007-07-12','Юбилейная ул., д. 18'),
	 (6,'Рыбас','Роман','Владиславович','2003-09-15','Совхозная ул., д. 24'),
	 (7,'Владимирова','Ольга','Викторовна','2004-12-14','Майская ул., д. 16'),
	 (8,'Шутова','Светлана','Витальевна','1995-06-08','Школьная ул., д. 12'),
	 (9,'Апоян','Давид','Сасунович','2002-11-01','Речной пер., д. 2'),
	 (10,'Ковешникова','Татьяна','Михайловна','2000-06-29','Березовая ул., д. 25');
INSERT INTO public.admission_of_patients (id_admission,date_of_admission,id_doctors,id_patients) VALUES
	 (1,'2024-07-15',1,4),
	 (2,'2024-05-30',3,2),
	 (3,'2024-05-30',10,7),
	 (4,'2024-09-04',8,10),
	 (5,'2024-05-28',5,5),
	 (6,'2024-02-20',2,3),
	 (7,'2024-03-27',1,8),
	 (8,'2024-05-14',9,9),
	 (9,'2024-02-29',2,7),
	 (10,'2024-05-29',4,1);
