// https://leetcode.com/problems/print-immutable-linked-list-in-reverse/
 public class ImmutableListNode {
     public func printValue() {}
     public func getNext() -> ImmutableListNode? {return nil}
 }
class Solution {
    func printLinkedListInReverse(_ head: ImmutableListNode?) {
        var nodes = [ImmutableListNode]()
        var node = head
        while let n = node {
            nodes.insert(n, at: 0)
            node = n.getNext()
        }
        nodes.forEach {$0.printValue()}
    }
}
