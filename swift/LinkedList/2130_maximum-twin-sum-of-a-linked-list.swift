// https://leetcode.com/problems/maximum-twin-sum-of-a-linked-list/
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func pairSum(_ head: ListNode?) -> Int {
        var values = [Int]()
        var node = head
        while let n = node {
            values.append(n.val)
            node = node?.next
        }
        var ans = 0
        var j = values.count - 1
        var i = 0
        while i < j {
            ans = max(ans, values[i] + values[j])
            i += 1
            j -= 1
        }
        return ans
        
    }
}
