// https://leetcode.com/problems/get-maximum-in-generated-array/
class Solution {
    func getMaximumGenerated(_ n: Int) -> Int {
        guard n > 1 else {
            return n
        }
        var ans = [0,1]
        for i in 2...n {
            let half = i >> 1
            if i % 2 == 0 {
                ans.append(ans[half])
            } else {
                ans.append(ans[half] + ans[half + 1])
            }
        }
        return ans.max()!
    }
}

