// https://leetcode.com/problems/nested-list-weight-sum-ii/
class NestedInteger {
    // Return true if this NestedInteger holds a single integer, rather than a nested list.
    public func isInteger() -> Bool {return false }
    
    // Return the single integer that this NestedInteger holds, if it holds a single integer
    // The result is undefined if this NestedInteger holds a nested list
    public func getInteger() -> Int {
        return -1
    }
    
    // Set this NestedInteger to hold a single integer.
    public func setInteger(value: Int) {}
    
    // Set this NestedInteger to hold a nested list and adds a nested integer to it.
    public func add(elem: NestedInteger) {}
    
    // Return the nested list that this NestedInteger holds, if it holds a nested list
    // The result is undefined if this NestedInteger holds a single integer
    public func getList() -> [NestedInteger] {
        return []
    }
}

class Solution {
    func depthSumInverse(_ nestedList: [NestedInteger]) -> Int {
        var ans = 0
        var levels = [Int]()
        func dfs(_ nestedList: [NestedInteger],_ level: Int) {
            if levels.count < level + 1 {
                levels.append(0)
            }
            for item in nestedList {
                if item.isInteger() {
                    levels[level] += item.getInteger()
                } else {
                    dfs(item.getList(), level + 1)
                }
            }
        }
        dfs(nestedList,0)
        let maxDepth = levels.count
        for i in 0..<levels.count {
            ans += levels[i] * (maxDepth - i)
        }
        return ans
    }
}
