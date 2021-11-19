// https://leetcode.com/problems/reverse-nodes-in-even-length-groups/
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
    func reverseEvenLengthGroups(_ head: ListNode?) -> ListNode? {
        guard let _ = head else {
            return nil
        }
        var nodesGroup:[[ListNode]] = []
        var node = head
        var cur = [ListNode]()
        var groupCnt = 1
        while let n = node {
            cur.append(n)
            node = node?.next
            if groupCnt == cur.count {
                nodesGroup.append(cur)
                cur = []
                groupCnt += 1
            }
        }
        if !cur.isEmpty {
            nodesGroup.append(cur)
        }
        var last = head
        for idx in 1..<nodesGroup.count {
            let curGroup = nodesGroup[idx]
            if curGroup.count & 1 == 0 {
                for node in curGroup.reversed() {
                    last?.next = node
                    last = node
                }
            } else {
                last?.next = curGroup[0]
                last = curGroup.last!
            }
        }
        last?.next = nil
        return head
    }
}
