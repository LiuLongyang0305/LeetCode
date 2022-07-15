//https://leetcode.com/problems/sum-of-distances-in-tree/
class Solution {
    func sumOfDistancesInTree(_ N: Int, _ edges: [[Int]]) -> [Int] {

        var graph = [[Int]](repeating: [], count: N)
        for e in edges {
            graph[e[0]].append(e[1])
            graph[e[1]].append(e[0])
        }

        var ans = [Int](repeating: 0, count: N)
        var countNodes = [Int](repeating: 1, count: N)


        func  dfs(_ node: Int, _ parent: Int) {
            for child in graph[node] {
                guard parent != child else {continue}
                dfs(child, node)
                countNodes[node] += countNodes[child]
                ans[node] += ans[child] + countNodes[child]
            }
        }


        func dfs2(_ node: Int, _ parent: Int) {
            for child in graph[node] {
                guard child != parent else {continue}
                ans[child] = ans[node] - countNodes[child] + N - countNodes[child]
                dfs2(child, node)
            }
        }

        dfs(0,-1)
        dfs2(0,-1)

        return ans

    }
}