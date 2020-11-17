// https://leetcode.com/problems/count-vowels-permutation/
class Solution {
    private let MOD = 1_000_000_007
    func countVowelPermutation(_ n: Int) -> Int {
        guard n > 1 else {
            return n == 0 ? 0 : 5
        }
        var cnt: [Character: Int] = [:]
        "aeiou".forEach { cnt[$0] = 1}
        for _ in 2...n {
            var new = [Character:Int]()
            for (ch,val) in cnt {
                switch ch {
                case "a":
                    new["e", default: 0 ] += val
                case "e":
                    new["a", default: 0 ] += val
                    new["i", default: 0 ] += val
                case "i":
                    new["a", default: 0 ] += val
                    new["e", default: 0 ] += val
                    new["o", default: 0 ] += val
                    new["u", default: 0 ] += val
                case "o":
                    new["i", default: 0 ] += val
                    new["u", default: 0 ] += val
                case "u":
                    new["a", default: 0 ] += val
                default:
                    break
                }
            }
            for (ch,v) in new {
                new[ch] = v % MOD
            }
            cnt = new
        }
        return  cnt.values.reduce(0) {$0 + $1} % MOD
    }
}

// Solution().countVowelPermutation(5)