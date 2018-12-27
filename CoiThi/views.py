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
  # idPhong = models.PhongThi.objects.get(id = a).maLop.id
  # # return HttpResponse(idPhong)
  # idLop = models.LopHoc.objects.filter(id = idPhong).first()
  # dsSV = models.ChiTietLop.objects.filter(maLop = idLop.id)
  # data = {'sinhvien': dsSV}

  data = {}

  thoiGian = models.PhongThi.objects.get(id = a).gio.strftime('%H:%M')
  thoiGianThi = models.PhongThi.objects.get(id = a).thoiGianThi
  ngayThi = models.PhongThi.objects.get(id = a).ngayThi.strftime('%Y-%m-%d')

  data.update({'thoigian': thoiGian})
  data.update({'thoigianthi': thoiGianThi})
  data.update({'ngaythi': ngayThi})
  data.update({'id': a})
  return render(request, 'coithi/danhsachsinhvien.html', data)

# Data danh sach sinh vien
def dataSV(request, a):
  datas = []
  idPhong = models.PhongThi.objects.get(id = a).maLop.id
  # return HttpResponse(idPhong)
  idLop = models.LopHoc.objects.filter(id = idPhong).first()
  dsSV = models.ChiTietLop.objects.filter(maLop = idLop.id)
  # data = {'sinhvien': dsSV}

  thoiGian = models.PhongThi.objects.get(id = a).gio.strftime('%H:%M')
  thoiGianThi = models.PhongThi.objects.get(id = a).thoiGianThi
  ngayThi = models.PhongThi.objects.get(id = a).ngayThi.strftime('%Y-%m-%d')

  # data.update({'thoigian': thoiGian})
  # data.update({'thoigianthi': thoiGianThi})
  # data.update({'ngaythi': ngayThi})
  i = 0
  for item in dsSV:
    data = {}
    i = i + 1
    data.update({'no': i})
    data.update({'tensinhvien': item.maSinhVien.tenSinhVien})
    data.update({'masinhvien': item.maSinhVien.maSinhVien})
    data.update({'tendonvi': item.maSinhVien.maDonVi.tenDonVi})
    data.update({'trangthai': item.trangThai})
    data.update({'lydo': item.lyDo})
    data.update({'ghichu': item.ghiChu})
    data.update({'diem': item.diem})
    data.update({'id': a})
    datas.append(data)

  return JsonResponse(datas, safe=False)

# Cap nhat thong tin coi thi
def updateCoiThi(request, s):
  data = {}
  a = request.POST['idphong']

  thoiGian = models.PhongThi.objects.get(id = a).gio.strftime('%H:%M')
  thoiGianThi = models.PhongThi.objects.get(id = a).thoiGianThi
  ngayThi = models.PhongThi.objects.get(id = a).ngayThi.strftime('%Y-%m-%d')

  data.update({'thoigian': thoiGian})
  data.update({'thoigianthi': thoiGianThi})
  data.update({'ngaythi': ngayThi})
  data.update({'id': a})

  if request.method == 'POST':
    masinhvien = request.POST['masinhvien']
    trangthai = request.POST['trangthai']
    lydo = request.POST['lydo']
    ghichu = request.POST['ghichu']

    print(masinhvien)
    print(trangthai)
    print(lydo)
    print(ghichu)
    idSV = models.SinhVien.objects.filter(maSinhVien = masinhvien).first().id
    lop = models.ChiTietLop.objects.filter(maSinhVien = idSV).first()

    lop.trangThai = trangthai
    lop.lyDo = lydo
    lop.ghiChu = ghichu
    lop.save()
  return render(request, 'coithi/danhsachsinhvien.html')

# Trang cham thi
def chamthi(request):
  if not request.user.is_authenticated:
    return redirect('CoiThi:login')
  return render(request, 'chamthi/danhsachphong.html')

# Logout
def user_logout(request):
  logout(request)
  return redirect('CoiThi:login')

# Cham thi

# Danh sach phong cham thi

def dsPhongCham(request):
  datas = []
  ngayHienTai = datetime.datetime.today().strftime('%Y-%m-%d')
  kyThiHienTai = models.KyThi.objects.get(ngayKetThuc__gte = ngayHienTai, ngayBatDau__lte = ngayHienTai)
  danhSachPhongCham = models.ChamThi.objects.all()
  i = 0
  for item in danhSachPhongCham:
    if request.user.id == item.canBoCham1.id or request.user.id == item.canBoCham2.id:
      data = {}

      i = i + 1
      tenCanBoCoi1 = item.canBoCham1.tenCanBo
      tenCanBoCoi2 = item.canBoCham2.tenCanBo
      ngayCham = item.ngayCham
      hinhThucThi = item.maPhong.hinhThucThi
      tenMon = item.maPhong.maLop.maMon.tenMon
      tenPhong = item.maPhong.tenPhong
      idPhong = item.maPhong.id

      data.update({'tencanbocham1': tenCanBoCoi1})
      data.update({'tencanbocham2': tenCanBoCoi2})
      data.update({'ngaycham': ngayCham})
      data.update({'hinhthucthi': hinhThucThi})
      data.update({'tenmon': tenMon})
      data.update({'tenphong': tenPhong})
      data.update({'idphong': idPhong})
      data.update({'no': i})

      datas.append(data)
  return JsonResponse(datas, safe=False)


def ChamTay(request, a):
  data = {'id': a}
  return render(request, 'chamthi/chamtay.html', data)

def ChamTuDong(request, a):
  return HttpResponse('cham tu dong')
