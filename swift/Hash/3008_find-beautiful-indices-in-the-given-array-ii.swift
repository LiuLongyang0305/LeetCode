
    // https://leetcode.cn/problems/find-beautiful-indices-in-the-given-array-ii/
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
        func beautifulIndices(_ s: String, _ a: String, _ b: String, _ k: Int) -> [Int] {

            let sHash = StringHasher(s)
            let M = s.count, N = a.count,P = b.count
            let aHashVal = StringHasher(a).getHash(0, N - 1)
            let bHashVal = StringHasher(b).getHash(0, P - 1)

            var candidateIndicesOfB = [Int]()

            for i in 0..<M {
                guard i + P - 1 < M else {break}
                if bHashVal == sHash.getHash(i, i + P - 1) {
                    candidateIndicesOfB.append(i)
                }
            }
            guard !candidateIndicesOfB.isEmpty else {return []}
            candidateIndicesOfB = [-1] + candidateIndicesOfB + [M + 5]
            // print(candidateIndicesOfB)
            func binarySearchForLastLessThan(_ target: Int) -> Int {
                var l = 0
                var r = candidateIndicesOfB.count - 1
                while l < r {
                    let mid = (l + r + 1) >> 1
                    if candidateIndicesOfB[mid] >= target {
                        r = mid - 1
                    } else {
                        l = mid
                    }
                }
                return l
            }


            func check(_ idx: Int) -> Bool {
                //判断是否存在J位于 [idx - k,idx+k]之中，二分法
                let minTarget = max(idx - k,0)
                let maxTarget = min(idx + k,M)
                //第一个大于等于minTarget的-> 最后一个小于miTtarget
                //最后一个小于等于maxTarget的 -> 最后一个小于(maxTarget + 1)
                let l = binarySearchForLastLessThan(minTarget) + 1
                let r = binarySearchForLastLessThan(maxTarget + 1)

                return r >= l
            }


            var sb = [Int]()

            for i in 0..<M {
                guard i + N - 1 < M else {break}
                if aHashVal == sHash.getHash(i, i + N - 1) {
                    if check(i) {
                        sb.append(i)
                    }
                }
            }

            return sb
        }
    }
