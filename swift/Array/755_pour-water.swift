// https://leetcode.com/problems/pour-water/
class Solution {
    func pourWater(_ heights: [Int], _ V: Int, _ K: Int) -> [Int] {
        var ans = heights
        let N = heights.count
        for _ in 1...V {
            var flag = false
            for dx in [-1,1] {
                var i = K
                var best = K
                while i + dx >= 0 && i + dx < N && ans[i + dx] <= ans[i] {
                    if ans[i + dx] < ans[i] {
                        best = i + dx
                    }
                    i += dx
                }
                if best != K {
                    flag = true
                    ans[best] += 1
                    break
                }
            }
            if !flag {
                ans[K] += 1
            }
        }
        return ans
    }
}
