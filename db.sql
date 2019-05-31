
CREATE TABLE small_carousel(
    id INT PRIMARY KEY AUTO_INCREMENT,
    lei varchar(255),
    title varchar(255),
    dis varchar(255),
    price decimal(5,2),
    src varchar(255)
);

/*插入数据*/
INSERT INTO small_carousel VALUES(null,"图书","哈利·波特与被诅咒的孩子",'"哈利·波特"第八个故事中文版震撼来袭!特别彩排版剧本',"29.37元","img/neirong/5e5da924-84e3-4959-9e25-5891cdf30757.png");
INSERT INTO small_carousel VALUES(null,"图书","好吗好的","畅销作家大冰2016年新书!讲给你听,好吗好的!","17.9元","img/neirong/61e1385e-54de-48f3-8717-5e4f4b1cdd14.png");
INSERT INTO small_carousel VALUES(null,"图书","梦中欢","一个清心寡欲,无欲无求的男神沉迷史!","7.9元","img/neirong/more-app.jpg");

INSERT INTO small_carousel VALUES(null,"MIUI","BROWN &FRIENDS定制",'BROWN & FRIENDS 定制主题，是LINE FRIENDS在公司',"null","img/neirong/xmad_1554795253_HKsNc.png");
INSERT INTO small_carousel VALUES(null,"MIUI主题","电影版<<下模友人帐>>","快下载《夏目友人帐》主题拥有最温柔的少年和最可爱的猫咪老师","免费","img/neirong/xmad_1551940859025_MrKLP.png");
INSERT INTO small_carousel VALUES(null,"MIUI","<<阿丽塔>>定制",'卡梅隆最新力作，战斗天使机械酷炫来袭!',"免费","img/neirong/xmad_1550653044827_BAshe.png");
INSERT INTO small_carousel VALUES(null,"MIUI主题","","众多个性主题、百变锁屏与自由桌面让你的手机与众不同！","null","img/neirong/more-miui.jpg");


INSERT INTO small_carousel VALUES(null,"游戏","非人学员",'脑洞大开的二次元竞技手游',"null","img/neirong/xmad_15299832299419_eIPOw.png");
INSERT INTO small_carousel VALUES(null,"游戏","竹子联盟","实力派,一起团吧!","null","img/neirong/xmad_15120234492499_MNEVo.png");
INSERT INTO small_carousel VALUES(null,"游戏","手游模拟器",'在电脑上玩遍所有手游',"免费","img/neirong/T1czW_BXCv1R4cSCrK.png");
INSERT INTO small_carousel VALUES(null,"游戏","null","免费下载海量的手机游戏,天天都有现金福利赠送","null","img/neirong/more-game.jpg");

INSERT INTO small_carousel VALUES(null,"应用","2018绿竹奖",'最优秀的应用和游戏',"null","img/neirong/3332da7d-4056-4694-9548-c83b7b3af7d3.png");
INSERT INTO small_carousel VALUES(null,"应用","Forest","帮助您专心于生活中每个重要时刻","免费","img/neirong/T1TkKvBCKv1R4cSCrK.png");
INSERT INTO small_carousel VALUES(null,"应用","竹子应用",'山竹出品,必属精品',"免费","img/neirong/T1czW_BXCv1R4cSCrK.png");
INSERT INTO small_carousel VALUES(null,"应用","null","帮助山竹手机和其他安卓手机用户发现好用的安卓应用","null","img/neirong/more-app.jpg");
/*首页大轮播图数据*/
CREATE TABLE big_carousel_img(
    id int primary key auto_increment,
    src varchar(255),
    chose varchar(255)
);
insert into big_carousel_img values(null,"img/lun bo/xmad_15540348357918_QhSfb.jpg","active");
insert into big_carousel_img values(null,"img/lun bo/xmad_15541194668557_Xpoxs.jpg","");
insert into big_carousel_img values(null,"img/lun bo/xmad_15547163541041_ipebP.jpg","");
insert into big_carousel_img values(null,"img/lun bo/xmad_15547798366135_YcVSe.jpg","");
insert into big_carousel_img values(null,"img/lun bo/xmad_15547822805969_hxdoV.jpg","");

