//
//  CustomOperators.swift
//  NN-Swift
//
//  Created by Cyril Garcia on 3/10/21.
//

import Foundation

infix operator **
func **(lhs: Float64, rhs: Float64) -> Float64 {
    return pow(lhs, rhs)
}

infix operator •
func •(lhs: [[Float64]], rhs: [[Float64]]) -> [[Float64]] {
    
    var product: [[Float64]] = [[]]
    
    for row in lhs {
        var rowProd: [Float64] = []
        
        for i in 0..<rhs.count {
            let prod: Float64 = row[i] * rhs[i][0]
            rowProd.append(prod)
        }
        
        product.append([rowProd.reduce(0, +)])
    }
    
    return product
}

infix operator -
func -(lhs: [[Float64]], rhs: [[Float64]]) -> [[Float64]] {
    var diff: [[Float64]] = [[]]
    
    for i in 0..<rhs.count {
        diff.append([lhs[i][0] - rhs[i][0]])
    }
    
    return diff
}

infix operator +
func +(lhs: [[Float64]], rhs: [[Float64]]) -> [[Float64]] {
    var diff: [[Float64]] = [[]]
    
    for i in 0..<rhs.count {
        diff.append([lhs[i][0] + rhs[i][0]])
    }
    
    return diff
}

infix operator *
func *(lhs: [[Float64]], rhs: [[Float64]]) -> [[Float64]] {
    var diff: [[Float64]] = [[]]
    
    for i in 0..<rhs.count {
        diff.append([lhs[i][0] * rhs[i][0]])
    }
    
    return diff
}

extension Collection where Self.Element: Collection {
    func T() -> [[Float64]] {
        let arr: [[Float64]] = self as! [[Float64]]
        
        var trans: [[Float64]] = [[]]
        
        let rowCount: Int = self.count
        let colCount: Int = self.first?.count ?? 0
        
        for x in 0..<colCount {
            var row: [Float64] = []
            for y in 0..<rowCount {
                row.append(arr[y][x])
            }
            trans.append(row)
        }
        
        return trans
    }
    
}
