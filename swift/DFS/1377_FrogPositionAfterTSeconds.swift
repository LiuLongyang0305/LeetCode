// https://leetcode.com/problems/frog-position-after-t-seconds/ 
class Solution {
    func frogPosition(_ n: Int, _ edges: [[Int]], _ t: Int, _ target: Int) -> Double {
        var ans: Double = 0.0
        var tree = [Int:[Int]]()
        for edge in edges {
            if nil == tree[edge[0]] {
                tree[edge[0]] = []
            }
            if nil == tree[edge[1]] {
                tree[edge[1]] = []
            }
            tree[edge[0]]?.append(edge[1])
            tree[edge[1]]?.append(edge[0])
        }
        
        var visited = Set<Int>()
        func dfs(_ root: Int, _ probablity: Double, _ time: Int ) {
            guard root != target else {
                if time == t {
                    ans += probablity
                } else if time < t {
                    var nextPosition = -1
                    if let nextPositions = tree[root] {
                        for p in nextPositions {
                            if !visited.contains(p) {
                                nextPosition = p
                                break
                            }
                        }
                    }
                    if nextPosition == -1 {
                        ans += probablity
                    }
                }
                return
            }
            guard time < t else {
                return
            }
            guard let possibleNextPositions = tree[root] else {
                return
            }
            let nextPositions = possibleNextPositions.filter { !visited.contains($0)}
            let currentP = 1.0 / Double(nextPositions.count)
            for p in nextPositions {
                visited.insert(p)
                dfs(p, probablity * currentP, time + 1)
                visited.remove(p)
            }
  
        }
        visited.insert(1)
        dfs(1, 1.0, 0)
        return ans
    }
 }