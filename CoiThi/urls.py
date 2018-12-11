from django.urls import path
from . import views
from django.contrib.auth.views import LogoutView

app_name = 'CoiThi'

urlpatterns = [
  path('login/', views.LoginClass.as_view(), name='login'),
  path('quan-ly/', views.index, name = 'home'),
  path('logout/', views.user_logout, name = 'logout')
]
