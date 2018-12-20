from django.shortcuts import render
from django.http import HttpResponse, HttpRequest, HttpResponseRedirect,JsonResponse
from django.views import View
from django.contrib.auth import authenticate, login, decorators, logout, get_user
from django.shortcuts import redirect
from django.conf import settings
import json
from CoiThi.models import *
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
    if not request.user.is_authenticated:
        return redirect('CoiThi:login')
    return render(request, 'adminkt/manager_lop.html')
    
def manage_khoa(request):
    if not request.user.is_authenticated:
        return redirect('CoiThi:login')
    return render(request,'adminkt/manage_khoa.html')

def manage_mon(request):
    if not request.user.is_authenticated:
        return redirect('CoiThi:login')
    return render(request,'adminkt/manage_mon.html')

def kithi(request):
    # if not request.user.is_authenticated:
    #     return redirect('CoiThi:login')
    return render(request,'adminkt/manager_kithi.html')

def manage_hocvien(request):
    # if not request.user.is_authenticated:
    #     return redirect('CoiThi:login')
    return render(request,'adminkt/manage_hocvien.html')

def create_kithi(request):
    return render(request,'adminkt/create_kithi.html')
def data_canbo(request):
    if not request.user.is_authenticated:
        return redirect('CoiThi:login')
    return render(request,'adminkt/manager_canbo.html')

def thongke(request):
    if not request.user.is_authenticated:
        return redirect('CoiThi:login')
    return render(request,'adminkt/thongke.html')
def data_mon(request):
    return False
def manager_kithi(request):
    user = request.user
    if user.is_authenticated:
        if request.method == 'POST':
            if 'delete' in request.POST:
                KyThi.objects.get(id=request.POST['delete']).delete()
            else:
                if request.POST['kieu'] == 'new':
                    try:
                        KyThi.objects.create(MaKyThi=request.POST['ten'], lop=request.POST['lop'], mo_ta=request.POST['mo_ta'])
                    except:
                        pass
                else:
                    m = Mon.objects.get(id=request.POST['id'])
                    m.ten = request.POST['ten']
                    m.lop = request.POST['lop']
                    m.mo_ta = request.POST['mo_ta']
                    m.save()
        return render(request, 'adminsc/manage_mon.html', content)
    else:
        return HttpResponseRedirect('/')
def data_kithi(request):
    # if not request.user.is_authenticated:
    #     return redirect('CoiThi:login')
    tblkithi = KyThi.objects.all()
    tblmon =  Mon.objects.all()
    # listdata = list(tblkithi)
    data = []
    for kithi in tblkithi:
        makithi = '<p id="makithi_{0}">{1}</p>'.format(kithi.MaKyThi,kithi.MaKyThi)
        ls_mon = '<p class="mon{0}">{1}</p>'.format(kithi.MaKyThi,kithi.MonHoc.TenMon)
        ngaythi = kithi.NgayThi
        options = '''
                <div class="btn-group">
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#new_teacher" data-title="edit" id="edit_{0}">
                        <i class="fa fa-cog" data-toggle="tooltip" title="Chỉnh sửa"></i>   Chỉnh sửa</button> 
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-title="del" id="del_{0}" data-target="#delete_kithi">
                        <i class="fa fa-trash" data-toggle="tooltip" title="Xóa"></i>
                    </button> 
                </div>
            '''.format(kithi.MaKyThi)
        data.append([makithi,ls_mon, str(ngaythi), options])
    big_data = {"data": data}
    json_data = json.loads(json.dumps(big_data))
    return JsonResponse(json_data)
