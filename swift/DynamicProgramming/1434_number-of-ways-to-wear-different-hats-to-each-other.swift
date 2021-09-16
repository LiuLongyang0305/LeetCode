//https://leetcode.com/problems/number-of-ways-to-wear-different-hats-to-each-other/
extension Int {
    static var mod: Int {
        return 1_000_000_007
    }
}
class Solution {
    func numberWays(_ hats: [[Int]]) -> Int {
        
        let N = hats.count
        var hatsToPerson = [[Int]](repeating: [], count: 40)
        for i in 0..<N {
            for h in hats[i] {
                hatsToPerson[h - 1].append(i)
            }
        }
        var memo = [Int:Int]()
        let allAssigned = (1 << N) - 1
        func dfs(_ mask: Int,_ curHat: Int) -> Int {
            guard mask != allAssigned else {
                return 1
            }
            guard curHat < 40 else {
                return 0
            }
            let key = (curHat << 16) | mask
            
            if let c = memo[key] {
                return c
            }
            
            var ans = dfs(mask, curHat + 1) % Int.mod
            
            for p in hatsToPerson[curHat] {
                if mask & (1 << p) == 0 {
                    ans = (ans + dfs(mask | (1 << p), curHat + 1)) % Int.mod
                }
            }
            ans %= Int.mod
            memo[key] = ans
            return ans
        }
        
        
        return dfs(0, 0)
    }
}