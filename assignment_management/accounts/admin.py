from django.contrib import admin

# Register your models here.
from .models import *

class AuthorAdmin(admin.ModelAdmin):
    pass
admin.site.register(Department, AuthorAdmin)
admin.site.register(Subject, AuthorAdmin)