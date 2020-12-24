// https://leetcode.com/problems/consecutive-numbers-sum/
class Solution {
    func consecutiveNumbersSum(_ N: Int) -> Int {
        var ans = 0
        var sum = 0
        var numsCnt = 1
        let target = N << 1
        while numsCnt * (numsCnt + 1) <= target {
            let t = N - sum
            if t % numsCnt == 0 && t / numsCnt > 0 {
                ans += 1
            }
            sum += numsCnt
            numsCnt += 1
        }
        return ans
    }
}