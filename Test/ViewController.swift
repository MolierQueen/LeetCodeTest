//
//  ViewController.swift
//  Test
//
//  Created by OliverQueen on 2018/4/24.
//  Copyright © 2018年 OliverQueen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(productExceptSelf_238([1,2,3,4]))
        print(titleToNumber_171("AB"))
        print(maxAreaOfIsland_695([[0,0,1,0,0,0,0,1,0,0,0,0,0],
                                   [0,0,0,0,0,0,0,1,1,1,0,0,0],
                                   [0,1,1,0,1,0,0,0,0,0,0,0,0],
                                   [0,1,0,0,1,1,0,0,1,0,1,0,0],
                                   [0,1,0,0,1,1,0,0,1,1,1,0,0],
                                   [0,0,0,0,0,0,0,0,0,0,1,0,0],
                                   [0,0,0,0,0,0,0,1,1,1,0,0,0],
                                   [0,0,0,0,0,0,0,1,1,0,0,0,0]]))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func productExceptSelf_238(_ nums: [Int]) -> [Int] {
        
//        Given an array of n integers where n > 1, nums, return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
//
//        Solve it without division and in O(n).
//
//        For example, given [1,2,3,4], return [24,12,8,6].
//
//            生成前数组  [1,1,2,6]
//                        [1,2,3,4]
//  生成后数组（需要逆序）      [1,4,12,24]
//        第一个和最后一个首尾相乘
        var arr1 : [Int] = []
        var num1 : Int = 1
        var num2 : Int = 1
        for (_, ele) in nums.enumerated() {
            arr1.append(num1)
            num1 *= ele
        }
        
        for (index, ele) in nums.reversed().enumerated() {
            arr1[nums.count - 1 - index] *= num2
            num2 *= ele
        }
        return arr1
    }

    
    func titleToNumber_171(_ s: String) -> Int {
//        Given a column title as appear in an Excel sheet, return its corresponding column number.
//
//        For example:
//
//        A -> 1
//        B -> 2
//        C -> 3
//        ...
//        Z -> 26
//        AA -> 27
//        AB -> 28
        
        var num = 0 //和
        var numOf26 = 1   //几个26
        for ele in s.unicodeScalars.reversed(){   //需要从个位开始
            num += (Int(ele.value) - 64) * numOf26
            numOf26 *= 26
        }
        return num
    }
    
    func maxAreaOfIsland_695(_ grid: [[Int]]) -> Int {
        var isAllZero : Bool = true
        
        var mark : Int = 0
        
        
        var v : Int = 0
        var h : Int = 0
        var sumArr_horizontal : [Int] = []
        var sumArr_vertical : [Int] = []
        var sumArr : [Int] = []

        for (index ,ele) in grid.enumerated() {
            
            for (index1 ,ele1) in ele.enumerated() {
                
                if index1 == 1 {
                    isAllZero = false
                }
                h += ele1
   

                if index > 0 &&
                    index == mark - index * ele.count {
                    v += ele1
                    sumArr_vertical.append(v)
                }
                
                mark += 1
            }
            sumArr_horizontal.append(h)
        }
        if isAllZero {
            return 0
        }
        return 0
    }

}

