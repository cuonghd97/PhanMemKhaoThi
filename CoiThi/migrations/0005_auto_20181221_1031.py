# Generated by Django 2.1.2 on 2018-12-21 10:31

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('CoiThi', '0004_remove_kythi_makythi'),
    ]

    operations = [
        migrations.AlterField(
            model_name='phongthi',
            name='maKyThi',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='CoiThi.KyThi'),
        ),
    ]
