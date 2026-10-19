    // https://leetcode.cn/problems/find-diameter-endpoints-of-a-tree/
class Solution {
    func findSpecialNodes(_ n: Int, _ edges: [[Int]]) -> String {

        let tree = buildTree(edges, n)
        let dismeterPoint = getOnePointOnDiameter(tree,n)
        let path = getDiameterPath(dismeterPoint,tree,n)
        let centerPoints = getCenterPoints(based: path)
        let allDiameterEndPoints = getDiametersPoints(basedOn: centerPoints, n, tree)

        return allDiameterEndPoints.reduce("") { $0 + ($1 ? "1" : "0")}
    }


    private func getDiametersPoints(basedOn centerPoints:[Int], _ n: Int, _ tree: [[Int]]) -> [Bool] {
        var dis = [Int](repeating: -1, count: n)
        var queue = centerPoints
        var curDis = 0
        for n in queue {
            dis[n] = curDis
        }
        while !queue.isEmpty {
            curDis += 1
            var newQueue = [Int]()
            for n in queue {
                for next in tree[n] {
                    guard -1 == dis[next] else {continue}
                    dis[next] = curDis
                    newQueue.append(next)
                }
            }
            queue = newQueue
        }
        let maxDis = dis.max()!
        return dis.map {$0 == maxDis}
    }
    private func buildTree(_ edges: [[Int]], _ n: Int) -> [[Int]] {
        var tree = [[Int]](repeating: [], count: n)
        for e in edges {
            let (f,s) = (e[0],e[1])
            tree[f].append(s)
            tree[s].append(f)
        }
        return tree
    }
    private func getOnePointOnDiameter(_ tree: [[Int]], _ n: Int) -> Int {
        var dis = [Int](repeating: -1, count: n)

        func dfs(_ node: Int, _ cd: Int) {
            guard dis[node] == -1 else {return}
            dis[node] = cd
            for n in tree[node] {
                dfs(n, cd + 1)
            }
        }

        dfs(0, 0)
        let maxDis = dis.max()!
        return dis.firstIndex(of: maxDis)!
    }

    private func getDiameterPath(_ basedOnPoint: Int, _ tree: [[Int]], _ n: Int) -> [Int] {
        var pa = [Int](repeating: -1, count: n)
        var dis = [Int](repeating: -1, count: n)

        func dfs(_ node: Int, _ cd: Int, _ p: Int) {
            guard dis[node] == -1 else {return}
            dis[node] = cd
            pa[node] = p
            for n in tree[node] {
                dfs(n, cd + 1,node)
            }
        }

        dfs(basedOnPoint, 0,-1)

        let maxDis = dis.max()!
        let anotherPoint = dis.firstIndex(of: maxDis)!

        var path = [Int]()
        var cur = anotherPoint
        while pa[cur] != -1 {
            path.append(cur)
            cur = pa[cur]
        }
        path.append(basedOnPoint)
        return path
    }

    private func getCenterPoints( based path: [Int]) -> [Int] {
        var ans = [Int]()
        let N = path.count
        ans.append(path[N / 2])
        if N & 1 == 0 {
            ans.append(path[N / 2 - 1])
        }
        return ans
    }
}
