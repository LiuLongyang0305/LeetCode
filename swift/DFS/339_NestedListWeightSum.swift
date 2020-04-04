// https://leetcode.com/problems/nested-list-weight-sum/
/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */
class Solution {
    func depthSum(_ nestedList: [NestedInteger]) -> Int {
        return getDepthSum(nestedList, 1)
    }
    private func getDepthSum(_ nestedList: [NestedInteger], _ currentDepth: Int) -> Int{
        var sum = 0
        for item in nestedList {
            if item.isInteger() {
                sum += currentDepth * item.getInteger()
            } else {
                sum += getDepthSum(item.getList(), currentDepth + 1)
            }
        }
        return sum
    }
}