//https://leetcode.com/problems/minimum-height-trees/
class Solution {
    //                         最大深度  最大深度对应节点 次大深度，次大深度对应节点
    private typealias Squre = (depth1:Int,from1: Int,depth2:Int,from2:Int)
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var graph = [[Int]](repeating: [], count: n)
        for edge in edges {
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }


        //求解以当前节点为根，子节点的深度信息
        var down = [Squre](repeating: (0,-1,0,-1), count: n)
        @discardableResult
        func dfs(_ cur: Int, _ parent: Int) -> Squre {

            var ans: Squre = (0,-1,0,-1)

            for v in graph[cur] {
                guard v != parent else {continue}
                let (d1,_,_,_) = dfs(v, cur)
                if d1  + 1 >= ans.depth1 {
                    ans.depth2 = ans.depth1
                    ans.from2 = ans.from1
                    ans.depth1 = d1 + 1
                    ans.from1 = v
                } else if d1 + 1 > ans.depth2 {
                    ans.depth2 = d1 + 1
                    ans.from2 = v
                }
            }
            down[cur] = ans
            return ans
        }

        //以当前节点为根，最大深度可能来自于其父节点。
        var up = [Int](repeating: 0, count: n)
        func dfs2(_ cur: Int, _ parent: Int) {
            for v in graph[cur] {
                guard v != parent else {continue}
                if v == down[cur].from1 {
                    up[v] = max(up[cur], down[cur].depth2) + 1
                } else {
                    up[v] = max(up[cur], down[cur].depth1) + 1

                }
                dfs2(v, cur)
            }
        }

        dfs(0, -1)
        dfs2(0, -1)

        //二者较大值即为以当前节点为根的树的深度
        let depth = (0..<n).map { max(down[$0].depth1, up[$0])}
        let minDepth = depth.min()!
        return (0..<n).filter {minDepth == depth[$0]}
    }
}