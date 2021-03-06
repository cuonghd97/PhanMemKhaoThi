from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils import timezone
import datetime
# Create your models here.

# Bảng khóa học
class KhoaHoc(models.Model):
  tenKhoaHoc = models.TextField(max_length=200, null=True)
  he = models.TextField(max_length=200, null=True)

  class Meta:
    managed = True
    db_table = 'khoa_hoc'

# Bảng Môn
class Mon(models.Model):
  maMon = models.CharField(max_length = 20, unique = True, null=True)
  tenMon = models.TextField(max_length = 200, null=True)

  class Meta:
    managed = True
    db_table = 'mon'

# Bảng Đơn Vị
class DonVi(models.Model):
  tenDonVi = models.TextField(max_length=200, null=True)
  maDonVi = models.CharField(max_length=100, null=True)

  class Meta:
    managed = True
    db_table = 'don_vi'

# Bảng Cán Bộ
class CanBo(AbstractUser):
  tenCanBo = models.TextField(max_length=200, null=True)
  maCanBo = models.CharField(max_length=100, null = True)
  quanHam = models.TextField(max_length=200, null=True)
  maDonVi = models.ForeignKey(DonVi, models.SET_NULL, null=True)
  position = models.IntegerField(default=0)
  # position = 0: Admin
  # position = 1: Coi Thi
  # position = 2: Cham Thi
  class Meta:
    managed = True
    db_table = 'can_bo'

# Bảng Sinh Viên
class SinhVien(models.Model):
  maSinhVien = models.CharField(max_length=100, null=True)
  tenSinhVien = models.TextField(max_length=200, null=True)
  ngaySinh = models.DateField(datetime.date.today())
  maDonVi = models.ForeignKey(DonVi, models.SET_NULL, null=True)

  class Meta:
    managed = True
    db_table = 'sinh_vien'

# Bảng Lớp Học
class LopHoc(models.Model):
  maLop = models.CharField(max_length=100, null=True)
  tenLop = models.TextField(max_length=200, null=True)
  maKhoa = models.ForeignKey(KhoaHoc, models.CASCADE, null=True)
  maMon = models.ForeignKey(Mon, models.CASCADE, null=True)

  class Meta:
    managed = True
    db_table = 'lop_hoc'

class Log_diem(models.Model):
  diemCu = models.FloatField(default=0)
  diemMoi = models.FloatField(default=0)
  nguoiSua = models.ForeignKey(CanBo, models.SET_NULL, related_name='nguoisua', null=True)
  ngaySua = models.DateTimeField(auto_now_add=True)
  lyDoSua = models.TextField(max_length=300, null=True)
  class Meta:
    managed = True
    db_table = 'log_diem'

# Bảng Chi Tiết Lớp
class ChiTietLop(models.Model):
  maLop = models.ForeignKey(LopHoc, models.CASCADE, null=True)
  maSinhVien = models.ForeignKey(SinhVien, models.CASCADE, null=True)
  diem = models.FloatField(default=0)
  trangThai = models.TextField(max_length=200, null=True)
  lyDo = models.TextField(max_length=200, null=True)
  ghiChu = models.TextField(max_length=200, null=True)
  soBaoDanh = models.CharField(max_length=100, null=True)
  maDe = models.CharField(max_length=100, null=True)
  baiLam = models.FileField(upload_to='BaiLam/',null=True)
  maPhach = models.CharField(max_length = 30,null = True)
  log_sua_diem = models.ManyToManyField(Log_diem,related_name='log_sua_diem',db_table='log_sua_diem')

  class Meta:
    managed = True
    db_table = 'chi_tiet_lop'

# Bảng Chi Tiết Khóa
class ChiTietKhoa(models.Model):
  maKhoa = models.ForeignKey(KhoaHoc, models.CASCADE, null=True)
  maLop = models.ForeignKey(LopHoc, models.CASCADE, null=True)

  class Meta:
    managed = True
    db_table = 'chi_tiet_khoa'

# Bảng Kỳ Thi
class KyThi(models.Model):
  tenKyThi = models.TextField(max_length=200, null=True)
  ngayBatDau = models.DateField(default=timezone.now)
  ngayKetThuc = models.DateField(default=timezone.now)

  class Meta:
    managed = True
    db_table = 'ky_thi'

# Phòng Thi
class PhongThi(models.Model):
  tenPhong = models.TextField(max_length=100, null=True)
  viTri = models.CharField(max_length=100, null=True)
  ngayThi = models.DateField(default=timezone.now)
  gio = models.TimeField(default=timezone.now)
  maLop = models.ForeignKey(LopHoc, models.SET_NULL, null=True)
  canBoCoi1 = models.ForeignKey(CanBo, models.SET_NULL, related_name='canBoCoi1', null=True)
  canBoCoi2 = models.ForeignKey(CanBo, models.SET_NULL, related_name='canBoCoi2', null=True)
  maKyThi = models.ForeignKey(KyThi, models.SET_NULL, null=True)
  thoiGianThi = models.IntegerField(default=0)
  role = models.IntegerField(default=1)
  hinhThucThi = models.CharField(max_length = 100, null=True)

  class Meta:
    managed = True
    db_table = 'phong_thi'

# Bảng Chấm Thi
class ChamThi(models.Model):
  maPhong = models.ForeignKey(PhongThi, models.CASCADE, null=True)
  canBoCham1 = models.ForeignKey(CanBo, models.SET_NULL, related_name='canBoCham1', null=True)
  canBoCham2 = models.ForeignKey(CanBo, models.SET_NULL, related_name='canBoCham2', null=True)
  ngayCham = models.DateField(default=timezone.now)

  class Meta:
    managed = True
    db_table = 'cham_thi'

# Bang dap an
class DapAn(models.Model):
  maDe = models.CharField(max_length=100, null=True)
  dapAn = models.FileField(upload_to='DapAn')
  makithi = models.ForeignKey(KyThi, models.SET_NULL,null=True)
  class Meta:
    managed = True
    db_table = 'dap_an'

