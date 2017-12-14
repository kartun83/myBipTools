#include "highlightcomponent.h"
#include <QQuickTextDocument>

HighlightComponent::HighlightComponent(QObject* parent)
        : inherited(parent)
{
}

void HighlightComponent::onCompleted()
{
    auto property = parent()->property("textDocument");
    auto textDocument = property.value<QQuickTextDocument*>();
    auto document = textDocument->textDocument();
    //TODO init here your QSyntaxHighlighter
}

void HighlightComponent::registerQmlType()
{
    qmlRegisterType<HighlightComponent>("MyBipTools", 1, 0, "JSONHighlighterComponent");
}
