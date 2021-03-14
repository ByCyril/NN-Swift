//
//  main.swift
//  NN-Swift
//
//  Created by Cyril Garcia on 3/11/21.
//

import Foundation

let nn = NeuralNetwork()

let inputs: [[Float64]] = [[0,0,1],[1,1,1],[0,1,1]]
let outputs: [[Float64]] = [[0],[1],[0]]

nn.train(inputs, outputs, 500)

print(nn.predict([[0,0,1],[1,1,1],[0,1,1],[1,0,0]]))
