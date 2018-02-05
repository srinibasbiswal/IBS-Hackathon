from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from train.models import Passenger
from train.forms import PassengerForm


def index(request):
    return render(request, "base.html", context=None)


def homepage(request):
    form = PassengerForm(request.POST)

    if request.method == "POST":
        if form.is_valid():
            instance = form.save()
            return HttpResponse("Success")
        else:
            return HttpResponse("Error")
    context = {
        "title": "Login / Register",
        "form": form,
    }
    return render(request, "homepage.html", context)


def profile(request, pk=None):
    instance = get_object_or_404(Passenger, pk=pk)
    context = {
        "instance": instance,
    }
    return render(request, "profile.html", context)


def search(request):
    context = {
        "title": "Search",
    }
    return render(request, "search.html", context)


def ticket(request):
    context = {
        "title": "Ticket",
    }
    return render(request, "ticket.html", context)


def booking(request):
    context = {
        "title": "Booking",
    }
    return render(request, "booking.html", context)


def result(request):
    context = {
        "title": "Result",
    }
    return render(request, "result.html", context)

def transfer(request,):
    username = Passenger.objects.filter()
