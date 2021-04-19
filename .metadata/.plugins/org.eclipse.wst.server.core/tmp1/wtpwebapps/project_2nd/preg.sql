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





insert into diary values(preg_num.nextval, 'ato', '2021-01-18', '昔莫旭精 祢献戚', '神潅精 段奄舛腔段製督 啄澗 劾!
祢献戚澗 徹 5.94cm / 倖巷惟 54g / 宿舌酵疑精 154bmp 戚掘推.
徹研 坐識 岨 朕辞 森舛析戚 雁移霜 匝 硝紹澗汽 倖巷惟澗 爽呪拭 限焼 益企稽傾推~~
商商 設 朕操 壱原趨~~','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-19', '硲戚硲戚 茶蓄澗 牛廃 祢献戚', '祢献戚亜 独.陥軒稽 ｀硲戚硲戚¨馬澗牛 茶聖 蓄悟 伸宿備 且壱 赤澗 乞柔戚 嬢卓蟹 瑛娠揮走~~~
戚腰爽亀 畳原澗 伸宿備 刊趨 赤聖臆~~ぞぞ
殿嘘澗 情薦 馬劃~~~せせせせ','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-20', '践軒印戚 吉 祢献戚','酔軒 祢献戚 左澗汽 嬢卓蟹 瑛娠揮走~
2爽幻拭 左艦 独.陥軒 瑛食錘 践軒印戚醤.
宿舌亀 設 禽壱 赤壱~
陥楳馬惟 設 滴壱 赤嬢辞 凧 壱原趨~^^','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-21', '戚去重戚 吉劾','球巨嬢 酔軒 祢献戚亜 戚去重 吉 劾!! 酔軒 祢献戚 瑛食錘 紫戚綜. 1.58cm
壱原趨~
紺纏蒸戚 設 切虞爽壱 赤嬢辞..','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-22', '奄孜檎辞亀 十蚤劾','｀梯貞梯貞~ 鋳~¨ 鋼側戚悟 煽軒 拙精 宿舌拭辞 禽澗杏 左艦 重奄馬革~
焼奄増戚 2.27cm拭 祢献戚澗 0.91cm掘~
爽呪拭 限惟 設 朕爽壱 赤嬢 壱舷壱... 紫櫛背...','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-23', '殿誤戚 持延劾','祢献焼... 神硯焼....
畳原亜 球貴 格費 殿誤聖 走醸嬢.
格費 却陥 設 切虞捜 畳原澗 希拝 蟹是 蒸戚 疏畏陥..','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-24', '祢献戚 坦製生稽 幻貝 劾','砧悦砧悦...
設 切虞壱 赤奄研 郊虞悟..
湛段製督 伊遭.
嬢袴蟹!!! 焼奄増戚 2鯵.
姶紫杯艦陥!!!!','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-25', '100析戚 吉劾','祢献戚 100析 鞠澗 劾!!
100繊 幻繊拭 100繊!!
詞姥幻廃 紫戚綜虞艦..ぞぞ
益 疑照 焼巷纏 蒸戚 闇悪馬惟 設 切虞操','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-26', '殴~~ 昔莫旭焼!!!','4爽 幻拭 幻蟹艦 希 鋼逢陥!!
哀搾酸 原巨原巨人 担蓄亜 左戚壱 謝亜喰.降亜喰拭 悦整猿走~
倖巷惟亜 155g.
走貝腰左陥 詞亀 希 細嬢 搭搭背遭牛背~','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-27', '殿疑!!','忽潤 神潅戚 亨! 鋼戚 鞠醸陥.
鎧 倖 照拭 笛差周焼 幻廃 持誤端亜 赤陥 持唖馬艦 重奄馬奄亀 馬姥...
益 疑照精 脊機 凶庚拭 嬢胸惟 左蛎澗走亀 設 乞牽畏陥.
焼送亀 脊機精 害焼 赤陥.','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-28', '壱戎亀帖 畳原','酔軒 祢献戚亜 戚幻鏑 椎嬢推~
神潅魚虞 杖閏精 訊 戚軒 照 左食 爽澗走~
商什君趨遂??
原走厳拭 杖閏 廃腰幻 左食操 馬艦 謝聖 鎧軒革~
壱原雀~~','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-29', '祢献戚澗 焼級!','酔軒 祢献戚 焼級戚掘推!! 焼級!!
拙惟蟹原 杭亜 左昔陥悟...
畳原税 嘩戚 劾虞亜澗 授娃!!','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-30', '祢献戚 害切 仙溌昔!','祢献戚 幻蟹澗 劾!
戚賎 2爽拭 廃腰梢 左奄.
神潅精 煽 焼級戚森推~虞壱 硝形爽澗牛...せせ
爽呪拭 限惟 倖巷惟亀 1585g.
倖巷惟亀 益係走幻 徹亜 赤嬢 益訓走 殿疑戚 陥牽姥蟹..','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-01-31', '歳幻企 臣虞亜左陥','祢献焼 照括~
戚薦採渡 飾球形 赤澗井酔亜 弦焼 杖閏 左奄 毘級依 旭陥壱 馬革~~
益掘辞 岨 焼習頗嬢~^^
陥製殖 伽 左食操~~','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-02-01', '球貴 劾戚 陥亜神壱 赤姥蟹','祢献焼 照括~
飾球形赤嬢 神潅亀 沙闇 急搭呪人 袴軒朝喰 屍...
2.2kg 妊層生稽 設 切虞爽壱 赤嬢 壱舷壱 紫櫛背~','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-02-02', '切尻歳幻 識澱!!','窒至号狛 識澱!
｀焼戚亀 至乞亀 疏精汽 切尻歳幻 背 左獣畏嬢推?¨
歳幻嘘叔聖 級精 蟹稽識 ｀革¨.
切尻歳幻...
設 拝 呪 赤聖猿?','noimage');
insert into diary values(preg_num.nextval, 'ato', '2021-02-03', '畳原 克紗精 呪慎舌~~^^','弘聖 設 照 原獣澗 蟹澗 丞呪勲戚 案舛鞠醸陥.
陣杏~~~~
丞呪勲戚 神備形 弦焼 祢献戚亜 且奄 疏精 雌殿虞悟 神備形 照 且檎 戚雌戚赤澗暗虞壱..
益杏 級醸澗走 希 設 葛澗姥蟹.','noimage');


















