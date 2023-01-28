from django.urls import path
from .views import CategoryDetail, CategoryList, PostList, PostDetail


app_name = "api"


urlpatterns = [
    path("post/<int:pk>/", PostDetail.as_view(), name="post-detail"),
    path("posts/", PostList.as_view(), name="post-list"),
    path("categories/", CategoryList.as_view(), name="category-list"),
    path("category/<int:pk>/", CategoryDetail.as_view(), name="category-detail"),
]
