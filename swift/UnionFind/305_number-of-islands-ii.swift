// https://leetcode.com/problems/number-of-islands-ii/
class Solution {
    private typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    private var parents = Array<Int>()
    private var grid = Array<Array<Bool>>()
    func numIslands2(_ m: Int, _ n: Int, _ positions: [[Int]]) -> [Int] {
        grid = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: n), count: m)
        parents = Array<Int>(0..<(n*m))
        var ans = Array<Int>()
        let N = positions.count
        for idx in 0..<N {
            let x = positions[idx][0]
            let y = positions[idx][1]
            guard !grid[x][y] else {
                ans.append(ans.last!)
                continue
            }
            grid[x][y] = true
            
            let p = x * n + y
            guard idx > 0 else {
                find(p)
                ans.append(1)
                continue
            }
            var roots = Set<Int>()
            for dir in directions {
                let newX = dir.dx + x
                let newY = dir.dy + y
                guard newX >= 0 && newX < m  && newY >= 0 && newY < n else {
                    continue
                }
                if grid[newX][newY] {
                    roots.insert(find(newX * n + newY))
                }
            }
            let par = find(p)
            if roots.isEmpty {
                ans.append(ans.last! + 1)
            } else {
                ans.append(ans.last! - (roots.count - 1))
                for r in roots {
                    union(r, par)
                }
            }
        }
        return ans
    }
    
    private func find(_ p: Int) -> Int {
        if p == parents[p] {
            parents[p] = p
            return p
        }
        var temp = p
        while temp != parents[temp] {
            temp = parents[temp]
        }
        return temp
    }
    
    private func union(_ first: Int, _ second: Int) {
        parents[first] = second
    }
}
