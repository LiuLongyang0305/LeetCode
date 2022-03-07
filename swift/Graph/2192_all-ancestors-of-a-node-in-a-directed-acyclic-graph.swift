// https://leetcode.com/problems/all-ancestors-of-a-node-in-a-directed-acyclic-graph/
class Solution {
   func getAncestors(_ n: Int, _ edges: [[Int]]) -> [[Int]] {
       
       var roots = [Set<Int>](repeating: [], count: n)
       var degree = [Int](repeating: 0, count: n)
       var graph = [[Int]](repeating: [], count: n)
       edges.forEach { e in
           graph[e[0]].append(e[1])
           degree[e[1]] += 1
       }
       
       var queue = [Int]()
       for i in 0..<n {
           if degree[i] == 0 {
               queue.append(i)
           }
       }
       
       while !queue.isEmpty {
           var newQueue = [Int]()
           for cur in queue {
               for next in graph[cur] {
                   var t = roots[next]
                   t = t.union(roots[cur])
                   t.insert(cur)
                   degree[next] -= 1
                   if degree[next] == 0 {
                       newQueue.append(next)
                   }
                   roots[next] = t
               }
           }
           queue = newQueue
       }
       return roots.map {$0.sorted()}
   }
}
