// https://leetcode.com/problems/trapping-rain-water/
class Solution {
    func trap(_ height: [Int]) -> Int {

        var ans = 0
        var stack = [Int]()
        for idx in 0..<height.count {
            while !stack.isEmpty && height[idx] > height[stack.last!] {
                let top = stack.removeLast()
                guard !stack.isEmpty else {
                    break
                }
                let left = stack.last!
                ans += (idx - left - 1) * (min(height[idx], height[left]) - height[top])
            }
            stack.append(idx)
        }
        return ans
    }
}

