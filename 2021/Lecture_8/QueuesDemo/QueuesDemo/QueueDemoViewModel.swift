//
//  QueueDemoViewModel.swift
//  QueuesDemo
//
//  Created by Grzegorz Baczek on 30/10/2021.
//

import Foundation

class QueueDemoViewModel: ObservableObject{
    
    @Published var secondButtonCounter = 0
    
    func performTimeConsumingTaskOnMainThread(){
        sleep(5)
    }
    
    func performTimeConsumingTaskOnBackgroundThread(){
        DispatchQueue.global(qos: .userInitiated).async {
            print("hello from long running task")
            sleep(5)
            print("long running task is about to finish")
        }
    }
}
