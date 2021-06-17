-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2021 at 05:12 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data`
--

-- --------------------------------------------------------

--
-- Table structure for table `attraction`
--

CREATE TABLE `attraction` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `content` text CHARACTER SET utf8 NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 NOT NULL,
  `text` text CHARACTER SET utf8 NOT NULL,
  `money` text CHARACTER SET utf8 NOT NULL,
  `img` varchar(225) CHARACTER SET utf8 NOT NULL,
  `photo` varchar(225) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attraction`
--

INSERT INTO `attraction` (`id`, `name`, `content`, `address`, `text`, `money`, `img`, `photo`) VALUES
(1, 'Bà Nà Hills', 'Bà Nà Hills là địa điểm du lịch đầy hấp dẫn của thành phố Đà Nẵng. Đã từ lâu, “ngọn đồi” này được xem là “con át chủ bài” thu hút hàng ngàn lượt khách du lịch đổ về Đà Nẵng mỗi năm, đặc biệt là khách Hàn Quốc. Thuộc hệ thống thương hiệu giải trí Sun World, cách trung tâm thành phố Đà Nẵng hơn 20 km, Sun World Bà Nà Hills là quần thể du lịch nghỉ dưỡng kết hợp vui chơi giải trí đẳng cấp bậc nhất Việt Nam.Là địa điểm du lịch mà bất cứ ai đến du lịch Đà Nẵng cũng đi ít nhất 1 lần. Tọa lạc trên đỉnh núi cao vời vợi, Bà Nà hút hồn du khách với cảnh đẹp như tiên cảnh và cáp treo dài nhất thế giới.Đây cũng được xem là một trong những địa điểm nổi bật nhất Đà Nẵng mà mọi du khách trên thế giới đều muốn đến ít nhất một lần.   \r\n\r\nĐến với Sun World Bà Nà Hills, du khách có cơ hội được thăm quan và trải nghiệm những công trình và điểm đến độc đáo, có một không hai. Một trong những công trình được du khách yêu thích nhất khi đến với Bà Nà Hills là Làng Pháp, nơi tái hiện một nước Pháp cổ kính và lãng mạn với những công trình kiến trúc cổ điển độc đáo như quảng trường, nhà thờ, thị trấn, làng cổ, và khách sạn.', 'Đà Nẵng', '\"Đó là một nỗ lực để thu hút thêm nhiều khách du lịch đến với thành phố\", tờ Time đánh giá.  Cầu Vàng tại Việt Nam không bắc qua dòng sông nào, có điểm nhấn là đôi bàn tay khổng lồ rêu phong nâng đỡ lối đi giống như một dải lụa vàng óng, sừng sững giữa mây trời Đà Nẵng.  Ngoài không gian với lối kiến trúc Pháp lãng mạn, nguy nga ngay trên đỉnh núi hội tụ tất cả các dịch vụ sang trọng, hấp dẫn như nhà hàng, công viên giải trí Fantasy Park, hầm rượu debay, bảo tàng sáp, vườn hoa, điểm thu hút du khách khác nữa ở khu du lịch Đà Nẵng chính là nơi đây sở hữu khí hậu 4 mùa trong một ngày khá thú vị. Đến Bà Nà Hills, bạn chắc chắn sẽ có những trải nghiệm khó quên cùng những bức ảnh kỉ niệm như đang lạc lối ở châu Âu.', '550.500', 'https://rosamiahotel.com/FileUpload/Images/bana.jpg', 'https://rosamiahotel.com/FileUpload/Images/bana_3.jpg'),
(2, 'Asian Park', 'Công viên Asia Park Đà Nẵng là một trong những công viên giải trí mang đẳng cấp quốc tế, đáng để đến vui chơi và thăm quan hàng đầu Việt Nam và Đông Nam Á. Công viên giải trí tại Asia Park mang đến hàng loạt trò chơi độc đáo, lần đầu tiên xuất hiện tại Việt Nam.\r\nCác trò chơi thường được nhắc đến như tàu lượn siêu tốc, tàu điện trên cao, tháp rơi tự do, máng trượt tốc độ cao… chắc chắn sẽ mang đến cho du khách nhiều trải nghiệm thú vị.\r\n\r\nĐến với Asian Park bạn sẽ khám phá thế giới vui chơi muôn màu muôn vẻ với các trò chơi cảm giác mạnh hay trò chơi vui nhộn. Bên cạnh đó bạn còn được chìm đắm trong không gian văn hóa đậm bản sắc châu Á. Chắc chắn du khách sẽ được trải nghiệm cảm giác vui chơi thoải mái ở đây.', 'Đà Nẵng', 'Asia Park bao gồm ba khu vực chính: công viên giải trí ngoài trời hiện đại, công viên văn hóa với các công trình kiến trúc và nghệ thuật thu nhỏ mang tính biểu trưng của 10 quốc gia châu Á, và khu Sun Wheel - nơi giao thoa giữa nét hiện đại và truyền thống\r\n\r\nCông viên văn hóa tại Asia Park mở ra một không gian phương Đông kỳ thú qua từng nét văn hóa đa dạng, các công trình kiến trúc lịch sử và những hoạt động nghệ thuật, ẩm thực độc đáo của 10 quốc gia Châu Á: Nhật Bản, Indonesia, Singapore, Hàn Quốc, Ấn Độ, Nepal, Thái Lan, Campuchia, Trung Quốc và Việt Nam.\r\n\r\n', '50.000', 'https://rosamiahotel.com/FileUpload/Images/asia_2.jpg', 'https://rosamiahotel.com/FileUpload/Images/asia.jpg'),
(3, 'Bãi Biển Mỹ Khê', 'Được mệnh danh là một trong 6 bãi biển đẹp nhất hành tinh nên không thật thiếu sót khi không nhắc đến bãi biển Mỹ Khê. Biển xanh cát vàng mang vẻ đẹp trong trẻo thu hút đông đảo du khách. Chính vì thế khu vực ở đây tập trung rất nhiều nhà hàng khách sạn nhằm phục vụ lượng khách đến Đà Nẵng hàng năm.Có đến 3 khu vực chính của biển được chia ra để phục vụ mọi du khách. Điều này nhằm giảm tải việc du khách tìm về đây trong mùa nắng nóng cao điểm. Đây là bãi biển nhộn nhịp với rất nhiều hoạt động vui chơi giải trí phù hợp với mọi lứa tuổi và nhu cầu của du khách. Với làn nước trong xanh, mọi người có thể hòa mình để tận hưởng cảm giác thư giãn tuyệt đối.\r\nBên cạnh đó, bờ biển dài cùng những chòi lá nhỏ được dựng lên phục vụ hoạt động nghỉ dưỡng của du khách. Đây cũng là địa điểm lý tưởng để những ai có nhu cầu tham gia các trò chơi thể thao trên biển như bóng đá, cầu lông,...\r\n', 'Đà Nẵng', 'Sự phong phú của các khu nghỉ dưỡng cao cấp mang lại sự cạnh tranh ráo riết tạo nên một hiệu ứng tốt, giá cả mềm mại, và du khách sẽ là người được hưởng những dịch vụ tốt nhất, thoải mái, sang trọng nhất.\r\n\r\nĐây cũng là con đường du lịch, bởi từ con đường này, vào trung tâm thành phố cũng được, mà tới Hội An, Mỹ Sơn cũng gần. Với hy vọng con đường này sẽ sớm trở thành một Phuket (Thái Lan) hay Bali (Indonesia), nó gần như là trung điểm của con đường du lịch, là điểm nhấn về kiến trúc, trung tâm du lịch, mang lại nguồn thu lớn cho du lịch Đà Nẵng.\r\n\r\nVới những ai vừa muốn thưởng thức hải sản Đà Nẵng vừa tận hưởng khung cảnh thơ mộng vào lúc hoàng hôn, thì các cửa hàng địa phương dọc theo bãi biển chính là lựa chọn tuyệt vời. Nơi đây có mọi loại hải sản tươi sống trên thị trường để du khách có thể chọn mua nguyên liệu thô và tự mình nấu nướng. Còn đợi gì nữa các bạn hay lên kế hoạch ngay hôm nay để có một kỳ nghỉ thật thú vị tại bờ biển xinh đẹp này.', 'Free', 'https://rosamiahotel.com/FileUpload/Images/img_min_5.jpg', 'https://rosamiahotel.com/FileUpload/Images/mykhe_3.jpg'),
(4, 'Cầu Rồng ', 'Đà Nẵng được mệnh danh là thành phố của những cây cầu, sở dĩ vì cứ đi vài cây số người ta lại được nhìn thấy một cây cầu ở thành phố này, mà đó không phải là những cây cầu đơn thuần mà chúng có những nét riêng biệt và sự độc đáo khác lạ chưa từng có ở bất cứ nơi đâu ở Việt Nam. Cầu Rồng phun lửa – phun nước là cây cầu nổi tiếng nhất Đà Nẵng bởi hình dáng độc nhất vô nhị của cây cầu và những điều thú vị gắn liền với cây cầu đó.\r\nVới vị trí nằm bắc qua dòng sông Hàn, cây cầu sừng sững và nổi bật giữa trung tâm thành phố, khiến bất kỳ người dân Đà Nẵng nào khi nhìn vào cũng thấy tự hào vô cùng. Cây cầu được xây dựng theo kiểu kiến trúc mang hình dạng một con Rồng thời Lý như vươn mình bay ra biển lớn, một ý tưởng vô cùng ý nghĩa thể hiện khát vọng ngày càng phát triển lớn mạnh của thành phố Đà Nẵng và còn tượng trưng cho nghệ thuật kiến trúc mới của Đà Nẵng.', 'Đà Nẵng', 'Ngoài những ấn tượng về kiến trúc, cầu Rồng Đà Nẵng còn được thiết kế với công năng khiến du khách phải kinh ngạc, đó là có thể phun lửa và phun nước. Đây như là một nam châm thu hút du khách tứ phương về du lịch tại Đà Nẵng.\r\n\r\nĐể chiêm ngưỡng cầu Rồng Đà Nẵng phun lửa, phun nước thì du khách hãy đến Đà Nẵng vào hai ngày cuối tuần, thứ 7 hoặc chủ nhật lúc 21h00 sẽ có một sự kiện 18 ngọn lửa và 3 ngọn nước bay ra từ miệng của Rồng.Mỗi lần sẽ phun lửa trước, nước sau. Lửa sẽ được phun 2 lượt, mỗi lượt 9 lần, nước sẽ được phun 3 lượt, mỗi lượt 1 lần hòa vào cùng với những âm thanh nhạc điệu.\r\nThời gian cầu Rồng phun lửa, phun nước rất hợp lý với người dân và du khách để có thể chiêm ngưỡng vẻ đẹp của cây cầu huyền thoại. Nếu có cơ hội đến Đà Nẵng thì du khách hãy đến đây vào cuối tuần để được ngắm nhìn, chiêm ngưỡng cầu Rồng Đà Nẵng phun lửa, phun nước. Ngoài cây cầu đặc sắc này thì Đà Nẵng còn rất nhiều địa danh đẹp và nổi tiếng khác giữ chân khách du lịch tứ phương.\r\n\r\nHãy đến và được tận mắt chứng kiến “thành phố đáng sống nhất Việt Nam” này nhé, có thể du khách sẽ lưu luyến không muốn rời đi đâu', 'Free', 'https://rosamiahotel.com/FileUpload/Images/caurong_3.jpg', 'https://rosamiahotel.com/FileUpload/Images/caurong.jpg'),
(5, 'Angelica Ramos', 'Software Engineer', 'San Francisco', '26', '5465', '', ''),
(6, 'Airi Satou', 'Integration Specialist', 'New York', '53', '56465', '', ''),
(8, 'Tiger Nixon', 'Software Engineer', 'London', '45', '456', '', ''),
(9, 'Airi Satou', 'Pre-Sales Support', 'New York', '25', '4568', '', ''),
(10, 'Angelica Ramos', 'Sales Assistant', 'New York', '45', '456', '', ''),
(11, 'Ashton updated', 'Senior Javascript Developer', 'Olongapo', '45', '54565', '', ''),
(12, 'Bradley Greer', 'Regional Director', 'San Francisco', '27', '5485', '', ''),
(13, 'Brenden Wagner', 'Javascript Developer', 'San Francisco', '38', '65468', '', ''),
(14, 'Brielle Williamson', 'Personnel Lead', 'Olongapo', '56', '354685', '', ''),
(15, 'Bruno Nash', 'Customer Support', 'New York', '36', '65465', '', ''),
(16, 'cairocoders', 'Sales Assistant', 'Sydney', '45', '56465', '', ''),
(17, 'Zorita Serrano', 'Support Engineer', 'San Francisco', '38', '6548', '', ''),
(18, 'Zenaida Frank', 'Chief Operating Officer (COO)', 'San Francisco', '39', '545', '', ''),
(19, 'Yuri Berry', 'Accountant', 'Tokyo', '38', '5468', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attraction`
--
ALTER TABLE `attraction`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attraction`
--
ALTER TABLE `attraction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
