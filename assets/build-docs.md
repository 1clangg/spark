# Hướng dẫn build Spark Linux

Spark Linux được thiết kế để có thể build lại dễ dàng (reproducible) trên các hệ thống dựa trên Debian.

Tài liệu này mô tả quy trình tạo môi trường Spark Linux từ ISO gốc đến hệ thống hoàn chỉnh.

---

> [!WARNING]
> ⚠️ **Yêu cầu hệ thống**
>
> Trước khi bắt đầu, hãy đảm bảo:
>
> * Hệ điều hành Debian / Ubuntu / các bản tương thích
> * Phiên bản hệ điều hành: Debian ≥ 11 hoặc Ubuntu ≥ 18.04.5
> * Tối thiểu 20GB dung lượng trống
> * Quyền sudo (root)
> * Kết nối internet ổn định

---

## 1. Công cụ build

Spark Linux sử dụng **Cubic** để tùy biến ISO trong môi trường chroot.

### Cài đặt Cubic

```
# Ubuntu
sudo apt-add-repository universe
sudo apt-add-repository ppa:cubic-wizard/release
sudo apt update
sudo apt install --no-install-recommends cubic

# Debian
# Đối với phiên bản Bookworm (12) trở xuống
sudo apt update
sudo apt install --no-install-recommends dpkg
echo "deb https://ppa.launchpadcontent.net/cubic-wizard/release/ubuntu/ noble main" | sudo tee /etc/apt/sources.list.d/cubic-wizard-release.list
curl -S "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x081525e2b4f1283b" | sudo gpg --batch --yes --dearmor --output /etc/apt/trusted.gpg.d/cubic-wizard-ubuntu-release.gpg

sudo apt update
sudo apt install --no-install-recommends cubic

# Đối với phiên bản Bullseye (11)
# HOÀN TOÀN KHÔNG KHUYẾN KHÍCH LÀM THEO!
cd /etc/apt
sudo cp sources.list sources.list.original
sudo sed -i "s|bullseye|bookworm|g" sources.list
sudo apt update

sudo apt install --no-install-recommends dpkg

sudo mv sources.list.original sources.list
sudo apt update
echo "deb https://ppa.launchpadcontent.net/cubic-wizard/release/ubuntu/ noble main" | sudo tee /etc/apt/sources.list.d/cubic-wizard-release.list
curl -S "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x081525e2b4f1283b" | sudo gpg --batch --yes --dearmor --output /etc/apt/trusted.gpg.d/cubic-wizard-ubuntu-release.gpg

sudo apt update
sudo apt install --no-install-recommends cubic

# Đối với phiên bản Trixie (13)
# Do lỗi Launchpad, chính sách của Debian sẽ từ chối chữ ký, Cubic không thể được cài đặt bằng apt trên Debian 13 Trixie. Thay vào đó, hãy làm theo các hướng dẫn sau để cài đặt Cubic.
# Truy cập URL sau trong trình duyệt web của bạn:
# https://launchpad.net/~cubic-wizard/+archive/ubuntu/release/+packages
# Mở rộng dấu "▷" đầu tiên dưới mục "Source" trong phần "Packages".
# (Phiên bản Ubuntu bạn chọn không quan trọng, miễn là bạn chọn phiên bản Cubic mới nhất).
# Tải xuống gói Cubic Debian.
# Nhấp chuột phải vào tệp *.deb, chọn "Lưu liên kết thành...", và tải xuống thư mục Tải xuống của bạn.
# Thiết lập công cụ để xử lý các tệp Deb cùng với các phụ thuộc của chúng.

sudo apt -q update
sudo apt install -q gdebi-core

# Cài đặt Cubic.

cd ~/Downloads
sudo gdebi -o "APT::Install-Recommends=false" cubic*.deb
```

---

## 2. ISO nền

Spark Linux sử dụng ISO Debian LXQt làm base:

