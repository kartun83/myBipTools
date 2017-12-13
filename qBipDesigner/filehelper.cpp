#include "filehelper.h"
#include <QUrl>
#include <QDebug>
#include <QFileInfo>
#include <QStringRef>
#include <QJsonDocument>
#include <QJsonParseError>

FileHelper::FileHelper(QObject *parent) : QObject(parent)
{

}

/*
    Return the name of the currently selected file.
*/
QString FileHelper::filename() const
{
    return currentFile;
}

/*
    Return the file's content as a string.
*/
QString FileHelper::fileContent() const
{
    return m_fileContent;
}

/*
    Set the file name of the current file.
*/
void FileHelper::setFilename(const QString &str)
{
    if (str != currentFile) {
        QUrl url(str);
        currentFile = url.toLocalFile();
        m_workingDir = QFileInfo(currentFile).absolutePath();
        qDebug() << m_workingDir;
        emit filenameChanged();
    }
}

/*
    Set the content of the file as a string.
*/
void FileHelper::setFileContent(const QString &str)
{
    if (str != m_fileContent) {
        m_fileContent = str;
        emit fileContentChanged();
    }
}

/*
    Called from QML to save the file using the filename and content.
    Makes sure that the file has a .txt extension.
*/
void FileHelper::saveFile()
{
    if (currentFile.size() == 0) {
        qWarning() << "Cannot save file, empty filename.";
        return;
    }

    QString extendedName = currentFile;

    QFile file(extendedName);
    if (file.open(QFile::WriteOnly | QFile::Truncate)) {
        QTextStream outStream(&file);
        outStream << m_fileContent;
    }
    else
    {
        qDebug() << "Writing failed";
    }

    file.close();
}

/*
    Load the contents of a file.
    Only loads files with a .txt extension
*/
void FileHelper::loadFile()
{
    m_fileContent.clear();
    QString extendedName = currentFile;
    qDebug() << "Reading file" << extendedName;

    QFile file( extendedName );
    if (file.open(QFile::ReadOnly | QIODevice::Text)) {
        QTextStream inStream(&file);
        QString line;
        m_fileContent= inStream.readAll();
        validateJson(m_fileContent);
    }
    else
    {
        qDebug() << "Reading failed";
    }
    file.close();
}

QString FileHelper::validateJson(QString json)
{
    QJsonParseError *error = new QJsonParseError();
    QJsonDocument doc = QJsonDocument::fromJson(json.toUtf8(), error);
    QString result;
    if (error->error != QJsonParseError::NoError)
    {
        QStringRef subString = json.midRef(error->offset - 5, error->offset + 5);
        qDebug() << error->errorString() << ".Somewhere at:" << subString;
        result = QString("%1.\n %2: %3").arg(error->errorString(), "Somewhere at",  json.mid(error->offset - 5, error->offset + 5));
    }
    return result;
}

QString FileHelper::getFilename(const QString name)
{
    // TODO :: Make properly
    qDebug() << "Evaluating in cpp:" << name;
    return QUrl::fromLocalFile(QFileInfo(m_workingDir+'/'+name).absoluteFilePath()).toString();
}