/*大轮播左侧*/
CREATE TABLE big_carousel_left(
    lid int primary key auto_increment,
    title varchar(255),
    items varchar(255)
);

insert into big_carousel_left values(null,"手机 电话卡","null");
insert into big_carousel_left values(null,"电视 盒子","null");
insert into big_carousel_left values(null,"笔记本 平板","null");
insert into big_carousel_left values(null,"家电 插线板","null");
insert into big_carousel_left values(null,"出行 穿戴","null");
insert into big_carousel_left values(null,"智能 路由器","null");
insert into big_carousel_left values(null,"电源 配件","null");
insert into big_carousel_left values(null,"健康 儿童","null");
insert into big_carousel_left values(null,"耳机 音箱","null");
insert into big_carousel_left values(null,"生活 箱包","null");

create table big_carousel_left_items(
    cid int primary key auto_increment,
    url varchar(255),
    name varchar(25),
    nid int
);
insert into big_carousel_left_items values(null,"img/shou ji/mi9-80 (1).png","菌菌9",1);
insert into big_carousel_left_items values(null,"img/shou ji/mi9se-80.png","菌菌9 SE",1);
insert into big_carousel_left_items values(null,"img/shou ji/mix3-80.png","菌菌MIX 3",1);
insert into big_carousel_left_items values(null,"img/shou ji/qingchun-80.png","菌菌8 青春版",1);
insert into big_carousel_left_items values(null,"img/shou ji/pingmu-80.png","菌菌8 屏幕指纹版",1);
insert into big_carousel_left_items values(null,"img/shou ji/m8-80.png","菌菌8",1);

create table shop_user(
    uid int primary key auto_increment,
    uname varchar(25),
    upwd varchar(255),
    phone char(12)
);
insert into shop_user values(null,"tom",123456,18838866008);

create table shop_products(
    pid int primary key auto_increment,
    pname varchar(25),
    price varchar(25),
    pix varchar(30),
    quality varchar(30),
    t1n varchar(20),
    t1x varchar(20),
    t2n varchar(20),
    t2x varchar(20),
    t3n varchar(20),
    t3x varchar(20),
    t4n varchar(20),
    t4x varchar(20),
    t5n varchar(20),
    t5x varchar(20),
    t6n varchar(20),
    t6x varchar(20),
    t7n varchar(20),
    t7x varchar(20),
    t8n varchar(20),
    t8x varchar(20),
    t9n varchar(20),
    t9x varchar(20),
    t10n varchar(20),
    t10x varchar(20),
    img1 varchar(100),
    img2 varchar(100)  
);
insert into shop_products values(null,"山竹7","1599","4800",18,"旗舰相机","4800万超清双摄","满血性能","骁龙660「满血版」","超长续航","4000mAH 大电量","旗舰屏幕","6.3＂水滴全面屏","潮流外观","幻彩渐变 玻璃机身","品质小金刚","18个月超长质保","便捷耐用","USB-C接口","手机就是遥控器","红外遥控","金刚品质","康宁®第五代大猩猩玻璃","Quick Charge 4","支持快充4协议*","img/products/index-logo.png","img/products/index-bg.jpg");

