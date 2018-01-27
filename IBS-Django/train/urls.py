from django.urls import path

from train import views

app_name = 'train'
urlpatterns = [
    path('', views.homepage),
    path('booking/', views.booking),
    path('result/', views.result),
    path('search/', views.search),
    path('ticket/', views.ticket),
    path('profile/<int:pk>', views.profile),
]
