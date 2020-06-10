// https://leetcode-cn.com/problems/zhan-de-ya-ru-dan-chu-xu-lie-lcof/
class Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var pushedStack = [Int]()
        var popedStack = popped
        for ele in pushed {
            pushedStack.append(ele)
            while !pushedStack.isEmpty && pushedStack.last! == popedStack.first! {
                pushedStack.removeLast()
                popedStack.removeFirst()
            }
        }
        
        return pushedStack.reversed() == popedStack
    }
}