import UIKit
import Foundation

class StackElement: CustomStringConvertible{
    var description: String{
        return value
    }
    
    var value: String
    init(value: String) {
        self.value = value
    }
    
}

class Stack{
    private var stackElements = [StackElement]()
    private var stackCounter = 0
    
    func pushElement(element: StackElement){
        stackElements.append(element)
        stackCounter += 1
    }
    
    func popElement() -> StackElement{
        let elementToPop = stackElements[stackCounter - 1]
        if(stackCounter > 0){
            stackCounter -= 1
        }
        return elementToPop
    }
    
    /*func updateTopElement(newValue: String){
        if(stackCounter > 0){
            stackElements[stackCounter - 1].value = newValue
        }
    }*/
    
    func peekTopElement() -> StackElement?{
        if(stackCounter > 0){
            return stackElements[stackCounter - 1]
        }
        else{
            return nil
        }
    }
    
    func printStackElements(){
        if(stackCounter == 0){
            print("Stack is empty")
        }else{
            for i in 0..<stackCounter{
                print("\(i) element of stack is: \(stackElements[i])")
            }
        }
    }
}


var stack = Stack()
stack.pushElement(element: StackElement(value: "First"))
stack.pushElement(element: StackElement(value: "Second"))
stack.pushElement(element: StackElement(value: "Third"))
stack.pushElement(element: StackElement(value: "Fourth"))
stack.pushElement(element: StackElement(value: "Fifth"))

stack.printStackElements()

let poppedElement = stack.popElement()

print("Popped element: \(poppedElement)")

stack.printStackElements()

if let topElement = stack.peekTopElement(){
    topElement.value = topElement.value + " edited"
    print("Edited element: \(topElement)")
}

stack.printStackElements()
