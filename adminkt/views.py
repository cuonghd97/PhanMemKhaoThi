from django.shortcuts import render
from django.http import HttpResponse, HttpRequest, HttpResponseRedirect,JsonResponse
from django.views import View
from django.contrib.auth import authenticate, login, decorators, logout, get_user
from django.shortcuts import redirect
from django.conf import settings
from CoiThi import models
# Create your views here.
def home(request):
    # user = request.user
    return render(request, 'adminkt/index.html')
    # if user.is_authenticated and user.chucvu == 1:
    #     content = {'username': mark_safe(json.dumps(user.username)),
    #                'list_lop': ChiTietLop.objects.filter(myuser_id=user)}
    #     return render(request, 'adminkt/index.html', content)
    # else:
    #     return HttpResponseRedirect('/')

def data_lop(request):
    # LopHoc = request.LopHoc
    return render(request, 'adminkt/manager_lop.html')
    
def parse_canbo(request):
    return render(request,'adminkt/parse_canbo.html')

def kithi(request):
    return render(request,'adminkt/manager_kithi.html')

def data_canbo(request):
    return render(request,'adminkt/manager_canbo.html')

def thongke(request):
    return render(request,'adminkt/thongke.html')

def data_kithi(request):
    tblkithi = models.KyThi.objects.all().values()
    listdata = list(tblkithi)
    return JsonResponse(listdata,safe=False)
