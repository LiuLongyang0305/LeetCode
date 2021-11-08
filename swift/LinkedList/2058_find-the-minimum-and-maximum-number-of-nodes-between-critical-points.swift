// https://leetcode.com/problems/find-the-minimum-and-maximum-number-of-nodes-between-critical-points/
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
    func nodesBetweenCriticalPoints(_ head: ListNode?) -> [Int] {
        var values = [Int]()
        var node = head
        while let n = node {
            values.append(n.val)
            node = n.next
        }
        return caculate(values)

    }
    
    
    private func caculate(_ values: [Int]) -> [Int] {
        let N = values.count
        guard N > 2 else {return   [-1,-1]}
        var first = -1
        var maxDis = Int.min
        var minDis = Int.max
        var last = -1
        for idx in stride(from: 1, to: N - 1, by: 1) {
            if (values[idx] - values[idx - 1]) * (values[idx] - values[idx + 1]) > 0 {
                if -1 == first {
                    first = idx
                    last = idx
                } else {
                    maxDis = max(maxDis, idx - first)
                    minDis = min(minDis, idx - last)
                    last = idx
                }
                
            }
        }
        return maxDis == Int.min ? [-1,-1] : [minDis,maxDis]
    }
}



class Solution {
    func nodesBetweenCriticalPoints(_ head: ListNode?) -> [Int] {
        guard let _ = head else {
            return [-1,-1]
        }
        var maxDis = Int.min
        var minDis = Int.max
        var first = -1
        var idx = 1
        var pre = head
        var cur = head?.next
        var last = -1
        while let c = cur, let next = cur?.next, let p = pre {
            // print("\(c.val)   \(p.val)  \(next.val)")
            if (c.val - p.val) * (c.val - next.val) > 0 {
                if first == -1 {
                    first = idx
                } else {
                    maxDis = max(maxDis, idx - first)
                    minDis = min(minDis, idx - last)
                }
                last = idx
            }
            idx += 1
            pre = cur
            cur = cur?.next
        }
        return maxDis == Int.min ? [-1,-1] : [minDis,maxDis]

    }
}



