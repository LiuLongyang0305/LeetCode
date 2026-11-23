// https://leetcode.cn/problems/find-the-index-of-permutation/

struct FenwickTree {
    private var tree: [Int]
    private let n: Int
    
    init(n: Int) {
        self.n = n
        self.tree = Array(repeating: 0, count: n + 1)
        // 初始时所有数字都可用，相当于每个位置值为 1
        for i in 1...n {
            tree[i] = i & (-i)
        }
    }
    
    /// 单点更新：把位置 idx 的值加 delta
    mutating func update(_ idx: Int, _ delta: Int) {
        var i = idx
        while i <= n {
            tree[i] += delta
            i += i & (-i)
        }
    }
    
    /// 前缀和：查询 [1...idx] 的和
    func query(_ idx: Int) -> Int {
        var sum = 0
        var i = idx
        while i > 0 {
            sum += tree[i]
            i -= i & (-i)
        }
        return sum
    }
    
    /// 查询 [l...r] 区间和
    func rangeQuery(_ l: Int, _ r: Int) -> Int {
        return query(r) - query(l - 1)
    }
}

let MOD = 1_000_000_007
let MAXN = 100_001

var fact: [Int] = Array(repeating: 1, count: MAXN)
for p in 2..<MAXN {
    fact[p] = (fact[p - 1] * p) % MOD
}

class Solution {
    func getPermutationIndex(_ perm: [Int]) -> Int {
        let n = perm.count
        var bit = FenwickTree(n: n)
        var ans = 0
        
        for i in 0..<n {
            let x = perm[i]
            
            // 比 x 小的未使用数字个数
            // 因为 BIT 里 1 表示可用，0 表示已用
            let smaller = bit.query(x - 1)
            
            ans += fact[n - 1 - i] * smaller
            ans %= MOD
            
            // 标记 x 为已用（值从 1 变 0）
            bit.update(x, -1)
        }
        
        return ans % MOD
    }
}
