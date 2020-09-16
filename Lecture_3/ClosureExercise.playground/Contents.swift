class Person {
    var cringeMoments = [() -> String]()
    
    func saveCringeMoment(CringeClosure cringe: @escaping() -> String) -> Void {
        cringeMoments.append(cringe)
    }
}


var john = Person()
var cringeStory = "In seventh grade John farted"
var cringeTime = " during the silent game."
john.saveCringeMoment { cringeStory + cringeTime}
// A lot of shorthand is going on, but this is fine.
print(john.cringeMoments[0]())


