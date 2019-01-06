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
    return render(request, 'login.html')
  def post(self, request):
    username = request.POST.get('username')
    password = request.POST.get('password')
    CanBo = authenticate(username = username, password = password)
    if CanBo is None:
      return redirect('CoiThi:login')
    login(request, CanBo)
    if CanBo.position == 1:
      return redirect('CoiThi:danhsachkythi')
    elif CanBo.position == 0:
      return redirect('adminkt:trangchu')

# Danh sach ky thi
def DanhSachKyThi(request):
  if not request.user.is_authenticated:
    return redirect('CoiThi:login')
  data = {'name': request.user.tenCanBo}
  data.update({'id': request.user.id})
  return render(request, 'danhsachkythi.html', data)

# Danh sach ky thi hien tai
def DataKyThi(request):
  datas = []
  i = 0
  ngayHienTai = datetime.datetime.today().strftime('%Y-%m-%d')
  kyThiHienTai = models.KyThi.objects.filter(ngayKetThuc__gte = ngayHienTai, ngayBatDau__lte = ngayHienTai)
  for item in kyThiHienTai:
    data = {}
    i = i + 1
    data.update({'makythi': item.id})
    data.update({'tenkythi': item.tenKyThi})
    data.update({'ngaybatdau': item.ngayBatDau})
    data.update({'ngayketthuc': item.ngayKetThuc})
    data.update({'no': i})

    datas.append(data)
  return JsonResponse(datas, safe=False)

# Danh sach cac phong thi
def DataPhong(request, idKyThi):
  datas = []
  try:
    # ngayHienTai = datetime.datetime.today().strftime('%Y-%m-%d')
    # kyThiHienTai = models.KyThi.objects.get(id = idKyThi)
    danhSachPhongThi = models.PhongThi.objects.filter(maKyThi = idKyThi)
    for item in danhSachPhongThi:
      if request.user.id == item.canBoCoi1.id or request.user.id == item.canBoCoi2.id:
        data = {}
        tenLop = item.maLop.tenLop
        monHoc = item.maLop.maMon.tenMon
        idCanBoCoi1 = item.canBoCoi1.id
        idCanBoCoi2 = item.canBoCoi2.id
        tenCanBoCoi1 = item.canBoCoi1.tenCanBo
        tenCanBoCoi2 = item.canBoCoi2.tenCanBo
        idPhong = item.id
        tenPhong = item.tenPhong
        thoiGian = item.gio.strftime('%H:%M')
        thoiGianThi = item.thoiGianThi
        role = item.role
        ngayThi = item.ngayThi

        data.update({'tenlop': tenLop})
        data.update({'monthi': monHoc})
        data.update({'idcanbocoi1': idCanBoCoi1})
        data.update({'tencanbocoi1': tenCanBoCoi1})
        data.update({'idcanbocoi2': idCanBoCoi2})
        data.update({'tencanbocoi2': tenCanBoCoi2})
        data.update({'id': idPhong})
        data.update({'tenphong': tenPhong})
        data.update({'gio': thoiGian})
        data.update({'thoigianthi': thoiGianThi})
        data.update({'role': role})
        data.update({'ngaythi': ngayThi})
        data.update({'coithi': 1})
        data.update({'idphong': idPhong})

        datas.append(data)
      phongCham = models.ChamThi.objects.filter(maPhong = item.id).first()
      if phongCham.canBoCham1.id == request.user.id or phongCham.canBoCham2.id == request.user.id:
        data = {}

        tenLop = item.maLop.tenLop
        monHoc = item.maLop.maMon.tenMon
        idCanBoCham1 = phongCham.canBoCham1.id
        tenCanBoCham1 = phongCham.canBoCham1.tenCanBo
        idCanBoCham2 = phongCham.canBoCham2.id
        tenCanBoCham2 = phongCham.canBoCham2.tenCanBo
        idPhong = item.id
        tenPhong = item.tenPhong
        thoiGian = item.gio.strftime('%H:%M')
        thoiGianThi = item.thoiGianThi
        role = item.role
        ngayThi = item.ngayThi
        ngayCham = phongCham.ngayCham

        data.update({'tenlop': tenLop})
        data.update({'monthi': monHoc})
        data.update({'idcanbocham1': idCanBoCham1})
        data.update({'tencanbocham1': tenCanBoCham1})
        data.update({'idcanbocham2': idCanBoCham2})
        data.update({'tencanbocham2': tenCanBoCham2})
        data.update({'id': idPhong})
        data.update({'tenphong': tenPhong})
        data.update({'gio': thoiGian})
        data.update({'thoigianthi': thoiGianThi})
        data.update({'role': role})
        data.update({'ngaythi': ngayThi})
        data.update({'coithi': 0})
        data.update({'idphong': idPhong})
        data.update({'ngaycham': ngayCham})

        datas.append(data)
  except:
    pass
  return JsonResponse(datas, safe=False)

