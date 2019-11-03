//https://leetcode.com/contest/biweekly-contest-12/problems/tree-diameter/
class Solution {
    func treeDiameter(_ edges: [[Int]]) -> Int {
        var tree = [Int: Set<Int>]()
        for edge in edges {
            if nil == tree[edge[0]]{
                tree[edge[0]] = []
            }
            if nil == tree[edge[1]]{
                tree[edge[1]] = []
            }
            tree[edge[0]]?.insert(edge[1])
            tree[edge[1]]?.insert(edge[0])
        }

        
        func bfs(_ root: Int) -> (Int,Int) {
            
            var start = -1
            var visited = Set<Int>()
            var depth = 0
            
            var nodes = Array<Int>()
            nodes.append(root)
            while !nodes.isEmpty {
                print(nodes)
                start = nodes[0]
                depth += 1
                let length = nodes.count
                for _ in 0..<length {
                    let node = nodes.removeFirst()
                    visited.insert(node)
                    for child in tree[node]! {
                        if !visited.contains(child) {
                            nodes.append(child)
                        }
                    }
                }
            }
            return (start,depth)
        }
        
        return bfs(bfs(0).0).1 - 1
    }
}