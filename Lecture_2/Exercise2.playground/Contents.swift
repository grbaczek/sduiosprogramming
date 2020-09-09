import UIKit
import Foundation

struct StackElement: CustomStringConvertible{
    var description: String{
        return value
    }
    
    var value: String
    init(value: String) {
        self.value = value
    }
    
}

struct Stack{
    private var stackElements = [StackElement]()
    private var stackCounter = 0
    
    mutating func pushElement(element: StackElement){
        stackElements.append(element)
        stackCounter += 1
    }
    
    mutating func popElement() -> StackElement?{
        if(stackCounter > 0){
            let elementToPop = stackElements[stackCounter - 1]
            stackCounter -= 1
            return elementToPop
        }
        else{
            return nil
        }
    }
    
    mutating func updateTopElement(newValue: String){
        if(stackCounter > 0){
            stackElements[stackCounter - 1].value = newValue
        }
    }
    
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
            print("\n")
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

let popedElement = stack.popElement()

print("Poped element: \(popedElement!)")

stack.printStackElements()

if var topElement = stack.peekTopElement(){
    topElement.value = topElement.value + " edited"
    print("Edited element: \(topElement)")
}

stack.printStackElements()

stack.updateTopElement(newValue: "edited element")

stack.printStackElements()
