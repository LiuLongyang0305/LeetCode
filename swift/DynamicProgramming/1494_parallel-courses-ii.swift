 // https://leetcode.com/problems/parallel-courses-ii/
extension Int {
    var bitCnt: Int {
        var cnt = 0
        var a = self
        while a > 0 {
            a &= (a - 1)
            cnt += 1
        }
        return cnt
    }
}


class Solution {
    func minNumberOfSemesters(_ n: Int, _ relations: [[Int]], _ k: Int) -> Int {
        var pre = [Int](repeating: 0, count: n)
        for relation in relations {
            pre[relation[1] - 1] |= (1 << (relation[0] - 1))
        }
        var  dp = [Int](repeating: n, count: 1 << n)
        dp[0] = 0
        for i in 0..<(1 << n) {
            var ex = 0
            for j in 0..<n {
                if(i & pre[j]  == pre[j]) {
                    ex |= (1 << j)
                }
            }
            ex &= ~i;
            var s = ex
            while s > 0 {
                if s.bitCnt <= k {
                    dp[i | s] = min(dp[i | s], dp[i] + 1)
                }
                s = (s - 1) & ex
            }
        }
        return dp.last!
    }
}

