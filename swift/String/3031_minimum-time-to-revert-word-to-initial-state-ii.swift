    //https://leetcode.cn/problems/minimum-time-to-revert-word-to-initial-state-ii/
    struct StringHasher {
    private let base: UInt64 = 131  // 常用质数基数
    private let mod: UInt64 = 1_000_000_007  // 大质数模数
    private var prefixHash: [UInt64] = []
    private var power: [UInt64] = []

    init(_ s: String) {
        let n = s.count
        prefixHash = Array(repeating: 0, count: n + 1)
        power = Array(repeating: 1, count: n + 1)

        let chars = Array(s)
        for i in 0..<n {
            let charValue = UInt64(chars[i].asciiValue ?? 0)
            prefixHash[i + 1] = (prefixHash[i] * base + charValue) % mod
            power[i + 1] = (power[i] * base) % mod
        }
    }

    /// 获取子串 [l, r] 的哈希值（闭区间，0-based）
    func getHash(_ l: Int, _ r: Int) -> UInt64 {
        guard l <= r, l >= 0, r < prefixHash.count - 1 else { return 0 }
        let hash = (prefixHash[r + 1] + mod - (prefixHash[l] * power[r - l + 1]) % mod) % mod
        return hash
    }
}
    class Solution {
        func minimumTimeToInitialState(_ word: String, _ k: Int) -> Int {

            let wordHash = StringHasher(word)
            let N = word.count
            for i in stride(from: k, to: N, by: k) {
                let len = N - i
                if wordHash.getHash(0, len - 1) == wordHash.getHash(N - len, N - 1) {
                    return i / k
                }
            }
            return (N + k - 1) / k
        }
    }
