//  https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof/
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Solution {
    func reversePrint(_ head: ListNode?) -> [Int] {
        var ans = [Int]()
        var node = head
        while let h = node {
            ans.insert(h.val, at: 0)
            node = h.next
        }
        return ans
    }
}