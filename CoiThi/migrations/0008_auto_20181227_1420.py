# Generated by Django 2.1.2 on 2018-12-27 07:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CoiThi', '0007_remove_khoahoc_makhoahoc'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='lophoc',
            name='hinhThucThi',
        ),
        migrations.AddField(
            model_name='phongthi',
            name='hinhThucThi',
            field=models.CharField(max_length=100, null=True),
        ),
    ]
