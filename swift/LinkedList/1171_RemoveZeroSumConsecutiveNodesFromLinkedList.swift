 // https://leetcode.com/problems/remove-zero-sum-consecutive-nodes-from-linked-list/
 public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
 }
 
 
 

 class Solution {
    func removeZeroSumSublists(_ head: ListNode?) -> ListNode? {
        var nodes = [ListNode?]()
        var values = [0]
        var node = head
        var set: Set<Int> = [0]
        var sum = 0
        while let t = node {
            sum += t.val
            if set.contains(sum) {
                while !values.isEmpty &&  values.last! != sum{
                    set.remove(values.removeLast())
                    nodes.removeLast()
                }
                if !nodes.isEmpty {
                    nodes[nodes.count - 1]?.next = t.next
                }
            } else {
                nodes.append(t)
                values.append(sum)
                set.insert(sum)
            }
            
            node = t.next
        }
        
        return nodes.isEmpty ? nil : nodes.first!
    }
 }

