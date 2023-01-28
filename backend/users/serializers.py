from rest_framework import serializers
from users.models import SystemUser


class RegisterUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = SystemUser
        fields = ("email", "user_name", "password")
        extra_kwargs = {"password": {"write_only": True}}

    def create(self, validation_data):
        password = validation_data.pop("password", None)
        instance = self.Meta.model(**validation_data)
        if password is not None:
            instance.set_password(password)
        instance.save()
        return instance