create table pro_second(
    tid int primary key auto_increment,
    img1 varchar(100),
    img2 varchar(100),
    img3 varchar(100),
    img4 varchar(100),
    img5 varchar(100),
    img6 varchar(100),
    img7 varchar(100),
    img8 varchar(100),
    img9 varchar(100),
    img10 varchar(100),
    img11 varchar(100),
    img12 varchar(100),
    t1n varchar(30),
    t1t varchar(30),
    t2n varchar(30),
    t2t varchar(255),
    t3n varchar(30),
    t3T varchar(255),
    t4n varchar(50),
    t4t varchar(255)
);
insert into pro_second values(null,"img/products/title-1.jpg","img/products/con-1.jpg","img/products/phone.png","img/products/scale-img1.jpg","img/products/con-2.jpg","img/products/20190429231044.png","img/products/pic1.jpg","img/products/pic2.jpg","img/products/pic3.jpg","img/products/pic4.jpg","img/products/pic5.jpg","img/products/pic6.jpg","旗舰拍照","4800万像素超清相机","四倍像素,更清晰","像素越多,照片就越清晰。红外Note 7 采用新一代4800万像素感光元件,对比主流1200万像素数提升4倍,在4800万高像素模式下,单个像素0.8μm,带给你分辨率极高的拍照体验。"," ","你可以尽情放大照片,截取小细节,二次创作摄影大片。风景照,放大几倍看也锐利;大合影裁切后秒变单人表情包。竹子Note 7 将旗舰级的4800万相机应用到了一台千元手机,与你共享科技乐趣。","四合一1.6μm高感光*与竹子MIX3相同的手持超级夜景算法*",'全球 DxOMark 相机评测排名前三的MIX 3，为何能拍出让人惊叹的夜景？这源于先进的"手持超级夜景"算法：按一下快门，相机自动拍摄多个画面，并合成一张高质量照片。红米Note 7 相机同时支持高感光模式，将 4 个像素合成一个 1.6μm 大像素，输出一张 1200 万高质量夜景照片。1/2”的大感光元件，在拍夜景时能捕获更多光线，拍出画面明亮少噪点的大作。三项科技并用于一部手机，想拍下绝美夜景，不必使用三脚架，手持记录良辰夜色。');

create table shop_cart(
    pid int primary key auto_increment,
    pname varchar(255),
    price decimal(7,2),
    img varchar(255),
    count int,
    total decimal(9,2),
    chosed int,
    uid int
);
insert into shop_cart values(null,"山竹MIX 3 标准高透膜","5.9","img/cart/pms_1540373846.84597943!140x140.jpg",1,5.9,0,1);

/*购物车推荐列表*/
create table  commend(
    cid int primary key AUTO_INCREMENT,
    img varchar(250),
    pname varchar(255),
    price decimal(7,2),
    count int,
    total decimal(9,2),
    est decimal(6,2)
);
insert into commend values(null,"img/cart/pms_1531878216.04982543!140x140.jpg","山竹Max 3 全网通版 6GB内存/8GB内存",1899,1,1899,9711);
insert into commend values(null,"img/cart/pms_1554721776.06777385!140x140.jpg","山竹USB充电器快充版 (18w-25w)",29.9,1,29.9,3.5);
insert into commend values(null,"img/cart/pms_1540429657.8272281!140x140.jpg","竹子MIX 3 全网通版 8GB内存",3599,1,3599,8852);
insert into commend values(null,"img/cart/pms_1506393991.60537642!140x140.jpg","山竹USB Type C快速充电线",15.9,1,15.9,2.6);
insert into commend values(null,"img/cart/pms_1537839581.07399564!140x140.jpg","ERWUDD云潭减震运动鞋 男款",249,1,249,2252);
insert into commend values(null,"img/cart/pms_1545303051.38414485!140x140.jpg","竹子照片打印机",459,1,459,2552);
insert into commend values(null,"img/cart/7c59c959d89a30ed227e8111e9e896d7!140x140.png","最生活毛巾",69,1,69,2.7);
insert into commend values(null,"img/cart/pms_1536893637.94181701!140x140.jpg","竹子生活积木 动物乐园",69,1,69,491);
insert into commend values(null,"img/cart/pms_1528336993.80899840!140x140.jpg","直流电变频落地扇",369,1,369,2491);
insert into commend values(null,"img/cart/pms_1502092431.91411696!140x140.jpg","TS放蓝光眼镜",99,1,99,2);

