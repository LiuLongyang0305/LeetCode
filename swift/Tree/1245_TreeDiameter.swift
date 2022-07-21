//https://leetcode.com/contest/biweekly-contest-12/problems/tree-diameter/

class Solution {
    func treeDiameter(_ edges: [[Int]]) -> Int {

        let N = edges.count + 1
        guard !edges.isEmpty else {return 0}
        var tree = [[Int]](repeating: [], count: N)
        for edge in edges {
            tree[edge[0]].append(edge[1])
            tree[edge[1]].append(edge[0])
        }


        func bfs(_ root: Int) -> (point:Int,depth:Int) {

            var point = -1
            var visited = [Bool](repeating: false, count: N)
            var depth = 0
            var nodes = Array<Int>()
            nodes.append(root)
            visited[root] = true

            while !nodes.isEmpty {
                point = nodes[0]
                depth += 1
               var newQueue = [Int]()
                for node in nodes {
                    for child in tree[node] {
                        guard !visited[child] else {
                            continue
                        }
                        newQueue.append(child)
                        visited[child] = true
                    }
                }
                nodes = newQueue
            }
            return (point,depth)
        }

        return bfs(bfs(0).0).1 - 1
    }
}


class Solution {
    func treeDiameter(_ edges: [[Int]]) -> Int {
        let N = edges.count
        var tree = [[Int]](repeating: [], count: N + 1)
        for e in edges {
            tree[e[0]].append(e[1])
            tree[e[1]].append(e[0])
        }
        var ans = 0
        @discardableResult
        func dfs(_ cur: Int, _ parent: Int) -> Int {
            var maxLength = 0
            var secondMaxLength = 0

            for v in tree[cur] {
                guard v != parent else {continue}
                let temp = dfs(v, cur) + 1
                if temp > maxLength {
                    secondMaxLength = maxLength
                    maxLength = temp
                } else if temp > secondMaxLength {
                    secondMaxLength = temp
                }
            }

//            print("\(maxLength)   \(secondMaxLength)")
            ans = max(ans, maxLength + secondMaxLength)
            return maxLength
        }
        dfs(0, -1)
        return ans
    }
}