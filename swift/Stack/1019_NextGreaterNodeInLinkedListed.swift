//https://leetcode.com/problems/next-greater-node-in-linked-list/
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func nextLargerNodes(_ head: ListNode?) -> [Int] {
        guard head != nil else {
            return [Int]()
        }
        var elements = [Int]()
        var temp = head
        while nil != temp {
            elements.append(temp!.val)
            temp = temp?.next
        }
        let length = elements.count
        var dic = [Int:Int]()
        var stack = [Int]()
        for i in 0..<length {
            while !stack.isEmpty && elements[stack.last!] < elements[i] {
                dic[stack.removeLast()] = i
            }
            stack.append(i)
        }
        var ans = Array<Int>(repeating: 0, count: length)
        for i in 0..<length {
            if let nextLarger = dic[i] {
                ans[i] = elements[nextLarger]
            }
        }
        return ans
    }
}

class Solution2 {
    func nextLargerNodes(_ head: ListNode?) -> [Int] {
        guard head != nil else {
            return [Int]()
        }
        var elements = [Int]()
        var temp = head
        while nil != temp {
            elements.append(temp!.val)
            temp = temp?.next
        }
        let length = elements.count
        var dic = [Int:Int]()
        var stack = [Int]()
        var ans = Array<Int>(repeating: 0, count: length)
        for i in 0..<length {
            let target = elements[i]
            while !stack.isEmpty && elements[stack.last!] < elements[i] {
                ans[stack.removeLast()] = target
            }
            stack.append(i)
        }
        return ans
    }
}
