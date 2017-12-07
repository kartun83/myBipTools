#ifndef FILEHELPER_H
#define FILEHELPER_H

#include <QObject>
#include <QFile>

class FileHelper : public QObject
{
    Q_OBJECT
    // File name of the text file to read/write
    Q_PROPERTY(QString filename READ filename WRITE setFilename NOTIFY filenameChanged)

    // Text content of the file
    Q_PROPERTY(QString fileContent READ fileContent WRITE setFileContent NOTIFY fileContentChanged)
public:
    explicit FileHelper(QObject *parent = nullptr);
    QString filename() const;
    QString fileContent() const;

    // Properties' write functions
    void setFilename(const QString &str);
    void setFileContent(const QString &str);

    // Accessible from QML
    Q_INVOKABLE void saveFile();
    Q_INVOKABLE void loadFile();

    Q_INVOKABLE QString getFilename(const QString name);

signals:
    void filenameChanged();
    void fileContentChanged();

public slots:

private:
    QString currentFile;
    // Contains the file data in QString format
    QString m_fileContent;
    QString m_workingDir;
};

#endif // FILEHELPER_H
