from django.db import models
from django.utils import timezone
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.models import (
    AbstractBaseUser,
    PermissionsMixin,
    BaseUserManager,
)


class CustomAccountManager(BaseUserManager):
    def create_superuser(self, email, user_name, first_name, password, **orther_fiels):
        orther_fiels.setdefault("is_staff", True)
        orther_fiels.setdefault("is_superuser", True)
        orther_fiels.setdefault("is_active", True)

        if orther_fiels.get("is_staff") is not True:
            raise ValueError("Superuser must assigned to is staff=True")
        if orther_fiels.get("is_superuser") is not True:
            raise ValueError("Superuser must be assigned to is_superuser=True")
        return self.create_user(email, user_name, first_name, password, **orther_fiels)

    def create_user(self, email, user_name, first_name, password, **orther_fiels):
        if not email:
            raise ValueError(_("You must provide an email address!"))
        email = self.normalize_email(email)
        user = self.model(
            email=email, user_name=user_name, first_name=first_name, **orther_fiels
        )
        user.set_password(password)
        user.save()
        return user


class SystemUser(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(_("email address"), unique=True)
    user_name = models.CharField(max_length=150, unique=True)
    first_name = models.CharField(max_length=150, blank=True)
    start_date = models.DateTimeField(default=timezone.now)
    about = models.TextField(_("about"), max_length=500, blank=True)
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)

    object = CustomAccountManager()

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ["user_name", "first_name"]

    def __str__(self):
        return self.user_name
