from django.urls import path
from . import views

app_name = 'adminkt'
urlpatterns = [
  path('', views.home),
  path('manage_lop/', views.data_lop, name = 'manage_lop'),
  path('phancong_canbo/', views.parse_canbo, name = 'parse_canbo'),
  path('quan_ly_ki_thi/', views.data_kithi, name = 'quanly_kithi'),
  path('thong_ke_ki_thi/', views.thongke, name = 'thongke'),
]
