# Generated by Django 2.1.2 on 2018-12-26 02:53

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('CoiThi', '0003_auto_20181226_0950'),
    ]

    operations = [
        migrations.AlterField(
            model_name='chamthi',
            name='ngayCham',
            field=models.DateField(default=django.utils.timezone.now),
        ),
        migrations.AlterField(
            model_name='kythi',
            name='ngayBatDau',
            field=models.DateField(default=django.utils.timezone.now),
        ),
        migrations.AlterField(
            model_name='kythi',
            name='ngayKetThuc',
            field=models.DateField(default=django.utils.timezone.now),
        ),
        migrations.AlterField(
            model_name='phongthi',
            name='ngayThi',
            field=models.DateField(default=django.utils.timezone.now),
        ),
    ]