[Debian 13.5 LXQt (amd64)](https://mirror.steadfast.net/debian-cd/13.5.0-live/amd64/iso-hybrid/debian-live-13.5.0-amd64-lxqt.iso)

Bạn cần tải ISO chính thức trước khi bắt đầu Cubic.

> **Lưu ý về phiên bản Debian**
>
> Hiện tại, script của Spark Linux chỉ hỗ trợ build đến phiên bản Debian 13.5, nếu bạn cố gắng chạy script trên 1 phiên bản mới hơn của Debian, nó có thể break luôn / của Debian.

---

## 3. Bắt đầu Cubic

1. Mở Cubic
2. Chọn thư mục project
3. Import ISO Debian và config như trong hình
<img width="478" height="480" alt="image" src="https://github.com/user-attachments/assets/00e3ae79-c579-4c74-9a21-d069ff761dd3" />
4. Vào môi trường chroot

---

## 4. Chuẩn bị môi trường và clone Spark source

Trong môi trường chroot của Cubic, cần cấu hình lại APT và cập nhật hệ thống.

### Cấu hình repository

```bash
rm /etc/apt/sources.list.d/live.list 2>/dev/null

cat > /etc/apt/sources.list << 'EOF'
deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware
deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware
deb http://security.debian.org/debian-security trixie-security main contrib non-free non-free-firmware
EOF
```

### Cập nhật hệ thống và cài git
```bash
apt update && apt full-upgrade -y
apt install -y git
```

### Clone source
```bash
git clone https://github.com/1clangg/spark.git
cd spark
```

---

## 5. Cài đặt hệ thống Spark

Cấp quyền thực thi cho script cài đặt:
```bash
chmod +x setup.sh
```
Chạy installer:
```bash
sudo ./setup.sh
```

---
## 6. Quy trình cài đặt

Script setup.sh sẽ thực hiện các bước sau:

* Khởi tạo base system
* Cài đặt các gói cần thiết
* Áp dụng cấu hình Spark Linux
* Thiết lập LXQt Desktop Environment
* Cài theme và giao diện hệ thống
* Cấu hình GRUB bootloader
* Tối ưu hiệu năng hệ thống
---
## 7. Cấu hình build ISO

Trước khi build ISO trong Cubic, cần đảm bảo cấu hình:

* Tuyệt đối không sử dụng minimal package hoặc chọn package nào trong chế độ standard package
* Kernel sử dụng: Liquorix 7.x
* Compression: LZO
* Giữ hệ thống tối giản, tránh thêm package không cần thiết

---
## 7.1. Làm ISO có thể khởi động (Bootable)
Sau khi hoàn tất mọi thay đổi trong môi trường chroot, bạn cần bổ sung các thành phần bootloader của Spark Linux trước khi xuất ISO.

### 1. Tải mã nguồn Spark Linux trên máy host

Tải mã nguồn Spark Linux trên hệ thống host:

```bash
git clone https://github.com/1clangg/spark.git
```

Hoặc tải mã nguồn dưới dạng tệp .zip từ GitHub và giải nén.

### 2. Sao chép thư mục boot

Trong mã nguồn Spark Linux, tìm thư mục: `boot/`

Sao chép thư mục này vào thư mục project của Cubic.

### 3. Cấu hình Custom Disk

Trong thư mực project, tìm thư mực tên là `custom-disk`.

Từ thư mục boot/ của Spark Linux, sao chép các tệp vào cấu trúc ISO như sau:

| Nguồn (spark/boot/)       | Đích (project/custom-disk/)  |
| ---------------- | ------------------ |
| boot/grub/* | boot/grub/      |
| boot/isolinux/*     | isolinux/ |

Ghi đè các tệp hiện có nếu được yêu cầu.

## 8. Hoàn tất việc build ISO
Giờ thì, bấm build ISO thôii :>.

**Sau khi hoàn tất:**

* Cubic sẽ đóng gói hệ thống thành ISO bootable
* File ISO sẽ được xuất trong thư mục output của Cubic project


---
## Xử lý lỗi

Trong quá trình build, có thể xảy ra lỗi do môi trường chroot hoặc dependency.

Nếu gặp lỗi:

* Kiểm tra lại apt update
* Đảm bảo ISO base đúng phiên bản yêu cầu
* Xem log Cubic để xác định bước bị lỗi

---

## Lưu ý quan trọng

- Nên thực hiện build trong môi trường máy ảo (VM)
- Không khuyến khích chạy trên hệ thống production
- Spark Linux đang trong quá trình phát triển, cấu trúc có thể thay đổi theo từng phiên bản
- ISO base phải đúng phiên bản được yêu cầu để đảm bảo tương thích

---

## Cấu trúc hệ thống

Spark Linux được tổ chức theo cấu trúc thư mục như sau:

- `boot/` → Cấu hình boot hệ thống
- `etc/` → Cấu hình hệ thống
- `usr/` → File hệ thống nền (base system)
- `root/` → Cấu hình môi trường root
- `plymouth/` → Giao diện splash khi boot
- `scripts/` → Công cụ và script hệ thống
- `setup.sh` → Script cài đặt chính của Spark Linux

---

<p align="center">
  Spark Linux Build System
  <br>
  Made with ❤️ in Vietnam
</p>
