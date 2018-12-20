from django.urls import path
from . import views

app_name = 'adminkt'
urlpatterns = [
  path('', views.home),
  path('manage_lop/', views.data_lop, name = 'manage_lop'),
  path('manage_khoa/', views.manage_khoa, name = 'manage_khoa'),
  path('manage_mon/', views.manage_mon, name = 'manage_mon'),
  path('quan_ly_ki_thi/', views.kithi, name = 'quanly_kithi'),
  path('manage_hocvien/', views.manage_hocvien, name = 'manage_hocvien'),
  path('quan_ly_ki_thi/data', views.data_kithi),
  path('quan_ly_ki_thi/data_mon', views.data_mon),
  path('quan_ly_can_bo/', views.data_canbo, name = 'quanly_canbo'),
  path('thong_ke_ki_thi/', views.thongke, name = 'thongke'),
  path('tao_ki_thi/', views.create_kithi, name = 'tao_ki_thi'),
]
