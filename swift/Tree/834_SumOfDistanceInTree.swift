//https://leetcode.com/problems/sum-of-distances-in-tree/
class Solution {
    var ans =  [Int]()
    var count = [Int]()
    var graph = [Set<Int>]()
    var N: Int = -1
    func sumOfDistancesInTree(_ N: Int, _ edges: [[Int]]) -> [Int] {
        self.N =  N
        ans = Array<Int>(repeating: 0, count: N)
        count = Array<Int>(repeating: 1, count: N)
        graph = Array<Set<Int>>(repeating: Set<Int>(), count: N)
        for edge in edges {
            graph[edge[0]].insert(edge[1])
            graph[edge[1]].insert(edge[0])
        }
        dfs(root: 0, parent: -1)
        dfs2(root: 0, parent: -1)
        return ans
    }
    
    private func dfs(root: Int, parent: Int)  {
        for child in graph[root] {
            if child != parent  {
                dfs(root: child, parent: root)
                count[root] +=  count[child]
                ans[root] +=  ans[child]  + count[child]
            }
        }
    }
    private func dfs2(root: Int, parent: Int)  {
        for child in graph[root] {
            if child != parent {
                ans[child] = ans[root] - count[child] + N - count[child]
                dfs2(root: child, parent: root)
            }
        }
    }
}