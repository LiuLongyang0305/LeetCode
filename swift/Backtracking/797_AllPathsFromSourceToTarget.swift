// https://leetcode.com/problems/all-paths-from-source-to-target/
class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        let N = graph.count
        var ans = [[Int]]()
        
        func backtracking(_ currentPath: inout [Int], _ visited: inout Set<Int>)  {
            if currentPath.last! == N - 1 {
                ans.append(currentPath)
                return
            }
            for child in graph[currentPath.last!] {
                if !visited.contains(child) {
                    visited.insert(child)
                    currentPath.append(child)
                    backtracking(&currentPath, &visited)
                    visited.remove(child)
                    currentPath.removeLast()
                }
            }
        }
        var visited = Set<Int>()
        var currentPath = [Int]()
        visited.insert(0)
        currentPath.append(0)
        backtracking(&currentPath, &visited)
        return ans
    }
 }