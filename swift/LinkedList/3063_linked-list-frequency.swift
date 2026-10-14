// https://leetcode.cn/problems/linked-list-frequency/
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
    func frequenciesOfElements(_ head: ListNode?) -> ListNode? {
        var cnt = [Int:Int]()
        var node = head
        while let n = node {
            cnt[n.val,default: 0] += 1
            node = n.next
        }
        var ans: ListNode = ListNode(-1)
        var last = ans
        for (_,c) in cnt {
            let new = ListNode(c)
            last.next = new
            last = new
        }
        return ans.next
    }
}
