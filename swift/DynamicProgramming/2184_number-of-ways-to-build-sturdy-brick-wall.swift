// https://leetcode.com/problems/number-of-ways-to-build-sturdy-brick-wall/
class Solution {
    private let MOD = 1_000_000_007
    func buildWall(_ height: Int, _ width: Int, _ bricks: [Int]) -> Int {
        
        var possibleRows = [[Int]]()
        dfs(width, [0], &possibleRows, bricks)
        guard height > 1 else {return possibleRows.count}
        let tree = buildTree(bricks, width, height, possibleRows)
        guard !tree.isEmpty else {return 0}
        let M = possibleRows.count
        var lastRow = [Int](repeating: 1, count: M)
        
        
        for _ in  1..<height {
            var new = [Int](repeating: 0, count: M)
            //枚举上一，更新下一层
            for idx in 0..<M {
                guard lastRow[idx] > 0 else {continue}
                guard let children = tree[idx] else {continue}
                for cur in children {
                    new[cur] = (new[cur]  + lastRow[idx]) % MOD
                }
            }
            
            
            lastRow = new
        }
        
        return lastRow.reduce(0) { ($0 + $1) % MOD}
    }
    
    
    
    private func dfs(_ need: Int, _ cur: [Int],_ possibleRows: inout [[Int]], _ bricks: [Int]) {
        guard need > 0 else {
            possibleRows.append(cur)
            return
        }
        for idx in 0..<bricks.count {
            guard bricks[idx] <= need else {continue}
            dfs(need - bricks[idx], cur + [(cur.last ?? 0) + bricks[idx]], &possibleRows,bricks)
        }
    }
    
    
    private func buildTree(_ bricks: [Int], _ width: Int, _ height: Int, _ possibleRows: [[Int]]) -> [Int:[Int]] {
        
        var tree = [Int:[Int]]()

        func check(_ r1: [Int], _ r2: [Int]) -> Bool {
            
            let M = r1.count
            var idx = 1
            while idx < M - 1 {
                if let _ = r2.firstIndex(of: r1[idx]) {
                    return false
                }
                idx += 1
            }
            return true
        }
        
        
        
        let M = possibleRows.count
        var i = 0
        while i < M {
            if check(possibleRows[i], possibleRows[i]) {
                tree[i,default: []].append(i)
            }
            var j = i + 1
            while j < M {
                
                if check(possibleRows[i],possibleRows[j]) {
                    tree[i, default: []].append(j)
                    tree[j,default: []].append(i)
                }
                
                j += 1
            }
            i += 1
        }
        
        return tree
    }
    
}