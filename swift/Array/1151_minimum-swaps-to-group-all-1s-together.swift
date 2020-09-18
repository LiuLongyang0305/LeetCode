// https://leetcode.com/problems/minimum-swaps-to-group-all-1s-together/
class Solution {
    func minSwaps(_ data: [Int]) -> Int {
        let oneCnt = data.reduce(0) { $0 + $1}
        var ans = oneCnt
        guard oneCnt > 1 else {
            return 0
        }
        guard oneCnt < data.count else {
            return 0
        }
        var curCnt = 0
        var i = 0
        while i < oneCnt {
            curCnt += data[i]
            i += 1
        }
        ans = min(ans, oneCnt - curCnt)
        var j = 0
        while i < data.count {
            curCnt += (data[i] - data[j])
            ans = min(ans, oneCnt - curCnt)
            j += 1
            i += 1
        }
        return ans
    }
}
