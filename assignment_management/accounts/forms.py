from django import forms
from django.contrib.auth.forms import UserCreationForm,UsernameField
from .models import Staffs, Students, Subject, User,Department
from django.core.exceptions import ValidationError
from django.contrib.auth import authenticate, get_user_model, password_validation
import django.db
from django.utils.translation import gettext_lazy as _

class UserRegistrationForm(forms.ModelForm):
    email = forms.EmailField()
    phone_number = forms.CharField()
    
    class Meta:
        model = User
        fields = ['username', 'email','phone_number']
        field_classes = {"username": UsernameField}
    """
    A form that creates a user, with no privileges, from the given username and
    password.
    """

    error_messages = {
        "password_mismatch": _("The two password fields didn’t match."),
    }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields.pop('password1',None)
        self.fields.pop('password2',None)
        if self._meta.model.USERNAME_FIELD in self.fields:
            self.fields[self._meta.model.USERNAME_FIELD].widget.attrs[
                "autofocus"
            ] = True


    def _post_clean(self):
        super()._post_clean()
        # Validate the password after self.instance is updated with form data
        # by super().
        password = self.cleaned_data.get("password2")
        if password:
            try:
                password_validation.validate_password(password, self.instance)
            except ValidationError as error:
                self.add_error("password2", error)

    def save(self, commit=True):
        user = super().save(commit=False)
        user.set_password("As@12345")
        if commit:
            user.save()
        return user


class StaffForm(forms.ModelForm):
    class Meta:
        model=Staffs
        exclude=('user',)
class StudentForm(forms.ModelForm):
    date_of_birth=forms.DateField(widget=forms.DateInput(attrs={
        'class':'datepicker'
    }))
    date_of_joining=forms.DateField(widget=forms.DateInput(attrs={
        'class':'datepicker'
    }))
    class Meta:
        model=Students
        exclude=('user',)

SEMESTER_CHOICE={
    (8,'8'),
    (7,'7'),
    (6,'6'),
    (5,'5'),
    (2,'2'),
    (4,'4'),
    (3,'3'),
    (1,'1'),
}
ACADEMIC_CHOICE={
    (4,'4'),
    (3,'3'),
    (2,'2'),
    (1,'1'),
}
from django_select2 import forms as s2forms

class MultiSelectWidget(s2forms.ModelSelect2MultipleWidget):
    search_fields = [
        "name__icontains",
    ]
class SubjectsForm(forms.ModelForm):
    semester=forms.ChoiceField(choices=sorted(SEMESTER_CHOICE, key=lambda x: x[1]))
    description=forms.CharField(widget=forms.Textarea())
    class Meta:
        model=Subject
        fields="__all__"
class DepartmentForm(forms.ModelForm):
    total_academic_years=forms.ChoiceField(choices=sorted(ACADEMIC_CHOICE, key=lambda x: x[1]))
    class Meta:
        model=Department
        fields="__all__"
        widgets = {
            "subjects": MultiSelectWidget,
        }