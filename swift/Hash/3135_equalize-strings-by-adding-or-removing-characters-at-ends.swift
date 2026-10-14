//https://leetcode.cn/problems/equalize-strings-by-adding-or-removing-characters-at-ends/
class Solution {
    func minOperations(_ initial: String, _ target: String) -> Int {
        let initialHasher = DoubleStringHasher(initial)
        let targetHasher = DoubleStringHasher(target)
        let M = target.count
        let N = initial.count

        func getHashValueSet(_ lenth: Int) -> Set<DoubleHashResult> {
            var sb = Set<DoubleHashResult>()
            for i in 0..<M {
                let j = i + lenth - 1
                guard j < M else {break}
                sb.insert(targetHasher.getDoubleHash(i, j))
            }
            return sb
        }


        func check(_ length:Int) -> Bool {
            let set = getHashValueSet(length)

            for i in 0..<N {
                let j = i + length - 1
                guard j < N else {break}
                guard !set.contains(initialHasher.getDoubleHash(i, j)) else {return true}
            }

            return false
        }




        var l = 0
        var r = min(initial.count,target.count)

        while l < r {
            let mid = (l + r + 1) >> 1
            if check(mid) {
                l = mid
            } else {
                r = mid - 1
            }
        }

        return target.count + initial.count - 2 * l
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
