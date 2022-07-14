 // https://leetcode.com/problems/frog-position-after-t-seconds/
class Solution {
   func frogPosition(_ n: Int, _ edges: [[Int]], _ t: Int, _ target: Int) -> Double {
       guard n > 1 else {return 1.0}
       var ans: Double = 0.0
       var tree = [Int:[Int]]()
       for edge in edges {
           tree[edge[0], default: []].append(edge[1])
           tree[edge[1],default: []].append(edge[0])
       }

       var visited = Set<Int>()

       func dfs(_ root: Int, _ probablity: Double, _ time: Int ) {
            guard time <= t else {return}
           guard let possibleNextPositions = tree[root] else { return}
           let nextPositions = possibleNextPositions.filter { !visited.contains($0)}

           guard root != target else {
               ans += (time == t) || (time < t && nextPositions.isEmpty) ? probablity : 0.0
               return
           }
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