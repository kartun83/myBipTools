#ifndef ALIGNMENT_H
#define ALIGNMENT_H

#include <QObject>
#include <QtQml>
#include <QVariant>
//#include <QVariantHash>
#include <QVariantMap>

class Alignment : public QObject
{
    Q_OBJECT
    // Seems QVariantHash doesn't work properly in QML, so fallback for map for now
    //Q_PROPERTY(QVariantHash AlignmentMap READ map WRITE setMap NOTIFY mapChanged)
    Q_PROPERTY(QVariantMap AlignmentMap READ map WRITE setMap NOTIFY mapChanged)
public:
    explicit Alignment(QObject *parent = nullptr);
    enum AlignEnum
            {
                ALIGN_LEFT = 2,
                ALIGN_RIGHT = 4,
                ALIGN_HCENTER = 8,
                ALIGN_TOP = 16,
                ALIGN_BOTTOM = 32,
                ALIGN_VCENTER = 64,
            };
            Q_ENUMS(AlignEnum)


    // Do not forget to declare your class to the QML system.
    static void declareQML() {
        qmlRegisterType<Alignment>("MyBipTools", 1, 0, "Alignment");
    }

    //QVariantHash map() const;
    //void setMap(const QVariantHash &map);
    QVariantMap map() const;
    void setMap(const QVariantMap &map);


signals:
             void mapChanged();

public slots:
private:
            //QVariantHash m_map;
             QVariantMap m_map;
};

#endif // ALIGNMENT_H
