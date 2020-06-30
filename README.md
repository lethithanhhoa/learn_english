# Giới thiệu
Ứng dụng giúp đối tượng người dùng chính là các em học sinh lớp 1 có thể học và ôn tập kiến thức môn học tiếng Anh được giảng dạy trên lớp. Dữ liệu của ứng dụng được tổng hợp bộ sách giáo khoa tiếng Anh lớp 1 của nhà xuất bản giáo dục Việt Nam trên hệ thống sachmem.vn. Ứng dụng xây dựng theo mô hình client-server, với client được phát triển bởi Flutter bởi Flutter Framework kết hợp với thư viện Provider để quản lý trạng thái các widget trong ứng dụng. Phía server, ứng dụng sử dụng hệ thống Firebase làm backend được cung cấp sẵn bởi Google.Hiện ứng dụng khả dụng trên hai nền tảng là Android và web. Ứng dụng có thể hỗ trợ ngoại tuyến (với điều kiện đã đăng nhập thành công).
### Các chức năng hiện có:
+ Đăng nhập với tài khoản Google hoặc Facebook (tự động đăng nhập lại nếu chưa logout khỏi phiên làm việc trước đó)
+ Học từ (có tính % số câu trả lời đúng cho mỗi bài học)
+ Xem lại các từ đã học
+ Mini game: TapTap game (chọn từ và nghĩa tương ứng) và MemoryCard game (ghi nhớ thẻ từ và chọn thẻ tương ứng với âm thanh)
+ Xem bảng xếp hạng (bảng xếp hạng điểm kinh nghiệm, điểm cao nhất các trò chơi)
+ Xem thông tin cá nhân
+ Đăng xuất

### Một số màn hình của ứng dụng
<p>
<img src="https://github.com/lethithanhhoa/learn_english/blob/master/screenshot/login.png" alt="Màn hình đăng nhập" width="200"/>
<img src="https://github.com/lethithanhhoa/learn_english/blob/master/screenshot/home.png" alt="Màn hình chính (mobile)" width="200"/>
<img src="https://github.com/lethithanhhoa/learn_english/blob/master/screenshot/homeweb.PNG" alt="Màn hình chính (web)" width="700"/>
</p>
<p>
  <img src="https://github.com/lethithanhhoa/learn_english/blob/master/screenshot/game.png" width="200"/>
  <img src="https://github.com/lethithanhhoa/learn_english/blob/master/screenshot/ranking.png" width="200"/>
  <img src="https://github.com/lethithanhhoa/learn_english/blob/master/screenshot/account.png" width="200"/>
  <img src="https://github.com/lethithanhhoa/learn_english/blob/master/screenshot/review.png" width="200"/>
  <img src="https://github.com/lethithanhhoa/learn_english/blob/master/screenshot/taptap.png" width="200"/>
  <img src="https://github.com/lethithanhhoa/learn_english/blob/master/screenshot/memory.png" width="200"/>
</p>
<p>
  <img src="https://github.com/lethithanhhoa/learn_english/blob/master/screenshot/1.png" width="200"/>
  <img src="https://github.com/lethithanhhoa/learn_english/blob/master/screenshot/2.png" width="200"/>
  <img src="https://github.com/lethithanhhoa/learn_english/blob/master/screenshot/3.png" width="200"/>
  <img src="https://github.com/lethithanhhoa/learn_english/blob/master/screenshot/4.png" width="200"/>
  <img src="https://github.com/lethithanhhoa/learn_english/blob/master/screenshot/5.png" width="200"/>
  <img src="https://github.com/lethithanhhoa/learn_english/blob/master/screenshot/6.png" width="200"/>
</p>


### Phiên bản Web khả dụng tại: https://learn-english-7c4c5.web.app/#/
### File cài đặt trên Android: https://drive.google.com/file/d/1JZB9-8K_u8edBpAsSUNusxQ3LpVEQbbA/view?usp=sharing

# Cài đặt và chạy chương trình 
- Cài đặt Flutter trên máy (xem chi tiết ở https://flutter.dev/docs/get-started/install)
- Clone source code và thực thi câu lệnh "flutter run" trong folder dự án để chạy chương trình

