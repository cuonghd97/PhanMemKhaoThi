# Generated by Django 2.1.2 on 2018-12-27 04:15

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('CoiThi', '0006_lophoc_hinhthucthi'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='khoahoc',
            name='maKhoaHoc',
        ),
    ]