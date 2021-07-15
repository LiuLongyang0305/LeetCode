// https://leetcode.com/problems/depth-of-bst-given-insertion-order/
class Solution {
    typealias Node = (val:Int,level:Int)
    private var nodes = [Int:Node]()
    func maxDepthBST(_ order: [Int]) -> Int {
        let nums1 = Array<Int>(1...order.count)
        let nums2 = [Int](nums1.reversed())
        guard order != nums1 && order != nums2 else {
            return order.count
        }
        self.nodes = [:]
        for num in order {
            buildTree(num)
        }
        var ans = 0
        for (_,node) in nodes {
            if node.level > ans {
                ans = node.level
            }
        }
        return ans + 1
    }
    func buildTree(_ num: Int) {
        guard let _ = nodes[0] else {
            nodes[0] = (num,0)
            return
        }
        var idx = 0
        while let (val,_) = nodes[idx] {
            if num > val {
                idx = 2 * idx + 2
            } else {
                idx = 2 * idx + 1
            }
        }
        if let (_,l) = nodes[(idx - 1) / 2] {
            nodes[idx] = (num,l + 1)
        }
    }
}