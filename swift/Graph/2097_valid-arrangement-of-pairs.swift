// https://leetcode.com/problems/valid-arrangement-of-pairs/
class Solution {
    func validArrangement(_ pairs: [[Int]]) -> [[Int]] {
        var graph = [Int:[Int]]()
        var degree = [Int:Int]()
        for pair in pairs {
            graph[pair[0],default: []].append(pair[1])
            degree[pair[0], default: 0] += 1
            degree[pair[1], default: 0] -= 1
        }
        var start = pairs[0][0]
        for (node,d) in degree {
            if d == 1 {
                start = node
                break
            }
        }
        
        var ans = [[Int]]()
        
        var indices = [Int:Int]()
        for (node,_) in graph {
            indices[node] = 0
        }
        func dfs(_ node: Int) {
            guard let children = graph[node] else {return}
            
            while let idx = indices[node], idx < children.count {
                let next = children[idx]
                indices[node, default: 0] += 1
                dfs(next)
                ans.append([node,next])
            }
            
        }
        dfs(start)
        
        return ans.reversed()
    }
}