// https://leetcode.cn/problems/split-a-circular-linked-list/
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
    func splitCircularLinkedList(_ list: ListNode?) -> [ListNode?] {
        var arr = [ListNode]()
        let f = list!
        var cur = list?.next
        var last = list
        while let c = cur, c !== f {
            arr.append(last!)
            last  = cur
            cur = c.next
        }
        arr.append(last!)
        let N = arr.count
        var (fe,ss) = (-1,-1)
        if N & 1 == 1 {
            fe = N / 2
            ss = N / 2 + 1
        } else {
            fe = N / 2 - 1
            ss = N / 2
        }
        arr[fe].next = f
        arr[N - 1].next = arr[ss]
        return [list,arr[ss]]
    }
}
