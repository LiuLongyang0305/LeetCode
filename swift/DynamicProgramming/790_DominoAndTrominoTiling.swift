// https://leetcode.com/problems/domino-and-tromino-tiling/
class Solution {
    private let MOD  = 1_000_000_007
    func numTilings(_ N: Int) -> Int {
        guard N != 1 else {
            return 1
        }
        guard N != 2 else {
            return 2
        }
        guard N != 3 else {
            return 5
        }
        var ans = (1,2,5)
        for _ in 4...N {
            ans = (ans.1,ans.2,(ans.2 << 1 + ans.0)  % MOD)
        }
        return ans.2
    }
 }