// https://leetcode.cn/problems/construct-string-with-minimum-cost/
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

    class Solution {
        private let INF = Int.max / 2
        func minimumCost(_ target: String, _ words: [String], _ costs: [Int]) -> Int {
            let targetHasher = DoubleStringHasher(target)
            let sortedLenToWords = getSortedLengthToWordMap(words, costs)
            let N = target.count
            var memo = [Int?](repeating: nil, count: N)
            func dfs(_ cur: Int) -> Int {


                guard cur < N else {return 0}
                if let v = memo[cur] {return v}
                var sb = INF
                for (len,hvToCost) in sortedLenToWords {
                    var right = cur + len - 1
                    guard right < N else {break}
                    let h1 = targetHasher.getDoubleHash(cur, right)
                    if let c = hvToCost[h1] {
                        sb = min(sb,c + dfs(right + 1))
                    }
                }
                memo[cur]  = sb
                return sb
            }

            let sb = dfs(0)
            return sb < INF ? sb : -1
        }

        private func getSortedLengthToWordMap(_ words:[String], _ costs: [Int]) -> [(Int,[DoubleHashResult:Int])] {
            let M = words.count
            var lengthToWord = [Int:[DoubleHashResult:Int]]()
            for i in 0..<M {
                let len = words[i].count
                let hv = DoubleStringHasher(words[i]).getDoubleHash(0, len - 1)
                if nil == lengthToWord[len] {
                    lengthToWord[len] = [hv:costs[i]]
                } else {
                    if let c = lengthToWord[len]?[hv] {
                        if costs[i] < c {
                            lengthToWord[len]?[hv] = costs[i]
                        }
                    } else {
                        lengthToWord[len]?[hv] = costs[i]
                    }
                }
            }

            return lengthToWord.sorted { p1, p2 in
                p1.key < p2.key
            }
        }
    }
