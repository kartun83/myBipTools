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
    m_time = QTime::currentTime().toString("hh:mm:ss");
    m_date = QDate::currentDate().toString("dd.MM.yyyy");
    m_alarm = m_bluetooth = m_dnd = m_locked = true;
}

int SettingsDataModel::battery() const
{
    return m_battery;
}

void SettingsDataModel::setBattery(int battery)
{
    if (battery >0 && battery != m_battery)
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

    m_time = time;
    emit TimeChanged(m_time);
}

QString SettingsDataModel::date() const
{
    return m_date;
}

void SettingsDataModel::setDate(const QString &date)
{
    m_date = date;
    emit DateChanged(m_date);
    emit dayNumberChanged(dayNumber());
}

int SettingsDataModel::dayNumber() const
{
    //QDate* date = new QDate();
    //date.
    qDebug() << QDate::fromString(m_date, "dd.MM.yyyy").dayOfWeek();
    return QDate::fromString(m_date, "dd.MM.yyyy").dayOfWeek() - 1;
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
