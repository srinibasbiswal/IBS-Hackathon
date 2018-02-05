from django import forms
from train.models import Passenger


class PassengerForm(forms.ModelForm):
    class Meta:
        model = Passenger
        fields = [
            "name",
            "aadhar",
            "username",
            "phone",
        ]
