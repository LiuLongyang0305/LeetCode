// https://leetcode.com/problems/number-of-music-playlists/
extension Int {
    static var mod: Int {
        return 1_000_000_007
    }
}


class Solution {
    func numMusicPlaylists(_ n: Int, _ goal: Int, _ k: Int) -> Int {
        var memo = [Int:Int]()
        func helper(_ idx: Int, _ existed: Int) -> Int {
            if idx == goal  {
                return existed == n ? 1 : 0
            }
            let key = idx << 10 | existed
            if let c = memo[key] {
                return c
            }
            var ans = 0
            //可以重复
            if idx >= k{
                if existed < n {
                    ans = (ans + (n - existed) * helper(idx + 1, existed + 1) % Int.mod) % Int.mod
                }
                ans = (ans + (existed - k) * helper(idx + 1, existed) % Int.mod) % Int.mod

            } else {
                //不可重复
                ans = (ans + (n - existed) * helper(idx + 1, existed + 1) % Int.mod) % Int.mod
            }
            memo[key] = ans
            return ans
        }
        
        return helper(0, 0)
    }
    
}