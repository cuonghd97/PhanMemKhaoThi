# Generated by Django 2.1.2 on 2019-01-07 06:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CoiThi', '0012_baithi'),
    ]

    operations = [
        migrations.AddField(
            model_name='baithi',
            name='maDe',
            field=models.CharField(max_length=100, null=True),
        ),
    ]