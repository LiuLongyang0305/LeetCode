// https://leetcode.com/problems/minimum-absolute-difference-in-sliding-submatrix/
class Solution {
    func minAbsDiff(_ grid: [[Int]], _ k: Int) -> [[Int]] {
        let m = grid.count
        let n = grid[0].count
        var ans = [[Int]](repeating: [Int](repeating: 0, count: n - k + 1), count: m - k + 1)
        for i in 0..<m{
            let maxRow = i + k - 1
            guard maxRow < m else {continue}
            for j in 0..<n{
                let maxCol =  j + k - 1
                guard maxCol < n  else {
                    continue
                }

                var set = Set<Int>()
                for dx in 0..<k {
                    for dy in 0..<k {
                        set.insert(grid[i + dx][j + dy])
                    }
                }
                if set.count == 1 {
                    ans[i][j] = 0
                    continue
                }

                let sortedSet = set.sorted()
                // print(sortedSet)
                var t = sortedSet[1] - sortedSet[0]
                for i in 1..<sortedSet.count {
                    t = min(t,sortedSet[i] - sortedSet[i - 1])
                }
                ans[i][j] = t
            }
        }
        return ans
    }
}
