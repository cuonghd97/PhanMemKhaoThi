from django.urls import path
from . import views
from django.contrib.auth.views import LogoutView

app_name = 'CoiThi'

urlpatterns = [
  path('', views.direct),
  path('login/', views.LoginClass.as_view(), name='login'),
  path('danh-sach-phong/', views.coithi, name = 'coithi'),
  path('cham-thi/', views.chamthi, name = 'chamthi'),
  path('logout/', views.user_logout, name = 'logout'),
  path('ds-phongthi', views.danhsachphongthi),
  path('coithi/<int:a>', views.danhSachSinhVien, name = 'danhsachsv'),
  path('data-sv/<int:a>', views.dataSV),
  path('capnhat-trangthai/<str:s>', views.updateCoiThi),
  path('ds-phongcham', views.dsPhongCham),
  path('cham-thi/chamtay/<int:a>', views.ChamTay),
  path('cham-thi/chamtay/post-tay', views.ChamDiem),
  path('cham-thi/chamtudong/<int:a>', views.ChamTuDong)
]
