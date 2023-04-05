from django.db import models
from accounts.models import Department,Subject,User
from django.utils import timezone

# Create your models here.


class Assignmets(models.Model):
    title=models.CharField(max_length=50)
    description=models.CharField(max_length=100)
    question=models.CharField(max_length=1000)
    depatment=models.ForeignKey(Department,on_delete=models.CASCADE)
    subject=models.ForeignKey(Subject,on_delete=models.CASCADE)
    total_marks=models.IntegerField(default=0)
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    status=models.IntegerField(default=1)
    created=models.DateField(default=timezone.now)    
    updated=models.DateField(default=timezone.now)
    last_date=models.DateField(default=timezone.now)
    def __str__(self) -> str:
        return self.title
class AssignmentSubmissions(models.Model):
    student=models.ForeignKey(User,on_delete=models.CASCADE)
    assignment=models.ForeignKey(Assignmets,on_delete=models.CASCADE)
    answer=models.CharField(max_length=5000)
    file=models.FileField(max_length=500)
    total_mark=models.IntegerField(default=0)
    status=models.IntegerField(default=0)
    created=models.DateField(default=timezone.now)    
    updated=models.DateField(default=timezone.now)
    comments=models.CharField(max_length=500)
    updated_by=models.ForeignKey(User,on_delete=models.SET_NULL,null=True,related_name='updated_by')
    def __str__(self) -> str:
        return self.assignment.title
