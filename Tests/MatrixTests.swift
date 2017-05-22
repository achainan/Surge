//
//  MatrixTests.swift
//  Surge
//
//  Created by Wenbin Zhang on 2/13/16.
//  Copyright © 2016 Mattt Thompson. All rights reserved.
//

import XCTest
import Surge

class MatrixTests: XCTestCase {
    
    var matrix : Matrix<Double> = Matrix<Double>([[1, 2, 3, 4], [5,6,7,8], [9, 10, 11, 12]])
    
    func testSubscriptRow() {
        XCTAssertEqual(matrix[row: 0], [1,2,3,4])
        XCTAssertEqual(matrix[row: 1], [5, 6, 7, 8])
    }
    
    func testSubscriptColumn() {
        XCTAssertEqual(matrix[column: 0], [1,5,9])
        XCTAssertEqual(matrix[column: 1], [2,6,10])
    }
    
    func testSetRow() {
        matrix[row: 0] = [13.0, 14.0, 15.0, 16.0]
        XCTAssertTrue(matrix==Matrix<Double>([[13,14,15,16],[5,6,7,8], [9, 10, 11, 12]]))
    }
    
    func testSetColumn() {
        matrix[column: 0] = [20,30,40]
        XCTAssertEqual(matrix, Matrix<Double>([[20,2,3,4],[30,6,7,8], [40, 10, 11, 12]]))
    }
    
    func testMatrixPower() {
        let expectedResult = Matrix<Double>([[1, 4, 9, 16], [25, 36, 49, 64], [81, 100, 121, 144]])
        XCTAssertEqual(pow(matrix, 2), expectedResult)
    }
    
    func testElementWiseMultiplication() {
        let matrix2 = Matrix<Double>([[2,3,4,5], [6,7,8,9], [10, 11, 12, 13]])
        XCTAssertEqual(elmul(matrix, y: matrix2), Matrix<Double>([[2,6,12,20], [30,42,56,72], [90, 110, 132,156]]))
    }
  
    func testVectorMultiplication() {
        let vector = Matrix<Double>([[10],[20],[1]])
        XCTAssertEqual(mulrow(matrix, vector: vector), Matrix<Double>([[10, 20, 30, 40],[100,120,140,160],[9, 10, 11, 12]]))
    }
    
    func testVectorDivision() {
        let vector = Matrix<Double>([[10],[20],[1]])
        XCTAssertEqual(divrow(matrix, vector: vector), Matrix<Double>([[0.1, 0.2, 0.3, 0.4],[0.25,0.3,0.35,0.4],[9, 10, 11, 12]]))
    }
    
  
    func testDotProduct() {
        let test = Matrix<Double>([[1,2], [3,4]])
        let vector = Matrix<Double>([[1,2], [3,4]])
        XCTAssertEqual(dot(test, y: vector), Matrix<Double>([[7,10],[15, 22]]))
    }
    
    func testMaximum() {
        let input = Matrix<Double>([[1,-2], [-3,4]])
        let expected = Matrix<Double>([[1,0], [0,4]])
        XCTAssertEqual(maximum(0, x: input), expected)
    }


}
