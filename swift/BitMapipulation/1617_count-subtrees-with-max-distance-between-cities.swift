//https://leetcode.com/problems/count-subtrees-with-max-distance-between-cities/
class Solution {
    func countSubgraphsForEachDiameter(_ n: Int, _ _edges: [[Int]]) -> [Int] {

        let edges = _edges.map { e in
            [e[0] - 1,e[1] - 1]
        }

        ///根据`mask`构造子树（也可能是森林）
        func buildSubtree( base mask: Int ) -> [[Int]] {
            var tree = [[Int]](repeating: [], count: n)
            for e in edges {
                guard mask & (1 << e[0]) != 0 && mask & (1 << e[1]) != 0 else {continue}
                tree[e[0]].append(e[1])
                tree[e[1]].append(e[0])
            }
            return tree
        }


        ///常规DFS
        func dfs(_ node: Int, _ visited: inout Int,_ tree:[[Int]]) {
            visited |= (1 << node)
            for child in tree[node]  {
                guard visited & (1 << child) == 0 else {
                    continue
                }
                dfs(child, &visited, tree)
            }
        }


        ///判断是否是一棵树：任一节点出发，都能访问到另一个节点
        func isTree(possibleTree: [[Int]], _ mask: Int) -> Bool {
            let anynode = 64 - mask.leadingZeroBitCount - 1
            var visited = 0
            dfs(anynode, &visited, possibleTree)
            return visited == mask
        }

        ///BFS求解直径的两点
        func getPointOfTreeDiameter(_ tree:[[Int]], _ root: Int) -> (point:Int,depth:Int) {
            var point = -1
            var visited = 0
            var depth = 0
            var queue = [Int]()
            queue.append(root)
            visited |= (1 << root)

            while !queue.isEmpty {
                point = queue[0]
                depth += 1
                var newQueue = [Int]()
                for node in queue {
                    for ch in tree[node] {
                        guard 0 == visited & (1 << ch) else {
                            continue
                        }
                        visited |= (1 << ch)
                        newQueue.append(ch)
                    }
                }
                queue = newQueue
            }
            return (point,depth)
        }

        ///求树的直径
        func caculateDiameter(of tree:[[Int]], _ mask: Int) -> Int {
            return  getPointOfTreeDiameter(tree, getPointOfTreeDiameter(tree, 64 - mask.leadingZeroBitCount - 1).point).depth - 1
        }

        var ans = [Int](repeating: 0, count: n - 1)
        for mask in 1..<(1 << n) {
            guard mask.nonzeroBitCount > 1 else {continue}
            //构造子树
            let subtree = buildSubtree(base: mask)
            //保证子树合法,连通
            guard isTree(possibleTree: subtree, mask) else {continue}
            //求直径
            let d = caculateDiameter(of: subtree, mask)
            ans[d - 1] += 1

        }
        return ans
    }
}