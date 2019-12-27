// https://leetcode.com/problems/domino-and-tromino-tiling/
class Solution {
    private let MOD  = 1_000_000_007
    func numTilings(_ N: Int) -> Int {
        guard N < 4 else {
            return [1,2,5][N - 1]
        }
        var ans = (1,2,5)
        for _ in 4...N {
            ans = (ans.1,ans.2,(ans.2 << 1 + ans.0)  % MOD)
        }
        return ans.2
    }
 }