from django.db import models
from django.contrib.auth.models import  AbstractUser
from django.utils import timezone

# Create your models here.
class User(AbstractUser):
    phone_number=models.CharField(max_length=20)
    class Meta:
        permissions = (("staff_permissions", "Staff Permissions"),("students_permissions", "Students Permissions"))

class Subject(models.Model):
    name=models.CharField(max_length=60)
    description=models.CharField(max_length=100)
    semester=models.IntegerField(default=1)
    def __str__(self) -> str:
        return self.name
# class Staffs(models.Model):
#     name=models.CharField(max_length=60)

class Department(models.Model):
    name=models.CharField(max_length=50)
    subjects=models.ManyToManyField(Subject)
    total_academic_years=models.IntegerField(default=4)
    def __str__(self) -> str:
        return self.name

class Staffs(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    department = models.ForeignKey(Department,on_delete=models.SET_NULL,null=True)
    designation = models.CharField(max_length=100)
    class Meta:
        verbose_name = "staff"
        verbose_name_plural = "staffs"
import datetime
from dateutil import relativedelta

def get_month_diff(d1,d2):
    return ((d1.year - d2.year) * 12 + d1.month - d2.month)
def get_sem(d1,d2):
    diff=get_month_diff(d1,d2)//6
    if diff>=0:
        return 1
    else:
        return diff
def get_year(d1,d2):
    diff=get_month_diff(d1,d2)//12
    if diff>=0:
        return 1
    else:
        return diff
class Students(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    department = models.ForeignKey(Department,on_delete=models.SET_NULL,null=True)
    date_of_birth=models.DateField(default=timezone.now)    
    date_of_joining=models.DateField(default=timezone.now)
    register_number=models.CharField(max_length=25)
    @property
    def semester(self):
        now=datetime.datetime.now().date()
        diif=self.date_of_joining
        return get_sem(now,diif)
    @property
    def academic_year(self):
        now=datetime.datetime.now().date()
        diif=self.date_of_joining
        return get_year(now,diif)
    class Meta:
        verbose_name = "student"
        verbose_name_plural = "students"