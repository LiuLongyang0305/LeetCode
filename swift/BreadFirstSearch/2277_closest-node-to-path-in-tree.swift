// https://leetcode.com/problems/closest-node-to-path-in-tree/
class Solution {
    func closestNode(_ n: Int, _ edges: [[Int]], _ querys: [[Int]]) -> [Int] {
        var tree = [[Int]](repeating: [], count: n)
        for edge in edges {
            tree[edge[0]].append(edge[1])
            tree[edge[1]].append(edge[0])
        }

        var distance = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)

        for node in 0..<n {

            var visited = [Bool](repeating: false, count: n)
            visited[node] = true
            distance[node][node] = 0

            var queue = [node]

            var dis = 0
            while !queue.isEmpty {
                dis += 1
                var newQueue = [Int]()
                for n in queue {
                    for child in tree[n] {
                        guard !visited[child] else {continue}
                        visited[child] = true
                        distance[node][child] = dis
                        newQueue.append(child)
                    }
                }
                queue = newQueue
            }
        }





        func dfs(_ node: Int, _ path:  [Int], _ visited: inout [Bool], _ target: Int, _ targetPath: inout [Int]) {
            visited[node] = true
            guard node != target else {
                targetPath = path
                return
            }
            for n in tree[node] {
                if !visited[n] {
                    dfs(n, path + [n] , &visited, target,&targetPath)
                }
            }

        }


        func getMinDisNode(in path: [Int],  distanceTo node : Int) -> Int {
            var ans = path[0]
            for n in path.dropFirst() {
                if distance[n][node] < distance[ans][node] {
                    ans = n
                }
            }
            return ans
        }

        var ans = [Int]()
        for q in querys {
            let (s,e,node) = (q[0],q[1],q[2])
            var visited = [Bool](repeating: false, count: n)
            var path = [Int]()
            dfs(s,[s] ,&visited,e,&path)
            // print(path)
            ans.append(getMinDisNode(in: path, distanceTo: node))
        }
        return ans
    }
}