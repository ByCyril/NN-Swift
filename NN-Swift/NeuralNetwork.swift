//
//  NeuralNetwork.swift
//  NN-Swift
//
//  Created by Cyril Garcia on 3/10/21.
//

import Foundation

final class NeuralNetwork {
    
    var synapticWeights: [[Float64]] = [[]]
    
    init() {
        synapticWeights = [[Float64.random(in: 0...1)],
                           [Float64.random(in: 0...1)],
                           [Float64.random(in: 0...1)]]
    }
    
    func sigmoid(_ x: [[Float64]]) -> [[Float64]] {
        return x.compactMap { (x) -> [Float64] in
            [1 / (1 + (M_E**(-x.first!)))]
        }
    }
    
    func sigmoidPrime(_ x: [[Float64]]) -> [[Float64]] {
        return x.compactMap { (x) -> [Float64] in
            [x.first! * (1 - x.first!)]
        }
    }
    
    func predict(_ inputs: [[Float64]]) -> [[Float64]] {
        return sigmoid(inputs•synapticWeights)
    }
    
    func train(_ trainingInputs: [[Float64]],
               _ trainingOutputs: [[Float64]],
               _ epochs: Int = 250) {
        
        for _ in 0..<epochs {
            let outputs: [[Float64]] = predict(trainingInputs)
            let error: [[Float64]] = trainingOutputs - outputs
            let adj: [[Float64]] = trainingInputs.T() • (error * sigmoidPrime(outputs))
            synapticWeights = synapticWeights + adj
        }
        
    }
    
}
