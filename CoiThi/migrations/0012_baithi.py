# Generated by Django 2.1.2 on 2019-01-07 05:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CoiThi', '0011_dapan'),
    ]

    operations = [
        migrations.CreateModel(
            name='BaiThi',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('baiLam', models.FileField(upload_to='BaiLam')),
            ],
            options={
                'db_table': 'bai_thi',
                'managed': True,
            },
        ),
    ]
