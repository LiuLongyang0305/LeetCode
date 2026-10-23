// https://leetcode.cn/problems/find-pattern-in-infinite-stream-i/
/**
 * Definition for an infinite stream.
 * class InfiniteStream {
 *     init(bits: [Int]) {}
 *     func next() -> Int {}
 * }
 */
struct _DoubleHashResult:Hashable {
    var h1: UInt64
    var h2: UInt64
}
struct _DoubleStringHasher {

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

    init() {
        prefixHashes = Array(repeating: Array(repeating: 0, count: 1), count: 2)
        powers = Array(repeating: Array(repeating: 1, count: 1), count: 2)
    }


    mutating func append(_ char: Character) {
        let v = UInt64(char.asciiValue ?? 0)
        for p in 0..<2 {
            let (base,mod) = (params[0].base,params[p].mod)
            prefixHashes[p].append((prefixHashes[p].last! * base + v) % mod)
            powers[p].append((powers[p].last! * base) % mod)
        }
    }

        /// 获取子串的双哈希值
    func getDoubleHash(_ l: Int, _ r: Int) -> _DoubleHashResult {
        guard l <= r, l >= 0, r < prefixHashes[0].count - 1 else { return  _DoubleHashResult(h1: 0, h2: 0)}

        var result = _DoubleHashResult(h1: 0, h2: 0)
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

// class InfiniteStream {
//     init(bits: [Int]) {}
//     func next() -> Int {
//         return 1
//     }
// }

class Solution {
    func findPattern(_ stream: InfiniteStream, _ pattern: [Int]) -> Int {
        let target = getTargetHashValue(pattern)
        let M = pattern.count
        var streamHasher = _DoubleStringHasher()
        if M > 1 {
            for _ in 0..<(M - 1) {
                streamHasher.append("\(stream.next())".first!)
            }
        }


        var i = 0
        repeat {
            streamHasher.append("\(stream.next())".first!)
            if streamHasher.getDoubleHash(i, i + M - 1) == target {
                return i
            }
            i += 1
        } while(true)


        return -1
    }

    private func getTargetHashValue(_ pattern: [Int]) -> _DoubleHashResult {

        var hasher = _DoubleStringHasher()
        for p in pattern {
            hasher.append("\(p)".first!)
        }

        return hasher.getDoubleHash(0, pattern.count - 1)
    }
}

