#ifndef FILEHELPER_H
#define FILEHELPER_H

#include <QObject>

class FileHelper : public QObject
{
    Q_OBJECT
public:
    explicit FileHelper(QObject *parent = nullptr);

signals:

public slots:
};

#endif // FILEHELPER_H