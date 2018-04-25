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
        print(twoSum_001([3,3], 6))
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
    
    func twoSum_001(_ nums: [Int], _ target: Int) -> [Int] {
        
//        用字典来储存便利过的元素和下标（元素为Key  下标为Value），这样可以保证两点
//        1：当前的下标和取出的下标肯定不会重复
//        2：当前的下标一定要比取出的下标大
//        
//        使用字典和减法可以避免多次便利，降低时间复杂度，其实可以用content但是会增加复杂度
        
        var dic : [Int : Int] = [:]
        
        var arrr : [Int] = []
        for (currentIndex ,i) in nums.enumerated() {
            if let index : Int = dic[target - i] {
                arrr.append(index)
                arrr.append(currentIndex)
                return arrr
            }
            dic[i] = currentIndex
        }
        
        return arrr
    }

}

