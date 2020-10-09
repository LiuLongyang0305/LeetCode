//https://leetcode.com/problems/move-sub-tree-of-n-ary-tree/
class Solution {
    private struct NodeInfo {
        var level: Int
        var parent: Int
    }
    func moveSubTree(_ root: Node?, _ p: Node?, _ q: Node?) -> Node? {
        
        guard let r = root, let ch = p, let parent = q else {
            return root
        }
        
        var nodesInfo = [Int: NodeInfo]()
        var valToNode = [Int: Node]()
        
        func dfs(_ node: Node?, _ level: Int) {
            guard let curNode = node else {
                return
            }
            let val = curNode.val
            for child in curNode.children {
                valToNode[child.val] = child
                nodesInfo[child.val] = NodeInfo(level: level + 1, parent: val)
                dfs(child, level + 1)
            }
        }
        
        valToNode[r.val] = r
        nodesInfo[r.val] = NodeInfo(level: 0, parent: -1)
        dfs(root, 0)
        // simmilar to find lowest common ancestor
        func  checkIsInSubTree(_ higherLevelNodeVal: Int, _ targetLevel: Int, _ targetVal: Int) -> Bool {
            var val = higherLevelNodeVal
            while let info = nodesInfo[val], info.level > targetLevel {
                val = info.parent
            }
            return val == targetVal
        }
        
        guard let childInfo = nodesInfo[ch.val], let parentInfo = nodesInfo[parent.val] else {
            return root
        }
        guard childInfo.parent != parent.val else {
            return root
        }
        
        // q is in subtree of p
        if parentInfo.level > childInfo.level && checkIsInSubTree(parent.val, childInfo.level, ch.val) {
            var targetIdx = -1
            if let idx = valToNode[parentInfo.parent]?.children.firstIndex(where: { $0.val == parent.val}) {
                valToNode[parentInfo.parent]?.children.remove(at: idx)
            }
            if let idx = valToNode[childInfo.parent]?.children.firstIndex(where: { $0.val == ch.val}) {
                targetIdx = idx
                valToNode[childInfo.parent]?.children.remove(at: idx)
            }
            valToNode[parent.val]?.children.append(valToNode[ch.val]!)
            if ch.val == r.val {
                return parent
            } else {
                valToNode[childInfo.parent]?.children.insert(parent, at: max(targetIdx, 0) )
                return root
            }
        } else {
            valToNode[parent.val]?.children.append(ch)
            if let idx = valToNode[childInfo.parent]?.children.firstIndex(where: { $0.val == ch.val}) {
                valToNode[childInfo.parent]?.children.remove(at: idx)
            }
            return root
        }
    }
}
