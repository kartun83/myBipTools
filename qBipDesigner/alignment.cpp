#include "alignment.h"

Alignment::Alignment(QObject *parent) : QObject(parent)
{
    m_map.insert(QString::number(ALIGN_LEFT),QVariant(Qt::AlignLeft));
    m_map.insert(QString::number(ALIGN_RIGHT),QVariant(Qt::AlignRight));
    m_map.insert(QString::number(ALIGN_HCENTER),QVariant(Qt::AlignHCenter));
    m_map.insert(QString::number(ALIGN_TOP),QVariant(Qt::AlignTop));
    m_map.insert(QString::number(ALIGN_BOTTOM),QVariant(Qt::AlignBottom));
    m_map.insert(QString::number(ALIGN_VCENTER),QVariant(Qt::AlignVCenter));

    // Layout intersections
    m_map.insert(QString::number(ALIGN_TOP|ALIGN_HCENTER),QVariant(Qt::AlignTop | Qt::AlignHCenter));
    m_map.insert(QString::number(ALIGN_TOP|ALIGN_LEFT),QVariant(Qt::AlignTop | Qt::AlignLeft));
    m_map.insert(QString::number(ALIGN_TOP|ALIGN_RIGHT),QVariant(Qt::AlignTop | Qt::AlignRight));
    m_map.insert(QString::number(ALIGN_VCENTER|ALIGN_HCENTER),QVariant(Qt::AlignVCenter | Qt::AlignHCenter));
    m_map.insert(QString::number(ALIGN_VCENTER|ALIGN_LEFT),QVariant(Qt::AlignVCenter | Qt::AlignLeft));
    m_map.insert(QString::number(ALIGN_VCENTER|ALIGN_RIGHT),QVariant(Qt::AlignVCenter | Qt::AlignRight));
    m_map.insert(QString::number(ALIGN_BOTTOM|ALIGN_HCENTER),QVariant(Qt::AlignBottom | Qt::AlignHCenter));
    m_map.insert(QString::number(ALIGN_BOTTOM|ALIGN_LEFT),QVariant(Qt::AlignBottom | Qt::AlignLeft));
    m_map.insert(QString::number(ALIGN_BOTTOM|ALIGN_RIGHT),QVariant(Qt::AlignBottom | Qt::AlignRight));
}

QVariantMap Alignment::map() const
{
    return m_map;
}

void Alignment::setMap(const QVariantMap &map)
{
    if(map != m_map) {
               m_map = map;
               emit mapChanged();
           }
}
