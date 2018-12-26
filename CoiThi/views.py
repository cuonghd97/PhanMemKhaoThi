from django.shortcuts import render
from django.http import HttpResponse, HttpRequest, HttpResponseRedirect, JsonResponse
from django.views import View
from django.contrib.auth import authenticate, login, decorators, logout, get_user
from .models import CanBo
from django.shortcuts import redirect
from django.conf import settings
import json
from django.core.serializers import serialize
from . import models
import datetime
# Create your views here.

# Redirect login
def direct(request):
  return redirect('CoiThi:login')

# Login
class LoginClass(View):
  def get(self, request):
    return render(request, 'coithi/login.html')
  def post(self, request):
    username = request.POST.get('username')
    password = request.POST.get('password')
    CanBo = authenticate(username = username, password = password)
    if CanBo is None:
      return redirect('CoiThi:login')
    login(request, CanBo)
    if CanBo.position == 1:
      return redirect('CoiThi:coithi')
    elif CanBo.position == 2:
      return redirect('CoiThi:chamthi')
    elif CanBo.position == 0:
      return redirect('adminkt:trangchu')

# Trang coi thi
def coithi(request):
  if not request.user.is_authenticated:
    return redirect('CoiThi:login')
  data = {'name': request.user.tenCanBo}
  return render(request, 'coithi/coithi.html', data)

# Danh sach cac phong thi
def danhsachphongthi(request):
  ngayHienTai = datetime.datetime.today().strftime('%Y-%m-%d')
  kyThiHienTai = models.KyThi.objects.filter(ngayKetThuc__gte = ngayHienTai, ngayBatDau__lte = ngayHienTai).first()
  danhSachPhongThi = models.PhongThi.objects.all()
  datas = []
  for item in danhSachPhongThi:
    if item.ngayThi >= kyThiHienTai.ngayBatDau and item.ngayThi <= kyThiHienTai.ngayKetThuc:
      if request.user.id == item.canBoCoi1.id or request.user.id == item.canBoCoi2.id:
        data = {}
        tenLop = item.maLop.maLop.tenLop
        maLop = item.maLop.maLop.id
        monHoc = item.maLop.maLop.maMon.tenMon
        idCanBoCoi1 = item.canBoCoi1.id
        idCanBoCoi2 = item.canBoCoi2.id
        idPhong = item.id
        tenPhong = item.tenPhong
        thoiGian = item.gio
        data.update({'tenlop': tenLop})
        data.update({'malop': maLop})
        data.update({'monthi': monHoc})
        data.update({'idcanbocoi1': idCanBoCoi1})
        data.update({'idcanbocoi2': idCanBoCoi2})
        data.update({'id': idPhong})
        data.update({'tenphong': tenPhong})
        data.update({'gio': thoiGian})
        datas.append(data)
  # Dua ra danh sach phong thi va mon thi khong trung nhau
  b = []
  for i in range(0, len(datas)):
    if datas[i] not in datas[i+1:]:
      b.append(datas[i])
  return JsonResponse(b, safe=False)

# Data danh sach chi tiet phong thi
def dataPhongThi(request):
  ngayHienTai = datetime.datetime.today().strftime('%Y-%m-%d')
  kyThiHienTai = models.KyThi.objects.get(ngayKetThuc__gte = ngayHienTai, ngayBatDau__lte = ngayHienTai)
  danhSachPhongThi = models.PhongThi.objects.all()
  datas = []
  for item in danhSachPhongThi:
    if item.ngayThi >= kyThiHienTai.ngayBatDau and item.ngayThi <= kyThiHienTai.ngayKetThuc:
      data = {}
      tenSinhVien = item.maLop.maSinhVien.tenSinhVien
      diem = item.maLop.diem
      tenCanBoCoi1 = item.canBoCoi1.tenCanBo
      tenCanBoCoi2 = item.canBoCoi2.tenCanBo
      ngayThi = item.ngayThi
      ngayBatDau = item.maKyThi.ngayBatDau
      ngayKetThuc = item.maKyThi.ngayKetThuc
      trangThai = item.maLop.trangThai
      lyDo = item.maLop.lyDo
      ghiChu = item.maLop.ghiChu
      tenLop = item.maLop.maLop.tenLop
      monHoc = item.maLop.maLop.maMon.tenMon
      quanHamCanBo1 = item.canBoCoi1.quanHam
      quanHamCanBo2 = item.canBoCoi2.quanHam
      donViCanBo1 = item.canBoCoi1.maDonVi.tenDonVi
      donViCanBo2 = item.canBoCoi2.maDonVi.tenDonVi
      data.update({'tensinhvien': tenSinhVien})
      data.update({'diem': diem})
      data.update({'ngaythi': ngayThi})
      data.update({'ngaybatdau': ngayBatDau})
      data.update({'ngayketthuc': ngayKetThuc})
      data.update({'trangthai': trangThai})
      data.update({'lydo': lyDo})
      data.update({'ghichu': ghiChu})
      data.update({'tenlop': tenLop})
      data.update({'monhoc': monHoc})
      data.update({'tencanbocoi1': tenCanBoCoi1})
      data.update({'quanhamcanbo1': quanHamCanBo1})
      data.update({'donvicanbo1': donViCanBo1})
      data.update({'tencanbocoi2': tenCanBoCoi2})
      data.update({'quanhamcanbo2': quanHamCanBo2})
      data.update({'donvicanbo2': donViCanBo2})
      datas.append(data)
  return JsonResponse(datas, safe=False)

# Trang cham thi
def chamthi(request):
  if not request.user.is_authenticated:
    return redirect('CoiThi:login')
  return render(request, 'coithi/chamthi.html')

# Logout
def user_logout(request):
  logout(request)
  return redirect('CoiThi:login')

# Base
# def base(request):
#   return render(request, 'base.html')

# Data json don vi
# def donvidata(request):
#   donvi = models.DonVi.objects.all().values()
#   listdonvi = list(donvi)
#   return JsonResponse(listdonvi, safe=False)
# Quan ly don vi
# class QuanLyDonVi(View):
#   def get(self, request):
#     return render(request, 'coithi/quanlydonvi.html')
#   def post(self, request):
#     madonvi = request.POST.get('MaDonVi')
#     tedonvi = request.POST.get('TenDonVi')
#     data = models.DonVi.objects.filter(MaDonVi = madonvi).get()
#     data.MaDonVi = madonvi
#     data.TenDonVi = tedonvi
#     data.save()
#     return render(request, 'coithi/quanlydonvi.html')
# def xoadonvi(request, var):
#   madonvi = request.POST.get('MaDonVi')
#   models.DonVi.objects.filter(MaDonVi = madonvi).get().delete()
#   return render(request, 'coithi/quanlydonvi.html')
