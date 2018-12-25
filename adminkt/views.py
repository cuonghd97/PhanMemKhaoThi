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
def manage_class(request):
    user = request.user
    if user.is_authenticated and user.position == 0:
        if request.method == 'POST':
            if 'delete' in request.POST:
                LopHoc.objects.get(id=request.POST['delete']).delete()
            elif 'ten' in request.POST:
                # nien_khoa, nam = request.POST['nien_khoa'].split(" - ")
                if request.POST['kieu'] == 'new':
                    # try:
                    # print(request.POST['ten'])
                    LopHoc.objects.create(tenLop=request.POST['ten'],maKhoa=KhoaHoc.objects.get(id =request.POST['khoa']),maMon = Mon.objects.get(id = request.POST['mon']))
                    # except:
                    #     pass
                else:
                    l = LopHoc.objects.get(id=request.POST['id'])
                    l.tenLop = request.POST['ten']
                    l.maKhoa = KhoaHoc.objects.get(id=request.POST['khoa'])
                    l.maMon = Mon.objects.get(id = request.POST['mon'])
                    l.save()
                
        content = {'username': user.username, 'ds_khoa': KhoaHoc.objects.all(), 'mon' : Mon.objects.all()}
        return render(request, 'adminkt/manager_lop.html', content)
    else:
        return HttpResponseRedirect('/')

def manage_class_data(request):
    user = request.user
    if user.is_authenticated and user.position == 0:
        data = []
        for lop in LopHoc.objects.all():
            ten = '<p id="ten_{}">{}</p>'.format(lop.id, lop.tenLop)
            khoa = '<p id="khoa_{}">{} - {}</p>'.format(lop.id, lop.maKhoa.tenKhoaHoc,lop.maKhoa.he)
            mon = '<p id="mon_{}">{}</p>'.format(lop.id, lop.maMon.tenMon)
            # nien_khoa = '<p id="nien_khoa_{}">{}</p>'.format(lop.id, lop.nien_khoa_id.ten_nien_khoa + ' - ' + str(lop.nien_khoa_id.nam_hoc))
            # ls_chi_tiet = ChiTietLop.objects.filter(id=lop).values()
            # gv = '''
            # {1}  <i class="fa fa-info-circle" data-title="{0}" data-toggle="modal" data-target="#detail_teacher"></i> 
            # '''.format(lop.ten, MyUser.objects.filter(id__in=ls_chi_tiet, position=1).count())
           
            hs = '''
            {1}  <i class="fa fa-info-circle" data-title="{0}" data-toggle="modal" data-target="#detail_student"></i> 
            '''.format(lop.tenLop,LopHoc.objects.filter(maLop = id).count())
            options = '''
                <div class="btn-group">
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#new_class" data-title="edit" id="edit_{0}">
                        <i class="fa fa-cog" data-toggle="tooltip" title="Chỉnh sửa"></i>
                    </button> 
                    <button type="button" class="btn btn-danger" data-title="del" id="del_{0}">
                        <i class="fa fa-trash" data-toggle="tooltip" title="Xóa"></i>
                    </button> 
                </div>
            '''.format(lop.id)
            data.append([ten,mon, khoa,hs, options])
        big_data = {"data": data}
        json_data = json.loads(json.dumps(big_data))
        return JsonResponse(json_data)

def manage_donvi(request):
    user = request.user
    if user.is_authenticated and user.position == 0:
        if request.method == 'POST':
            if 'delete' in request.POST:
                DonVi.objects.get(id=request.POST['delete']).delete()
            elif 'ten' in request.POST:
                # nien_khoa, nam = request.POST['nien_khoa'].split(" - ")
                if request.POST['kieu'] == 'new':
                    try:
                        print(request.POST['ma'])
                        DonVi.objects.create(tenDonVi=request.POST['ten'],maDonVi=request.POST['ma'])
                    except:
                        pass
                else:
                    l = DonVi.objects.get(id=request.POST['id'])
                    l.tenDonVi = request.POST['ten']
                    l.maDonVi = request.POST['ma']
                    l.save()
                
        content = {'username': user.username}
        return render(request, 'adminkt/manager_donvi.html', content)
    else:
        return HttpResponseRedirect('/')

def manage_donvi_data(request):
    user = request.user
    if user.is_authenticated and user.position == 0:
        data = []
        for dv in DonVi.objects.all():
            ten = '<p id="ten_{}">{}</p>'.format(dv.id, dv.tenDonVi)
            Madv = '<p id="ma_{}">{}</p>'.format(dv.id, dv.maDonVi)
            options = '''
                <div class="btn-group">
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#new_class" data-title="edit" id="edit_{0}">
                        <i class="fa fa-cog" data-toggle="tooltip" title="Chỉnh sửa"></i>
                    </button> 
                    <button type="button" class="btn btn-danger" data-title="del" id="del_{0}">
                        <i class="fa fa-trash" data-toggle="tooltip" title="Xóa"></i>
                    </button> 
                </div>
            '''.format(dv.id)
            data.append([ten,Madv,options])
        big_data = {"data": data}
        json_data = json.loads(json.dumps(big_data))
        return JsonResponse(json_data)

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
        
