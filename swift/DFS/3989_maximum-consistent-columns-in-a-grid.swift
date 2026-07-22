//https://leetcode.cn/problems/maximum-consistent-columns-in-a-grid/
class Solution {
    func maxConsistentColumns(_ grid: [[Int]], _ limit: Int) -> Int {
        let N = grid[0].count
        let M = grid.count
        var tree = [[Int]](repeating: [], count: N)

        func check(_ fc: Int, sc: Int) -> Bool {
            for r in 0..<M {
                guard abs(grid[r][fc] - grid[r][sc]) <= limit else {return false}
            }
            return true
        }


        for i in 0..<N {
            for j in stride(from: i + 1, to: N, by: 1) {
                if check(i, sc: j) {
                    tree[i].append(j)
                }
            }
        }


        var depth = [Int](repeating: 1, count: N)
        var caculated = [Bool](repeating: false, count: N)
        func dfs(_ i: Int){
            if caculated[i] {return}
            var sb = 1
            for ch in tree[i] {
                if !caculated[ch] {
                    dfs(ch)
                }
                sb = max(sb,1 + depth[ch])
            }
            caculated[i] = true
            depth[i] = sb

        }

        for c in stride(from: N - 1, through: 0, by: -1){
            dfs(c)
        }


        return depth.max()!
    }
}
