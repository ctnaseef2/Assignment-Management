from django.shortcuts import render
import django.urls
from django.shortcuts import render,redirect
import django.utils
from . forms import AssignmentForm,SubmissionForm,SubmissionReviewForm
from .models import Assignmets,AssignmentSubmissions
from django.views import View
import datetime
from django.urls import reverse
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator

# Create your views here.
@method_decorator(login_required, name='dispatch')
class AddAssignment(View):
    def get(self,request, *args, **kwargs):
        form = AssignmentForm()
        context={
            'form':form
        }
        return render(request, 'includes/common_form.html', context)
    def post(self,request, *args, **kwargs):
        form = AssignmentForm(request.POST)
        if form.is_valid():
            data=form.save(commit=False)
            data.user=request.user
            data.created=datetime.datetime.now()
            data.updated=datetime.datetime.now()
            data.save()
            return redirect('home')
        context={
            'form':form
        }
        return render(request, 'includes/common_form.html', context)
@method_decorator(login_required, name='dispatch')
class EditAssignment(View):
    assignment=None
    def dispatch(self, request, *args, **kwargs):
        self.assignment=Assignmets.objects.get(id=kwargs.get("id"))
        return super().dispatch(request, *args, **kwargs)
    def get(self,request, *args, **kwargs):
        form = AssignmentForm(instance=self.assignment)
        context={
            'form':form
        }
        return render(request, 'includes/common_form.html', context)
    def post(self,request, *args, **kwargs):
        form = AssignmentForm(request.POST,instance=self.assignment)
        if form.is_valid():
            data=form.save(commit=False)
            data.updated=datetime.datetime.now()
            data.save()
            return redirect('home')
        context={
            'form':form
        }
        return render(request, 'includes/common_form.html', context)
@method_decorator(login_required, name='dispatch')
class ViewAssignment(View):
    def get(self,request, *args, **kwargs):
        headers={
            'title':"Title",
            'description':"Description",
            'question':"Question",
            'depatment':"Depatment",
            'subject':"Subject",
            'total_marks':"Total Marks",
            'last_date':"Last Date",
            'actions':"Action",
        }
        if request.user.has_perm('accounts.staff_permissions'):
            assignmets=Assignmets.objects.filter(user=request.user).all()
        else:
            assignmets=Assignmets.objects.all()
        for assignmet in assignmets:
            if request.user.has_perm('accounts.students_permissions'):
                assignmet.actions="<a href='{}' class='px-1'>Submit</a>".format(reverse('submit',kwargs={'id':assignmet.pk}))
            else:
                assignmet.actions="<a href='{}' class='px-1'>Edit</a>".format(reverse('edit_assignments',kwargs={'id':assignmet.pk}))
        context={
                'data': assignmets,
                'headers':headers,
                'title':"Assignmets",
                'safe_fields':['actions'],
            }
        return render(request, 'account/table.html', context)
@method_decorator(login_required, name='dispatch')
class ViewAssignmentSubmissions(View):
    def get(self,request, *args, **kwargs):
        headers={
            'assignment':"Assignment",
            'student':"Student",
            'total_mark':"Mark",
            'created':"Submitted on",
            'actions':"Action",
        }
        if request.user.has_perm('accounts.students_permissions'):
            submissions=AssignmentSubmissions.objects.filter(student=request.user).all()
        elif request.user.has_perm('accounts.staff_permissions'):
            submissions=AssignmentSubmissions.objects.filter(assignment__user=request.user).all()
        for assignmet in submissions:
            assignmet.actions="<a href='{}' class='px-1'>View</a>".format(reverse('view_assignment',kwargs={'id':assignmet.pk}))
        context={
                'data': submissions,
                'headers':headers,
                'title':"Assignment Submissions",
                'safe_fields':['actions'],
            }
        return render(request, 'account/table.html', context)
@method_decorator(login_required, name='dispatch')
class SubmitAssignment(View):
    assignment=None
    def dispatch(self, request, *args, **kwargs):
        self.assignment=Assignmets.objects.get(id=kwargs.get("id"))
        return super().dispatch(request, *args, **kwargs)
    def get(self,request, *args, **kwargs):
        form = SubmissionForm()
        context={
            'assignment':self.assignment,
            'form':form,
            'title':"Submit Answer",
            'files':True,
        }
        return render(request, 'assignments/submission_form.html', context)
    def post(self,request, *args, **kwargs):
        form = SubmissionForm(request.POST,request.FILES)
        if form.is_valid():
            data=form.save(commit=False)
            data.student=request.user
            data.assignment=self.assignment
            data.created=datetime.datetime.now()
            data.updated=datetime.datetime.now()
            data.save()
            return redirect('home')
        context={
            'assignment':self.assignment,
            'form':form,
            'title':"Submit Answer",
            'files':True,
        }
        return render(request, 'assignments/submission_form.html', context)
@method_decorator(login_required, name='dispatch')
class AssignmentSubmissionView(View):
    assignment=None
    def dispatch(self, request, *args, **kwargs):
        self.assignment=AssignmentSubmissions.objects.get(id=kwargs.get("id"))
        return super().dispatch(request, *args, **kwargs)
    def get(self,request, *args, **kwargs):
        form = SubmissionReviewForm(instance=self.assignment)
        context={
            'form':form,
            'files':True,
        }
        context={
            "date":datetime.datetime.now().date(),
            "title":"View Assignment",
            'assignment':self.assignment,
            'form':form
        }
        return render(request, 'assignments/view-assignment.html', context)
    def post(self,request, *args, **kwargs):
        form = SubmissionReviewForm(request.POST,instance=self.assignment)
        print(request.POST)
        if form.is_valid() and 'operation' in request.POST:
            data=form.save(commit=False)
            data.updated_by=request.user
            if request.POST['operation']=="submit":
                data.status=1#submitted
            elif request.POST['operation']=="reject":
                data.status=2#rejected
            data.updated=datetime.datetime.now()
            data.save()
            return redirect('home')
        context={
            "date":datetime.datetime.now().date(),
            "title":"View Assignment",
            'assignment':self.assignment,
            'form':form,
            'files':True,
        }
        return render(request, 'assignments/view-assignment.html', context)