/*商品搜索*/
create table products_list(
    aid int PRIMARY KEY AUTO_INCREMENT,
    img varchar(255),
    img0 varchar(255),
    img1 varchar(255),
    img2 varchar(255),
    img3 varchar(255),
    img4 varchar(255),
    title varchar(50),
    price decimal(7,2),
    imgs varchar(500)
);
insert into products_list values(null,"img/search/pms_1524621078.90015819!200x200.jpg","img/search/pms_1524621078.90015819!200x200.jpg","img/search/pms_1524621219.48895957!200x200.jpg","img/search/pms_1524621222.66011593!200x200.jpg","img/search/pms_1524621225.83162698!200x200.jpg","img/search/pms_1524621361.19832451!200x200.jpg","山竹Mix2 标准高级版",1999,"'img/search/pms_1524621215.02256716!34x34.jpg','img/search/pms_1524621219.48895957!34x34.jpg','img/search/pms_1524621222.66011593!34x34.jpg','img/search/pms_1524621225.83162698!34x34.jpg','img/search/pms_1524621229.56695068!34x34.jpg'");
insert into products_list values(null,"img/search/pms_1524621219.48895957!200x200.jpg","img/search/pms_1524621078.90015819!200x200.jpg","img/search/pms_1524621219.48895957!200x200.jpg","img/search/pms_1524621222.66011593!200x200.jpg","img/search/pms_1524621225.83162698!200x200.jpg","img/search/pms_1524621361.19832451!200x200.jpg","山竹6x 全网通版",799,"'img/search/pms_1524621215.02256716!34x34.jpg','img/search/pms_1524621219.48895957!34x34.jpg','img/search/pms_1524621222.66011593!34x34.jpg','img/search/pms_1524621225.83162698!34x34.jpg','img/search/pms_1524621229.56695068!34x34.jpg'");
insert into products_list values(null,"img/search/pms_1524621222.66011593!200x200.jpg","img/search/pms_1524621078.90015819!200x200.jpg","img/search/pms_1524621219.48895957!200x200.jpg","img/search/pms_1524621222.66011593!200x200.jpg","img/search/pms_1524621225.83162698!200x200.jpg","img/search/pms_1524621361.19832451!200x200.jpg","山竹Mix2 联通版",2599,"'img/search/pms_1524621215.02256716!34x34.jpg','img/search/pms_1524621219.48895957!34x34.jpg','img/search/pms_1524621222.66011593!34x34.jpg','img/search/pms_1524621225.83162698!34x34.jpg','img/search/pms_1524621229.56695068!34x34.jpg'");
insert into products_list values(null,"img/search/pms_1524621225.83162698!200x200.jpg","img/search/pms_1524621078.90015819!200x200.jpg","img/search/pms_1524621219.48895957!200x200.jpg","img/search/pms_1524621222.66011593!200x200.jpg","img/search/pms_1524621225.83162698!200x200.jpg","img/search/pms_1524621361.19832451!200x200.jpg","山竹Mix2 双卡版",1699,"'img/search/pms_1524621215.02256716!34x34.jpg','img/search/pms_1524621219.48895957!34x34.jpg','img/search/pms_1524621222.66011593!34x34.jpg','img/search/pms_1524621225.83162698!34x34.jpg','img/search/pms_1524621229.56695068!34x34.jpg'");
insert into products_list values(null,"img/search/pms_1524621361.19832451!200x200.jpg","img/search/pms_1524621078.90015819!200x200.jpg","img/search/pms_1524621219.48895957!200x200.jpg","img/search/pms_1524621222.66011593!200x200.jpg","img/search/pms_1524621225.83162698!200x200.jpg","img/search/pms_1524621361.19832451!200x200.jpg","山竹Mix2 三卡版",999,"'img/search/pms_1524621215.02256716!34x34.jpg','img/search/pms_1524621219.48895957!34x34.jpg','img/search/pms_1524621222.66011593!34x34.jpg','img/search/pms_1524621225.83162698!34x34.jpg','img/search/pms_1524621229.56695068!34x34.jpg'");