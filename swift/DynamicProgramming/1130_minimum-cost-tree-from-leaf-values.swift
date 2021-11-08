// https://leetcode.com/problems/minimum-cost-tree-from-leaf-values/
class Solution {
    func mctFromLeafValues(_ arr: [Int]) -> Int {
        let N = arr.count
        var memo = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
        var maxValues = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
        for s in 0..<N {
            var v = arr[s]
            for e in s..<N {
                v = max(v, arr[e])
                maxValues[s][e] = v
            }
        }
        
        
        func dfs(_ s: Int, _ e: Int) -> Int {
            guard s != e  else {return 0}
            guard memo[s][e] == 0 else {
                return memo[s][e]
            }
            var t = Int.max
            for i in s..<e {
                let l = dfs(s,  i)
                let r = dfs(i + 1, e)
                t = min(t, l + r + maxValues[s][i] * maxValues[i + 1][e] )
            }
            memo[s][e] = t
            return t
        }
        return dfs(0, N - 1)
    }
}

