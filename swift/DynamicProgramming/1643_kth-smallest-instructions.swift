// https://leetcode.com/problems/kth-smallest-instructions/
class Solution {
    func kthSmallestPath(_ destination: [Int], _ k: Int) -> String {
        var ans = ""
        var h = destination[1]
        var v = destination[0]
        let totalSteps = h + v

        var combination = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: h), count: totalSteps)
        combination[0][0] = 1
        for i in 1..<totalSteps {
            combination[i][0] = 1
            var j = 1
            while j <= i &&  j < h{
                combination[i][j] = combination[i - 1][j - 1] + combination[i - 1][j]
                j += 1
            }
        }
        var temp = k
        for _ in 0..<totalSteps {
            if h > 0 {
                let half = combination[h + v - 1][h - 1]
                if temp > half {
                    ans.append("V")
                    v -= 1
                    temp -= half
                } else {
                    ans.append("H")
                    h -= 1
                }
            } else {
                ans.append("V")
                v -= 1
            }
        }
        return ans
    }
}