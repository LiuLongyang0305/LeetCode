//https://leetcode.com/problems/linked-list-random-node/
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

 class Solution {
    
    private var head: ListNode? = nil
    /** @param head The linked list's head.
     Note that the head is guaranteed to be not null, so it contains at least one node. */
    init(_ head: ListNode?) {
        self.head = head
    }
    
    /** Returns a random node's value. */
    func getRandom() -> Int {
        
        var cnt = 0
        var ans: ListNode? = nil
        var current = head
        while nil != current {
            cnt += 1
            if cnt == 1 {
                ans = current
            } else {
                if Int.random(in: ClosedRange<Int>(uncheckedBounds: (lower: 0, upper: cnt  - 1))) == 0 {
                    ans  = current
                }
            }
            current = current?.next
        }
        return ans!.val
    }
 }

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(head)
 * let ret_1: Int = obj.getRandom()
 */