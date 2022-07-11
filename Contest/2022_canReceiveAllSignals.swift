// https://leetcode.cn/contest/zj-future2022/problems/WYKGLO/
class Solution {
    func canReceiveAllSignals(_ intervals: [[Int]]) -> Bool {
        guard intervals.count > 1 else {return true}
        let sortedIntervals = intervals.sorted { f, s in
            f[0] < s[0]
        }

        for i in 1..<intervals.count {
            guard sortedIntervals[i][0] >= sortedIntervals[i - 1][1] else {
                return false
            }
        }
        return true
    }
}