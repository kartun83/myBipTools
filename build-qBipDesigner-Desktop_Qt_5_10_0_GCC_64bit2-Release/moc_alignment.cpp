/****************************************************************************
** Meta object code from reading C++ file 'alignment.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.10.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../qBipDesigner/alignment.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'alignment.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.10.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Alignment_t {
    QByteArrayData data[11];
    char stringdata0[119];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Alignment_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Alignment_t qt_meta_stringdata_Alignment = {
    {
QT_MOC_LITERAL(0, 0, 9), // "Alignment"
QT_MOC_LITERAL(1, 10, 10), // "mapChanged"
QT_MOC_LITERAL(2, 21, 0), // ""
QT_MOC_LITERAL(3, 22, 12), // "AlignmentMap"
QT_MOC_LITERAL(4, 35, 9), // "AlignEnum"
QT_MOC_LITERAL(5, 45, 10), // "ALIGN_LEFT"
QT_MOC_LITERAL(6, 56, 11), // "ALIGN_RIGHT"
QT_MOC_LITERAL(7, 68, 13), // "ALIGN_HCENTER"
QT_MOC_LITERAL(8, 82, 9), // "ALIGN_TOP"
QT_MOC_LITERAL(9, 92, 12), // "ALIGN_BOTTOM"
QT_MOC_LITERAL(10, 105, 13) // "ALIGN_VCENTER"

    },
    "Alignment\0mapChanged\0\0AlignmentMap\0"
    "AlignEnum\0ALIGN_LEFT\0ALIGN_RIGHT\0"
    "ALIGN_HCENTER\0ALIGN_TOP\0ALIGN_BOTTOM\0"
    "ALIGN_VCENTER"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Alignment[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
       1,   20, // properties
       1,   24, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   19,    2, 0x06 /* Public */,

 // signals: parameters
    QMetaType::Void,

 // properties: name, type, flags
       3, QMetaType::QVariantMap, 0x00495003,

 // properties: notify_signal_id
       0,

 // enums: name, flags, count, data
       4, 0x0,    6,   28,

 // enum data: key, value
       5, uint(Alignment::ALIGN_LEFT),
       6, uint(Alignment::ALIGN_RIGHT),
       7, uint(Alignment::ALIGN_HCENTER),
       8, uint(Alignment::ALIGN_TOP),
       9, uint(Alignment::ALIGN_BOTTOM),
      10, uint(Alignment::ALIGN_VCENTER),

       0        // eod
};

void Alignment::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Alignment *_t = static_cast<Alignment *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->mapChanged(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            typedef void (Alignment::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Alignment::mapChanged)) {
                *result = 0;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        Alignment *_t = static_cast<Alignment *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QVariantMap*>(_v) = _t->map(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        Alignment *_t = static_cast<Alignment *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setMap(*reinterpret_cast< QVariantMap*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
    Q_UNUSED(_a);
}

const QMetaObject Alignment::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Alignment.data,
      qt_meta_data_Alignment,  qt_static_metacall, nullptr, nullptr}
};


const QMetaObject *Alignment::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Alignment::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Alignment.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Alignment::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 1)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 1;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 1;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void Alignment::mapChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
