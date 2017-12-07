#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "filehelper.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    // Declaring your C++ class to the QML system
    qmlRegisterType<FileHelper>("MyCustomClasses", 1, 0, "FileHelper");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
