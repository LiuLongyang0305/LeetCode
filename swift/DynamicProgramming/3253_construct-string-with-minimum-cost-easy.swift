    // https://leetcode.cn/problems/construct-string-with-minimum-cost-easy/
    class Solution {
        private let INF = 1_000_000_007
        func minimumCost(_ target: String, _ words: [String], _ costs: [Int]) -> Int {

            let lengths = words.map { $0.count}
            let hashValue = words.map { DoubleStringHasher($0).getDoubleHash(0, $0.count - 1)}
            let targetHasher = DoubleStringHasher(target)
            let M = target.count
            let N = words.count
            var memo = [Int?](repeating: nil, count: M + 5)
            func dfs(_ i: Int) -> Int {
                guard i < M else {return 0}
                if let v = memo[i] {return v}
                var sb = INF

                for wi in 0..<N {
                    let len = lengths[wi]
                    guard i + len - 1 < M else {continue}
                    if targetHasher.getDoubleHash(i, i + len - 1) == hashValue[wi] {
                        sb = min(sb, costs[wi] + dfs(i + len))
                    }
                }
                memo[i] = sb
                return sb
            }

            let ans = dfs(0)
            return dfs(0) >= INF ? -1 : ans
        }
    }
    struct DoubleHashResult:Hashable {
    var h1: UInt64
    var h2: UInt64
}
struct DoubleStringHasher {

    private struct HashParams {
        let base: UInt64
        let mod: UInt64
    }

    // 使用两个不同的参数组，大幅降低碰撞概率
    private let params = [
        HashParams(base: 131, mod: 1_000_000_007),
        HashParams(base: 137, mod: 1_000_000_009)
    ]

    private var prefixHashes: [[UInt64]] = []
    private var powers: [[UInt64]] = []

    init(_ s: String) {
        let n = s.count
        prefixHashes = Array(repeating: Array(repeating: 0, count: n + 1), count: 2)
        powers = Array(repeating: Array(repeating: 1, count: n + 1), count: 2)

        let chars = Array(s)
        for p in 0..<2 {
            let base = params[p].base
            let mod = params[p].mod

            for i in 0..<n {
                let charValue = UInt64(chars[i].asciiValue ?? 0)
                prefixHashes[p][i + 1] = (prefixHashes[p][i] * base + charValue) % mod
                powers[p][i + 1] = (powers[p][i] * base) % mod
            }
        }
    }

    /// 获取子串的双哈希值
    func getDoubleHash(_ l: Int, _ r: Int) -> DoubleHashResult {
        guard l <= r, l >= 0, r < prefixHashes[0].count - 1 else { return  DoubleHashResult(h1: 0, h2: 0)}

        var result = DoubleHashResult(h1: 0, h2: 0)
        for p in 0..<2 {
            let mod = params[p].mod
            let hash = (prefixHashes[p][r + 1] + mod - (prefixHashes[p][l] * powers[p][r - l + 1]) % mod) % mod
            if p == 0 {
                result.h1 = hash
            } else {
                result.h2 = hash
            }
        }
        return result
    }

    /// 比较两个子串是否相等（通过比较哈希值）
    func isEqual(_ l1: Int, _ r1: Int, _ l2: Int, _ r2: Int) -> Bool {
        let hash1 = getDoubleHash(l1, r1)
        let hash2 = getDoubleHash(l2, r2)
        return hash1 == hash2
    }
}

