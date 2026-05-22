  //https://leetcode.cn/problems/minimum-moves-to-balance-circular-array/
    class Solution {
        func minMoves(_ balance: [Int]) -> Int {
            guard let idx = balance.firstIndex(where: { $0 < 0}) else {return 0}
            guard balance.reduce(0, { $0 + $1}) >= 0 else {return -1}
            let tripkeBalance = balance + balance + balance
            var l = balance.count + idx - 1
            var r = balance.count + idx + 1
            var d = 1
            var sb = 0
            var target = abs(balance[idx])
            while target > 0 {
                let delta = tripkeBalance[l] + tripkeBalance[r]
                if delta > target{
                    sb += d * target
                    target = 0
                } else {
                    sb += d * delta
                    target -= delta
                }
                l -= 1
                r += 1
                d += 1
            }


            return sb
        }
    }
