// https://leetcode.com/problems/bricks-falling-when-hit/
class Solution {
    private class UF {
        private var fa: [Int]
        private var size: [Int]
        init(_ n: Int) {
            self.fa = [Int](0..<n)
            self.size = [Int](repeating: 1, count: n)
        }

        func find(_ x: Int) -> Int {
            if fa[x] != x {
                fa[x] = find(fa[x])
            }
            return fa[x]
        }
        func union(_ x: Int,_ y: Int) {
            let fx = find(x)
            let fy = find(y)
            guard fx != fy else {return}
            if size[fx] > size[fy] {
                fa[fy] = fx
                size[fx] += size[fy]

            } else {
                fa[fx] = fy
                size[fy] += size[fx]
            }
        }

        func getSize(_ x: Int) -> Int {
            return size[find(x)]
        }
    }
    private var rows: Int = 0
    private var cols: Int = 0
    private typealias Direction = (dr:Int,dc:Int)
    private let directions:[Direction] = [(0,1),(0,-1),(-1,0),(1,0)]
    func hitBricks(_ grid: [[Int]], _ hits: [[Int]]) -> [Int] {
        self.rows = grid.count
        self.cols = grid[0].count

        var copy = grid.map { row in
            row.map { $0 == 1}
        }
        for hit in hits {
            copy[hit[0]][hit[1]] = false
        }


        let size = self.cols * self.rows
        let uf = UF(size + 1)

        for c in 0..<cols {
            if copy[0][c] {
                uf.union(c, size)
            }
        }

        for r in stride(from: 1, to: rows, by: 1) {
            for c in 0..<cols {
                guard copy[r][c] else {continue}
                if copy[r - 1][c] {
                    uf.union(getIndex(r - 1, c), getIndex(r, c))
                }
                if c > 0 && copy[r][c - 1] {
                    uf.union(getIndex(r, c - 1), getIndex(r, c))
                }

            }
        }

        let hitsLen = hits.count
        var ans = [Int](repeating: 0, count: hitsLen)
        for i in stride(from: hitsLen - 1, through: 0, by: -1) {
            let (r,c) = (hits[i][0],hits[i][1])
            guard grid[r][c] == 1 else {continue}
            let origion = uf.getSize(size)
            if r == 0 {
                uf.union(c, size)
            }
            for dir in directions {
                let nr = r + dir.dr
                let nc = c + dir.dc
                guard inArea(nr, nc) && copy[nr][nc] else {continue}
                uf.union(getIndex(r, c), getIndex(nr, nc))
            }
            let current = uf.getSize(size)
            ans[i] = max(0, current - origion - 1)
            copy[r][c] = true
        }
        return ans
    }

    private func getIndex(_ r: Int, _ c: Int) -> Int {
        return r * cols + c
    }
    private func inArea(_ r: Int, _ c: Int) -> Bool {
        return r >= 0 && r < rows && c >= 0 && c < cols
    }
}
