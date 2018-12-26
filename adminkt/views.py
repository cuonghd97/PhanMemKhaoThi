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
                
        content = {'username': user.username, 'ds_khoa': KhoaHoc.objects.all(), 'mon' : Mon.objects.all(),'ds_sinhvien':SinhVien.objects.all(),'ds_lop':LopHoc.objects.all()}
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
            hs = '''
            {1}  <i class="fa fa-info-circle" data-title="{0}" data-toggle="modal" data-target="#detail_student"></i> 
            '''.format(lop.tenLop,ChiTietLop.objects.filter(maLop_id = lop.id).count())
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
def manage_add_student(request):
    user = request.user
    if user.is_authenticated and user.position == 0:
        if request.method == 'POST':
            if 'delete' in request.POST:
                ChiTietLop.objects.get(id=request.POST['delete']).delete()
            elif 'lop' in request.POST:
                
                if request.POST['kieu'] == 'new':
                    # try:
                    ChiTietLop.objects.create(maLop = LopHoc.objects.get(id = request.POST['lop']) ,maSinhVien=SinhVien.objects.get(id =request.POST['sinhvien']))
                    # except:
                    #     pass
        return JsonResponse({'status':'succsec'})
    else:
        return HttpResponseRedirect('/')
def manage_student_data(request,lop):
    user = request.user
    if user.is_authenticated and user.position == 0:
        ls_chi_tiet = ChiTietLop.objects.filter(maLop = LopHoc.objects.get(tenLop=lop)).values('maLop')
        ls_student = ChiTietLop.objects.filter(maLop__in = ls_chi_tiet)
        data = []
        for student in ls_student:
            fullname = '<p id="full_{0}">{1}</p>'.format(student.maSinhVien.id, student.maSinhVien.tenSinhVien)
            username = '<p id="user_{0}">{1}</p>'.format(student.maSinhVien.id, student.maSinhVien.maSinhVien)
            tuoi = '<p id="tuoi_{0}">{1}</p>'.format(student.maSinhVien.id, student.maSinhVien.tuoi)
            capham = '<p id="capham_{0}">{1}</p>'.format(student.maSinhVien.id, student.maSinhVien.maDonVi.tenDonVi)
            option = '''
                <div class="btn-group">
                    <button type="button" class="btn btn-danger" data-title="del" id="del_{0}">
                        <i class="fa fa-trash" data-toggle="tooltip" title="Xóa"></i>
                    </button> 
                </div>
            '''.format(student.id)
            data.append([fullname, username, tuoi,capham,option])
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

def manager_kithi(request):
    user = request.user
    content = {'username': user.username,'ds_cb':CanBo.objects.all(),'ds_lop':LopHoc.objects.all(),'ds_kithi':KyThi.objects.all()}  
    if user.is_authenticated:
        if request.method == 'POST':
            if 'delete' in request.POST:
                KyThi.objects.get(id=request.POST['delete']).delete()
            else:
                if request.POST['kieu'] == 'new':
                    # try:
                    KyThi.objects.create(tenKyThi=request.POST['tenkithi'], ngayBatDau=request.POST['tungay'], ngayKetThuc=request.POST['denngay'])
                    # except:
                    #     pass
                else:
                    m = KyThi.objects.get(id=request.POST['id'])
                    m.tenKyThi = request.POST['tenkithi']
                    m.ngayBatDau = request.POST['tungay']
                    m.ngayKetThuc = request.POST['denngay']
                    m.save()
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
            tungay = '<p id="tungay_{}" data-tungay="{}">{}</p>'.format(kt.id,kt.ngayBatDau,kt.ngayBatDau.strftime('%d-%m-%Y'))
            denngay = '<p id="denngay_{0}" data-denngay="{1}">{2}</p>'.format(kt.id,kt.ngayKetThuc,kt.ngayKetThuc.strftime('%d-%m-%Y'))
            ds_phongthi = '''
            {1}  <i class="fa fa-info-circle" data-title="{0}" data-toggle="modal" data-target="#detail_room"></i> 
            '''.format(kt.tenKyThi,PhongThi.objects.filter(maKyThi_id = kt.id).count())
            options = '''
                <div class="btn-group">
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#new_kithi" data-title="edit" id="edit_{0}">
                        <i class="fa fa-cog" data-toggle="tooltip" title="Chỉnh sửa"></i>   Chỉnh sửa</button> 
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-title="del" id="del_{0}" data-target="#delete_kithi">
                        <i class="fa fa-trash" data-toggle="tooltip" title="Xóa"></i>
                    </button> 
                </div>
            '''.format(kt.id)
            data.append([tenkithi, tungay, denngay, ds_phongthi, options])
        big_data = {"data": data}
        json_data = json.loads(json.dumps(big_data))
        return JsonResponse(json_data)
    
