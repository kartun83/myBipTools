/****************************************************************************
** Meta object code from reading C++ file 'filehelper.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.10.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../qBipDesigner/filehelper.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'filehelper.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.10.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_FileHelper_t {
    QByteArrayData data[12];
    char stringdata0[121];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_FileHelper_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_FileHelper_t qt_meta_stringdata_FileHelper = {
    {
QT_MOC_LITERAL(0, 0, 10), // "FileHelper"
QT_MOC_LITERAL(1, 11, 15), // "filenameChanged"
QT_MOC_LITERAL(2, 27, 0), // ""
QT_MOC_LITERAL(3, 28, 18), // "fileContentChanged"
QT_MOC_LITERAL(4, 47, 8), // "saveFile"
QT_MOC_LITERAL(5, 56, 8), // "loadFile"
QT_MOC_LITERAL(6, 65, 12), // "validateJson"
QT_MOC_LITERAL(7, 78, 4), // "json"
QT_MOC_LITERAL(8, 83, 11), // "getFilename"
QT_MOC_LITERAL(9, 95, 4), // "name"
QT_MOC_LITERAL(10, 100, 8), // "filename"
QT_MOC_LITERAL(11, 109, 11) // "fileContent"

    },
    "FileHelper\0filenameChanged\0\0"
    "fileContentChanged\0saveFile\0loadFile\0"
    "validateJson\0json\0getFilename\0name\0"
    "filename\0fileContent"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_FileHelper[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       2,   54, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   44,    2, 0x06 /* Public */,
       3,    0,   45,    2, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
       4,    0,   46,    2, 0x02 /* Public */,
       5,    0,   47,    2, 0x02 /* Public */,
       6,    1,   48,    2, 0x02 /* Public */,
       8,    1,   51,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::QString, QMetaType::QString,    7,
    QMetaType::QString, QMetaType::QString,    9,

 // properties: name, type, flags
      10, QMetaType::QString, 0x00495103,
      11, QMetaType::QString, 0x00495103,

 // properties: notify_signal_id
       0,
       1,

       0        // eod
};

void FileHelper::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        FileHelper *_t = static_cast<FileHelper *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->filenameChanged(); break;
        case 1: _t->fileContentChanged(); break;
        case 2: _t->saveFile(); break;
        case 3: _t->loadFile(); break;
        case 4: { QString _r = _t->validateJson((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 5: { QString _r = _t->getFilename((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            typedef void (FileHelper::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&FileHelper::filenameChanged)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (FileHelper::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&FileHelper::fileContentChanged)) {
                *result = 1;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        FileHelper *_t = static_cast<FileHelper *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->filename(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->fileContent(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        FileHelper *_t = static_cast<FileHelper *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setFilename(*reinterpret_cast< QString*>(_v)); break;
        case 1: _t->setFileContent(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject FileHelper::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_FileHelper.data,
      qt_meta_data_FileHelper,  qt_static_metacall, nullptr, nullptr}
};


const QMetaObject *FileHelper::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FileHelper::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_FileHelper.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int FileHelper::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 2;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void FileHelper::filenameChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void FileHelper::fileContentChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
