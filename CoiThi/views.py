from django.shortcuts import render
from django.http import HttpResponse, HttpRequest, HttpResponseRedirect
from django.views import View
from django.contrib.auth import authenticate, login, decorators, logout, get_user
from .models import Nguoi
from django.shortcuts import redirect
from django.conf import settings
# Create your views here.

class LoginClass(View):
  def get(self, request):
    return render(request, 'coithi/login.html')
  def post(self, request):
    username = request.POST.get('username')
    password = request.POST.get('password')
    Nguoi = authenticate(username = username, password = password)
    if Nguoi is None:
      return HttpResponse('Tai khoan khong ton tai')
    login(request, Nguoi)
    return redirect('CoiThi:home')

# Trang Home
def index(request):
  if not request.user.is_authenticated:
    return redirect('CoiThi:login')
  return render(request, 'coithi/model-table.html')

# Logout
def user_logout(request):
  logout(request)
  return redirect('CoiThi:home')
