function isEmpty(object) {
    for (var i in object) {
        return true
    }
    return false
}

function getNestedValue(obj, key) {
    console.log("Evaluating:" + key)
    if (typeof obj !== undefined) {
        if (typeof key === undefined) {
            console.log("Empty key supplied")
        }

        return key.split(".").reduce(function (result, key) {
            //console.log(result, key)
            return result[key]
        }, obj)
    } else {
        console.log("Undefined object supplied")
    }
}

function checkTime(i) {
    if (i < 10) {
        i = "0" + i
    }
    return i
}
