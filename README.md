# Giới thiệu
### Ứng dụng để học tiếng Anh cho học sinh lớp 1 (dữ liệu được lấy trên sachmem.vn) được phát triển bởi framework Flutter kết hợp với Firebase làm backend
### Các chức năng hiện có:
+ Đăng nhập với tài khoản Google (tự động đăng nhập lại nếu chưa logout khỏi phiên làm việc trước đó)
+ Học từ (có tính % số câu trả lời đúng cho mỗi bài học)
+ Xem lại các từ đã học
+ Mini game: TapTap game (chọn từ và nghĩa tương ứng) và MemoryCard game (ghi nhớ thẻ từ và chọn thẻ tương ứng với âm thanh)
+ Xem bảng xếp hạng (bảng xếp hạng điểm kinh nghiệm, điểm cao nhất các trò chơi)
+ Xem thông tin cá nhân
+ Logout

# Cài đặt và chạy chương trình 
- Cài đặt Flutter trên máy (xem chi tiết ở https://flutter.dev/docs/get-started/install)
- Clone source code và từ folder clone về thực thi câu lệnh "flutter run" để chạy chương trình

# Build file apk và cài đặt trên máy
- Thực thi câu lện "flutter build apk --debug" để build debug version hoặc "flutter build apk" (hoặc "flutter build apk --split-per-abi") để build release version 
- Và cài đặt trên máy bằng câu lệnh "flutter install"
