// https://leetcode.com/problems/detonate-the-maximum-bombs/
class Solution {
    private typealias Bomb = (x:Int,y:Int,r:Int)
    func maximumDetonation(_ bs: [[Int]]) -> Int {
        
        func canBomb(_ first: Bomb, _ second: Bomb) -> Bool {
            let dx = first.x - second.x
            let dy = first.y - second.y
            return  dx * dx + dy * dy <= first.r * first.r
        }
        let bombs:[Bomb] = bs.map { ($0[0],$0[1],$0[2])}
        let N = bombs.count
        var tree = [Int:[Int]]()
        
        for i in 0..<N {
            for j in 0..<N {
                if canBomb(bombs[i], bombs[j]) {
                    tree[i,default: []].append(j)
                }
            }
        }
        
        func bfs(_ node: Int) -> Int {
            var ans = 1
            var visited = [Bool](repeating: false, count: N)
            visited[node] = true
            var queue = [node]
            while !queue.isEmpty {
                var newLevel = [Int]()
                for n in queue {
                    guard let children = tree[n] else {
                        continue
                    }
                    for ch in children {
                        if !visited[ch] {
                            newLevel.append(ch)
                            visited[ch] = true
                            ans += 1
                        }
                    }
                }
                queue = newLevel
            }
            return ans
        }
        var ans = 1
        for i in 0..<N {
            ans = max(ans, bfs(i))
        }
        return ans
    }
}