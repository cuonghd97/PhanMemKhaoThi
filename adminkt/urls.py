from django.urls import path
from . import views

app_name = 'adminkt'
urlpatterns = [
  path('', views.home),
  path('manage_lop/', views.data_lop, name = 'manage_lop'),
  path('phan_cong_canbo/', views.parse_canbo, name = 'parse_canbo'),
  path('quan_ly_ki_thi/', views.kithi, name = 'quanly_kithi'),
  path('quan_ly_ki_thi/data', views.data_kithi),
  path('quan_ly_ki_thi/data_mon', views.data_mon),
  path('quan_ly_can_bo/', views.data_canbo, name = 'quanly_canbo'),
  path('thong_ke_ki_thi/', views.thongke, name = 'thongke'),
  path('tao_ki_thi/', views.create_kithi, name = 'tao_ki_thi'),
]
