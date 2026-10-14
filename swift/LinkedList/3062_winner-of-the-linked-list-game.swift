//https://leetcode.cn/problems/winner-of-the-linked-list-game/
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
    func gameResult(_ head: ListNode?) -> String {
        var diff = 0
        var oddNode = head?.next
        var evenNode = head
        while let en = evenNode,let on = oddNode {
            let scoreDiff = en.val - on.val
            diff += (scoreDiff > 0 ? 1 : -1)
            evenNode = on.next
            oddNode = evenNode?.next
        }
        return diff == 0 ? "Tie" : (diff > 0 ? "Even" : "Odd")
    }
}
