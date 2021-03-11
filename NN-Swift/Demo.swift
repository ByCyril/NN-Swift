//
//  Demo.swift
//  NN-Swift
//
//  Created by Cyril Garcia on 3/10/21.
//

import Foundation

@main
final class Demo {
    
    static func main() -> Void {
        
        let nn = NeuralNetwork()
        
        let inputs: [[Float64]] = [[0,0,1],[1,1,1],[0,1,1]]
        let outputs: [[Float64]] = [[0],[1],[0]]
        
        nn.train(inputs, outputs, 500)
        print(nn.predict([[0,0,1],[1,1,1],[0,1,1],[1,0,0]])) // should return 0,1,0,1
        
//        Need the tanh activtaion function
//        let inputs: [[Float64]] = [[1,1,0],[1,1,1],[0,1,0],[-1,1,0],[-1,0,0],[-1,0,1],[0,0,1],[1,1,0],[1,0,0],[-1,0,0],[1,0,1],[0,1,1],[0,0,0],[-1,1,1]]
//        let outputs: [[Float64]] = [[0],[0],[1],[1],[1],[0],[1],[0],[1],[1],[1],[1],[1],[0]]
//
//        nn.train(inputs, outputs, 10000)
        
//        print(nn.predict([[1,0,0]]))
        
    }
    
}
