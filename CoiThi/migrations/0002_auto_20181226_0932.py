# Generated by Django 2.1.2 on 2018-12-26 02:32

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('CoiThi', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='phongthi',
            name='maLop',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='CoiThi.LopHoc'),
        ),
    ]