// https://leetcode.com/problems/detect-cycles-in-2d-grid/submissions/
class Solution {
    private var parent = [Int]()
    func containsCycle(_ grid: [[Character]]) -> Bool {
        let M = grid.count
        let N = grid[0].count
        self.parent = Array<Int>(0..<M * N)
        for r in 0..<M {
            for c in 0..<N {
                let curP = r * N + c
                let curParent = find(curP)
                var leftParent: Int? = nil
                var upParent: Int? = nil
                if r > 0 && grid[r][c] == grid[r - 1][c]{
                    upParent = find(curP - N)
                }
                if c > 0 && grid[r][c] == grid[r][c - 1] {
                    leftParent = find(curP - 1)
                }
                if let f1 = upParent, let f2 = leftParent {
                    guard f1 != f2 else {
                        return true
                    }
                    parent[f1] = curParent
                    parent[f2] = curParent
                    continue
                }
                if let f1 = upParent {
                    parent[f1] = curParent
                }
                if let f2 = leftParent {
                    parent[f2] = curParent
                }
            }
        }
        return false
    }
    private func find(_ node: Int) -> Int{
        guard parent[node] != node else {
            return node
        }
        var temp = node
        while temp != parent[temp] {
            temp = parent[temp]
        }
        return temp
    }
}