from django.shortcuts import render

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

def data_kithi(request):
    return render(request,'adminkt/manager_kithi.html')

def thongke(request):
    return render(request,'adminkt/thongke.html')