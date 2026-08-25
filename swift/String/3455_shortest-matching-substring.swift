  // https://leetcode.cn/problems/shortest-matching-substring/
struct _StringHasher {
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
        private let INF = 1_000_000_007
        func shortestMatchingSubstring(_ s: String, _ p: String) -> Int {
            let splitStrs = getNeedMatchSubStrings(p)
            guard !splitStrs.isEmpty else {return 0}
            let hashValues = splitStrs.map { _StringHasher($0).getHash(0, $0.count - 1)}
            let lengths = splitStrs.map { $0.count}
            let sourceHasher = _StringHasher(s)
            let M = s.count
            let N = splitStrs.count
            var indices = [[Int]](repeating: [], count: N)

            for i in 0..<M {
                for j in 0..<N {
                    guard lengths[j] + i - 1 < M else {
                        continue
                    }
                    if hashValues[j] == sourceHasher.getHash(i, i + lengths[j] - 1) {
                        indices[j].append(i)
                    }
                }
            }

            for j in 0..<N {
                guard !indices[j].isEmpty else {return -1}
            }

            if N == 1 {
                return indices[0].isEmpty ? -1 : lengths[0]
            } else if N == 2  {
                return solveWhenTwoParts(indices, lengths)
            } else {
                return solveWhenThreeParts(indices, lengths)
            }
        }
        private func getNeedMatchSubStrings(_ p: String) -> [String] {
            let strs = p.components(separatedBy: "*")
            var sb = [String]()
            for s in strs {
                if !s.isEmpty {
                    sb.append(s)
                }
            }
            return sb
        }
        private func solveWhenTwoParts(_ indices: [[Int]], _ lengths:[Int]) -> Int {
            let (firstMatchedIndices,firstPartLength) = (indices[0],lengths[0])
            let (secondMatchedIndices,secondPartLength) = (indices[1],lengths[1])
            var sb = INF
            var j = 0
            let M = secondMatchedIndices.count

            for firstIdx in firstMatchedIndices {
                while  j < M && secondMatchedIndices[j] <= firstIdx + firstPartLength - 1 {
                    j += 1
                }
                if j < M {
                    sb = min(sb,secondMatchedIndices[j] + secondPartLength - firstIdx)
                }
            }

            return sb == INF ? -1 : sb
        }
        private func solveWhenThreeParts(_ indices: [[Int]], _ lengths:[Int]) -> Int {
            let (firstMatchedIndices,firstPartLength) = (indices[0],lengths[0])
            let (secondMatchedIndices,secondPartLength) = (indices[1],lengths[1])
            let (thirdMatchedIndices,thirdPartLength) = (indices[2],lengths[2])
            let (M,N) = (firstMatchedIndices.count,thirdMatchedIndices.count)

            var i = 0
            var k = 0
            var sb = INF
            for j in secondMatchedIndices {
                let r = j + secondPartLength - 1
                guard j > firstMatchedIndices[i] + firstPartLength - 1 else {continue}
                //找到最右侧的第一部分匹配
                while i + 1 < M && j > firstMatchedIndices[i + 1] + firstPartLength - 1 {
                    i += 1
                }
                    //找到最左侧的第三部分匹配
                while k < N && thirdMatchedIndices[k] <= r {
                    k += 1
                }
                if k < N {
                    sb = min(sb,thirdMatchedIndices[k] + thirdPartLength - firstMatchedIndices[i])
                }
            }

            return sb == INF ? -1 : sb
        }
    }
