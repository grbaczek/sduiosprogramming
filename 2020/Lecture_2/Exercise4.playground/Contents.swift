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
    
    // Exercise 4
    mutating func remove(key: Int) {
        if let index = keys.firstIndex(of: key) {
            self.keys.remove(at: index)
            self.values.remove(at: index)
        }
    }
    
    mutating func clear(){
        self.keys = []
        self.values = []
    }
    
    func contains(key: Int) -> Bool {
        return keys.contains(key)
    }
    
    func contains(value: String) -> Bool {
        return values.contains(value)
    }
    
    func isEmpty() -> Bool {
        return keys.isEmpty
    }
    
    func count() -> Int {
        return keys.count
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

// Exercise 4
dictionary.remove(key: 200)

dictionary.contains(key: 200)
dictionary.contains(key: 400)

dictionary.contains(value: "OK")
dictionary.contains(value: "Forbidden")
dictionary.contains(value: "Bad Request")

dictionary.isEmpty()
dictionary.count()

dictionary.clear()
dictionary.isEmpty()
dictionary.count()
