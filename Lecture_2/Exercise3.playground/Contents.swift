struct Dictionary {
    
    // Exercise 3
    var keys: [Int]
    var values: [String]
    
    init() {
        self.keys = []
        self.values = []
    }
    
    mutating func put(key: Int, value: String) {
        if let index = keys.firstIndex(of: key) {
            keys.remove(at: index)
            keys.insert(key, at: index)
            values.remove(at: index)
            values.insert(value, at: index)
        } else {
            keys.append(key)
            values.append(value)
        }
    }
    
    func value(key: Int) -> String? {
        if let index = keys.firstIndex(of: key) {
            return values[index]
        }
        return nil
    }
    
}

// Exercise 3
var dictionary = Dictionary()

dictionary.put(key: 200, value: "OK")
dictionary.put(key: 400, value: "Baaad Request")
dictionary.put(key: 400, value: "Bad Request")
dictionary.put(key: 501, value: "Not Implemented")

dictionary.value(key: 200)
dictionary.value(key: 500)
