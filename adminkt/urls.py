from django.urls import path
from . import views

app_name = 'adminkt'
urlpatterns = [
  path('', views.home,name = 'trangchu'),
  path('manage_lop/', views.manage_class, name = 'manage_lop'),
  path('manage_donvi/', views.manage_donvi, name = 'manage_donvi'),
  path('manage_donvi_data/', views.manage_donvi_data),
  path('manage_lop_data/', views.manage_class_data),
  path('manage_student/data_<str:lop>', views.manage_student_data),
  path('manage_add_student/', views.manage_add_student),
  path('manage_khoa/', views.manage_khoa, name = 'manage_khoa'),
  path('manage_khoa_data/', views.manage_khoa_data),
  path('manage_mon/', views.manage_mon, name = 'manage_mon'),
  path('manage_mon_data/', views.manage_mon_data),
  path('quan_ly_ki_thi/', views.manager_kithi, name = 'quanly_kithi'),
  path('manage_kithi/data_<str:kithi>', views.manage_ki_thi_data),
  path('manage_hocvien/', views.manage_hocvien, name = 'manage_hocvien'),
  path('manage_hocvien_data/', views.manage_hocvien_data),
  path('quan_ly_ki_thi_data/', views.manage_kithi_data),
  path('manage_can_bo/', views.manager_canbo, name = 'quanly_canbo'),
  path('manage_can_bo_data/', views.manage_canbo_data),
  path('thong_ke_ki_thi/', views.thongke, name = 'thongke'),
  path('manage_add_kithi/', views.manage_add_kithi),
]
