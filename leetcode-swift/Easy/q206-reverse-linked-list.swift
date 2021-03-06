//
//  q206-reverse-linked-list.swift
//  leetcode-swift
//  Source    :  https://leetcode.com/problems/reverse-linked-list/
//  Category* :  LinkedList TwoPointers
//
//  Created by Tianyu Wang on 16/6/27.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Reverse a singly linked list.
 *
 * click to show more hints.
 *
 * Hint:
 * A linked list can be reversed either iteratively or recursively. Could you implement both?
 *
 *
 **********************************************************************************/


import Foundation

struct q206 {
    
    class Solution {
        func reverseList(_ head: ListNode?) -> ListNode? {
            
            return reverseListRecursively(head)
            
        }
        
        func reverseListRecursively(_ head: ListNode?) -> ListNode? {
            if let head = head {
                
                if head.next == nil {
                    return head
                }
                
                let reversedListHead = reverseListRecursively(head.next)
                
                head.next?.next = head
                head.next = nil
                
                return reversedListHead
            } else {
                return nil
            }
        }
        
    }
    
    class Solution2 {
        
        func reverseList(_ head: ListNode?) -> ListNode? {
            return reverseListInteratively(head)
        }
        
        func reverseListInteratively(_ head: ListNode?) -> ListNode? {
            var head = head
            var n: ListNode? = head?.next
            var p: ListNode? = nil
            while head != nil {
                
                head!.next = p
                p = head
                head = n
                n = head?.next
                
            }
            return p
        }
    }
    
    static func getSolution() -> Void {
        let head = LinkedListHelper.buildLinkedList(withNodes: [1,2])
        print(head ?? "")
        
        let reversedListHead = Solution2().reverseList(head)
        print(reversedListHead ?? "")
    }
}
