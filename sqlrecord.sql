
create database sqlrecord;



use sqlrecord;



-- 회원(member) --
select * from member;
drop table member;
create table member (
	id varchar(30) primary key,		-- 아이디
    pw varchar(1000) not null,		-- 비밀번호
    name varchar(30) not null,		-- 이름
    email varchar(200) not null,	-- 이메일
    tel varchar(50) not null,		-- 연락처
    addr1 varchar(100) not null,	-- 기본 주소
    addr2 varchar(100) not null,	-- 상세 주소
    postcode varchar(20) not null,	-- 우편번호
    birth varchar(50) not null,		-- 생년월일
    resdate timestamp default current_timestamp,	-- 가입일
    tag1 varchar(20),				-- 관심태그1
    tag2 varchar(20),				-- 관심태그2
    tag3 varchar(20),				-- 관심태그3
    point int default 0 not null	-- 구매 포인트
);
insert into member values(
    'dusik123',
    '1234',
    '김두식',
    'dusik23@fds34',
    '010-5456-8789',
    '종로구',
    '그레이츠',
    '042-55',
    '2010-02-01',
    default,
    'radio',
    '',
    '',
    1000
);



-- 레코드(product) --
drop table product;
select * from product;
create table product (
	pno int auto_increment primary key,		-- 상품번호
    name varchar(100) not null,				-- 상품명
    remark1 varchar(2000),					-- 상품설명1
    remark2 varchar(2000),					-- 상품설명2
    price int not null,						-- 가격
    img1 varchar(300),						-- 이미지1(상품설명 이미지)
    img2 varchar(300),						-- 이미지2(상품설명 이미지)
    img3 varchar(300),						-- 이미지3(상품설명 이미지)
    img4 varchar(300),						-- 이미지4(상품설명 이미지)
    img5 varchar(300),						-- 이미지5(상품설명 이미지)
    tag varchar(300)						-- 태그
);

insert into product values(
    default,
    'COMPANIONRADIO',
    'COMPANIONRADIO',
    'Relax with your favorite beverage and let the Crosley Companion Radio set the mood. Inspired by traditional cathedral cabinetry, this radio features AM/FM frequencies and Bluetooth to stream digital music through the built-in speakers. The cutout details, route lines, and fabric-covered speaker grill give the Companion its vintage look.,',
    89000,
    '/sqlrecord/resources/imgs/product/radio/COMPANIONRADIO.webp',
    '/sqlrecord/resources/imgs/product/radio/COMPANIONRADIO.webp',
    '',
    '',
    '',
    'radio'
);

insert into product values(
    default,
    'ROCHESTER8-IN-1RECORDPLAYER',
    'ROCHESTER8-IN-1RECORDPLAYER',
    'Even the classics can use a refresh now and then. The updated Rochester 8-in-1 Record Player boasts a handsome makeover with dark wood and gold accents, giving it a look that fits seamlessly with classic and modern decor. The turntable system features a vinyl record player, cassette player, AM/FM radio, CD player, and Bluetooth for streaming through the built-in speakers. Want to listen in private? Use the headphone jack to keep things quiet and enjoy your tunes distraction-free. The Rochester covers all your listening needs: a true all-in-one music player that looks as good as it sounds.',
    89000,
    '/sqlrecord/resources/imgs/product/radio/ROCHESTER8-IN-1RECORDPLAYER.webp',
    '/sqlrecord/resources/imgs/product/radio/ROCHESTER8-IN-1RECORDPLAYER.webp',
    '',
    '',
    '',
    'radio'
);
    
    
-- 고객접대(qna) --
drop table qna;
select * from qna;
create table qna (
	qno int auto_increment primary key,		-- 글번호
    qtitle varchar(100) not null,			-- 글제목
    qcontent varchar(2000),					-- 글내용
     qlevel int not null default 1,			-- 글종류(1:원글 2:댓글)
    qparno int not null default 0,			-- 투고글 그룹
    qhits int default 0,					-- 방문 횟수
    qresdate timestamp default current_timestamp,-- 작성일
    qaid varchar(30) not null,				-- 작성자 아이디
    qname varchar(50) not null,				-- 작성자 이름
    secret BOOL default 0, 					-- 비밀글 여부
    cate  varchar(10) NOT NULL       		-- 주제(acc:계정, pay: 결제, ref: 환불, etc:기타)
);


