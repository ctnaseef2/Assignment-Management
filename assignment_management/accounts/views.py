from django.shortcuts import render,redirect
from django.urls import reverse
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator

from django.views import View
from django.contrib.auth.views import LoginView
from django.contrib.auth import authenticate,login
from django.http import HttpResponseRedirect
import django.urls
from .models import Department, Students, Subject, User
from django.contrib.auth.models import Group

# Create your views here.
@method_decorator(login_required, name='dispatch')
class Home(View):
    def get(self, request, *args, **kwargs):
        return render(request, 'account/index.html', {'foo': 'bar'})

class LoginView(LoginView):
    template_name="account/login.html"
    def get(self,request, *args, **kwargs):
        if request.user.is_authenticated:
            return HttpResponseRedirect(reverse('home'))
        return super().get(request, *args, **kwargs)

from .forms import DepartmentForm, StaffForm, StudentForm, SubjectsForm, UserRegistrationForm
@method_decorator(login_required, name='dispatch')
class AddNewStaff(View):
    def get(self,request, *args, **kwargs):
        form = UserRegistrationForm()
        staff_form = StaffForm()
        context={
            'form2':staff_form,
            'form':form
        }
        return render(request, 'account/register.html', context=context)
    def post(self,request, *args, **kwargs):
        form = UserRegistrationForm(request.POST)
        staff_form = StaffForm(request.POST)
        if form.is_valid() and staff_form.is_valid():
            user = form.save()
            st=staff_form.save(commit=False)
            st.user=user
            st.save()
            staff_group = Group.objects.get(name='staff') 
            user.groups.add(staff_group)
            return redirect('home')
        context={
            'form2':staff_form,
            'form':form
        }
        return render(request, 'account/register.html', context)
@method_decorator(login_required, name='dispatch')
class AddNewStudent(View):
    def get(self,request, *args, **kwargs):
        form = UserRegistrationForm()
        studen_form=StudentForm()
        context={
            'form2':studen_form,
            'form':form
        }
        return render(request, 'account/register.html', context)
    def post(self,request, *args, **kwargs):
        form = UserRegistrationForm(request.POST)
        studen_form=StudentForm(request.POST)
        if form.is_valid() and studen_form.is_valid():
            user = form.save()
            st=studen_form.save(commit=False)
            st.user=user
            st.save()
            student_group = Group.objects.get(name='student') 
            user.groups.add(student_group)
            return redirect('home')
        context={
            'form2':studen_form,
            'form':form
        }
        return render(request, 'account/register.html', context)
@method_decorator(login_required, name='dispatch')
class ViewUsers(View):
    def get(self,request, *args, **kwargs):
        headers={
            'username':"Name",
            'email':"Email",
            'phone_number':"Phone number",
            'group':"User Type",
            'department':"Department",
        }
        user=User.objects.all().exclude(username="admin")
        for u in user:
            dapartment=u.staffs.department if hasattr(u,'staffs') else u.students.department
            u.department=dapartment
            u.group=u.groups.first().name
        context={
                'data': user,
                'headers':headers,
                'title':"Users"
            }
        return render(request, 'account/table.html', context)
@method_decorator(login_required, name='dispatch')
class ViewStudents(View):
    def get(self,request, *args, **kwargs):
        headers={
            'username':"Name",
            'email':"Email",
            'phone_number':"Phone number",
            'department':"Department",
            'date_of_birth':"DOB",
            'date_of_joining':"Date of joining",
        }
        user=User.objects.filter(groups__name='student').all()
        for u in user:
            dapartment=u.students.department
            u.department=dapartment
            u.date_of_birth=u.students.date_of_birth
            u.date_of_joining=u.students.date_of_joining
        context={
                'data': user,
                'headers':headers,
                'title':"Students"
            }
        return render(request, 'account/table.html', context)
@method_decorator(login_required, name='dispatch')
class ViewStaffs(View):
    def get(self,request, *args, **kwargs):
        headers={
            'username':"Name",
            'email':"Email",
            'phone_number':"Phone number",
            'department':"Department",
            'designation':"Designation",
        }
        user=User.objects.filter(groups__name='staff').all()
        for u in user:
            dapartment=u.staffs.department 
            u.department=dapartment
            u.designation=u.staffs.designation
        context={
                'data': user,
                'headers':headers,
                'title':"Satffs"
            }
        return render(request, 'account/table.html', context)
