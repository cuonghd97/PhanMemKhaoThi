# Generated by Django 2.1.7 on 2019-03-11 15:42

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CoiThi', '0014_auto_20190310_1449'),
    ]

    operations = [
        migrations.AlterField(
            model_name='chitietlop',
            name='baiLam',
            field=models.FileField(null=True, upload_to='BaiLam/'),
        ),
        migrations.AlterField(
            model_name='sinhvien',
            name='ngaySinh',
            field=models.DateField(verbose_name=datetime.date(2019, 3, 11)),
        ),
    ]
