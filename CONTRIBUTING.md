# Contributing to Spark Linux

Spark Linux là một dự án mã nguồn mở được xây dựng tại Việt Nam, hướng đến một hệ điều hành nhẹ, hiện đại và ổn định.

Chúng tôi rất hoan nghênh mọi đóng góp từ cộng đồng — từ người mới đến các developer giàu kinh nghiệm.

---

## Bạn có thể đóng góp như thế nào?

Bạn có thể giúp Spark Linux qua:

* Báo lỗi (bug reports)
* Đề xuất tính năng mới
* Cải thiện tài liệu
* Sửa lỗi hệ thống
* Tối ưu hiệu năng
* Đóng góp script, theme, hoặc tool

---

## Quy tắc chung

Trước khi đóng góp, vui lòng đảm bảo:

* Hiểu rõ mục đích của Spark Linux (nhẹ, nhanh, tối giản)
* Không thêm thành phần không cần thiết (bloat)
* Giữ code đơn giản, dễ đọc, dễ bảo trì
* Tôn trọng cấu trúc hệ thống hiện tại
* Test kỹ trước khi gửi Pull Request

---

## Quy trình đóng góp

### 1. Fork repository

Fork repo Spark Linux về tài khoản GitHub của bạn.

---

### 2. Clone về máy

```bash id="a9k2p0"
git clone https://github.com/your-username/spark.git
cd spark
```

---

### 3. Tạo branch mới

```bash id="k3m7zx"
git checkout -b feature/ten-tinh-nang
```

---

### 4. Thực hiện thay đổi

* Giữ thay đổi nhỏ, rõ ràng
* Không sửa nhiều thứ không liên quan trong cùng một PR

---

### 5. Commit chuẩn

Sử dụng format rõ ràng:

* `fix:` sửa lỗi
* `add:` thêm tính năng
* `update:` cải tiến
* `remove:` xóa thành phần

Ví dụ:

```bash id="c0v8lp"
git commit -m "fix: improve boot performance on low-end devices"
```

---

### 6. Push và tạo Pull Request

```bash id="x9q1aa"
git push origin feature/ten-tinh-nang
```

Sau đó mở Pull Request trên GitHub.

---

## Tiêu chí để merge PR

Một pull request sẽ được chấp nhận nếu:

* Không phá vỡ hệ thống hiện tại
* Có mô tả rõ ràng
* Code sạch và dễ hiểu
* Không gây thêm bloat
* Có lý do rõ ràng cho thay đổi

---

## Khi cần hỗ trợ

Nếu bạn không chắc chắn:

* Mở Issue trước khi làm lớn
* Thảo luận trong PR
* Hỏi maintainer

---

## Code of Conduct

Mọi đóng góp phải tuân theo Code of Conduct của dự án.

---

<p align="center">
  Thank you for contributing to Spark Linux ❤️
  <br>
  Made with ❤️ in Vietnam
</p>