# Danh sach phong
def DanhSachPhong(request, idKyThi):
  data = {'idKyThi': idKyThi}
  data.update({'name': request.user.tenCanBo})
  return render(request, 'danhsachphong.html', data)

# Data danh sach sinh vien
def dataSV(request, idPhong):
  datas = []
  Lop = models.PhongThi.objects.get(id = idPhong).maLop
  phong = models.PhongThi.objects.get(id = idPhong)
  phong.role = 0
  phong.save()
  DSSV = models.ChiTietLop.objects.filter(maLop = Lop.id)
  i = 0

  for item in DSSV:
    data = {}
    i = i + 1

    data.update({'tensinhvien': item.maSinhVien.tenSinhVien})
    ngayHienTai = datetime.datetime.now().date()
    ngaySinh = item.maSinhVien.ngaySinh
    tuoi = ngayHienTai - ngaySinh
    data.update({'tuoi': int(tuoi.days / 365.25)})
    data.update({'tendonvi': item.maSinhVien.maDonVi.tenDonVi})
    data.update({'masinhvien': item.maSinhVien.maSinhVien})
    data.update({'idsv': item.maSinhVien.id})
    data.update({'trangthai': item.trangThai})
    data.update({'lydo': item.lyDo})
    data.update({'ghichu': item.ghiChu})
    data.update({'diem': item.diem})
    data.update({'no': i})
    data.update({'idlop': Lop.id})
    data.update({'mamon': Lop.maMon.id})
    data.update({'monhoc': Lop.maMon.tenMon})

    datas.append(data)
  return JsonResponse(datas, safe=False)

# Danh sach sinh vien trong 1 phong
def DanhSachSV(request, idPhong):
  data = {}

  thoiGian = models.PhongThi.objects.get(id = idPhong).gio.strftime('%H:%M')
  thoiGianThi = models.PhongThi.objects.get(id = idPhong).thoiGianThi
  ngayThi = models.PhongThi.objects.get(id = idPhong).ngayThi.strftime('%Y-%m-%d')
  tenmon = models.PhongThi.objects.get(id = idPhong).maLop.maMon.tenMon

  data.update({'thoigian': thoiGian})
  data.update({'thoigianthi': thoiGianThi})
  data.update({'ngaythi': ngayThi})
  data.update({'tenmon': tenmon})
  data.update({'idPhong': idPhong})
  data.update({'name': request.user.tenCanBo})
  return render(request, 'danhsachsinhvien.html', data)

# Cap nhat thong tin coi thi
def updateCoiThi(request):
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

    idPhong = models.PhongThi.objects.get(id = request.POST['idphong']).maLop.id
    lopID = models.LopHoc.objects.filter(maMon = request.POST['mamon']).first().id
    idSV = models.SinhVien.objects.filter(maSinhVien = masinhvien).first().id
    lop = models.ChiTietLop.objects.filter(maSinhVien = idSV).filter(maLop = lopID).first()
    if trangthai == '0':
      lop.trangThai = ''
    elif trangthai == '1':
      lop.trangThai = 'Hoãn thi'
    else:
      lop.trangThai = 'Vi phạm'
    lop.lyDo = lydo
    lop.ghiChu = ghichu
    lop.save()
  return render(request, 'danhsachsinhvien.html', data)

# Trang sua thong tin
def SuaThongTin(request, id):
  data = {'id': id}
  data.update({'name': request.user.tenCanBo})
  data.update({'tencanbo': request.user.tenCanBo})
  return render(request, 'suathongtin.html', data)

# Ham sua thong tin
def updateinfo(request):
  matkhaumoi = request.POST['matkhaumoi']
  mknhaplai = request.POST['nhaplaimatkhau']
  print(matkhaumoi)
  username = request.user.username
  idcanbo = request.POST['idcanbo']
  if request.POST['nhaplaimatkhau'] != 'notnull':
    request.user.set_password(matkhaumoi)
    request.user.tenCanBo = request.POST['ten']

    request.user.save()

  request.user.tenCanBo = request.POST['ten']

  request.user.save()
  CanBo = authenticate(username = username, password = matkhaumoi)
  login(request, CanBo)
  return HttpResponse('done')

# Logout
def user_logout(request):
  logout(request)
  return redirect('CoiThi:login')


def ChamTay(request, a):
  data = {'id': a}
  data.update({'name': request.user.tenCanBo})
  return render(request, 'nhapdiembangtay.html', data)

def ChamDiem(request):
  idLop = request.POST['idlop']
  idSV = request.POST['idsv']
  SV = models.ChiTietLop.objects.filter(maLop = idLop).filter(maSinhVien = idSV).first()
  SV.diem = request.POST.get('diem')
  SV.save()
  return HttpResponse('done')

def ChamTuDong(request, a):
  data = {'id': a}
  return render(request, 'chamthi/chamtudong.html', data)
