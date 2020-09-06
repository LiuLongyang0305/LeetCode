// https://leetcode.com/problems/number-of-ways-to-split-a-string/
class Solution {
    private let MOD = 1_000_000_007
    func numWays(_ s: String) -> Int {
        let N = s.count
        guard N > 2 else {
            return 0
        }
        var prefix = [Int]()
        var oneCnt = 0
        for ch in s {
            if ch == "1" {
                oneCnt += 1
            }
            prefix.append(oneCnt)
        }
        guard oneCnt % 3 == 0 else {
            return 0
        }
        guard oneCnt != 0 else {
            return (N - 2) * (N - 1)  / 2 % MOD
        }
        let mark1 = prefix.firstIndex(of: oneCnt / 3)!
        let mark2 = prefix.lastIndex(of: oneCnt / 3)! + 1
        let mark3 = prefix.firstIndex(of: oneCnt * 2 / 3)!
        let mark4 = prefix.lastIndex(of: oneCnt * 2 / 3)! + 1
        return  (mark2 - mark1 ) * (mark4 - mark3) % MOD
    }
}