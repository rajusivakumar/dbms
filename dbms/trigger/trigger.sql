CREATE TABLE `student` (
  `register` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `student`
  ADD PRIMARY KEY (`register`);


CREATE TABLE `profile_log` (
id int(11) NOT NULL,
reg_no varchar(255) NOT NULL,
type varchar(255) NOT NULL,
time date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `profile_log`
  ADD PRIMARY KEY (`id`);

DROP TRIGGER IF EXISTS `insert`;
CREATE DEFINER=`root`@`localhost` TRIGGER `insert` 
AFTER INSERT ON `student` 
FOR EACH ROW 
INSERT into profile_log VALUES(null,new.register,'profile created',curdate());




DROP TRIGGER IF EXISTS `update`;
CREATE DEFINER=`root`@`localhost` TRIGGER `update` 
AFTER UPDATE ON `student` 
FOR EACH ROW 
INSERT into profile_log VALUES(null,new.register,'profile created',curdate());



DROP TRIGGER IF EXISTS `delete`;
CREATE DEFINER=`root`@`localhost` TRIGGER `delete` 
BEFORE DELETE ON `student` 
FOR EACH ROW
 INSERT into profile_log VALUES(null,old.register,'profile deleted',curdate());






INSERT INTO `student` (`register`, `name`, `email`, `gender`, `updationDate`, `password`) VALUES ('19cs0439', 'Raju', 'rajuraj@gmail.com', 'male', CURRENT_DATE(), 'Raju@1234');

UPDATE `student` SET `email`='Raju@gmail.com',`password`=12345678 WHERE register='19cs0439';







