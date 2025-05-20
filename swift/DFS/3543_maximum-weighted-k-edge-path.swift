//https://leetcode.com/problems/maximum-weighted-k-edge-path/

class Solution {
    func maxWeight(_ n: Int, _ edges: [[Int]], _ k: Int, _ t: Int) -> Int {
        var tree = [Int:[(Int,Int)]]()
        for edge in edges {
            tree[edge[0],default: []] .append((edge[1],edge[2]))
        }
        var visited = Set<String>()
        var ans = -1

        func  dfs(_ curNode: Int, _ curPathLength: Int, _ sum: Int ) {
            guard curPathLength <  k else  {
                ans = max(ans,sum)
                return
            }
            let mask = "\(curNode)_\(curPathLength)_\(sum)"
            guard !visited.contains(mask) else {return}
            visited.insert(mask)
            guard let nextNodes = tree[curNode] else {return}
            for (nextNode, weight) in nextNodes {
                guard sum + weight < t else {
                    continue
                }
                dfs(nextNode, curPathLength + 1,sum + weight)
            }
        }

        for i in 0..<n {
            dfs(i, 0, 0)
        }
        return ans
    }
}
