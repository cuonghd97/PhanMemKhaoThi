# Generated by Django 2.1.2 on 2018-11-29 08:48

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ChiTietLop',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.CreateModel(
            name='ChiTietPhong',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('SBD', models.CharField(max_length=20, unique=True)),
                ('TrangThai', models.TextField(max_length=200)),
                ('GhiChu', models.TextField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='DonVi',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('MaDonVi', models.CharField(max_length=20, unique=True)),
                ('TenDonVi', models.TextField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='KyThi',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('MaKyThi', models.CharField(max_length=20, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='LopHoc',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('MaLop', models.CharField(max_length=20, unique=True)),
                ('TenLop', models.TextField(max_length=200)),
                ('KhoaHoc', models.TextField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Mon',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('MaMon', models.CharField(max_length=20, unique=True)),
                ('TenMon', models.TextField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Nguoi',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Ma', models.CharField(max_length=20, unique=True)),
                ('Ten', models.TextField(max_length=200)),
                ('GioiTinh', models.TextField(max_length=200)),
                ('ChucVu', models.TextField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='PhongThi',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('MaPhong', models.CharField(max_length=20, unique=True)),
                ('HinhThucThi', models.TextField(max_length=200)),
                ('MaCanBoCoi1', models.CharField(max_length=20)),
                ('MaCanBoCoi2', models.CharField(max_length=20)),
                ('MaCanBoCham1', models.CharField(max_length=20)),
                ('MaCanBoCham2', models.CharField(max_length=20)),
                ('MaKyThi', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoiThi.KyThi')),
            ],
        ),
        migrations.AddField(
            model_name='kythi',
            name='KhoaHoc',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoiThi.LopHoc'),
        ),
        migrations.AddField(
            model_name='kythi',
            name='MonHoc',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoiThi.Mon'),
        ),
        migrations.AddField(
            model_name='chitietphong',
            name='MaHocVien',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoiThi.Nguoi'),
        ),
        migrations.AddField(
            model_name='chitietphong',
            name='MaPhong',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoiThi.PhongThi'),
        ),
        migrations.AddField(
            model_name='chitietlop',
            name='DonVi',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoiThi.DonVi'),
        ),
        migrations.AddField(
            model_name='chitietlop',
            name='MaHocVien',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoiThi.Nguoi'),
        ),
        migrations.AddField(
            model_name='chitietlop',
            name='MaLop',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoiThi.LopHoc'),
        ),
        migrations.AddField(
            model_name='chitietlop',
            name='Mon',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoiThi.Mon'),
        ),
    ]
