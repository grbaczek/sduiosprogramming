import Foundation

class Balance{
    var value: Int
    init(value: Int) {
        self.value = value
    }
}

let serialQueue = DispatchQueue(label: "SerialQueue")
let concurentQueue = DispatchQueue(label: "WithdrawalQueue", attributes: .concurrent)

class Atm_v1{

    var balance: Balance
    let tag: String
    
    init(tag: String, _ balance: Balance) {
        self.tag = tag
        self.balance = balance
    }
   
    func withdraw(value: Int) {
        print("\(self.tag): checking if balance containing sufficent money")
        if balance.value > value {
            print("\(self.tag): Balance is sufficent, please wait while processing withdrawal")
            // sleeping for some random time, simulating a long process
            Thread.sleep(forTimeInterval: Double.random(in: 0...2))
            balance.value -= value
            print("\(self.tag): Done: \(value) has been withdrawed")
            print("\(self.tag): current balance is \(balance.value)")
        } else {
            print("\(self.tag): Can't withdraw: insufficent balance")
        }
    }
}

class Atm_v2{

    var balance: Balance
    let tag: String
    
    init(tag: String, _ balance: Balance) {
        self.tag = tag
        self.balance = balance
    }
   
    func withdraw(value: Int) {
        serialQueue.async {
            print("\(self.tag): checking if balance containing sufficent money")
            if self.balance.value > value {
                print("\(self.tag): Balance is sufficent, please wait while processing withdrawal")
                // sleeping for some random time, simulating a long process
                Thread.sleep(forTimeInterval: Double.random(in: 0...2))
                self.balance.value -= value
                print("\(self.tag): Done: \(value) has been withdrawed")
                print("\(self.tag): current balance is \(self.balance.value)")
            } else {
                print("\(self.tag): Can't withdraw: insufficent balance")
            }
        }
    }
}

class Atm_v3{

    var balance: Balance
    let tag: String
    
    init(tag: String, _ balance: Balance) {
        self.tag = tag
        self.balance = balance
    }
   
    func withdraw(value: Int) {
        concurentQueue.async(flags: .barrier) {
            print("\(self.tag): checking if balance containing sufficent money")
            if self.balance.value > value {
                print("\(self.tag): Balance is sufficent, please wait while processing withdrawal")
                // sleeping for some random time, simulating a long process
                Thread.sleep(forTimeInterval: Double.random(in: 0...2))
                self.balance.value -= value
                print("\(self.tag): Done: \(value) has been withdrawed")
                print("\(self.tag): current balance is \(self.balance.value)")
            } else {
                print("\(self.tag): Can't withdraw: insufficent balance")
            }
        }
    }
}


func run_atm_v1(){
    let queue = DispatchQueue(label: "WithdrawalQueue", attributes: .concurrent)
    let balance = Balance(value: 1200)
    
    queue.async {
        let firstATM = Atm_v1(tag: "firstATM",  balance)
        firstATM.withdraw(value: 1000)
    }

    queue.async {
        let secondATM = Atm_v1(tag: "secondATM",  balance)
        secondATM.withdraw(value: 800)
    }
}

func run_atm_v2(){
    let queue = DispatchQueue(label: "WithdrawalQueue", attributes: .concurrent)
    let balance = Balance(value: 1200)
    queue.async {
        let firstATM = Atm_v2(tag: "firstATM",  balance)
        firstATM.withdraw(value: 1000)
    }

    queue.async {
        let secondATM = Atm_v2(tag: "secondATM",  balance)
        secondATM.withdraw(value: 800)
    }
}

func run_atm_v3(){
    let queue = DispatchQueue(label: "WithdrawalQueue", attributes: .concurrent)
    let balance = Balance(value: 1200)
    queue.async {
        let firstATM = Atm_v3(tag: "firstATM",  balance)
        firstATM.withdraw(value: 1000)
    }

    queue.async {
        let secondATM = Atm_v3(tag: "secondATM",  balance)
        secondATM.withdraw(value: 800)
    }
}

//run_atm_v1()
//run_atm_v2()
run_atm_v3()
