// https://leetcode.com/problems/copy-list-with-random-pointer/
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *    	   self.random = nil
 *     }
 * }
 */

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        guard let _ = head else {
            return nil
        }
        
        //保存id信息到节点
        var cur = head
        var id = 0
        while let node = cur {
            node.val = (node.val + 10000) | (id << 32)
            cur = cur?.next
            id += 1
        }
        
        //复制节点并链接next
        var newNodes = [Node?]()
        cur = head
        while let node = cur {
            let copy = Node((node.val & 0xffffffff) - 10000)
            if !newNodes.isEmpty {
                newNodes[newNodes.count - 1]?.next = copy
            }
            newNodes.append(copy)
            cur = cur?.next
        }
        
        //复制random
        cur = head
        id = 0
        
        while let node = cur {
            if let next = node.random {
                newNodes[id]?.random = newNodes[next.val >> 32]
            }
            cur = cur?.next
            id += 1
        }
        return newNodes[0]
    }
}