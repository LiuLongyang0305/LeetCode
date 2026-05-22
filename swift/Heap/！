   //https://leetcode.cn/problems/find-the-occurrence-of-first-almost-equal-substring/
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
        func minStartingIndex(_ s: String, _ pattern: String) -> Int {


            guard pattern.count > 1 else {
                return 0
            }
            let sHash = StringHasher(s)
            let patternHash = StringHasher(pattern)

            let sChars = [Character](s)
            let pChars = [Character](pattern)
            let N = sChars.count
            let M = pChars.count


            func binarySearchForFirstDifferentCharIndex(_ from: Int) -> Int {
                var l = from
                var r = from + M - 1

                while l < r {
                    let mid = (l + r) / 2
                    if sHash.getHash(from, mid) == patternHash.getHash(0, mid - from) {
                        l = mid + 1
                    } else {
                        r = mid
                    }
                }
                return l
            }




            func check(_ startIdx: Int) -> Bool {
                //完全形同或者修改第一个字符或者修改第二个字符
                if (sHash.getHash(startIdx, startIdx + M - 1) == patternHash.getHash(0, M - 1)) || (sHash.getHash(startIdx + 1, startIdx + M - 1) == patternHash.getHash(1, M - 1)) || (sHash.getHash(startIdx, startIdx + M - 2) == patternHash.getHash(0, M - 2)) {
                    return true
                }
                let firstDifferentIdx = binarySearchForFirstDifferentCharIndex(startIdx)
                return sHash.getHash(startIdx, firstDifferentIdx - 1) == patternHash.getHash(0, firstDifferentIdx - 1 - startIdx) && sHash.getHash(firstDifferentIdx + 1, startIdx + M - 1) == patternHash.getHash(firstDifferentIdx - startIdx + 1, M - 1)
            }
            var startIdx = 0
            while startIdx + M - 1 < N {
                if check(startIdx) {
                    return startIdx
                }
                startIdx += 1
            }
            return -1
        }
    }
