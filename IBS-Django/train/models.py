from django.db import models


class Passenger(models.Model):
    name = models.CharField(max_length=30)
    aadhar = models.CharField(max_length=12)
    username = models.CharField(max_length=12)
    phone = models.CharField(max_length=10)

    def __str__(self):
        return self.username
