from django.urls import path
from . import views
from django.contrib.auth.views import LogoutView

app_name = 'CoiThi'

urlpatterns = [
  path('', views.direct),
  path('login/', views.LoginClass.as_view(), name='login'),
  path('danh-sach-ky-thi/', views.DanhSachKyThi, name='danhsachkythi'),
  path('logout/', views.user_logout, name = 'logout'),
  path('data-kythi', views.DataKyThi),
  path('data-phong/<int:idKyThi>', views.DataPhong),
  path('danh-sach-phong/<int:idKyThi>', views.DanhSachPhong, name='danhsachphong'),
  path('data-sv/<int:idPhong>', views.dataSV),
  path('data-sv-coi-thi/<int:idPhong>', views.dataSV_coithi),
  path('data-sv-cham-tu-dong/<int:idPhong>', views.dataSVtudong),
  path('data-sv-phach/<int:idPhong>', views.data_SV_Phach),
  path('danh-sach-phong/phong/<int:idPhong>', views.DanhSachSV),
  path('capnhat-trangthai/', views.updateCoiThi),
  path('cham-tay/<int:a>', views.ChamTay, name='nhapdiembangtay'),
  path('doc-phach/<int:a>', views.DocPhach, name='docPhach'),
  path('cham-tay/post-diem/', views.ChamDiem),
  path('doc-phach/post-phach/', views.NhapPhach),
  path('cham-tu-dong/<int:a>', views.ChamTuDong, name='chamtudong'),
  path('cham-tu-dong/post-bailam/', views.Chamtudongdiem, name='chamtudong'),
  path('info/<int:id>', views.SuaThongTin, name='suathongtin'),
  path('info/post-info/', views.updateinfo),
  path('danh-sach-dap-an/', views.ds_dapan ,name = "list-dapan"),
  path('upload-dapan/', views.uploadBaiThi,name = "upload-dapan"),
  path('danh-sach-de-thi/', views.danhsachdethi),

]