@method_decorator(login_required, name='dispatch')
class DepartmentAdd(View):
    def get(self,request, *args, **kwargs):
        form = DepartmentForm()
        context={
            'form':form
        }
        return render(request, 'includes/common_form.html', context)
    def post(self,request, *args, **kwargs):
        form = DepartmentForm(request.POST)
        if form.is_valid():
            user = form.save()
            return redirect('home')
        context={
            'form':form
        }
        return render(request, 'includes/common_form.html', context)
@method_decorator(login_required, name='dispatch')
class DepartmentEdit(View):
    departmet=None
    def dispatch(self, request, *args, **kwargs):
        self.departmet=Department.objects.get(id=kwargs.get("id"))
        return super().dispatch(request, *args, **kwargs)
    def get(self,request, *args, **kwargs):
        form = DepartmentForm(instance=self.departmet)
        context={
            'form':form
        }
        return render(request, 'includes/common_form.html', context)
    def post(self,request, *args, **kwargs):
        form = DepartmentForm(request.POST,instance=self.departmet)
        if form.is_valid():
            user = form.save()
            return redirect('view_departments')
        context={
            'form':form
        }
        return render(request, 'includes/common_form.html', context)
@method_decorator(login_required, name='dispatch')
class SubjectAdd(View):
    def get(self,request, *args, **kwargs):
        form = SubjectsForm()
        context={
            'form':form
        }
        return render(request, 'includes/common_form.html', context)
    def post(self,request, *args, **kwargs):
        form = SubjectsForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('view_subjects')
        context={
            'form':form
        }
        return render(request, 'includes/common_form.html', context)
@method_decorator(login_required, name='dispatch')
class SubjectEdit(View):
    subject=None
    def dispatch(self, request, *args, **kwargs):
        self.subject=Subject.objects.get(id=kwargs.get("id"))
        return super().dispatch(request, *args, **kwargs)
    def get(self,request, *args, **kwargs):
        form = SubjectsForm(instance=self.subject)
        context={
            'form':form
        }
        return render(request, 'includes/common_form.html', context)
    def post(self,request, *args, **kwargs):
        form = SubjectsForm(request.POST,instance=self.subject)
        if form.is_valid():
            form.save()
            return redirect('home')
        context={
            'form':form
        }
        return render(request, 'includes/common_form.html', context)

@method_decorator(login_required, name='dispatch')
class ViewSubjects(View):
    def get(self,request, *args, **kwargs):
        departmet=kwargs.get("department",None)
        headers={
            'name':"Name",
            'description':"Description",
            'semester':"Semester",
            'actions':"Action",
        }
        subjects=Subject.objects.all()
        for s in subjects:
            s.actions="<a href='{}' class='px-1'>Edit</a>".format(reverse('edit_subject',kwargs={'id':s.pk}))
        context={
                'data': subjects,
                'headers':headers,
                'title':"Subjects",
                'safe_fields':['actions'],
            }
        return render(request, 'account/table.html', context)
@method_decorator(login_required, name='dispatch')
class ViewDepartment(View):
    def get(self,request, *args, **kwargs):
        headers={
            'name':"Name",
            'total_academic_years':"Academic Years",
            'actions':"Action",
        }
        departmets=Department.objects.all()
        for depart in departmets:
            depart.actions="<a href='{}' class='px-1'>View subjects</a>".format(reverse('view_departments_subjects',kwargs={'id':depart.pk}))
            depart.actions=depart.actions+"|<a href='{}' class='px-1'>Edit</i></a>".format(reverse('edit_department',kwargs={'id':depart.pk}))
        safe_fields=['actions']
        context={
                'data': departmets,
                'headers':headers,
                'title':"Department",
                'safe_fields':safe_fields,
            }
        return render(request, 'account/table.html', context)
@method_decorator(login_required, name='dispatch')
class ViewDepartmentSubjects(View):
    def get(self,request, *args, **kwargs):
        headers={
            'name':"Name",
            'description':"Description",
            'semester':"semester",
        }
        departmets=Department.objects.filter(pk=kwargs.get("id",None)).first()
        subjects=None
        if departmets:
            subjects=departmets.subjects.all().order_by('semester')

        context={
                'data': subjects,
                'headers':headers,
                'title':"Department"
            }
        return render(request, 'account/table.html', context)
def page_not_found_view(request, exception):
    return render(request, '404.html', status=404)
def error_view(request):
    return render(request, '404.html', status=500)