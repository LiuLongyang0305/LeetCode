// https://leetcode.cn/problems/is-array-a-preorder-of-some-binary-tree/
    class Solution {
        private typealias Pair = (left:Int?,right:Int?)
        func isPreorder(_ nodes: [[Int]]) -> Bool {
            var tree = [Int:Pair]()
            var root = 0
            for node in nodes {
                let (n,p) = (node[0],node[1])
                if p == -1 {
                    root = n
                }
                if var pa = tree[p] {
                    pa.right = n
                    tree[p] = pa
                } else {
                    tree[p] = (n,nil)
                }
            }

            var preOrderValue = [Int]()

            func dfs(_ cur: Int?) {
                guard let c = cur else {return}
                preOrderValue.append(c)
                if let p = tree[c] {
                    dfs(p.left)
                    dfs(p.right)
                }

            }

            dfs(root)
            let N = nodes.count

            for i in 0..<N {
                guard nodes[i][0] == preOrderValue[i] else {return false}
            }
            return true
        }
    }
