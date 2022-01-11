// https://leetcode.com/problems/number-of-laser-beams-in-a-bank/
class Solution {
    func numberOfBeams(_ bank: [String]) -> Int {
        var ans = 0
        var lastCnt = 0
        for equipments in bank {
            var cnt = 0
            equipments.forEach { cnt += ($0 == "1" ? 1 : 0)}
            ans += lastCnt * cnt
            if cnt != 0 {
                lastCnt = cnt
            }
        }
        return ans
    }
}