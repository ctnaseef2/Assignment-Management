from django import forms
from .models import AssignmentSubmissions,Assignmets
from django.core.exceptions import ValidationError
import datetime

class AssignmentForm(forms.ModelForm):
    description=forms.CharField(widget=forms.Textarea(),required=True)
    question=forms.CharField(widget=forms.Textarea(),required=True)
    total_marks=forms.IntegerField(widget=forms.NumberInput(),min_value=0,max_value=100)
    last_date=forms.DateField(widget=forms.DateInput(attrs={
        'class':'datepicker'
    }),initial=datetime.date.today())
    def clean_last_date(self):
        data=self.cleaned_data.get('last_date',None)
        if data:
            print(data)
            time=datetime.date.today()
            if data<time:
                raise ValidationError("Please enter a future date")
        else:
            raise ValidationError("This field is required")
        return data
    class Meta:
        model=Assignmets
        exclude=('user','status','created','updated')
class SubmissionForm(forms.ModelForm):
    class Meta:
        model=AssignmentSubmissions
        fields=('answer','file')
class SubmissionReviewForm(forms.ModelForm):
    total_mark=forms.IntegerField(max_value=100,initial=0)
    comments=forms.CharField(widget=forms.Textarea(attrs={'placeholder':"If Any"}),required=False,max_length=100)
    class Meta:
        model=AssignmentSubmissions
        fields=('total_mark','comments')
    