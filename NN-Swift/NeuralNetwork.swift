//
//  NeuralNetwork.swift
//  NN-Swift
//
//  Created by Cyril Garcia on 3/10/21.
//

import Foundation

final class NeuralNetwork {
    
    var synapticWeights = [[Float64]]()
    
    init() {
        synapticWeights = [[Float64.random(in: 0...1)],
                           [Float64.random(in: 0...1)],
                           [Float64.random(in: 0...1)]]
    }
    
    func sigmoid(_ x: [[Float64]]) -> [[Float64]] {
        var sigProd = [[Float64]]()
        
        for x in x {
            sigProd.append([1 / (1 + (M_E**(-x[0])))])
        }
        
        return sigProd
    }
    
    func sigmoidPrime(_ x: [[Float64]]) -> [[Float64]] {
        var sigPrimeProd = [[Float64]]()
        
        for x in x {
            sigPrimeProd.append([x[0] * (1 - x[0])])
        }
        
        return sigPrimeProd
    }
    
    func predict(_ inputs: [[Float64]]) -> [[Float64]] {
        return sigmoid((inputs•synapticWeights))
    }
    
    func train(_ trainingInputs: [[Float64]],
               _ trainingOutputs: [[Float64]],
               _ epochs: Int = 10) {
        
        for _ in 0..<epochs {
            let outputs = predict(trainingInputs)
            let error = trainingOutputs - outputs
            let adj = trainingInputs.T() • (error * sigmoidPrime(outputs))
            synapticWeights = synapticWeights + adj
        }
        
    }
    
}
