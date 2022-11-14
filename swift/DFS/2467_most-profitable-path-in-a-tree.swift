// https://leetcode.com/problems/most-profitable-path-in-a-tree/
class Solution {
    private let INF = 1000000007
    func mostProfitablePath(_ edges: [[Int]], _ bob: Int, _ amount: [Int]) -> Int {
        let N = amount.count
        //建树
        var tree = [[Int]](repeating: [], count: N)
        for edge in edges {
            tree[edge[0]].append(edge[1])
            tree[edge[1]].append(edge[0])
        }
        //计算bob到达各个节点的时间戳
        var bobArriveTime = [Int](repeating: INF, count: N)
        var bobPath = [Int]()
        func bobDFS(_ parent: Int,_ cur: Int) {
            bobPath.append(cur)
            guard cur != 0 else {
                let N = bobPath.count
                for i in 0..<N {
                    bobArriveTime[bobPath[i]] = i
                }

                return
            }
            for next in tree[cur] {
                guard next != parent else {continue}
                bobDFS(cur, next)
            }
            bobPath.removeLast()
        }
        bobDFS(-1, bob)

        //判断当前节点是否为叶子结点
        func isLeaf(_ node: Int, _ parent: Int) -> Bool {
            if tree[node].count > 1 {
                return false
            }
            return tree[node][0] == parent
        }
        //计算Alice在当前节点的得分
        func caculateCurNodeScore(_ node: Int,_ time: Int) -> Int {
            if time < bobArriveTime[node] {
                return amount[node]
            }
            if time == bobArriveTime[node] {
                return amount[node] / 2
            }
            return 0
        }

        //DFS计算alice的可能得分
        var ans = Int.min
        func aliceDFS(_ parent: Int, _ cur: Int,_ time: Int, _ score: Int) {
            let newScore = score + caculateCurNodeScore(cur, time)
            guard !isLeaf(cur, parent) else {
                ans = max(ans, newScore)
                return
            }
            for next in tree[cur] {
                guard next != parent else {continue}
                aliceDFS(cur, next, time + 1, newScore)
            }
        }
        aliceDFS(-1, 0, 0, 0)

        return ans
    }
}