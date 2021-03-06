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





insert into diary values(preg_num.nextval, 'ato', '2021-01-18', '인형같은 푸른이', '오늘은 초기정밀초음파 찍는 날!
푸른이는 키 5.94cm / 몸무게 54g / 심장박동은 154bmp 이래요.
키를 봐선 좀 커서 예정일이 당겨질 줄 알았는데 몸무게는 주수에 맞아 그대로레요~~
쑥쑥 잘 커줘 고마워~~','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-19', '호이호이 춤추는 듯한 푸른이', '푸른이가 팔.다리로 ‘호이호이’하는듯 춤을 추며 열심히 놀고 있는 모습이 어찌나 귀엽던지~~~
이번주도 엄마는 열심히 누워 있을께~~ㅎㅎ
태교는 언제 하냐~~~ㅋㅋㅋㅋ','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-20', '젤리곰이 된 푸른이','우리 푸른이 보는데 어찌나 귀엽던지~
2주만에 보니 팔.다리 귀여운 젤리곰이야.
심장도 잘 뛰고 있고~
다행하게 잘 크고 있어서 참 고마워~^^','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-21', '이등신이 된날','드디어 우리 푸른이가 이등신 된 날!! 우리 푸른이 귀여운 사이즈. 1.58cm
고마워~
별탈없이 잘 자라주고 있어서..','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-22', '기쁘면서도 슬픈날','‘쿵쾅쿵쾅~ 츄~’ 반짝이며 저리 작은 심장에서 뛰는걸 보니 신기하네~
아기집이 2.27cm에 푸른이는 0.91cm래~
주수에 맞게 잘 커주고 있어 고맙고... 사랑해...','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-23', '태명이 생긴날','푸른아... 오름아....
엄마가 드뎌 너희 태명을 지었어.
너희 둘다 잘 자라줌 엄마는 더할 나위 없이 좋겠다..','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-24', '푸른이 처음으로 만난 날','두근두근...
잘 자라고 있기를 바라며..
첫초음파 검진.
어머나!!! 아기집이 2개.
감사합니다!!!!','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-25', '100일이 된날','푸른이 100일 되는 날!!
100점 만점에 100점!!
살구만한 사이즈라니..ㅎㅎ
그 동안 아무탈 없이 건강하게 잘 자라줘','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-26', '꺄~~ 인형같아!!!','4주 만에 만나니 더 반갑다!!
갈비뼈 마디마디와 척추가 보이고 손가락.발가락에 근육까지~
몸무게가 155g.
지난번보다 살도 더 붙어 통통해진듯해~','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-27', '태동!!','벌써 오늘이 딱! 반이 되었다.
내 몸 안에 큰복숭아 만한 생명체가 있다 생각하니 신기하기도 하구...
그 동안은 입덧 때문에 어떻게 보냈는지도 잘 모르겠다.
아직도 입덧은 남아 있다.','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-28', '고슴도치 엄마','우리 푸른이가 이만큼 컸어요~
오늘따라 얼굴은 왜 이리 안 보여 주는지~
쑥스러워용??
마지막에 얼굴 한번만 보여줘 하니 손을 내리네~
고마웡~~','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-29', '푸른이는 아들!','우리 푸른이 아들이래요!! 아들!!
작게나마 뭔가 보인다며...
엄마의 꿈이 날라가는 순간!!','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-30', '푸른이 남자 재확인!','푸른이 만나는 날!
이젠 2주에 한번씩 보기.
오늘은 저 아들이예요~라고 알려주는듯...ㅋㅋ
주수에 맞게 몸무게도 1585g.
몸무게도 그렇지만 키가 있어 그런지 태동이 다르구나..','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-31', '분만대 올라가보다','푸른아 안녕~
이제부턴 엎드려 있는경우가 많아 얼굴 보기 힘들것 같다고 하네~~
그래서 좀 아쉬웠어~^^
다음엔 꼭 보여줘~~','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-02-01', '드뎌 날이 다가오고 있구나','푸른아 안녕~
엎드려있어 오늘도 본건 뒷통수와 머리카락 뿐...
2.2kg 표준으로 잘 자라주고 있어 고맙고 사랑해~','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-02-02', '자연분만 선택!!','출산방법 선택!
‘아이도 산모도 좋은데 자연분만 해 보시겠어요?’
분만교실을 들은 나로선 ‘네’.
자연분만...
잘 할 수 있을까?','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-02-03', '엄마 뱃속은 수영장~~^^','물을 잘 안 마시는 나는 양수량이 걱정되었다.
왠걸~~~~
양수량이 오히려 많아 푸른이가 놀기 좋은 상태라며 오히려 안 놀면 이상이있는거라고..
그걸 들었는지 더 잘 노는구나.','noimage');


















