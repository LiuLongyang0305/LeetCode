//  https://leetcode.com/problems/trapping-rain-water/
class Solution {
    func trap(_ height: [Int]) -> Int {
        let N = height.count
        guard N > 2 else {
            return 0
        }
        var leftMaxHeigh = height
        var rightMaxHeight = height
        
        for index in 1..<N {
            leftMaxHeigh[index] = max(leftMaxHeigh[index - 1], height[index])
        }
        for index in (0..<(N - 1)).reversed() {
            rightMaxHeight[index] = max(rightMaxHeight[index + 1], height[index])
        }
        var ans = 0
        for i in 1..<(N - 1) {
            let smaller = min(leftMaxHeigh[i - 1], rightMaxHeight[i + 1])
            if smaller > height[i] {
                ans += smaller - height[i]
            }
        }
        return ans
    }
 }