-- 공지사항(board) --
drop table board;
select * from board;
create table board (
	bno int auto_increment primary key,		-- 글번호
    title varchar(100) not null,			-- 글제목
    content varchar(2000),					-- 글내용
    author varchar(30) default 'admin' not null,	-- 작성자
    vcnt int default 0 not null,			-- 방문횟수
    resdate timestamp default current_timestamp		-- 작성일
);

-- 재고(inventory) --
drop table inventory;
desc inventory;
select * from inventory;
create table inventory (
	ino int auto_increment primary key,		-- 재고번호
    pno int not null,						-- 상품번호
    iprice int ,							-- 입고가격
    oprice int ,							-- 출고가격
    amount int default 0 not null,			-- 재고량
    remark varchar(2000),					-- 상품설명
    resdate timestamp default current_timestamp		-- 입고일
);

-- 구매정보(order) --
create table orderone ( 
	ono int auto_increment primary key,
	id varchar(30),
	addr1  varchar(100) not null,
	addr2 varchar(100) not null,
	postcode varchar(20) not null,
	total_price int not null
);

-- 구매상세정보(client & admin shared) --
create table order_detail (
  odno int auto_increment primary key,
  ono int,
  amount int not null,
  total_d_price int not null, 				-- 갯수 * 물품가격 (해당 물품에 대한 총가격)
  status varchar(100) not null 				-- 결제완료 , 배송완료 , 환불요청(완료) , 교환요청(완료)
);

-- 환불 교환 정보 --
create table order_exchange (
  oeno int auto_increment primary key,
  odno int, 	 							-- 어떤 구매 물품?
  pno int, 									-- 교환시
  ex_status varchar(100) not null, 			-- 환불 or 교환
  reason varchar(500) not null,
  amount int 								-- 교환시 갯수는 같아야함. (유저의 선택권이 없음) , 환불 시 몇개를 환불?
); 
	

-- 장바구니(basket) --
drop table basket;
desc basket;
select * from basket;
create table basket (
	bskno int auto_increment primary key,	-- 장바구니 번호
    id varchar(30) not null,				-- 회원아이디
    pno int not null,								-- 상품번호
    amount int default 0 not null			-- 담은 수
);

insert into basket value(
	default,
    'dusik123',
    1,
    3
);
insert into basket value(
	default,
    'dusik123',
    2,
    1
);

-- ---------------------- 외래키(fk) 설정 --------------------------------
    


-- qna(qaid) -> member(id) --
ALTER TABLE qna
ADD CONSTRAINT fk_qaid_id
FOREIGN KEY (qaid) REFERENCES member(id);

-- board(author) -> member(id) --
ALTER TABLE board
ADD CONSTRAINT fk_author_id
FOREIGN KEY (author) REFERENCES member(id);

-- inventory(pno) -> product(pno) --
ALTER TABLE inventory
ADD CONSTRAINT fk_ipno_pno
FOREIGN KEY (pno) REFERENCES product(pno);


-- sales(id) -> member(id) --
ALTER TABLE sales
ADD CONSTRAINT fk_sid_id
FOREIGN KEY (id) REFERENCES member(id);


-- basket(id) -> member(id) --
ALTER TABLE basket
ADD CONSTRAINT fk_bid_id
FOREIGN KEY (id) REFERENCES member(id);

-- basket(pno) -> product(pno) --
ALTER TABLE basket
ADD CONSTRAINT fk_bpno_pno
FOREIGN KEY (pno) REFERENCES product(pno);



-- ------------------- 외래키 설정 확인 쿼리 -------------------- --
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
    TABLE_NAME = 'basket'		-- 여기 테이블명 삽입
    AND CONSTRAINT_SCHEMA = 'sqlrecord'
    AND REFERENCED_TABLE_NAME IS NOT NULL;
	-- 참조되는 테이블 : member, game, product