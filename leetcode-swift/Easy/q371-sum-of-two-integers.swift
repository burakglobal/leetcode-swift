//
//  q371-sum-of-two-integers.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/sum-of-two-integers/
//  Category* :  BitManipulation
//
//  Created by Tianyu Wang on 16/7/1.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com



/******************************************************************************************************
 *
 * Calculate the sum of two integers a and b, but you are not allowed to use the operator + and -.
 *
 * Example:
 * Given a = 1 and b = 2, return 3.
 *
 * Credits:
 * Special thanks to @fujiaozhu for adding this problem and creating all test cases.
 *
 ******************************************************************************************************/

/* 
 
 For bit by by manipulation addition, without considering the adding, there are four cases
 
    0+0=0
    0+1=1
    1+0=1
    1+1=0
 
 so you can get the result digit at their original position using XOR (^)
 
 Then let's deal with adding, also four cases
 
     0+0=0  x
     0+1=1  x > no adding
     1+0=1  x
     1+1=0  -> has adding
 
 you can get the adding generatee by the addtion at each position using AND (&)
 
 Consider the position of each digit is "ABC", so the adding generated by addition on position C will be added to position B, it is the same for position B and A.
 
 you can get the final adding for this round by using left shift (<<)
 
 */


import Foundation

struct q371 {
    
    class Solution {
        func getSum(_ a: Int, _ b: Int) -> Int {
            
            var sum = a
            var carry = b
            while carry != 0 {
                let t = sum ^ carry
                carry = (sum & carry) << 1
                sum = t
            }
            return sum
            
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().getSum(-1203940,1230912848102))
    }
}
