# SmartFarm System

## Hướng dẫn chạy script

Mở PowerShell sau đó di chuyển đến script và nhập lệnh: 

```powershell
 .\auto_report.ps1
```

## Checklist kiểm tra thiết bị

- [x] Kiểm tra file log có tồn tại trong thư mục data
- [ ] Kiểm tra dung lượng máy chủ
- [ ] Đối chiếu mã linh kiện với danh mục thiết bị

## Bảng thông số phần cứng


| Ten_thiet_bi | Don_gia | Loai_storage |
|---|---|---|
Raspberry Pi 4 Model B|	1.450.000	|SSD
Intel NUC i3	|6.200.000	|SSD
Orange Pi 5	|2.300.000	|SSD
Dell Optiplex Micro	|5.400.000	|HDD
Mini PC Fanless N100	|4.200.000	|SSD
Synology DS220j NAS	|3.900.000	|HDD


## Phân tích hệ thống

### IPO

- **Input:** File `data/log-he-thong.log` chứa thời gian gặp sự cố, dạng sự cố và nội dung sự cố
- **Process:** Đọc log bằng `Get-Content`, lọc dòng có `ERROR` hoặc `CRITICAL` bằng `Select-String`, ghi nội dung và đếm số dòng bằng Pipeline
- **Output:** File `backup/bao-cao-su-co.txt` chứa các dòng có sự cố `ERROR` và `CRITICAL`, nội dung sự cố và tổng số sự cố

### Phân loại tầng DIKW

| Phát biểu | Tầng DIKW | 
|---|---|
|(a) “Quyết định thay modem trạm sensor-03 trước thứ Sáu.”|Wisdom
|(b) “2026-10-12 08:15:01 \[ERROR\] sensor-03 Connection TIMEOUT after 30s”|Data
|(c) “Hôm nay hệ thống ghi nhận 8 sự cố, trong đó 4 sự cố đến từ trạm sensor-03.”|Information
|(d) “Trạm sensor-03 hay mất kết nối vào buổi chiều do sóng yếu, nên cần lắp thêm anten.”|Knowledge

## Bẫy phần cứng

Tốc độ mạng 100 Mbps đổi sang MB/s bằng cách chia cho 8:


- 100 Mbps / 8 = 12.5 MB/s
- 500 MB / 12.5 MB/s = 40 giây

-> Kết quả: thời gian tải file log là **40 giây**

