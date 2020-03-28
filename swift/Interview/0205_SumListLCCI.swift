//  https://leetcode-cn.com/problems/sum-lists-lcci/
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard nil != l1 || nil != l2 else {
            return nil
        }
        var carry = 0
        var node1 = l1
        var  node2 = l2
        var root: ListNode? = nil
        var end:  ListNode? = nil
        while nil != node1 || nil != node2 {
            let sum = (node1?.val  ?? 0) + (node2?.val ?? 0) +  carry
            carry = sum / 10
            let node = ListNode(sum % 10)
            if root ==  nil {
                root =  node
            }
            if end == nil {
                end = node
            } else {
                end?.next  = node
                end = node
            }
            if nil != node1 {
                node1 = node1?.next
            }
            if nil != node2 {
                node2 = node2?.next
            }
        }
        if carry != 0 {
            end?.next = ListNode(carry)
        }
        return root
    }
}
