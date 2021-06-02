/*
 Navicat Premium Data Transfer

 Source Server         : CentOS
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : 192.168.1.10:3306
 Source Schema         : exam

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 30/05/2021 20:18:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `ano` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员号',
  `adm_psw` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '123456' COMMENT '登录密码，默认为123456',
  `adm_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员姓名',
  `adm_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男' COMMENT '管理员性别',
  `adm_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员邮箱',
  `adm_phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员手机号码',
  `adm_last_login_time` datetime NULL DEFAULT NULL COMMENT '管理员最近登录时间',
  PRIMARY KEY (`ano`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('100000', '123456', '管理员', '男', '947295340@qq.com', '13012345678', '2021-05-20 19:42:50');

-- ----------------------------
-- Table structure for bank_fill_que
-- ----------------------------
DROP TABLE IF EXISTS `bank_fill_que`;
CREATE TABLE `bank_fill_que`  (
  `fill_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '填空题id',
  `fill_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '填空题内容',
  `fill_answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '填空题答案',
  `compose_flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否被组成',
  `answer_explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目解析',
  `lang_id` int(11) NULL DEFAULT NULL COMMENT '该题所属编程语言',
  PRIMARY KEY (`fill_id`) USING BTREE,
  INDEX `fill_lang_id`(`lang_id`) USING BTREE,
  CONSTRAINT `fill_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `programing_language` (`lang_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bank_fill_que
-- ----------------------------
INSERT INTO `bank_fill_que` VALUES (1, '定义字符串变量s存储空字符串的表达式是', 'String s = \"\";', '1', NULL, 1);
INSERT INTO `bank_fill_que` VALUES (2, '定义字符串变量s存储空格构成的字符串的表达式是', 'String s= \" \";', '1', NULL, 1);
INSERT INTO `bank_fill_que` VALUES (3, '若已初始化int型变量a，b和c，则当a是b和c的公倍数时为true的逻辑表达式是', 'a%b==0 && a%c==0', '1', NULL, 1);
INSERT INTO `bank_fill_que` VALUES (4, '若已初始化int型变量a，b和c，则当a是b和c的公约数时为true的逻辑表达式是', 'b%a==0&& c%a==0', '1', NULL, 1);

-- ----------------------------
-- Table structure for bank_judge_que
-- ----------------------------
DROP TABLE IF EXISTS `bank_judge_que`;
CREATE TABLE `bank_judge_que`  (
  `judge_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '判断题id',
  `judge_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '判断题内容',
  `judge_answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '判断题答案',
  `compose_flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否被组成试卷',
  `answer_explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目解析',
  `lang_id` int(11) NULL DEFAULT NULL COMMENT '该题所属编程语言',
  PRIMARY KEY (`judge_id`) USING BTREE,
  INDEX `judge_lang_id`(`lang_id`) USING BTREE,
  CONSTRAINT `judge_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `programing_language` (`lang_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bank_judge_que
-- ----------------------------
INSERT INTO `bank_judge_que` VALUES (1, '在Java的方法中定义一个常量要用const关键字。', 'F', '1', '在java中定义常量用final。', 1);
INSERT INTO `bank_judge_que` VALUES (2, '抽象方法必须在抽象类中，所以抽象类中的方法都必须是抽象方法。', 'F', '1', '抽象类中必须要有抽象方法，但是同时也可以有非抽象方法。', 1);
INSERT INTO `bank_judge_que` VALUES (3, '用final修饰的变量叫常量。', 'T', '1', NULL, 1);
INSERT INTO `bank_judge_que` VALUES (4, '描述对象的两个要素是属性和方法。', 'T', '1', NULL, 1);
INSERT INTO `bank_judge_que` VALUES (5, '接口是特殊的类，所以接口也可以继承，子接口将继承父接口的所有常量和抽象方法。', 'T', '1', NULL, 1);
INSERT INTO `bank_judge_que` VALUES (6, 'Java支持多重继承。', 'F', '1', '是单继承。一个类最多只能够有一个基类，用extends实现。', 1);
INSERT INTO `bank_judge_que` VALUES (7, 'final修饰的类能派生子类。', 'F', '1', 'Final是最终类，不能再派生。', 1);
INSERT INTO `bank_judge_que` VALUES (8, '覆盖的同名方法中，子类方法不能比父类方法的访问权限低。', 'T', '1', NULL, 1);
INSERT INTO `bank_judge_que` VALUES (9, '抽象类中能创建对象。', 'F', '1', NULL, 1);
INSERT INTO `bank_judge_que` VALUES (10, '一个类可以实现多接口。', 'T', '1', NULL, 1);
INSERT INTO `bank_judge_que` VALUES (11, 'Unicode码与ASCII码相同。', 'F', '1', NULL, 1);
INSERT INTO `bank_judge_que` VALUES (12, 'Java语言是编译解释型语言。', 'T', '1', NULL, 1);
INSERT INTO `bank_judge_que` VALUES (13, 'Java语言支持类的继承,但只支持类的单继承。', 'T', '1', NULL, 1);
INSERT INTO `bank_judge_que` VALUES (14, '抽象方法没有方法体。', 'F', '1', '可以有方法体。', 1);
INSERT INTO `bank_judge_que` VALUES (15, '方法的重载是指子类和父类具有相同的名字、相同的参数表，但返回类型可以不相同。', 'F', '1', '不是子类和父类之间吧。', 1);
INSERT INTO `bank_judge_que` VALUES (16, '在Java中声明变量时必须指定一个类型。', 'T', '1', NULL, 1);
INSERT INTO `bank_judge_que` VALUES (17, 'Java中，一个类可以有多个直接父类。', 'F', '1', '不可以，是单继承。', 1);
INSERT INTO `bank_judge_que` VALUES (18, 'package语句必须放在程序的第一句。', 'T', '1', NULL, 1);
INSERT INTO `bank_judge_que` VALUES (19, '接口中可以包含非静态成员变量。', 'F', '1', NULL, 1);
INSERT INTO `bank_judge_que` VALUES (20, '一个Java类可以有一个直接父类，并可以实现多个接口。', 'T', '1', NULL, 1);
INSERT INTO `bank_judge_que` VALUES (21, '不论是否捕捉到异常try{}catch ){} finaly{}语句中finally块中的代码总要被执行。', 'T', '1', NULL, 1);
INSERT INTO `bank_judge_que` VALUES (22, '、一个类实现一个接口，则该类必须实现接口中的所有方法。', 'T', '1', NULL, 1);
INSERT INTO `bank_judge_que` VALUES (23, 'final类中的属性和方法都必须是final的。', 'F', '1', '只是为了说明他不可派生', 1);
INSERT INTO `bank_judge_que` VALUES (24, '在方法定义中，可能发生的异常都必须用try{} catch ){}捕捉。', 'F', '1', NULL, 1);
INSERT INTO `bank_judge_que` VALUES (25, 'Java 程序一般应当含有 main 方法，因为它是所有 Java 程序执行的入口。', 'F', '1', 'Java程序也可以是applet程序，如果是applet，不用main方法。。。由init初始化，start启用。', 1);
INSERT INTO `bank_judge_que` VALUES (26, 'Java 语言的标识符是不区分大小写的。', 'T', '1', NULL, 1);
INSERT INTO `bank_judge_que` VALUES (27, '有时候为了避免引起混淆，构造方法的方法名可以不与所属类名同名。', 'F', '1', '可以被继承，但是不能被访问。', 1);
INSERT INTO `bank_judge_que` VALUES (28, 'Java的类不允许多重继承，但接口支持多重继承。', 'T', '1', NULL, 1);
INSERT INTO `bank_judge_que` VALUES (29, '一个类中含有几个构造方法，称为构造方法的重载。对于重载的方法，其参数列表可以相同。', 'T', '1', NULL, 1);

-- ----------------------------
-- Table structure for bank_multiple_choice_que
-- ----------------------------
DROP TABLE IF EXISTS `bank_multiple_choice_que`;
CREATE TABLE `bank_multiple_choice_que`  (
  `multiple_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '多选题id',
  `multiple_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '多选题内容',
  `choice_A` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项A',
  `choice_B` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项B',
  `choice_C` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项C',
  `choice_D` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项D',
  `choice_E` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项E',
  `choice_F` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项F',
  `choice_G` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项G',
  `multiple_answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '多选题答案',
  `compose_flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否被组成试卷',
  `answer_explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目解析',
  `lang_id` int(11) NULL DEFAULT NULL COMMENT '该题所属编程语言',
  PRIMARY KEY (`multiple_id`) USING BTREE,
  INDEX `multiple_lang_id`(`lang_id`) USING BTREE,
  CONSTRAINT `multiple_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `programing_language` (`lang_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bank_multiple_choice_que
-- ----------------------------
INSERT INTO `bank_multiple_choice_que` VALUES (1, '下面哪两个声明可以阻止方法重写？', 'A:final voimethoda(){}', 'B:voifinal methoda(){}', 'C:stativoimethoda(){}', 'D:statifinal voimethoda(){}', NULL, NULL, NULL, 'AD', '1', NULL, 1);
INSERT INTO `bank_multiple_choice_que` VALUES (2, '指出下列哪个方法与方法public void add(int a){}为合理的重载方法。', 'A:public int add(int a)', 'B:public void add(long a)', 'C:public void add(int a,int b)', 'D:public void add(float a)', NULL, NULL, NULL, 'CD', '1', NULL, 1);
INSERT INTO `bank_multiple_choice_que` VALUES (3, '定义变量如下:\n\n\nchar c=\'w\'; int i=8; long L=15; float f=8.9f;\n\n\n以下赋值语句正确的是', 'A:i=c+i;', 'B:c=c+i;', 'C:L=f+L;', 'D:f=i+L+f;', NULL, NULL, NULL, 'AD', '1', NULL, 1);
INSERT INTO `bank_multiple_choice_que` VALUES (4, '下面哪些是合法的标识符?', 'A:$persons', 'B:TwoUsers', 'C:*point', 'D:this', NULL, NULL, NULL, 'AB', '1', NULL, 1);
INSERT INTO `bank_multiple_choice_que` VALUES (5, '<html><body>\n\n\n<form name=\"data\" action=\"/servlet/Data Servlet\" method=\"POST\">\n\n\n<input type=\"text\" name=\"name\">\n\n\n<input type=\"submit\" name=\"submit\">\n\n\n</form>\n\n\n</body></html>\n\n\n下面的哪两个方法可以取出name参数的值？', 'A:Get Parameter (\"name\");', 'B:Get Parameter Value (\"name\");', 'C:Get Parameter Values (\"name\");', 'D:Get Parameters (\"name\");', NULL, NULL, NULL, 'AC', '1', NULL, 1);
INSERT INTO `bank_multiple_choice_que` VALUES (6, '下面哪个方法可以在任何时候被任何线程调用?', 'A:notify()', 'B:wait()', 'C:notifyAll()', 'D:sleep()', NULL, NULL, NULL, 'BD', '1', NULL, 1);
INSERT INTO `bank_multiple_choice_que` VALUES (7, '运行以下代码后，不能描述应用外观的是\nimport java.awt.*;\n\n\npublic class CompLay extends Frame{\n\n\npublic static void main(String argv[]){\n\n\nCompLay cl = new CompLay();\n\n\n}\n\n\nCompLay(){\n\n\nPanel p = new Panel();\n\n\np.setBackground(Color.pink);\n\n\np.add(new But', 'A:按钮按从左向右的次序出现在窗体的底部', 'B:按钮按从左向右的次序出现在窗体的顶部', 'C:按钮将不显示', 'D:只有一个按钮显示占满整个窗体', NULL, NULL, NULL, 'ACD', '1', NULL, 1);
INSERT INTO `bank_multiple_choice_que` VALUES (8, '执行下列代码后,哪个结论是正确的 String[] s=new String[10];', 'A:[10] 为 \"\";', 'B:[9] 为 null;', 'C:[0] 为 未定义', 'D:length 为10', NULL, NULL, NULL, 'BD', '1', NULL, 1);
INSERT INTO `bank_multiple_choice_que` VALUES (9, 'java.awt.Graphics 类的哪个方法不可以绘制填充矩形?', 'A:fillRect()', 'B:drawRect()', 'C:fillOval()', 'D:drawPolygon()', NULL, NULL, NULL, 'BCD', '1', NULL, 1);
INSERT INTO `bank_multiple_choice_que` VALUES (10, '如果下列的方法能够正常运行，在控制台上将显示什么？\npublic void example(){\n\n\ntry{\n\n\nunsafe();\n\n\nSystem.out.println(\"Test1\");\n\n\n}\n\n\ncatch(SafeException e)\n\n\n{System.out.println(\"Test 2\");}\n\n\nfinally{System.out.println(\"Test 3\");}\n\n\nSystem.out.println(\"Test 4\");\n\n\n}', 'A:Test 1', 'B:Test 2', 'C:Test 3', 'D:Test 4', NULL, NULL, NULL, 'ACD', '1', NULL, 1);

-- ----------------------------
-- Table structure for bank_single_choice_que
-- ----------------------------
DROP TABLE IF EXISTS `bank_single_choice_que`;
CREATE TABLE `bank_single_choice_que`  (
  `single_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '单选题id',
  `single_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单选题内容',
  `choice_A` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项A',
  `choice_B` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项B',
  `choice_C` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项C',
  `choice_D` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项D',
  `choice_E` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项E',
  `choice_F` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项F',
  `choice_G` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项G',
  `single_answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单选题答案',
  `compose_flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否被组成试卷',
  `answer_explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目解析',
  `lang_id` int(11) NULL DEFAULT NULL COMMENT '该题所属编程语言',
  PRIMARY KEY (`single_id`) USING BTREE,
  INDEX `single_lang_id`(`lang_id`) USING BTREE,
  CONSTRAINT `single_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `programing_language` (`lang_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bank_single_choice_que
-- ----------------------------
INSERT INTO `bank_single_choice_que` VALUES (39, '在哪种派生方式中，派生类可以访问基类中的 protected 成员', 'A：public 和 private', ' B：public 和 protected', 'C：protected 和 private', 'D：仅 protected', NULL, NULL, NULL, 'B', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (40, '对 C++语言和 C语言的兼容性，描述正确的是', 'A：C++兼容', 'B：C++部分兼容 C', 'C：C++不兼容C', 'D：C 兼容 C++', NULL, NULL, NULL, 'A', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (41, '在 C++中使用流进行输入输出，其中用于屏幕输出的对象是', 'A：cerr', 'B：cin', 'C：cout', 'D：cfile', NULL, NULL, NULL, 'C', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (42, '对使用关键字 new所开辟的动态存储空间，释放时必须使用', 'A：free', 'B：create', 'C：delete', 'D：realse', NULL, NULL, NULL, 'C', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (43, '如没有使用 private 关键字定义类的数据成员，则默认为', 'A：private ', 'B：public', 'C：protected', 'D：friend', NULL, NULL, NULL, 'A', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (44, '使用值传递方式将实参传给形参，下列说法正确的是', 'A： 形参是实参的备份', 'B：实参是形参的备份', 'C：形参和实参是同一对象', 'D：形参和实参无联系', NULL, NULL, NULL, 'A', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (45, '在函数调用时，如某一默认参数要指明一个特定值，则有', 'A：其之前所有参数都必须赋值', 'B：其之后所有参数都必须赋值', 'C：其前、后所有参数都必须赋值 ', 'D：其前、后所有参数都不必赋值', NULL, NULL, NULL, 'A', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (46, '设存在函数 int max(int ，int) 返回两参数中较大值，若求 22，59，70 三者中最大值，下列表达式不正确的是', 'A：int m=max(22 ，max(59，70)) ；', 'B：int m=max(max(22 ， 59) ，70) ；', 'C：int m=max(22 ，59，70) ；', 'D：int m=max(59 ，max(22，70)) ；', NULL, NULL, NULL, 'C', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (47, '下列哪个类型函数不适合声明为内联函数 ', 'A：函数体语句较多', 'B：函数体语句较少', 'C：函数执行时间较短', 'D：函数执行时间过长', NULL, NULL, NULL, 'A', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (48, 'int Func(int ，int) ；不可与下列哪个函数构成重载', 'A：int Func(int ，int ， int) ；', 'B：double Func(int ，int) ；', 'C：double Func(double ，double) ；', 'D：double Func(int ，double) ；', NULL, NULL, NULL, 'B', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (49, '对类中声明的变量，下列描述中正确的是 ', 'A： 属于全局变量', 'B：只属于该类', 'C： 属于该类，某些情况下也可被该类不同实例所共享', 'D：任何情况下都可被该类所有实例共享', NULL, NULL, NULL, 'C', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (50, '类的私有成员可在何处访问', 'A： 通过子类的对象访问', 'B：本类及子类的成员函数中', 'C： 通过该类对象访问', 'D：本类的成员函数中', NULL, NULL, NULL, 'd', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (51, '如果没有为一个类定义任何构造函数的情况下，下列描述正确的是', 'A：编译器总是自动创建一个不带参数的构造函数', 'B：这个类没有构造函数', 'C：这个类不需要构造函数', 'D：该类不能通过编译', NULL, NULL, NULL, 'A', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (52, '一个类可包含析构函数的个数是', 'A：0 个', 'B：1 个', 'C：至少一个', 'D：0 个或多个', NULL, NULL, NULL, 'B', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (53, 'this 指针存在的目的是', 'A： 保证基类公有成员在子类中可以被访问', 'B： 保证每个对象拥有自己的数据成员，但共享处理这些数据成员的代码', 'C： 保证基类保护成员在子类中可以被访问', 'D：保证基类私有成员在子类中可以被访问', NULL, NULL, NULL, 'B', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (54, '下列关于类的权限的描述错误的是', 'A： 类本身的成员函数只能访问自身的私有成员', 'B： 类的对象只能访问该类的公有成员', 'C： 普通函数不能直接访问类的公有成员，必须通过对象访问', 'D： 一个类可以将另一个类的对象作为成员', NULL, NULL, NULL, 'A', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (55, '在编译指令中，宏定义使用哪个指令', 'A：#include', 'B：#define', 'C：#if', 'D：#else', NULL, NULL, NULL, 'B', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (56, '设类 A将其它类对象作为成员，则建立 A类对象时，下列描述正确的是 ', 'A：A 类构造函数先执行', 'B：成员构造函数先执行', 'C： 两者并行执行', 'D：不能确定', NULL, NULL, NULL, 'B', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (57, '下列描述错误的是', 'A： 在创建对象前，静态成员不存在', 'B： 静态成员是类的成员', 'C： 静态成员不能是虚函数', 'D：静态成员函数不能直接访问非静态成员', NULL, NULL, NULL, 'A', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (58, '对于友元描述正确的是', 'A：友元是本类的成员函数', 'B：友元不是本类的成员函数', 'C： 友元不是函数', 'D：友元不能访问本类私有成员', NULL, NULL, NULL, 'B', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (59, '编写 C++程序一般需经过的几个步骤依次是', 'A： 编辑、调试、编译、连接', 'B： 编辑、编译、连接、运行', 'C： 编译、调试、编辑、连接', 'D：编译、编辑、连接、运行', NULL, NULL, NULL, 'B', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (60, '决定 C++语言中函数的返回值类型的是', 'A： return语句中的表达式类型', 'B：调用该函数时系统随机产生的类型', 'C： 调用该函数时的主调用函数类型', 'D：在定义该函数时所指定的数据类型', NULL, NULL, NULL, 'd', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (61, '所谓数据封装就是将一组数据和与这组数据有关操作组装在一起，形成一个实体，这实体', 'A：类', 'B：对象', 'C：函数体', 'D：数据块', NULL, NULL, NULL, 'A', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (62, '在公有派生类的成员函数不能直接访问基类中继承来的某个成员，则该成员一定是基类中', 'A：私有成员', 'B：公有成员', 'C：保护成员', 'D：保护成员或私有成员', NULL, NULL, NULL, 'A', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (63, '对基类和派生类的关系描述中，错误的是', 'A：派生类是基类的具体化', 'B：基类继承了派生类的属性', 'C：派生类是基类定义的延续', 'D：派生类是基类的特殊化', NULL, NULL, NULL, 'B', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (64, '关于 this 指针使用说法正确的是', 'A：保证每个对象拥有自己的数据成员，但共享处理这些数据的代码', 'B： 保证基类私有成员在子类中可以被访问。', 'C：保证基类保护成员在子类中可以被访问。', 'D：保证基类公有成员在子类中可以被访问。', NULL, NULL, NULL, 'A', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (65, '所谓多态性是指', 'A：不同的对象调用不同名称的函数', 'B：不同的对象调用相同名称的函数', 'C：一个对象调用不同名称的函数', 'D：一个对象调用不同名称的对象', NULL, NULL, NULL, 'B', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (66, '一个函数功能不太复杂，但要求被频繁调用，则应把它定义为', 'A：内联函数', 'B：重载函数', 'C：递归函数', 'D：嵌套函数', NULL, NULL, NULL, 'A', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (67, '适宜采用 inline定义函数情况是', 'A：函数体含有循环语句', 'B：函数体含有递归语句', 'C：函数代码少、频繁调用', 'D：函数代码多、不常调用', NULL, NULL, NULL, 'C', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (68, '在类中说明的成员可以使用关键字的是', 'A：public', 'B：extern', 'C：cpu', 'D：register', NULL, NULL, NULL, 'A', '0', NULL, 2);
INSERT INTO `bank_single_choice_que` VALUES (69, '下列选项中，不属于Java语言特点的一项是（ ）。', 'A:分布式', 'B:安全性', 'C:编译执行', 'D:面向对象', NULL, NULL, NULL, 'C', '1', NULL, 1);
INSERT INTO `bank_single_choice_que` VALUES (70, 'Java语言的特点与 C/C+ +语言的比较中说法错误的是（ ）', 'A：简单性Java继承了 C/C+ +的语法 ,丢弃了其中不常用又容易引起混淆的功能。', 'B：Java是一种纯面向对象的语言 ,具有封装、继承 ( Inheritance)和多态( Polymorphism)的特点。', 'C：Java应用程序可凭借URL打开并访问网络上的对象。', 'D：解释型Java写成的源代码需要被编译成高阶的字节码 ,它们与机器架构有关。', NULL, NULL, NULL, 'D', '1', NULL, 1);

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper`  (
  `paper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '试卷id',
  `paper_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试卷名称',
  `paper_create_time` datetime NULL DEFAULT NULL COMMENT '试卷创建时间',
  `paper_duration` int(11) NULL DEFAULT NULL COMMENT '考试时长，单位秒',
  `paper_difficulty` int(11) NULL DEFAULT NULL COMMENT '试卷难度',
  `paper_attention` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试注意事项',
  `paper_type` int(11) NULL DEFAULT NULL COMMENT '组卷机制，1为随机，2为固定',
  `single_score` int(11) NULL DEFAULT NULL COMMENT '单选题分配分数',
  `multiple_score` int(11) NULL DEFAULT NULL COMMENT '多选题分配分数',
  `judge_score` int(11) NULL DEFAULT NULL COMMENT '判断题分配分数',
  `fill_score` int(11) NULL DEFAULT NULL COMMENT '填空题分配分数',
  `lang_id` int(11) NULL DEFAULT NULL COMMENT '试卷所属编程语言',
  `participate_num` int(11) NULL DEFAULT 0 COMMENT '已参加人数',
  PRIMARY KEY (`paper_id`) USING BTREE,
  INDEX `paper_lang_id`(`lang_id`) USING BTREE,
  CONSTRAINT `paper_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `programing_language` (`lang_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES (1, '试卷1 —— 固定组卷', '2021-05-30 20:07:01', 3600, 4, '', 2, 40, 20, 20, 20, 1, 0);

-- ----------------------------
-- Table structure for paper_que
-- ----------------------------
DROP TABLE IF EXISTS `paper_que`;
CREATE TABLE `paper_que`  (
  `que_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '问题id',
  `que_type` int(11) NULL DEFAULT NULL COMMENT '题类型',
  `single_id` int(11) NULL DEFAULT NULL COMMENT '单选题id',
  `multiple_id` int(11) NULL DEFAULT NULL COMMENT '多选题id',
  `judge_id` int(11) NULL DEFAULT NULL COMMENT '判断题id',
  `fill_id` int(11) NULL DEFAULT NULL COMMENT '填空题id',
  `paper_id` int(11) NULL DEFAULT NULL COMMENT '试卷id',
  PRIMARY KEY (`que_id`) USING BTREE,
  INDEX `que_single_id`(`single_id`) USING BTREE,
  INDEX `que_multiple_id`(`multiple_id`) USING BTREE,
  INDEX `que_judge_id`(`judge_id`) USING BTREE,
  INDEX `que_fill_id`(`fill_id`) USING BTREE,
  INDEX `que_paper_id`(`paper_id`) USING BTREE,
  CONSTRAINT `que_fill_id` FOREIGN KEY (`fill_id`) REFERENCES `bank_fill_que` (`fill_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `que_judge_id` FOREIGN KEY (`judge_id`) REFERENCES `bank_judge_que` (`judge_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `que_multiple_id` FOREIGN KEY (`multiple_id`) REFERENCES `bank_multiple_choice_que` (`multiple_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `que_paper_id` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`paper_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `que_single_id` FOREIGN KEY (`single_id`) REFERENCES `bank_single_choice_que` (`single_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paper_que
-- ----------------------------
INSERT INTO `paper_que` VALUES (2, 1, 69, NULL, NULL, NULL, 1);
INSERT INTO `paper_que` VALUES (3, 1, 70, NULL, NULL, NULL, 1);
INSERT INTO `paper_que` VALUES (4, 2, NULL, 1, NULL, NULL, 1);
INSERT INTO `paper_que` VALUES (5, 2, NULL, 2, NULL, NULL, 1);
INSERT INTO `paper_que` VALUES (6, 2, NULL, 3, NULL, NULL, 1);
INSERT INTO `paper_que` VALUES (7, 2, NULL, 4, NULL, NULL, 1);
INSERT INTO `paper_que` VALUES (8, 2, NULL, 5, NULL, NULL, 1);
INSERT INTO `paper_que` VALUES (9, 2, NULL, 6, NULL, NULL, 1);
INSERT INTO `paper_que` VALUES (10, 2, NULL, 7, NULL, NULL, 1);
INSERT INTO `paper_que` VALUES (11, 2, NULL, 8, NULL, NULL, 1);
INSERT INTO `paper_que` VALUES (12, 2, NULL, 9, NULL, NULL, 1);
INSERT INTO `paper_que` VALUES (13, 2, NULL, 10, NULL, NULL, 1);
INSERT INTO `paper_que` VALUES (14, 3, NULL, NULL, 1, NULL, 1);
INSERT INTO `paper_que` VALUES (15, 3, NULL, NULL, 2, NULL, 1);
INSERT INTO `paper_que` VALUES (16, 3, NULL, NULL, 3, NULL, 1);
INSERT INTO `paper_que` VALUES (17, 3, NULL, NULL, 4, NULL, 1);
INSERT INTO `paper_que` VALUES (18, 3, NULL, NULL, 5, NULL, 1);
INSERT INTO `paper_que` VALUES (19, 3, NULL, NULL, 6, NULL, 1);
INSERT INTO `paper_que` VALUES (20, 3, NULL, NULL, 7, NULL, 1);
INSERT INTO `paper_que` VALUES (21, 3, NULL, NULL, 8, NULL, 1);
INSERT INTO `paper_que` VALUES (22, 3, NULL, NULL, 9, NULL, 1);
INSERT INTO `paper_que` VALUES (23, 3, NULL, NULL, 10, NULL, 1);
INSERT INTO `paper_que` VALUES (24, 3, NULL, NULL, 11, NULL, 1);
INSERT INTO `paper_que` VALUES (25, 3, NULL, NULL, 12, NULL, 1);
INSERT INTO `paper_que` VALUES (26, 3, NULL, NULL, 13, NULL, 1);
INSERT INTO `paper_que` VALUES (27, 3, NULL, NULL, 14, NULL, 1);
INSERT INTO `paper_que` VALUES (28, 3, NULL, NULL, 15, NULL, 1);
INSERT INTO `paper_que` VALUES (29, 3, NULL, NULL, 16, NULL, 1);
INSERT INTO `paper_que` VALUES (30, 3, NULL, NULL, 17, NULL, 1);
INSERT INTO `paper_que` VALUES (31, 3, NULL, NULL, 18, NULL, 1);
INSERT INTO `paper_que` VALUES (32, 3, NULL, NULL, 19, NULL, 1);
INSERT INTO `paper_que` VALUES (33, 3, NULL, NULL, 20, NULL, 1);
INSERT INTO `paper_que` VALUES (34, 3, NULL, NULL, 21, NULL, 1);
INSERT INTO `paper_que` VALUES (35, 3, NULL, NULL, 22, NULL, 1);
INSERT INTO `paper_que` VALUES (36, 3, NULL, NULL, 23, NULL, 1);
INSERT INTO `paper_que` VALUES (37, 3, NULL, NULL, 24, NULL, 1);
INSERT INTO `paper_que` VALUES (38, 3, NULL, NULL, 25, NULL, 1);
INSERT INTO `paper_que` VALUES (39, 3, NULL, NULL, 26, NULL, 1);
INSERT INTO `paper_que` VALUES (40, 3, NULL, NULL, 27, NULL, 1);
INSERT INTO `paper_que` VALUES (41, 3, NULL, NULL, 28, NULL, 1);
INSERT INTO `paper_que` VALUES (42, 3, NULL, NULL, 29, NULL, 1);
INSERT INTO `paper_que` VALUES (43, 4, NULL, NULL, NULL, 1, 1);
INSERT INTO `paper_que` VALUES (44, 4, NULL, NULL, NULL, 2, 1);
INSERT INTO `paper_que` VALUES (45, 4, NULL, NULL, NULL, 3, 1);
INSERT INTO `paper_que` VALUES (46, 4, NULL, NULL, NULL, 4, 1);

-- ----------------------------
-- Table structure for programing_language
-- ----------------------------
DROP TABLE IF EXISTS `programing_language`;
CREATE TABLE `programing_language`  (
  `lang_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编程语言id',
  `lang_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编程语言名称',
  `lang_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编程语言描述',
  `lang_img_src` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编程语言图标',
  `lang_create_time` datetime NULL DEFAULT NULL COMMENT '编程语言创建时间',
  `lang_created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编程语言被创建者',
  `lang_change_time` datetime NULL DEFAULT NULL COMMENT '编程语言最近修改时间',
  `lang_last_changer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编程语言最近被修改者',
  `is_recommend` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否在学生首页显示推荐，默认为0不推荐，1为推荐',
  PRIMARY KEY (`lang_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of programing_language
-- ----------------------------
INSERT INTO `programing_language` VALUES (1, 'Java程序设计', 'Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程。', 'http://localhost:8080/static/upload/img/c427dc51-ab96-4cb6-9c40-2d70b9b3e56f', '2021-05-21 20:59:37', '管理员', '2021-05-21 21:05:22', '管理员', '1');
INSERT INTO `programing_language` VALUES (2, 'C++程序设计', 'C++是C语言的继承，它既可以进行C语言的过程化程序设计，又可以进行以抽象数据类型为特点的基于对象的程序设计，还可以进行以继承和多态为特点的面向对象的程序设计。C++擅长面向对象程序设计的同时，还可以进行基于过程的程序设计，因而C++就适应的问题规模而论，大小由之。', 'http://localhost:8080/static/upload/img/3a1945d8-0f76-4529-a0ab-16bcead83787', '2021-05-21 21:58:20', '管理员', NULL, NULL, '1');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `sno` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键，学生学号',
  `stu_psw` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '123456' COMMENT '登录密码，默认为123456',
  `stu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生姓名',
  `stu_img_src` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像链接',
  `stu_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男' COMMENT '学生性别',
  `stu_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生邮箱',
  `stu_phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生手机号码',
  `stu_create_time` datetime NOT NULL COMMENT '学生注册时间',
  `stu_last_login_time` datetime NULL DEFAULT NULL COMMENT '学生最近登录时间',
  `stu_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '学生登录状态',
  `stu_security_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '123456' COMMENT '安全码用于密码找回',
  PRIMARY KEY (`sno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('2012114146', '123456', '钟旭', NULL, '男', NULL, NULL, '2021-05-30 19:47:58', '2021-05-30 19:48:04', '1', '123456');

-- ----------------------------
-- Table structure for student_feedback
-- ----------------------------
DROP TABLE IF EXISTS `student_feedback`;
CREATE TABLE `student_feedback`  (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '反馈id',
  `feedback_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '反馈内容',
  `feedback_create_time` datetime NOT NULL COMMENT '反馈创建时间',
  `sno` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `stu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `adm_answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员回复',
  `ano` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员号',
  `adm_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员姓名',
  `feedback_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '留言状态0为管理员未读，1为管理员已读学生未读，2为学生已读',
  `reply_time` datetime NULL DEFAULT NULL COMMENT '管理员回复时间',
  PRIMARY KEY (`feedback_id`) USING BTREE,
  INDEX `feedback_sno`(`sno`) USING BTREE,
  INDEX `feedback_ano`(`ano`) USING BTREE,
  CONSTRAINT `feedback_ano` FOREIGN KEY (`ano`) REFERENCES `admin` (`ano`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `feedback_sno` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for student_home_rotation_img
-- ----------------------------
DROP TABLE IF EXISTS `student_home_rotation_img`;
CREATE TABLE `student_home_rotation_img`  (
  `img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '轮播图id',
  `img_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '轮播图标题',
  `img_src` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图图片地址',
  `img_create_time` datetime NOT NULL COMMENT '轮播图创建时间',
  `ano` int(11) NOT NULL COMMENT '创建轮播图的管理员id',
  `adm_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建轮播图的管理员姓名',
  PRIMARY KEY (`img_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_home_rotation_img
-- ----------------------------

-- ----------------------------
-- Table structure for student_paper_answer
-- ----------------------------
DROP TABLE IF EXISTS `student_paper_answer`;
CREATE TABLE `student_paper_answer`  (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生答卷答案id',
  `stu_answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生答卷答案',
  `isCorrect` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '答案是否正确',
  `que_id` int(11) NULL DEFAULT NULL COMMENT '问题id',
  `paper_id` int(11) NULL DEFAULT NULL COMMENT '试卷id',
  `sno` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `isCollect` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否被收藏,0为否，1为是',
  PRIMARY KEY (`answer_id`) USING BTREE,
  INDEX `answer_que_id`(`que_id`) USING BTREE,
  INDEX `answer_paper_id`(`paper_id`) USING BTREE,
  INDEX `answer_sno`(`sno`) USING BTREE,
  CONSTRAINT `answer_paper_id` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`paper_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `answer_que_id` FOREIGN KEY (`que_id`) REFERENCES `paper_que` (`que_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `answer_sno` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_paper_answer
-- ----------------------------

-- ----------------------------
-- Table structure for student_paper_score
-- ----------------------------
DROP TABLE IF EXISTS `student_paper_score`;
CREATE TABLE `student_paper_score`  (
  `score_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生答卷分数id',
  `score` int(11) NULL DEFAULT NULL COMMENT '学生答卷总分',
  `time_used` int(11) NULL DEFAULT NULL COMMENT '答题花费时间，单位毫秒',
  `start_time` datetime NULL DEFAULT NULL COMMENT '答题开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '答题结束时间',
  `sno` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `paper_id` int(11) NULL DEFAULT NULL COMMENT '试卷id',
  PRIMARY KEY (`score_id`) USING BTREE,
  INDEX `score_sno`(`sno`) USING BTREE,
  INDEX `score_paper_id`(`paper_id`) USING BTREE,
  CONSTRAINT `score_paper_id` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`paper_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `score_sno` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_paper_score
-- ----------------------------

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `tno` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教工号',
  `tea_psw` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '123456' COMMENT '登录密码，默认为123456',
  `tea_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师姓名',
  `tea_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男' COMMENT '教师性别',
  `tea_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师邮箱',
  `tea_phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师手机号码',
  `tea_last_login_time` datetime NULL DEFAULT NULL COMMENT '教师最近登录时间',
  PRIMARY KEY (`tno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('100001', '123456', '刘一', '男', NULL, NULL, '2021-05-30 19:47:37');
INSERT INTO `teacher` VALUES ('100002', '123456', '陈二', '女', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('100003', '123456', '张三', '男', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('100004', '123456', '李四', '女', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('100005', '123456', '王五', '男', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('100006', '123456', '赵六', '女', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('100007', '123456', '孙七', '男', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('100008', '123456', '周八', '女', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('100009', '123456', '吴九', '男', NULL, NULL, NULL);
INSERT INTO `teacher` VALUES ('100010', '123456', '郑十', '女', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for teacher_notice
-- ----------------------------
DROP TABLE IF EXISTS `teacher_notice`;
CREATE TABLE `teacher_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师公告id',
  `notice_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告内容',
  `notice_create_time` datetime NULL DEFAULT NULL COMMENT '公告创建时间',
  `tea_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建公告的教师姓名',
  `tno` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建公告教工号',
  `sno` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `is_see` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查看',
  PRIMARY KEY (`notice_id`) USING BTREE,
  INDEX `notice_tno`(`tno`) USING BTREE,
  INDEX `notice_sno`(`sno`) USING BTREE,
  CONSTRAINT `notice_sno` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `notice_tno` FOREIGN KEY (`tno`) REFERENCES `teacher` (`tno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher_notice
-- ----------------------------
INSERT INTO `teacher_notice` VALUES (2, '试卷1 —— 固定组卷即将开始考试。请提前登录系统准备考试', '2021-05-30 20:16:01', '刘一', '100001', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
