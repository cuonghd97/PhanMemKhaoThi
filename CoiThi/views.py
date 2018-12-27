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
  return render(request, 'coithi/dsphong.html', data)

# Danh sach cac phong thi
def danhsachphongthi(request):
  datas = []
  try:
    ngayHienTai = datetime.datetime.today().strftime('%Y-%m-%d')
    kyThiHienTai = models.KyThi.objects.get(ngayKetThuc__gte = ngayHienTai, ngayBatDau__lte = ngayHienTai)
    danhSachPhongThi = models.PhongThi.objects.all()
    for item in danhSachPhongThi:
      if item.ngayThi >= kyThiHienTai.ngayBatDau and item.ngayThi <= kyThiHienTai.ngayKetThuc:
        if request.user.id == item.canBoCoi1.id or request.user.id == item.canBoCoi2.id:
          data = {}
          tenLop = item.maLop.tenLop
          monHoc = item.maLop.maMon.tenMon
          idCanBoCoi1 = item.canBoCoi1.id
          idCanBoCoi2 = item.canBoCoi2.id
          idPhong = item.id
          tenPhong = item.tenPhong
          thoiGian = item.gio.strftime('%H:%M')
          thoiGianThi = item.thoiGianThi
          role = item.role
          ngayThi = item.ngayThi

          data.update({'tenlop': tenLop})
          data.update({'monthi': monHoc})
          data.update({'idcanbocoi1': idCanBoCoi1})
          data.update({'idcanbocoi2': idCanBoCoi2})
          data.update({'id': idPhong})
          data.update({'tenphong': tenPhong})
          data.update({'gio': thoiGian})
          data.update({'thoigianthi': thoiGianThi})
          data.update({'role': role})
          data.update({'ngaythi': ngayThi})

          datas.append(data)
  except:
    pass
  return JsonResponse(datas, safe=False)


# Hien thi sinh vien trong phong thi voi id
def danhSachSinhVien(request, a):
  idPhong = models.PhongThi.objects.get(id = a).maLop.id
  # return HttpResponse(idPhong)
  idLop = models.LopHoc.objects.filter(id = idPhong).first()
  dsSV = models.ChiTietLop.objects.filter(maLop = idLop.id)
  data = {'sinhvien': dsSV}

  thoiGian = models.PhongThi.objects.get(id = a).gio.strftime('%H:%M')
  thoiGianThi = models.PhongThi.objects.get(id = a).thoiGianThi
  ngayThi = models.PhongThi.objects.get(id = a).ngayThi.strftime('%Y-%m-%d')

  data.update({'thoigian': thoiGian})
  data.update({'thoigianthi': thoiGianThi})
  data.update({'ngaythi': ngayThi})
  # return HttpResponse(thoiGian)
  return render(request, 'coithi/danhsachsinhvien.html', data)

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
