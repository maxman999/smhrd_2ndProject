select * from preg_member;
select * from DIARY;

drop table preg_member cascade constraints;
drop table diary cascade constraint;
drop sequence preg_num;

create table preg_member(
user_id varchar2(30),
user_pw varchar2(30) not null,
user_name varchar2(30) not null,
age number(5) not null,
sex varchar2(10) not null,
location varchar2(50),
pregnancy_day date not null,
constraint pmem_userid_pk primary key(user_id)
);

create table diary(
diary_id number(10),
user_id varchar2(30),
diary_date date not null,
title varchar2(50) not null,
content varchar2(500) not null,
uspicture varchar2(300),
constraint diary_diaryid_pk primary key(diary_id),
constraint diary_id_fk foreign key(user_id) references preg_member(user_id)   
);

create sequence preg_num start with 1 increment by 1;

select * from diary;
select * from PREG_MEMBER;





insert into diary values(preg_num.nextval, 'ato', '2021-01-18', '�������� Ǫ����', '������ �ʱ����������� ��� ��!
Ǫ���̴� Ű 5.94cm / ������ 54g / ����ڵ��� 154bmp �̷���.
Ű�� ���� �� Ŀ�� �������� ����� �� �˾Ҵµ� �����Դ� �ּ��� �¾� �״�η���~~
���� �� Ŀ�� ������~~','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-19', 'ȣ��ȣ�� ���ߴ� ���� Ǫ����', 'Ǫ���̰� ��.�ٸ��� ��ȣ��ȣ�̡��ϴµ� ���� �߸� ������ ��� �ִ� ����� ��� �Ϳ�����~~~
�̹��ֵ� ������ ������ ���� ������~~����
�±��� ���� �ϳ�~~~��������','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-20', '�������� �� Ǫ����','�츮 Ǫ���� ���µ� ��� �Ϳ�����~
2�ָ��� ���� ��.�ٸ� �Ϳ��� �������̾�.
���嵵 �� �ٰ� �ְ�~
�����ϰ� �� ũ�� �־ �� ������~^^','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-21', '�̵���� �ȳ�','���� �츮 Ǫ���̰� �̵�� �� ��!! �츮 Ǫ���� �Ϳ��� ������. 1.58cm
������~
��Ż���� �� �ڶ��ְ� �־..','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-22', '��ڸ鼭�� ���³�','����������~ ��~�� ��¦�̸� ���� ���� ���忡�� �ٴ°� ���� �ű��ϳ�~
�Ʊ����� 2.27cm�� Ǫ���̴� 0.91cm��~
�ּ��� �°� �� Ŀ�ְ� �־� ������... �����...','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-23', '�¸��� ���䳯','Ǫ����... ������....
������ �嵮 ���� �¸��� ������.
���� �Ѵ� �� �ڶ��� ������ ���� ���� ���� ���ڴ�..','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-24', 'Ǫ���� ó������ ���� ��','�αٵα�...
�� �ڶ�� �ֱ⸦ �ٶ��..
ù������ ����.
��ӳ�!!! �Ʊ����� 2��.
�����մϴ�!!!!','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-25', '100���� �ȳ�','Ǫ���� 100�� �Ǵ� ��!!
100�� ������ 100��!!
�챸���� ��������..����
�� ���� �ƹ�Ż ���� �ǰ��ϰ� �� �ڶ���','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-26', '��~~ ��������!!!','4�� ���� ������ �� �ݰ���!!
����� ���𸶵�� ô�߰� ���̰� �հ���.�߰����� ��������~
�����԰� 155g.
���������� �쵵 �� �پ� ������������~','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-27', '�µ�!!','���� ������ ��! ���� �Ǿ���.
�� �� �ȿ� ū������ ���� ����ü�� �ִ� �����ϴ� �ű��ϱ⵵ �ϱ�...
�� ������ �Ե� ������ ��� ���´����� �� �𸣰ڴ�.
������ �Ե��� ���� �ִ�.','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-28', '������ġ ����','�츮 Ǫ���̰� �̸�ŭ �Ǿ��~
���õ��� ���� �� �̸� �� ���� �ִ���~
����������??
�������� �� �ѹ��� ������ �ϴ� ���� ������~
������~~','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-29', 'Ǫ���̴� �Ƶ�!','�츮 Ǫ���� �Ƶ��̷���!! �Ƶ�!!
�۰Գ��� ���� ���δٸ�...
������ ���� ���󰡴� ����!!','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-30', 'Ǫ���� ���� ��Ȯ��!','Ǫ���� ������ ��!
���� 2�ֿ� �ѹ��� ����.
������ �� �Ƶ��̿���~��� �˷��ִµ�...����
�ּ��� �°� �����Ե� 1585g.
�����Ե� �׷����� Ű�� �־� �׷��� �µ��� �ٸ�����..','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-31', '�и��� �ö󰡺���','Ǫ���� �ȳ�~
�������� ����� �ִ°�찡 ���� �� ���� ����� ���ٰ� �ϳ�~~
�׷��� �� �ƽ�����~^^
������ �� ������~~','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-02-01', '�嵮 ���� �ٰ����� �ֱ���','Ǫ���� �ȳ�~
������־� ���õ� ���� ������� �Ӹ�ī�� ��...
2.2kg ǥ������ �� �ڶ��ְ� �־� ������ �����~','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-02-02', '�ڿ��и� ����!!','����� ����!
�����̵� ��� ������ �ڿ��и� �� ���ðھ��?��
�и������� ���� ���μ� ���ס�.
�ڿ��и�...
�� �� �� ������?','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-02-03', '���� ����� ������~~^^','���� �� �� ���ô� ���� ������� �����Ǿ���.
�ذ�~~~~
������� ������ ���� Ǫ���̰� ��� ���� ���¶�� ������ �� ��� �̻����ִ°Ŷ��..
�װ� ������� �� �� ��±���.','noimage');

















