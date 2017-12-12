#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "filehelper.h"
#include "settingsdatamodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QLoggingCategory::setFilterRules(QStringLiteral("qt.qml.binding.removal.info=true"));

    // Init additional libs
    QStringList paths = QCoreApplication::libraryPaths();
    paths.append(".");
    paths.append("imageformats");
    paths.append("platforms");
    paths.append("sqldrivers");
    QCoreApplication::setLibraryPaths(paths);

    QGuiApplication app(argc, argv);

    // Declaring your C++ class to the QML system
    qmlRegisterType<FileHelper>("MyCustomClasses", 1, 0, "FileHelper");
    qmlRegisterType<SettingsDataModel>("MyCustomClasses", 1, 0, "Settings");

    QQmlApplicationEngine engine;

    SettingsDataModel* m_model = new SettingsDataModel();
    QQmlContext *ctxt = engine.rootContext();
        ctxt->setContextProperty("mySettingsModel", m_model);


    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
