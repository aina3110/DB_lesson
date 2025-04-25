Q1
CREATE TABLE departments (
  department_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (department_id)
  );

Q2
ALTER TABLE people 
add department_id 
INT unsigned 
after email;

Q3
insert into departments (name)
values
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people (name, department_id, age, gender)
values
('斉藤 愛奈', 3, 28, 2),
('中山 遥', 2, 23, 2),
('平戸 優良', 1, 23, 2),
('戸枝 若菜', 1, 23, 2),
('伊藤 美咲', 1, 23, 2),
('中井 友莉', 2, 23, 2),
('佐藤 貴峰', 2, 26, 1),
('鈴木 竜聖', 2, 25, 1),
('西 洸人', 4, 27, 1),
('幸村 精市', 5, 28, 1);

insert into reports (person_id, content)
values
(7, 'ハンギョドンについて'),
(8, 'ひまりたんの可愛さについて'),
(9, 'データベースレッスンについて'),
(10, 'ビヨンドワークスについて'),
(11, 'ギズモの本社の場所について'),
(12, 'ひまわりの種の食べ方'),
(13, 'スヌーピーの本について'),
(14, '今日の夜ご飯は何にしよう'),
(15, 'カレーライスが食べたい'),
(16, 'ハンバーグの美味しさについて');

Q4
update people 
set department_id=2 
where person_id=2;

update people 
set department_id=3 
where person_id=3;

update people 
set department_id=4 
where person_id=4;

update people 
set department_id=5 
where person_id=6;

Q5
select name, age 
from people 
where gender=1 
order by age desc;

Q6
peopleのテーブルから、営業の部署に所属している人のレコードを取得し、名前とemailと年齢のカラムを日付の順で表示

Q7
select name 
from people 
where (gender=2 and age>19 and age<30) 
or (gender=1 and age>39 and age<50);

Q8
select * from people 
where department_id=1 
order by age asc;

Q9
select avg(age) as average_age 
from people 
where (gender=2 and department_id=2);

Q10
select people.name, departments.name, reports.content
from people
inner join reports on people.person_id = reports.person_id
inner join departments on people.department_id = departments.department_id;

Q11
select p.name 
from people p 
left outer join reports 
using (person_id) 
where content is NULL;