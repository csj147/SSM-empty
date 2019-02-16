
CREATE DATABASE Student_Union;

USE Student_Union;

-- 权限表
CREATE TABLE `power`(
	id INT,								-- 权限表 id
	name VARCHAR(50)					-- 权限名称（给各种各样的权限）
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 给权限表插入数据
INSERT INTO `power` VALUES
(1,'查看学生会'),
(2,'学生会用户管理'),
(3,'查看主席团'),
(4,'主席团权限'),
(5,'分配部分'),
(6,'查看秘书部'),
(7,'秘书部权限'),
(8,'查看学习部'),
(9,'查看学习部管理'),
(10,'阅览室权限'),
(11,'学习部权限');

-- 集体表
CREATE TABLE `collective`(
	id INT,								-- 集体表 id
	name VARCHAR(20),					-- 集体名称
    remark VARCHAR(40)					-- 备注（提示该集体的作用）
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 给集体表插入数据
INSERT INTO `collective` VALUES
(1,'主席团','分配管理学生会各个部门'),
(2,'秘书部',''),
(3,'学习部','管理书籍以及学习方面的事务');

-- 职务表
CREATE TABLE `jop`(
	id INT,								-- 职务表 id
	name VARCHAR(20)					-- 职务名称
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 给职务表插入数据
INSERT INTO `jop` VALUES
(1,'总指导老师'),
(2,'正主席'),
(3,'副主席'),
(4,'指导老师'),
(5,'正部'),
(6,'副部'),
(7,'部员');

-- 申请表
CREATE TABLE `authority`(
	id INT,								-- 申请表 id
	form VARCHAR(20),					-- 申请类型（如：活动申请、权限申请）
    content TEXT,						-- 申请内容
    applicant VARCHAR(5)				-- 申请人
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 受理表
CREATE TABLE `handle`(
	id INT,								-- 受理表 id
    form VARCHAR(20),					-- 受理类型
    state VARCHAR(20),					-- 受理状态
    acceptor VARCHAR(10),				-- 受理人
    remark TEXT,						-- 备注（申请失败的回复）
    aut_id int							-- 申请表 id
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 用户表
CREATE TABLE `acc`(
	id INT,								-- 用户表 id
	name VARCHAR(20),					-- 用户名（每个用户的账号都是唯一的）
	paw VARCHAR(20),					-- 密码（默认和用户名一样）
	state VARCHAR(10),					-- 状态
	power_id VARCHAR(50),				-- 权限表 id（每个用户都有不同的权限）
	power_time VARCHAR(255),			-- 权限使用时间
	registered VARCHAR(20),				-- 注册时间
	mem_id VARCHAR(20)					-- 成员表 id（实名）
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 给用户表插入数据
INSERT INTO `acc` VALUES
(1,'zdls','zdls','可用','1,2','2018/01/01','永久,永久','1'),
(2,'zzx','zzx','可用','4,5','2018/01/01','永久,永久','2'),
(3,'fzxa','fzxa','可用','4','2018/01/01','永久','3'),
(4,'fzxb','fzxb','可用','4','2018/01/01','永久','4'),
(5,'msbls','msbls','可用','6','2018/01/01','永久','5'),
(6,'msbz','msbz','可用','7','2018/01/01','永久','6'),
(7,'msbfa','msbfa','可用','7','2018/01/01','永久','7'),
(8,'xxbls','xxbls','可用','8,9,10','2018/01/01','永久,永久,永久','8'),
(9,'xxbz','xxbz','可用','11','2018/01/01','永久','9'),
(10,'xxbfa','xxbfa','可用','11','2018/01/01','永久','10'),
(11,'ylsa','ylsa','可用','10','2018/01/01','永久','11');

-- 事务表
CREATE TABLE `affair`(
	id INT,								-- 事务表 id
    name VARCHAR(20),					-- 事务名称
    addTime VARCHAR(20)					-- 添加日期
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 给事务表插入数据
INSERT INTO `affair` VALUES
(1,'成员','2018/01/01'),
(2,'会议','2018/01/01'),
(3,'出勤','2018/01/01'),
(4,'会议总结','2018/01/01'),
(5,'公告','2018/01/01');

-- 成员表
CREATE TABLE `member`(
	id INT,								-- 成员表 id
    name VARCHAR(20),					-- 成员名字
    number VARCHAR(20),					-- 成员电话
    QQ VARCHAR(15),						-- 成员 QQ 号
    classe VARCHAR(10),					-- 成员所在班级
	state VARCHAR(20),					-- 成员状态（如：考核期、正式成员、拒收）
    enter VARCHAR(20),					-- 进入时间
    lea VARCHAR(20),					-- 离开时间
    reason VARCHAR(20),					-- 离开原因
    jop_id VARCHAR(20),					-- 职务表 id（如：老师、部长、部员等等）
    coll_id VARCHAR(100)				-- 集体表 id
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 插入成员数据
INSERT INTO member VALUES
(1,'如果','13428658645','1366567864',NULL,'正式成员','2018/10/10',NULL,'暂无',1,NULL),
(2,'张三','12425678645','1242567864','148','正式成员','2018/10/10',NULL,'暂无',2,1),
(3,'李四','17568544870','1756854487','146','正式成员','2018/10/10',NULL,'暂无',3,1),
(4,'王五','11324237063','1132423706','143','正式成员','2018/10/10',NULL,'暂无',3,1),
(5,'杰瑞','16851217063','1685121706',NULL,'正式成员','2018/10/10',NULL,'暂无',4,2),
(6,'赵六','14866837063','1486683706','145','正式成员','2018/10/10',NULL,'暂无',5,2),
(7,'田七','15744534683','1574453468','143','正式成员','2018/10/10',NULL,'暂无',6,2),
(8,'史迪奇','16700758793','1670075879',NULL,'正式成员','2018/10/10',NULL,'暂无',4,3),
(9,'老王','16754275793','1675427579','146','正式成员','2018/10/10',NULL,'暂无',5,3),
(10,'老宋','18754687897','1875468789','145','正式成员','2018/10/10',NULL,'暂无',6,3),
(11,'杰克','15164679897','1516467989','149','正式成员','2018/10/10',NULL,'暂无',7,3);

-- 出勤表
CREATE TABLE `mee_att`(
	id INT,								-- 出勤表 id
    name VARCHAR(20),					-- 出勤人名称
    state VARCHAR(20),					-- 出勤状态
    remark VARCHAR(20),					-- 出勤备注
    coll_id INT,						-- 集体表 id
    mee_id INT							-- 会议表 id
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 会议表
CREATE TABLE `meetings`(
	id INT,								-- 会议表 id
    name VARCHAR(20),					-- 会议名称
    location VARCHAR(20),				-- 会议地点
	start VARCHAR(20),					-- 会议时间
    host VARCHAR(20),					-- 会议主持人
    coll_id VARCHAR(20)					-- 集体表 id
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 会议总结表
CREATE TABLE `summ`(
	id INT,								-- 总结表 id
    name VARCHAR(20),					-- 总结人名称
    content TEXT,						-- 会议总结（文件）
    summ_time VARCHAR(20),				-- 总结时间
    mee_id INT							-- 会议表 id
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 公告表
CREATE TABLE `notice`(
	 id INT,								-- 公告表 id
    title VARCHAR(50),					-- 标题
    content TEXT,						-- 内容
    state VARCHAR(10),					-- 状态
    rele_time VARCHAR(20),				-- 发布时间
    publisher VARCHAR(20),				-- 发布人
    mod_time VARCHAR(20),				-- 修改时间
    total INT,							-- 修改次数
    acc_id VARCHAR(20)					-- 用户表 id（接收公告的用户）
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 资料表
CREATE TABLE `arrange`(
	id INT,								-- 资料表 id
    name VARCHAR(20),					-- 资料名称
    form VARCHAR(20),					-- 资料类型
    sto TEXT,							-- 资料文件
    pass VARCHAR(20),					-- 上传时间
    coll_id int							-- 集体表 id
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 管理表
CREATE TABLE `tube`(
	 id INT,								-- 管理表 id
    name VARCHAR(20),					-- 管理名称
    coll_id INT							-- 集合表 id
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 活动表
CREATE TABLE `activity`(
	id INT,								-- 活动表 id
    name VARCHAR(20),					-- 活动名称
    push VARCHAR(20),					-- 推行时间
    coll_id INT							-- 集体表 id
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


