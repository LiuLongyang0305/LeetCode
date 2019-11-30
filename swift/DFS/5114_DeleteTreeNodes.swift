//https://leetcode.com/problems/delete-tree-nodes/ 
class Solution {
    private var tree = [Int:Set<Int>]()
    private var value = [Int]()
    private var parent  = [Int]()
    func deleteTreeNodes(_ nodes: Int, _ parent: [Int], _ value: [Int]) -> Int {
        self.parent =  parent
        self.value = value
        createTree()
        getSubTreeSumThenRemoveNodes(0)
        return countNodes(-1) - 1
    }
    private func createTree()  {
        for i in 0..<value.count {
            if tree[parent[i]] == nil  {
                tree[parent[i]] = []
            }
            tree[parent[i]]?.insert(i)
        }
    }
    private func getSubTreeSumThenRemoveNodes(_ root: Int) -> Int {
        var sum = value[root]
        if let children = tree[root]  {
            for child in children {
                sum += getSubTreeSumThenRemoveNodes(child)
            }
        }
        if sum == 0 {
            tree[parent[root]]?.remove(root)
        }
        return sum
    }
    private func countNodes(_ root: Int) -> Int {
        var count = 1
        guard let children = tree[root] else {
            return count
        }
        for child in children {
            count += countNodes(child)
        }
        return count
    }
 }