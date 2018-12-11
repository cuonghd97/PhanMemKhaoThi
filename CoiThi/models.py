from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils import timezone
import datetime
# Create your models here.

# Bảng lớp học
# class LopHoc(models.Model):
#   MaLop = models.CharField(max_length = 20, unique = True)
#   TenLop = models.TextField(max_length = 200)
#   KhoaHoc = models.TextField(max_length = 200)

# Bảng Môn
class Mon(models.Model):
  MaMon = models.CharField(max_length = 20, unique = True)
  TenMon = models.TextField(max_length = 200)

# Bảng đơn vị
class DonVi(models.Model):
  MaDonVi = models.CharField(max_length = 20, unique = True)
  TenDonVi = models.TextField(max_length = 200)
  QuanSo = models.IntegerField(default=0)

# Bảng Người gồm Học viên và Cán bộ
class Nguoi(AbstractUser):
  Ma = models.CharField(max_length = 20, unique = True)
  Ten = models.TextField(max_length = 200)
  CapHam = models.TextField(max_length=200, default='')
  NgaySinh = models.DateField(default=timezone.now)
  GioiTinh = models.TextField(max_length = 200)
  ChucVu = models.TextField(max_length = 200)
  role = models.IntegerField
  class Meta:
    managed = True
    db_table = 'Nguoi'

# Bảng Kỳ thi
class KyThi(models.Model):
  MaKyThi = models.CharField(max_length = 20, unique = True)
  NgayThi = models.DateField(default=timezone.now)
  MonHoc = models.ForeignKey(Mon, models.CASCADE)
  KhoaHoc = models.TextField(max_length=200)

# Bảng Phòng thi
class PhongThi(models.Model):
  MaPhong = models.CharField(max_length = 20, unique = True)
  MaKyThi = models.ForeignKey(KyThi, on_delete = models.CASCADE, null = True)
  HinhThucThi = models.TextField(max_length = 200)
  MaCanBoCoi1 = models.CharField(max_length = 20)
  MaCanBoCoi2 = models.CharField(max_length = 20)
  MaCanBoCham1 = models.CharField(max_length = 20)
  MaCanBoCham2 = models.CharField(max_length = 20)
  NgayCham  = models.DateField(default=timezone.now)

# Bảng Chi tiết phòng
class ChiTietPhong(models.Model):
  SBD = models.CharField(max_length = 20, unique = True)
  MaPhong = models.ForeignKey(PhongThi, on_delete = models.CASCADE, null = True)
  MaHocVien = models.ForeignKey(Nguoi, on_delete = models.CASCADE, null = True)
  TrangThai = models.TextField(max_length = 200)
  Diem = models.IntegerField
  GhiChu = models.TextField(max_length = 200)

# Bảng chi tiết lớp
# class ChiTietLop(models.Model):
#   MaLop = models.ForeignKey(LopHoc, on_delete = models.CASCADE, null = True)
#   MaHocVien = models.ForeignKey(Nguoi, on_delete = models.CASCADE, null = True)
#   Mon = models.ForeignKey(Mon, on_delete = models.CASCADE, null = True)
#   DonVi = models.ForeignKey(DonVi, on_delete = models.CASCADE, null = True)
