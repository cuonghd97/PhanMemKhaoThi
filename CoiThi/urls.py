from django.urls import path
from . import views
from django.contrib.auth.views import LogoutView

app_name = 'CoiThi'

urlpatterns = [
  path('', views.direct),
  path('login/', views.LoginClass.as_view(), name='login'),
  path('coi-thi/', views.coithi, name = 'coithi'),
  path('cham-thi/', views.chamthi, name = 'chamthi'),
  path('logout/', views.user_logout, name = 'logout'),
  path('data-phongthi', views.dataPhongThi),
  path('ds-phongthi', views.danhsachphongthi)
]
