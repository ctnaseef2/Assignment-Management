from django import template
from django.utils.safestring import mark_safe

register = template.Library()

@register.simple_tag
def gettatts(value,key,marksafe=False):
    try:
        result= value[key]
    except:
        result =getattr(value,key,'')
    finally :
        if marksafe:
            return mark_safe(result)
        return result