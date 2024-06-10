use sqlgames;
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
    point int default 0 not null,	-- 구매 포인트
    resdate timestamp default current_timestamp,	-- 가입일
    tag1 varchar(20),				-- 관심태그1
    tag2 varchar(20),				-- 관심태그2
    tag3 varchar(20)				-- 관심태그3
);

create table reply (
	id varchar(30) not null,
    rno int auto_increment primary key,
    pno int not null,
    nno int not null,
    depth int not null,
    content varchar(2000),
    resdate timestamp default current_timestamp,
    star float not null,
    img1 varchar(50),
    img2 varchar(50),
    img3 varchar(50)
);
drop table reply;

select * from reply;

delete from reply where rno = 40;


select * from member;
select * from reply order by rno desc;

INSERT INTO reply (id, pno, nno, depth, content, star, img1, img2, img3)
VALUES 
('user1', 101, 0, 0, 'This is a great product!', 5.0, 'img1_1.jpg', 'img1_2.jpg', 'img1_3.jpg'),
('user2', 102, 0, 0, 'Good value for money.', 5.0, 'img2_1.jpg', 'img2_2.jpg', 'img2_3.jpg'),
('user3', 103, 0, 0, 'Average quality.', 5.0, 'img3_1.jpg', 'img3_2.jpg', 'img3_3.jpg'),
('user4', 104, 0, 0, 'Not satisfied with the product.', 4.4, 'img4_1.jpg', 'img4_2.jpg', 'img4_3.jpg'),
('user5', 105, 0, 0, 'Terrible experience.', 5.0, 'img5_1.jpg', 'img5_2.jpg', 'img5_3.jpg'),
('user6', 106, 1, 1, 'Excellent quality, highly recommend!', 4.4, 'img6_1.jpg', 'img6_2.jpg', 'img6_3.jpg'),
('user7', 107, 1, 1, 'Pretty good overall.', 5.0, 'img7_1.jpg', 'img7_2.jpg', 'img7_3.jpg'),
('user8', 108, 1, 1, 'Just okay.', 5.0, 'img8_1.jpg', 'img8_2.jpg', 'img8_3.jpg'),
('user9', 109, 1, 1, 'Could be better.', 5.0, 'img9_1.jpg', 'img9_2.jpg', 'img9_3.jpg'),
('user10', 110, 1, 1, 'Worst product I have ever bought.', 5.0, 'img10_1.jpg', 'img10_2.jpg', 'img10_3.jpg');

SELECT
    '5점 MAX' AS rating_range,
    COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM reply), 1) AS percentage,
    1 AS rating_index
FROM reply
WHERE star = 5.0 
UNION
SELECT
    '4점 GPA' AS rating_range,
    COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM reply), 1) AS percentage,
    2 AS rating_index
FROM reply
WHERE star >= 4.0 AND star <= 4.9
UNION
SELECT
    '3점 GPA' AS rating_range,
    COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM reply), 1) AS percentage,
    3 AS rating_index
FROM reply
WHERE star >= 3.0 AND star <= 3.9
UNION
SELECT
    '2점 GPA' AS rating_range,
    COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM reply), 1) AS percentage,
    4 AS rating_index
FROM reply
WHERE star >= 2.0 AND star <= 2.9
UNION
SELECT
    '1점 GPA' AS rating_range,
    COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM reply), 1) AS percentage,
    5 AS rating_index
FROM reply
WHERE star >= 1.0 AND star <= 1.9
ORDER BY rating_index;

SELECT
    '4점 대' AS rating_range,
    COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM reply), 1) AS percentage
FROM reply
WHERE star BETWEEN 4.0 AND 4.9;


SELECT 
    AVG(star) AS average_star 
FROM 
    Reply;

    

    
    