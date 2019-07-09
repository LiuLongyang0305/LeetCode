//https://leetcode.com/problems/validate-stack-sequences/
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
var pushed = [1,2,3,4,5]
var poped = [4,5,3,2,1]
Solution().validateStackSequences(pushed, poped)