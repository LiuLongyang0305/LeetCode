//https://leetcode.com/problems/flip-string-to-monotone-increasing/
class Solution {
    func minFlipsMonoIncr(_ S: String) -> Int {
        let N = S.count
        var index = S.startIndex
        var onesCount = Array<Int>(repeating: 0, count: N + 1)
        for i in 0..<S.count {
            onesCount[i + 1] = onesCount[i] + (S[index] == "1" ? 1 : 0)
            index = S.index(after: index)
        }
        var ans = Int.max
        for i in 0...S.count {
            ans =  min(ans, onesCount[i] + N - i - (onesCount[N] - onesCount[i]))
        }
        return ans
    }
}