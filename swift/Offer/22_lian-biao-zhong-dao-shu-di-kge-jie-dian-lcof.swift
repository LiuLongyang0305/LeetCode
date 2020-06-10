//  https://leetcode-cn.com/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof/
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Solution {
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var fast: ListNode? = head
        for _ in 0..<k {
            fast = fast?.next
        }
        var slow = head
        while let f = fast {
            fast = f.next
            slow = slow?.next
        }
        return slow
    }
}