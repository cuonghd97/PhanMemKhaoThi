# Generated by Django 2.1.7 on 2019-03-19 01:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CoiThi', '0017_auto_20190319_0836'),
    ]

    operations = [
        migrations.AlterField(
            model_name='log_diem',
            name='diemCu',
            field=models.FloatField(default=0),
        ),
        migrations.AlterField(
            model_name='log_diem',
            name='diemMoi',
            field=models.FloatField(default=0),
        ),
    ]