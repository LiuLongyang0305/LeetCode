// https://leetcode.com/problems/number-of-visible-people-in-a-queue/
class Solution {
    func canSeePersonsCount(_ heights: [Int]) -> [Int] {
        let M = heights.count
        var ans = Array<Int>(repeating: 0, count: M)
        var stack = [Int]()
        for i in 0..<M {
            while !stack.isEmpty && heights[stack.last!] <= heights[i] {
                ans[stack.removeLast()] += 1
            }
            if !stack.isEmpty {
                ans[stack.last!] += 1
            }
            stack.append(i)
        }
        return ans
    }
}