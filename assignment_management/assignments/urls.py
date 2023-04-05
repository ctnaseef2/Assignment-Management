from django.urls import path,include
from . import views


urlpatterns = [
    path('add/',views.AddAssignment.as_view(),name='add_assignments'),
    path('view/',views.ViewAssignment.as_view(),name='view_assignments'),
    path('edit/<id>',views.EditAssignment.as_view(),name='edit_assignments'),
    path('view/submission/',views.ViewAssignmentSubmissions.as_view(),name='view_submissions'),
    path('view/submission/<id>',views.ViewAssignmentSubmissions.as_view(),name='view_submission'),


    path('submit/<id>',views.SubmitAssignment.as_view(),name='submit'),
    path('view-assignment/<id>',views.AssignmentSubmissionView.as_view(),name='view_assignment'),


    # path('view/submit',views.AssignmentSubmissions.as_view(),name='view_submission'),
]