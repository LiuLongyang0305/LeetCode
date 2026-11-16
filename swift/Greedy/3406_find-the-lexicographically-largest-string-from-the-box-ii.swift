// https://leetcode.cn/problems/find-the-lexicographically-largest-string-from-the-box-ii/
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
    private typealias Pair = (idx:Int,len:Int)
    func answerString(_ word: String, _ numFriends: Int) -> String {
        guard numFriends > 1 else {return word}
        let maxChar = word.max()!
        let chars = [Character](word)
        let M = chars.count
        let wordHasher = DoubleStringHasher(word)

        //candidate 是否大于curAns
        //找到第一个不同的字符，然后比较
        func compare(_ curAns: Pair, _ candidate: Pair ) -> Bool {
            let (si,ci) = (curAns.idx,candidate.idx)
            var l = 1
            var r = min(curAns.len,candidate.len)
            if wordHasher.isEqual(si, si + r - 1, ci,ci + r - 1) {
                return candidate.len > curAns.len
            }
            while l < r {
                let mid = (l + r) >> 1
                if wordHasher.isEqual(si, si + mid - 1, ci,ci + mid - 1) {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            return chars[ci + l - 1] > chars[si + l - 1]
        }







        var curAns: Pair = (-1,-1)
        for i in 0..<M {
            if chars[i] != maxChar {continue}
            let maxLenth = min(M - numFriends + 1,M - i)
            if maxLenth > 0 {
                if curAns.idx == -1 {
                    curAns = (i,maxLenth)
                } else {
                    let temp: Pair = (i,maxLenth)
                    if compare(curAns, temp) {
                        curAns = temp
                    }
                }
            }
        }
        return String(chars[curAns.idx..<(curAns.idx + curAns.len)])
    }
}
