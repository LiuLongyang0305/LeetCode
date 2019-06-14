//https://leetcode.com/problems/redundant-connection-ii/
class Solution {
    func findRedundantDirectedConnection(_ edges: [[Int]]) -> [Int] {
        guard edges.count > 3 else {
            return edges.count < 3 ? [Int]() : edges[2]
        }
        
        var parents = Array<Int>(repeating: -1, count: edges.count + 1)
        var children = Array<Array<Int>>(repeating: Array<Int>(), count: edges.count + 1)
        var potentionEdge = [Int]()
        var secondParent = -1
        var target = -1
        var root = -1
        var currentPath = [Int]()
        
        func dfs(root: Int) {
            if currentPath.contains(root) {
                potentionEdge = [currentPath.last!,root]
                return
            }
            currentPath.append(root)
            for child in children[root] {
                dfs(root: child)
            }
            currentPath.removeLast()
        }
        
        for edge in edges {
            let tail = edge[1]
            if parents[tail] == -1 {
                parents[tail] = edge[0]
            } else {
                secondParent = edge[0]
                target = tail
            }
            children[edge[0]].append(tail)
        }
        root = parents.lastIndex(of: -1)!
        root = root == 0 ? 1 : root
        target = -1 == target ? root : target
        
        dfs(root: target)
        return potentionEdge.isEmpty ? [secondParent,target] : potentionEdge
    }
}
