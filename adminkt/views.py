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
    user = request.user

    if not request.user.is_authenticated:
        return redirect('CoiThi:login')
    return render(request, 'adminkt/index.html')

def data_lop(request):
    if not request.user.is_authenticated:
        return redirect('CoiThi:login')
    return render(request, 'adminkt/manager_lop.html')
    
def manage_khoa(request):
    user = request.user
    content = {'username': user.tenCanBo}
    if request.user.is_authenticated:
        if request.method == 'POST':
            if 'delete' in request.POST:
                KhoaHoc.objects.get(id=request.POST['delete']).delete()
            else:
                if request.POST['kieu'] == 'new':
                    try:
                        KhoaHoc.objects.create(tenKhoaHoc=request.POST['khoa'], he=request.POST['mo_ta'],maKhoaHoc = request.POST['khoa'] + request.POST['mo_ta'] )
                    except:
                        pass



                else:
                    nk = KhoaHoc.objects.get(id=request.POST['id'])
                    nk.tenKhoaHoc = request.POST['khoa']
                    nk.he = request.POST['he']
                    nk.save()
        return render(request,'adminkt/manager_khoa.html')
    else:
        return HttpResponseRedirect('/')

def manage_khoa_data(request):
    user = request.user
    if user.is_authenticated and user.position == 0:
        data = []
        for khoa in KhoaHoc.objects.all():
            ten = '<p id="ten_{}">{}</p>'.format(khoa.id, khoa.tenKhoaHoc)
            he = '<p id="he_{}">{}</p>'.format(khoa.id, khoa.he)
            options = '''
                <div class="btn-group">
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#new_khoa" data-title="edit" id="edit_{0}">
                        <i class="fa fa-cog" data-toggle="tooltip" title="Chỉnh sửa"></i>
                    </button> 
                    <button type="button" class="btn btn-danger" data-title="del" id="del_{0}">
                        <i class="fa fa-trash" data-toggle="tooltip" title="Xóa"></i>
                    </button> 
                </div>
            '''.format(khoa.id)
            data.append([ten, he, options])
        big_data = {"data": data}
        json_data = json.loads(json.dumps(big_data))
        return JsonResponse(json_data)

def manage_mon(request):
    user = request.user
    content = {'username':user.username}
    if user.is_authenticated and user.position == 0:
        if request.method == 'POST':
            if 'delete' in request.POST:
                Mon.objects.get(id=request.POST['delete']).delete()
            else:
                if request.POST['kieu'] == 'new':
                    try:
                        Mon.objects.create(maMon=request.POST['mamon'], tenMon=request.POST['tenmon'])
                    except:
                        pass
                else:
                    m = Mon.objects.get(id=request.POST['id'])
                    m.maMon = request.POST['mamon']
                    m.tenMon = request.POST['tenmon']
                    m.save()
        return render(request,'adminkt/manager_mon.html')
    return redirect('CoiThi:login')

def manage_mon_data(request):
    user = request.user
    if user.is_authenticated and user.position == 0:
        data = []
        for mon in Mon.objects.all():
            ten = '<p id="tenmon_{0}">{1}</p>'.format(mon.id, mon.tenMon)
            ma = '<p id="mamon_{0}">{1}</p>'.format(mon.id, mon.maMon)
            options = '''
                <div class="btn-group">
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#new_mon" data-title="edit" id="edit_{0}">
                        <i class="fa fa-cog" data-toggle="tooltip" title="Chỉnh sửa"></i>
                    </button> 
                    <button type="button" class="btn btn-danger" data-title="del" id="del_{0}">
                        <i class="fa fa-trash" data-toggle="tooltip" title="Xóa"></i>
                    </button> 
                </div>
            '''.format(mon.id)
            data.append([ma,ten, options])
        big_data = {"data": data}
        json_data = json.loads(json.dumps(big_data))
        return JsonResponse(json_data)

def kithi(request):
    # if not request.user.is_authenticated:
    #     return redirect('CoiThi:login')
    return render(request,'adminkt/manager_kithi.html')

def manage_hocvien(request):
    # if not request.user.is_authenticated:
    #     return redirect('CoiThi:login')
    return render(request,'adminkt/manager_hocvien.html')

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
                        KyThi.objects.create(MaKyThi=request.POST['ten'], lop=request.POST['lop'], he=request.POST['he'])
                    except:
                        pass
                else:
                    m = Mon.objects.get(id=request.POST['id'])
                    m.ten = request.POST['ten']
                    m.lop = request.POST['lop']
                    m.he = request.POST['he']
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
