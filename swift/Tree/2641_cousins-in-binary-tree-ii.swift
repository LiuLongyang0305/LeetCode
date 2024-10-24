    //  https://leetcode.cn/problems/cousins-in-binary-tree-ii/
    class Solution {
        private typealias Pair = (node: TreeNode, parent: Int)
        func replaceValueInTree(_ root: TreeNode?) -> TreeNode? {

            guard let root = root else {return nil}
            root.val = 0
            var queue = [TreeNode]()
            queue.append(root)

            while !queue.isEmpty {
                var newQueue = [TreeNode]()
//                var indexToSum = [Int:Int]()
                var total = 0
                let N = queue.count
                for i in 0..<N {
                    let cur = queue[i]
                    if let l = cur.left {
//                        indexToSum[i,default: 0] += l.val
                        total += l.val
                        newQueue.append(l)
                    }
                    if let r = cur.right {
//                        indexToSum[i,default: 0] += r.val
                        newQueue.append(r)
                        total += r.val
                    }
                }

                for i in 0..<N {
                    let cur = queue[i],val = total - (cur.left?.val ?? 0) - (cur.right?.val ?? 0)
                    cur.left?.val = val
                    cur.right?.val = val
                }

                queue = newQueue
            }

            return root
        }
    }