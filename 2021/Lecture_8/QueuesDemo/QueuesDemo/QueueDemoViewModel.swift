//
//  QueueDemoViewModel.swift
//  QueuesDemo
//
//  Created by Grzegorz Baczek on 30/10/2021.
//

import Foundation

class QueueDemoViewModel: ObservableObject{
    
    @Published var secondButtonCounter = 0
    
    func performTimeConsumingTask(){
        sleep(5)
    }
    
    func performTimeConsumingTask2(){
        DispatchQueue.global(qos: .userInitiated).async {
            print("hello from long running task")
            sleep(5)
            print("long running task is about to finish")
        }
    }
}
