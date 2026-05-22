//https://leetcode.cn/problems/multi-source-flood-fill/
class Solution {
    private struct ColorEngiene:Comparable {
        static func < (lhs: Solution.ColorEngiene, rhs: Solution.ColorEngiene) -> Bool {
            if lhs.timeStamp == rhs.timeStamp {
                return lhs.color > rhs.color
            }
            return lhs.timeStamp < rhs.timeStamp
        }

        var r: Int
        var c:Int
        var color: Int
        var timeStamp: Int
    }

    func colorGrid(_ n: Int, _ m: Int, _ sources: [[Int]]) -> [[Int]] {
        var grid = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
        var heap = Heap<ColorEngiene>()
        for s in sources {
            let (r,c,color) = (s[0],s[1],s[2])
            grid[r][c] = color
            heap.insert(ColorEngiene(r: r, c: c, color: color, timeStamp: 0))
        }

        while !heap.isEmpty {
            let top = heap.popMin()!
            for (dr,dc) in [(0,1),(0,-1),(1,0),(-1,0)] {
                let nr = top.r + dr
                let nc = top.c + dc
                guard nr >= 0 && nr < n && nc >= 0 && nc < m else {continue}
                guard grid[nr][nc] == -1 else {continue}
                grid[nr][nc] = top.color
                heap.insert(ColorEngiene(r: nr, c: nc, color: top.color, timeStamp: top.timeStamp + 1))
            }
        }
        return grid
    }
}
