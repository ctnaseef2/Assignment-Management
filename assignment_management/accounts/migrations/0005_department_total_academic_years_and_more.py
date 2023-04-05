# Generated by Django 4.1.7 on 2023-04-02 06:20

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0004_alter_user_options'),
    ]

    operations = [
        migrations.AddField(
            model_name='department',
            name='total_academic_years',
            field=models.IntegerField(default=4),
        ),
        migrations.AddField(
            model_name='students',
            name='date_of_birth',
            field=models.DateField(default=django.utils.timezone.now),
        ),
        migrations.AddField(
            model_name='students',
            name='date_of_joining',
            field=models.DateField(default=django.utils.timezone.now),
        ),
        migrations.AddField(
            model_name='subject',
            name='semester',
            field=models.IntegerField(default=1),
        ),
    ]
