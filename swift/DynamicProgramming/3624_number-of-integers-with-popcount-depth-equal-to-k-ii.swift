//  https://leetcode.com/problems/number-of-integers-with-popcount-depth-equal-to-k-ii/
 func getDepth(of num: Int) -> Int {
    if num == 0 {
        return 0
    }
    if num == 1 {
        return 1
    }
    return 1 + getDepth(of: num.nonzeroBitCount)
}
class SegmentTreeNode {
    var left: Int = -1
    var right: Int = -1
    var leftNode: SegmentTreeNode? = nil
    var rightNode: SegmentTreeNode? = nil
    var value: [Int] = []
}

func bulid(_ l: Int, _ r: Int, _ nums: [Int]) -> SegmentTreeNode {
    let node = SegmentTreeNode.init()
    node.left = l
    node.right = r
    node.value = [Int](repeating: 0, count: 6)
    if l == r {
        let depth = getDepth(of: nums[l])
        node.value[depth - 1] = 1
    } else {
        let mid = (l + r) >> 1
        node.leftNode = bulid(l, mid, nums)
        node.rightNode = bulid(mid + 1, r, nums)
        
        for i in 0..<6 {
            node.value[i] = (node.leftNode?.value[i] ?? 0) + (node.rightNode?.value[i] ?? 0)
        }
    }
    return node
}


func update( _ node: SegmentTreeNode, _ idx: Int, _ num: Int) {
    let l = node.left
    let r = node.right
    if l == r && l == idx {
        node.value = [Int](repeating: 0, count: 6)
        node.value[getDepth(of: num) - 1] = 1
    } else {
        let mid = (l + r) >> 1
        if idx <= mid {
            update(node.leftNode!, idx, num)
        } else {
            update(node.rightNode!, idx, num)
        }
        for i in 0..<6 {
            node.value[i] = (node.leftNode?.value[i] ?? 0) + (node.rightNode?.value[i] ?? 0)
        }
    }
}

func query(_ node: SegmentTreeNode, _ l: Int, _ r: Int, _ depth: Int) -> Int {
    
    if node.left == l && node.right == r {
        return node.value[depth]
    }
    
    let mid = (node.left + node.right) >> 1
    if r <= mid {
        return query(node.leftNode!, l, r, depth)
    } else if l > mid {
        return query(node.rightNode!, l, r, depth)
    } else {
        return query(node.leftNode!, l, mid, depth) + query(node.rightNode!, mid + 1, r, depth)
    }
}

class Solution {
    func popcountDepth(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
                // print(nums.map({ getDepth(of: $0)}))
        let segmentTree = bulid(0,nums.count - 1,nums)
        var sb = [Int]()
        for q in queries {
            if q[0] == 1 {
                sb.append(query(segmentTree, q[1], q[2], q[3]))
            } else {
                update(segmentTree, q[1], q[2])
            }
        }
        return sb
    }
}
