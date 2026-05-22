    // https://leetcode.cn/problems/count-prefix-and-suffix-pairs-ii/
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
        func countPrefixSuffixPairs(_ words: [String]) -> Int {
            var map = [UInt64:Int]()
            map[StringHasher(words[0]).getHash(0, words[0].count - 1),default: 0] += 1
            var sb = 0
            for w in words.dropFirst() {
                let hasher = StringHasher(w)
                let N = w.count
                for l in 1...N {
                    let preffixHashValue =  hasher.getHash(0, l - 1)
                    if hasher.getHash(N - l, N - 1) == preffixHashValue {
                        sb += map[preffixHashValue] ?? 0
                    }
                }
                map[hasher.getHash(0, N - 1),default: 0] += 1
            }
            return sb
        }
    }
