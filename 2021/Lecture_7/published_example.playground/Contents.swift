import UIKit
import Combine

class Weather {
    @Published var temperature: Double
    init(temperature: Double) {
        self.temperature = temperature
    }
}

let weather = Weather(temperature: 20)
let cancellable = weather.$temperature
    .sink() {
        print ("Temperature now: \($0)")
}

let cancellable2 = weather.$temperature
    .sink() {
        print ("Temperature now: \($0)")
}
weather.temperature = 25

weather.temperature = 1

cancellable.cancel()

weather.temperature = 10

// Prints:
// Temperature now: 20.0
// Temperature now: 25.0
