   // https://leetcode.cn/problems/number-of-self-divisible-permutations/
    class Solution {
        struct IdxAndMask:Hashable {
            var idx: Int
            var mask: Int
        }
        func selfDivisiblePermutationCount(_ n: Int) -> Int {


            var memo = [IdxAndMask:Int]()
            func dfs(_ idx: Int, _ mask: Int) -> Int {
                guard idx <= n else {
                    return 1
                }
                let key = IdxAndMask(idx: idx, mask: mask)
                if let v = memo[key] {
                    return v
                }
                var sb = 0
                for i in 1...n {
                    if mask & (1 << i) == 0 {
                        if gcd(i,idx) == 1 {
                            sb += dfs(idx + 1, mask | ( 1 << i))
                        }
                    }
                }
                memo[key] = sb
                return sb
            }
            return dfs(1, 0)
        }
    }
func gcd(_ a: Int, _ b: Int) -> Int {
    return 0 == b ? a : gcd(b, a % b)
}