def manage_hocvien(request):
    user = request.user
    content = {'username': user.username, 'ds_donvi': DonVi.objects.all()}
    if user.is_authenticated and user.position == 0:
        if request.method == 'POST':
            if 'delete' in request.POST:
                SinhVien.objects.get(id=request.POST['delete']).delete()
            elif 'fullname' in request.POST:
                if request.POST['kieu'] == 'new':
                    try:
                        SinhVien.objects.create(tenSinhVien=request.POST['fullname'],
                                                    maSinhVien =request.POST['ma'],
                                                    tuoi=request.POST['tuoi'],
                                                    maDonVi=DonVi.objects.get(id = request.POST['donvi']))
                            # new_lop = Lop.objects.get(ten=request.POST['list_lop'])
                            # ChiTietLop.objects.create(lop_id=new_lop, myuser_id=hs)
                    except:
                        pass
                else:
                    # try:
                    hs = SinhVien.objects.get(id =request.POST['id'])
                    hs.tenSinhVien = request.POST['fullname']
                    hs.maSinhVien = request.POST['ma']
                    hs.tuoi = request.POST['tuoi']
                    hs.maDonVi = DonVi.objects.get(id = request.POST['donvi']) 
                    hs.save()

                        # lop = ChiTietLop.objects.get(myuser_id=hs)
                        # lop.lop_id = Lop.objects.get(ten=request.POST['list_lop'])
                        # lop.save()
                    # except:
                    #     pass
            else:
                list_student = request.POST['list_student']
                list_student = json.loads(list_student)
                for stu in list_student:
                    if stu is None:
                        continue
                    try:
                        SinhVien.objects.create(tenSinhVien=stu[0],
                                                    maSinhVien =stu[1],
                                                    tuoi= int(stu[2]),
                                                    maDonVi=DonVi.objects.get(id = stu[3]))
                    except:
                        continue
        return render(request, 'adminkt/manager_hocvien.html', content)
    else:
        return HttpResponseRedirect('/')
    
def manage_hocvien_data(request):
    user = request.user
    if user.is_authenticated and user.position == 0:
        ls_student = SinhVien.objects.all()
        data = []
        for sv in ls_student:
            fullname = '<p id="full_{0}">{1}</p>'.format(sv.id, sv.tenSinhVien)
            masv = '<p id="ma_{}">{}</p>'.format(sv.id,sv.maSinhVien)
            tuoi = '<p id="tuoi_{}">{}</p>'.format(sv.id,sv.tuoi)
            donvi = '<p id="donvi_{0}">{1}</p>'.format(sv.id,sv.maDonVi.tenDonVi)
            options = '''
                <div class="btn-group">
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#new_student" data-title="edit" id="edit_{0}">
                        <i class="fa fa-cog" data-toggle="tooltip" title="Chỉnh sửa"></i>
                    </button>  
                    <button type="button" class="btn btn-danger" data-title="del" id="del_{0}">
                        <i class="fa fa-trash" data-toggle="tooltip" title="Xóa"></i>
                    </button> 
                </div>
            '''.format(sv.id)
            data.append([fullname, masv, tuoi, donvi, options])
        big_data = {"data": data}
        json_data = json.loads(json.dumps(big_data))
        return JsonResponse(json_data)

def create_kithi(request):
    return render(request,'adminkt/create_kithi.html')

def manager_canbo(request):
    user = request.user
    content = {'username':user.username, 'ds_donvi':DonVi.objects.all()}
    if user.is_authenticated and user.position == 0:
        if request.method == 'POST':
            if 'delete' in request.POST:
                CanBo.objects.get(id=request.POST['delete']).delete()
            elif 'block' in request.POST:
                gv = CanBo.objects.get(id=request.POST['block'])
                if gv.is_active:
                    gv.is_active = False
                else:
                    gv.is_active = True
                gv.save()
            elif 'fullname' in request.POST:
                if request.POST['kieu'] == 'new':
                    try:
                        gv = CanBo.objects.create(email=request.POST['email'],
                                            tenCanBo=request.POST['fullname'],
                                            username=request.POST['username'],
                                            password=request.POST['password'],
                                            quanHam =request.POST['quanham'],
                                            maDonVi = DonVi.objects.get(id = request.POST['donvi']),
                                            maCanBo=request.POST['macanbo'])
                    except:
                        pass
                else:
                    try:
                        gv = CanBo.objects.get(username=request.POST['username'])
                        gv.tenCanBo = request.POST['fullname']
                        gv.quanHam = request.POST['quanham']
                        gv.email = request.POST['email']
                        gv.maCanBo = request.POST['macanbo']
                        gv.maDonVi = DonVi.objects.get(id = request.POST['donvi'])
                        
                        gv.save()
                    except:
                        pass
            else:
                list_teacher = request.POST['list_canbo']
                list_teacher = json.loads(list_teacher)
                for i, tea in enumerate(list_teacher):
                    if len(tea) == 0:
                        continue
                    try:
                        CanBo.objects.create(email=tea[2],
                                            tenCanBo=tea[0],
                                            maCanBo=tea[5],
                                            quanHam=tea[4],
                                            username=tea[1],
                                            password=tea[3],
                                            maDonVi= DonVi.objects.get(id =tea[6]))
                    except:
                        continue

        return render(request, 'adminkt/manager_canbo.html', content)
    else:
        return HttpResponseRedirect('/')

