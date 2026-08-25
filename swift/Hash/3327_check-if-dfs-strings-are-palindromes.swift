    // https://leetcode.cn/problems/check-if-dfs-strings-are-palindromes/
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
        private typealias Pair = (l:Int,r:Int)
        func findAnswer(_ parent: [Int], _ s: String) -> [Bool] {
            let n = parent.count
            let chars = [Character](s)
            var tree = [[Int]](repeating: [], count: n)
            for i in 1..<n {
                tree[parent[i]].append(i)
            }
            var boundry = [Pair](repeating: (-1,-1), count: n)
            var dfsstr = [Character]()

            func dfs(_ cur: Int)  {
                //即将开始的下标
                let l = dfsstr.count
                for ch in tree[cur] {
                    dfs(ch)
                }
                dfsstr.append(chars[cur])
                let r = dfsstr.count - 1
                boundry[cur] = (l,r)
            }
            dfs(0)
            let strHash = _StringHasher(String(dfsstr))
            let reversedStrHash = _StringHasher(String(dfsstr.reversed()))

            return (0..<n).map { root in
                let (l,r) = boundry[root]
                if l == r {
                    return true
                } else {
                    return strHash.getHash(l, r) == reversedStrHash.getHash(n - 1 - r, n - 1 - l)
                }
            }
        }
    }
