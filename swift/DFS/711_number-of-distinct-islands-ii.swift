// https://leetcode.com/problems/number-of-distinct-islands-ii/
class Solution {
    private typealias TransformFactor = (dx:Int,dy:Int)
    private let transformFactorsXY: [TransformFactor] = [(1,1),(-1,1),(1,-1),(-1,-1)]
    func numDistinctIslands2(_ grid: [[Int]]) -> Int {
        
        let M = grid.count
        guard M > 0 else {
            return 0
        }
        let N = grid[0].count
        guard N > 0 else {
            return 0
        }
        var ans = 0
        var existed = Set<[[Int]]>()
        var visited = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: M)
        
        func update(_ nodes: [[Int]]) {

            guard nodes.count > 1 else {
                guard !existed.contains([[0,0]]) else {
                    return
                }
                ans += 1
                existed.insert([[0,0]])
                return
            }
            let transformed = transform(nodes)
            guard !existed.contains(transformed) else {
                return
            }
            ans += 1
            existed.insert(transformed)
            existed.insert(transform(nodes.map({[-$0[0],$0[1]]})))
            existed.insert(transform(nodes.map({[$0[0],-$0[1]]})))
            existed.insert(transform(nodes.map({[-$0[0],-$0[1]]})))
            existed.insert(transform(nodes.map({[$0[1],$0[0]]})))
            existed.insert(transform(nodes.map({[-$0[1],$0[0]]})))
            existed.insert(transform(nodes.map({[$0[1],-$0[0]]})))
            existed.insert(transform(nodes.map({[-$0[1],-$0[0]]})))

        }
        func dfs(_ r: Int, _ c: Int, _ nodes: inout [[Int]]) {
            for (dx,dy) in [(0,1),(0,-1),(-1,0),(1,0)] {
                let newR = r + dx
                let newC = c + dy
                guard newR >= 0 && newR < M && newC >= 0 && newC < N && grid[newR][newC] == 1 && !visited[newR][newC] else {
                    continue
                }
                visited[newR][newC] = true
                nodes.append([newR,newC])
                dfs(newR, newC, &nodes)
            }
        }
        
        for r in 0..<M {
            for c in 0..<N {
                if grid[r][c] == 1 && !visited[r][c] {
                    var nodes = [[Int]]()
                    visited[r][c] = true
                    nodes.append([r,c])
                    dfs(r, c, &nodes)
                    update(nodes)
                }
            }
        }
        return ans
    }
    
    private func transform(_ nodes: [[Int]]) -> [[Int]] {
        let sortedNodes = nodes.sorted { (n1, n2) -> Bool in
            if n1[0] == n2[0] {
                return n1[1] < n2[1]
            }
            return n1[0] < n2[0]
        }
        let t = sortedNodes[0]
        return sortedNodes.map {[$0[0] - t[0], $0[1] - t[1]]}
    }
}
