from django.contrib import admin
from django.urls import path,include
from django.conf.urls.static import static
from django.conf import settings
from django.contrib.auth import views as auth_views
from . import views


urlpatterns = [
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('', views.LoginView.as_view(), name='login'),
    path('login/', views.LoginView.as_view(), name='login'),
    path('reset/',
        auth_views.PasswordResetView.as_view(
            template_name='password_reset.html',
            email_template_name='password_reset_email.html',
            subject_template_name='password_reset_subject.txt'
        ),
        name='password_reset'),
    path('reset/done/',
        auth_views.PasswordResetDoneView.as_view(template_name='password_reset_done.html'),
        name='password_reset_done'),
    path('^reset/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/',
        auth_views.PasswordResetConfirmView.as_view(template_name='password_reset_confirm.html'),
        name='password_reset_confirm'),
    path('reset/complete/',
        auth_views.PasswordResetCompleteView.as_view(template_name='password_reset_complete.html'),
        name='password_reset_complete'),
    path('settings/password/', auth_views.PasswordChangeView.as_view(template_name='password_change.html'),
        name='password_change'),
    path('settings/password/done/', auth_views.PasswordChangeDoneView.as_view(template_name='password_change_done.html'),
        name='password_change_done'),


    path('dashboard/',views.Home.as_view(),name='home'),
    path('add-staff/',views.AddNewStaff.as_view(),name='addnewstaff'),
    path('view-student/',views.AddNewStudent.as_view(),name='addnewstudent'),
    path('view-user/',views.ViewUsers.as_view(),name='viewuser'),
    path('view-students/',views.ViewStudents.as_view(),name='viewstudents'),
    path('view-staffs/',views.ViewStaffs.as_view(),name='viewststaffs'),

    path('add-department/',views.DepartmentAdd.as_view(),name='add_department'),
    path('add-subject/',views.SubjectAdd.as_view(),name='add_subject'),

    path('view-subject/',views.ViewSubjects.as_view(),name='view_subjects'),
    path('view-departments/',views.ViewDepartment.as_view(),name='view_departments'),
    path('view-departments-subjects/<id>',views.ViewDepartmentSubjects.as_view(),name='view_departments_subjects'),
    path('edit-department/<id>',views.DepartmentEdit.as_view(),name='edit_department'),
    path('edit-subject/<id>',views.SubjectEdit.as_view(),name='edit_subject'),

    
]