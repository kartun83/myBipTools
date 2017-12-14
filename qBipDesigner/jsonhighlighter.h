#ifndef JSONHIGHLIGHTER_H
#define JSONHIGHLIGHTER_H

#include <QObject>
#include <QSyntaxHighlighter>
#include <QTextCharFormat>
#include <QRegularExpression>
#include <QtQml>

class QTextDocument;

class JSONHighlighter : public QSyntaxHighlighter
{
        Q_OBJECT

public:
    JSONHighlighter(QTextDocument *parent = 0);
    static void declareQML()
    {
        qmlRegisterType<JSONHighlighter>("MyBipTools", 1, 0, "JSONHighlighter");
    }
    Q_INVOKABLE void setMyDocument(QTextDocument *doc);
    Q_INVOKABLE void myRehighlight();
protected:
    void highlightBlock(const QString &text) override;

private:
    struct HighlightingRule
    {
        QRegularExpression pattern;
        QTextCharFormat format;
    };
    QVector<HighlightingRule> highlightingRules;

    QRegularExpression commentStartExpression;
    QRegularExpression commentEndExpression;

    QTextCharFormat keywordFormat;
    QTextCharFormat classFormat;
    QTextCharFormat singleLineCommentFormat;
    QTextCharFormat multiLineCommentFormat;
    QTextCharFormat quotationFormat;
    QTextCharFormat functionFormat;
};



#endif // JSONHIGHLIGHTER_H