def manage_ki_thi_data(request,kithi):
    user = request.user
    if user.is_authenticated and user.position == 0:
        ls_chi_tiet = KyThi.objects.filter(tenKyThi = kithi).values('id')
        ls_phongthi = PhongThi.objects.filter(maKyThi__in = ls_chi_tiet)
        data = []
        for room in ls_phongthi:
            tenphong = '<p id="room_{0}">{1}</p>'.format(room.id, room.tenPhong)
            vitri = '<p id="vitri_{0}">{1}</p>'.format(room.id, room.viTri)
            ngaythi = '<p id="ngaythi_{0}">{1}</p>'.format(room.id, room.ngayThi.strftime('%d-%m-%y'))
            gio = '<p id="gio_{0}">{1}</p>'.format(room.id, room.gio)
            tenlop = '<p id="tenlop_{0}">{1}</p>'.format(room.id, room.maLop.maLop.tenLop)
            canbocoi1 = '<p id="cbcoi1_{0}">{1}</p>'.format(room.id, room.canBoCoi1.tenCanBo)
            canBoCoi2 = '<p id="cbcoi2_{0}">{1}</p>'.format(room.id, room.canBoCoi2.tenCanBo)
            option = '''
                <div class="btn-group">
                    <button type="button" class="btn btn-danger" data-title="del" id="del_{0}">
                        <i class="fa fa-trash" data-toggle="tooltip" title="Xóa"></i>
                    </button> 
                </div>
            '''.format(room.id)
            data.append([tenphong, vitri, ngaythi,gio,tenlop,canbocoi1,canBoCoi2,option])
        big_data = {"data": data}
        json_data = json.loads(json.dumps(big_data))
        return JsonResponse(json_data)

def manage_add_kithi(request):
    user = request.user
    if user.is_authenticated and user.position == 0:
        if request.method == 'POST':
            if 'delete' in request.POST:
                PhongThi.objects.get(id=request.POST['delete']).delete()
            elif 'lop' in request.POST:
                
                if request.POST['kieu'] == 'new':
                    # try:
                    PhongThi.objects.create(maKyThi = KyThi.objects.get(id = request.POST['kithi']) ,
                                            canBoCoi1=CanBo.objects.get(id =request.POST['cbc1']),
                                            canBoCoi2=CanBo.objects.get(id =request.POST['cbc2']),
                                            maLop = LopHoc.objects.get(id = request.POST['lop']),
                                            tenPhong = request.POST['tenphong'],
                                            viTri = request.POST['vitri'],
                                            ngayThi = request.POST['ngaythi'],
                                            gio = request.POST['gio'])
                    
                    ChamThi.objects.create(maPhong = PhongThi.objects.get(tenPhong = request.POST['tenphong']),
                                           canBoCham1=CanBo.objects.get(id =request.POST['cbcham1']),
                                           canBoCham2=CanBo.objects.get(id =request.POST['cbcham2']) )
                    # except:
                    #     pass
        return JsonResponse({'status':'succsec'})
    else:
        return HttpResponseRedirect('/')
