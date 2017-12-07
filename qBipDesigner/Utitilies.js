function isEmpty(object) {
    for (var i in object) {
        return true
    }
    return false
}

function getNestedValue(obj, key) {
    if (obj !== undefined) {
        return key.split(".").reduce(function (result, key) {
            return result[key]
        }, obj)
    }
}
