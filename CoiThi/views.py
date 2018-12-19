from django.shortcuts import render
from django.http import HttpResponse, HttpRequest, HttpResponseRedirect, JsonResponse
from django.views import View
from django.contrib.auth import authenticate, login, decorators, logout, get_user
from .models import CanBo
from django.shortcuts import redirect
from django.conf import settings
import json
from django.core.serializers import serialize
from . import models
import datetime
# Create your views here.

class LoginClass(View):
  def get(self, request):
    return render(request, 'coithi/login.html')
  def post(self, request):
    username = request.POST.get('username')
    password = request.POST.get('password')
    CanBo = authenticate(username = username, password = password)
    if CanBo is None:
      return redirect('CoiThi:login')
    login(request, CanBo)
    if CanBo.position == 1:
      return redirect('CoiThi:coithi')
    elif CanBo.position == 2:
      return redirect('CoiThi:chamthi')

# Trang coi thi
def coithi(request):
  if not request.user.is_authenticated:
    return redirect('CoiThi:login')
  return render(request, 'coithi/coithi.html')

# Trang cham thi
def chamthi(request):
  if not request.user.is_authenticated:
    return redirect('CoiThi:login')
  return render(request, 'coithi/chamthi.html')

# Logout
def user_logout(request):
  logout(request)
  return redirect('CoiThi:login')

# Base
# def base(request):
#   return render(request, 'base.html')

# Data json don vi
# def donvidata(request):
#   donvi = models.DonVi.objects.all().values()
#   listdonvi = list(donvi)
#   return JsonResponse(listdonvi, safe=False)
# Quan ly don vi
# class QuanLyDonVi(View):
#   def get(self, request):
#     return render(request, 'coithi/quanlydonvi.html')
#   def post(self, request):
#     madonvi = request.POST.get('MaDonVi')
#     tedonvi = request.POST.get('TenDonVi')
#     data = models.DonVi.objects.filter(MaDonVi = madonvi).get()
#     data.MaDonVi = madonvi
#     data.TenDonVi = tedonvi
#     data.save()
#     return render(request, 'coithi/quanlydonvi.html')
# def xoadonvi(request, var):
#   madonvi = request.POST.get('MaDonVi')
#   models.DonVi.objects.filter(MaDonVi = madonvi).get().delete()
#   return render(request, 'coithi/quanlydonvi.html')