def manage_canbo_data(request):
    user = request.user
    if user.is_authenticated and user.position == 0:
        ls_teacher = CanBo.objects.filter()
        data = []
        for teacher in ls_teacher:
            fullname = '<p id="full_{0}">{1}</p>'.format(teacher.id, teacher.tenCanBo)
            username = '<p id="user_{0}">{1}</p>'.format(teacher.id, teacher.username)
            macanbo = '<p id="macb_{0}">{1}</p>'.format(teacher.id, teacher.maCanBo)
            quanham = '<p id="quanham_{0}">{1}</p>'.format(teacher.id, teacher.quanHam)
            donvi = '<p id="donvi_{0}">{1}</p>'.format(teacher.id,teacher.maDonVi.tenDonVi)
            trang_thai = ''
            if(teacher.is_active):
                icon = 'fa fa-lock'
                title = 'khóa'
                trang_thai = '<span class="label label-success">kích hoạt</span>'
            else:
                icon = 'fa fa-unlock'
                title = 'mở khóa'
                trang_thai = '<span class="label label-danger">khóa</span>'
            options = '''
                <div class="btn-group">
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#new_teacher" data-title="edit" id="edit_{0}">
                        <i class="fa fa-cog" data-toggle="tooltip" title="Chỉnh sửa"></i>
                    </button> 
                    <button type="button" class="btn btn-warning" data-title="block" id="block_{0}">
                        <i class="{2}" data-toggle="tooltip" title="{3}"></i></i>
                    </button> 
                    <button type="button" class="btn btn-danger" data-title="del" id="del_{0}">
                        <i class="fa fa-trash" data-toggle="tooltip" title="Xóa"></i>
                    </button> 
                </div>
                <p hidden id="email_{0}">{1}</p>
            '''.format(teacher.id, teacher.email, icon, title)
            data.append([fullname, macanbo, quanham, donvi, username, trang_thai, options])
        big_data = {"data": data}
        json_data = json.loads(json.dumps(big_data))
        return JsonResponse(json_data)

def kithi(request):
    if not request.user.is_authenticated:
        return redirect('CoiThi:login')
    return render(request,'adminkt/manager_kithi.html')

def thongke(request):
    if not request.user.is_authenticated:
        return redirect('CoiThi:login')
    return render(request,'adminkt/thongke.html')

def data_mon(request):
    return False

def manager_kithi(request):
    user = request.user
    content = {'username': user.username}
    if user.is_authenticated:
        # if request.method == 'POST':
        #     if 'delete' in request.POST:
        #         KyThi.objects.get(id=request.POST['delete']).delete()
        #     else:
        #         if request.POST['kieu'] == 'new':
        #             try:
        #                 KyThi.objects.create(MaKyThi=request.POST['ten'], lop=request.POST['lop'], he=request.POST['he'])
        #             except:
        #                 pass
        #         else:
        #             m = Mon.objects.get(id=request.POST['id'])
        #             m.ten = request.POST['ten']
        #             m.lop = request.POST['lop']
        #             m.he = request.POST['he']
        #             m.save()
        return render(request, 'adminkt/manager_kithi.html', content)
    else:
        return HttpResponseRedirect('/')

def manage_kithi_data(request):
    user = request.user
    if user.is_authenticated and user.position == 0:
        ls_kithi = KyThi.objects.all()
        data = []
        for kt in ls_kithi:
            tenkithi = '<p id="tenkithi_{0}">{1}</p>'.format(kt.id, kt.tenKyThi)
            tungay = '<p id="tungay_{}">{}</p>'.format(kt.id,kt.ngayBatDau)
            denngay = '<p id="denngay_{0}">{1}</p>'.format(kt.id,kt.ngayKetThuc)
            options = '''
                <div class="btn-group">
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#new_teacher" data-title="edit" id="edit_{0}">
                        <i class="fa fa-cog" data-toggle="tooltip" title="Chỉnh sửa"></i>   Chỉnh sửa</button> 
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-title="del" id="del_{0}" data-target="#delete_kithi">
                        <i class="fa fa-trash" data-toggle="tooltip" title="Xóa"></i>
                    </button> 
                </div>
            '''.format(kt.id)
            data.append([tenkithi, tungay, denngay, options])
        big_data = {"data": data}
        json_data = json.loads(json.dumps(big_data))
        return JsonResponse(json_data)
    
