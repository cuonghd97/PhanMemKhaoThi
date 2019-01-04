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
  path('danh-sach-phong/phong/<int:idPhong>', views.DanhSachSV),
  path('capnhat-trangthai/', views.updateCoiThi),
  path('cham-tay/<int:a>', views.ChamTay, name='nhapdiembangtay'),
  path('cham-tay/post-diem/', views.ChamDiem)
]
