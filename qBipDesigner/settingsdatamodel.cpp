#include "settingsdatamodel.h"
#include <QTime>
#include <QDate>
#include <QDebug>

SettingsDataModel::SettingsDataModel(QObject *parent) : QObject(parent)
{
    m_battery = 55;
    m_calories = 154;
    m_pulse = 115;
    m_steps = 12098;
    m_stepsGoal = 15000;
    m_distance = 1024;
    m_weather_day = -5;
    m_weather_night = 10;
    m_weather_current = 0;
    m_time = QTime::currentTime().toString(timeFormat);
    m_date = QDate::currentDate().toString(dateFormat);
    m_alarm = m_bluetooth = m_dnd = m_locked = true;
}

int SettingsDataModel::battery() const
{
    return m_battery;
}

void SettingsDataModel::setBattery(int battery)
{
    if (battery >=0 && battery <=100 && battery != m_battery)
    {
    m_battery = battery;
    emit BatteryChanged(m_battery);
    }
}

int SettingsDataModel::steps() const
{
    return m_steps;
}

void SettingsDataModel::setSteps(int steps)
{
    if (steps > 0 && steps != m_steps)
    {
     m_steps = steps;
     emit StepsChanged(m_steps);
    }
}

int SettingsDataModel::stepsGoal() const
{
    return m_stepsGoal;
}

void SettingsDataModel::setStepsGoal(int stepsGoal)
{
    if (stepsGoal >0 and stepsGoal != m_stepsGoal)
    {
        m_stepsGoal = stepsGoal;
        emit StepsGoalChanged(m_stepsGoal);
    }
}

int SettingsDataModel::calories() const
{
    return m_calories;
}

void SettingsDataModel::setCalories(int calories)
{
    if (calories > 0 && calories != m_calories)
    {
        m_calories = calories;
        emit CaloriesChanged(m_calories);
    }
}

int SettingsDataModel::pulse() const
{
    return m_pulse;
}

void SettingsDataModel::setPulse(int pulse)
{
    if (pulse > 0 && pulse != m_pulse)
    {
        m_pulse = pulse;
        emit PulseChanged(m_pulse);
    }
}

QString SettingsDataModel::time() const
{
    return m_time;
}

void SettingsDataModel::setTime(const QString &time)
{
    if ( QTime::fromString(time,timeFormat).isValid() ) {
        m_time = time;
        emit TimeChanged(m_time);
    }
}

QString SettingsDataModel::date() const
{
    return m_date;
}

void SettingsDataModel::setDate(const QString &date)
{
    if (QDate::fromString(date, dateFormat).isValid()) {
        m_date = date;
        emit DateChanged(m_date);
        emit dayNumberChanged(dayNumber());
        emit dateDayChanged(dateDay());
        emit dateMonthChanged(dateMonth());
    }
}

int SettingsDataModel::dayNumber() const
{
    //QDate* date = new QDate();
    //date.
    qDebug() << QDate::fromString(m_date, dateFormat).dayOfWeek();
    return QDate::fromString(m_date, dateFormat).dayOfWeek() - 1;
}

int SettingsDataModel::dateDay() const
{
    qDebug() << "Date day" << QDate::fromString(m_date, dateFormat).day();
    return QDate::fromString(m_date, dateFormat).day();
}

int SettingsDataModel::dateMonth() const
{
    qDebug() << "Date month" << QDate::fromString(m_date, dateFormat).month();
    return QDate::fromString(m_date, dateFormat).month();
}

bool SettingsDataModel::alarm() const
{
    return m_alarm;
}

void SettingsDataModel::setAlarm(bool alarm)
{
    m_alarm = alarm;
    emit AlarmChanged(m_alarm);
}

bool SettingsDataModel::bluetooth() const
{
    return m_bluetooth;
}

void SettingsDataModel::setBluetooth(bool bluetooth)
{
    m_bluetooth = bluetooth;
    emit BluetoothChanged(m_bluetooth);
}

bool SettingsDataModel::DND() const
{
    return m_dnd;
}

void SettingsDataModel::setDND(bool dnd)
{
    m_dnd = dnd;
    emit DNDChanged(m_dnd);
}

bool SettingsDataModel::locked() const
{
    return m_locked;
}

void SettingsDataModel::setLocked(bool locked)
{
    m_locked = locked;
    emit LockedChanged(m_locked);
}

int SettingsDataModel::Distance() const
{
    return m_distance;
}

void SettingsDataModel::setDistance(int distance)
{
    if (distance >= 0 && distance != m_distance)
    {
        m_distance = distance;
        emit DistanceChanged(m_distance);
    }

}

int SettingsDataModel::WeatherDay() const
{
    return m_weather_day;
}

void SettingsDataModel::setWeatherDay(int weather_day)
{
    m_weather_day = weather_day;
    emit WeatherDayChanged(m_weather_day);
}

int SettingsDataModel::WeatherNight() const
{
    return m_weather_night;
}

void SettingsDataModel::setWeatherNight(int weather_night)
{
    m_weather_night = weather_night;
    emit WeatherNightChanged(m_weather_night);
}

int SettingsDataModel::WeatherCurrent() const
{
    return m_weather_current;
}

void SettingsDataModel::setWeatherCurrent(int weather_current)
{
    m_weather_current = weather_current;
    emit WeatherCurrentChanged(m_weather_current);
}
