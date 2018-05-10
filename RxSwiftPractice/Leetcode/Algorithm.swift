//
//  Algorithm.swift
//  RxSwiftPractice
//
//  Created by GT-iOS on 2018/5/9.
//  Copyright © 2018年 GT-iOS. All rights reserved.
//  leetcode 题目答案

import Foundation

class Solution {
    static let share: Solution = {
        let so = Solution()
        DLog(message: so.reverseString1(s: "qwert"))
        return so
    }()
}


// MARK: - 334 - 反转字符串
extension Solution {
    func reverseString(s: String) -> String {
        var result = ""
        for c in s {
            result.insert(c, at: result.startIndex)
        }
        return result
    }
    
    func reverseString1(s: String) -> String {
        return String(s.reversed())
    }
    
}
