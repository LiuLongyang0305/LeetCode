//  https://leetcode.com/problems/count-unique-characters-of-all-substrings-of-a-given-string/
class Solution {
    private let MOD = 1_000_000_007
    func uniqueLetterString(_ s: String) -> Int {
        var ans = 0
        var map = [Character:[Int]]()
        var i = 0
        for ch in s {
            map[ch,default: []].append(i)
            i += 1
        }
        for (_,indices) in map {
            var i = 0
            let N = indices.count
            while i < indices.count {
                let prev = i > 0 ? indices[i - 1] : -1
                let next = i < N - 1 ? indices[i + 1] : s.count
                ans += (indices[i] - prev) * (next - indices[i]) % MOD
                ans %= MOD
                i += 1
            }
        }
        return ans % MOD
    }
}


