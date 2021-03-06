#ifndef SETTINGSDATAMODEL_H
#define SETTINGSDATAMODEL_H

#include <QObject>
#include <QtQml>

class SettingsDataModel : public QObject
{
    Q_OBJECT
    Q_CLASSINFO("Version", "1.0.0")
    Q_PROPERTY(int Battery READ battery WRITE setBattery NOTIFY BatteryChanged FINAL)
    Q_PROPERTY(int Steps READ steps WRITE setSteps NOTIFY StepsChanged FINAL)
    Q_PROPERTY(int StepsGoal READ stepsGoal WRITE setStepsGoal NOTIFY StepsGoalChanged FINAL)
    Q_PROPERTY(int Calories READ calories WRITE setCalories NOTIFY CaloriesChanged FINAL)
    Q_PROPERTY(int Pulse READ pulse WRITE setPulse NOTIFY PulseChanged FINAL)
    Q_PROPERTY(QString Time READ time WRITE setTime NOTIFY TimeChanged FINAL)
    Q_PROPERTY(QString Date READ date WRITE setDate NOTIFY DateChanged FINAL)
    Q_PROPERTY(bool Alarm READ alarm WRITE setAlarm NOTIFY AlarmChanged FINAL)
    Q_PROPERTY(bool Bluetooth READ bluetooth WRITE setBluetooth NOTIFY BluetoothChanged FINAL)
    Q_PROPERTY(bool DND READ DND WRITE setDND NOTIFY DNDChanged FINAL)
    Q_PROPERTY(bool Locked READ locked WRITE setLocked NOTIFY LockedChanged FINAL)
    Q_PROPERTY(int DayNumber READ dayNumber NOTIFY dayNumberChanged STORED false FINAL)
    Q_PROPERTY(int DateDay READ dateDay NOTIFY dateDayChanged STORED false FINAL)
    Q_PROPERTY(int DateMonth READ dateMonth NOTIFY dateMonthChanged STORED false FINAL)
    Q_PROPERTY(int Distance READ Distance WRITE setDistance NOTIFY DistanceChanged FINAL)
    Q_PROPERTY(int WeatherDay READ WeatherDay WRITE setWeatherDay NOTIFY WeatherDayChanged FINAL)
    Q_PROPERTY(int WeatherNight READ WeatherNight WRITE setWeatherNight NOTIFY WeatherNightChanged FINAL)
    Q_PROPERTY(int WeatherCurrent READ WeatherCurrent WRITE setWeatherCurrent NOTIFY WeatherCurrentChanged FINAL)
    Q_PROPERTY(bool ShowGrid READ ShowGrid WRITE setShowGrid NOTIFY ShowGridChanged)

public:
    explicit SettingsDataModel(QObject *parent = nullptr);

    static void declareQML()
    {
        qmlRegisterType<SettingsDataModel>("MyBipTools", 1, 0, "Settings");
    }

    int battery() const;
    void setBattery(int battery);

    int steps() const;
    void setSteps(int steps);

    int stepsGoal() const;
    void setStepsGoal(int stepsGoal);

    int calories() const;
    void setCalories(int calories);

    int pulse() const;
    void setPulse(int pulse);

    QString time() const;
    void setTime(const QString &time);

    QString date() const;
    void setDate(const QString &date);

    int dayNumber() const;
    int dateDay() const;
    int dateMonth() const;

    bool alarm() const;
    void setAlarm(bool alarm);

    bool bluetooth() const;
    void setBluetooth(bool bluetooth);

    bool DND() const;
    void setDND(bool dnd);

    bool locked() const;
    void setLocked(bool locked);

    int Distance() const;
    void setDistance(int distance);

    int WeatherDay() const;
    void setWeatherDay(int weather_day);

    int WeatherNight() const;
    void setWeatherNight(int weather_night);

    int WeatherCurrent() const;
    void setWeatherCurrent(int WeatherCurrent);


    bool ShowGrid() const;
    void setShowGrid(bool showGrid);

signals:
    void BatteryChanged(const int &newBattery);
    void StepsChanged(const int &newSteps);
    void StepsGoalChanged(const int &newStepsGoal);
    void CaloriesChanged(const int &newCalories);
    void PulseChanged(const int &newPulse);
    void TimeChanged(const QString &newTime);
    void DateChanged(const QString &newDate);
    void AlarmChanged(const bool &newAlarm);
    void BluetoothChanged(const bool &newBluetooth);
    void DNDChanged(const bool &newDND);
    void LockedChanged(const bool &newLocked);
    void dayNumberChanged(const int &newDayNumber);
    void dateDayChanged(const int &newDateDay);
    void dateMonthChanged(const int &newDateMonth);
    void DistanceChanged(const int &newDistance);
    void WeatherNightChanged(const int&newWeatherNight);
    void WeatherDayChanged(const int&newWeatherDay);
    void WeatherCurrentChanged(const int&newWeatherCurrent);
    void ShowGridChanged(const bool&newShowGrid);

public slots:

private:
    int m_battery;
    int m_steps;
    int m_stepsGoal;
    int m_calories;
    int m_pulse;
    int m_distance;
    int m_weather_current;
    int m_weather_day;
    int m_weather_night;
    bool m_alarm;
    bool m_bluetooth;
    bool m_dnd;
    bool m_locked;
    bool m_showGrid;
    QString m_time;
    QString m_date;

    const QString dateFormat = "dd.MM";
    const QString timeFormat = "hh:mm:ss";
};

#endif // SETTINGSDATAMODEL_H
