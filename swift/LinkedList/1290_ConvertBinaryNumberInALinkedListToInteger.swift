//https://leetcode.com/problems/convert-binary-number-in-a-linked-list-to-integer/
 public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
 }
 class Solution {
    func getDecimalValue(_ head: ListNode?) -> Int {
        var ans = 0
        var temp =  head
        while temp != nil {
            ans = ans << 1
            ans += temp!.val
            temp = temp?.next
        }
        return ans
    }
 }