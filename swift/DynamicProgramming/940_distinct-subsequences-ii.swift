// https://leetcode.com/problems/distinct-subsequences-ii/
class Solution {
    private let MOD = 1_000_000_007
    func distinctSubseqII(_ s: String) -> Int {
        let nums = s.map { Int($0.asciiValue ?? 0) - 97}
        var endWith = [Int](repeating: 0, count: 26)
        for num in nums {
            endWith[num] = endWith.reduce(0,{ ($0 + $1) % MOD}) + 1
        }
        return endWith.reduce(0) { ($0 + $1) % MOD}
    }
}