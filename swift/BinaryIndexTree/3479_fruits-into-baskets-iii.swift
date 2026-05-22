//https://leetcode.com/problems/fruits-into-baskets-iii/
class Solution {
    class SegmentNode {
        var l: Int
        var r: Int
        var ln: SegmentNode? = nil
        var rn: SegmentNode? = nil
        var val: Int
        init(l: Int, r: Int, val: Int) {
            self.l = l
            self.r = r
            self.val = val
        }

    }

    func build(_ arr: [Int], _ l: Int, _ r: Int) -> SegmentNode {
        let sn = SegmentNode(l: l, r: r, val: -1)
        if l == r {
            sn.val = arr[l]
        } else {
            let mid = (l + r) >> 1
            let ln = build(arr, l, mid)
            let rn = build(arr, mid + 1, r)
            sn.ln = ln
            sn.rn = rn
            sn.val = max(ln.val,rn.val)
        }
        return sn
    }

    func search(_ curNode: SegmentNode,_ target: Int) -> Int {
        if curNode.l == curNode.r && curNode.val >= target {
            return curNode.l
        }
        if let ln = curNode.ln,ln.val >= target {
            return search(ln, target)
        }

        if let rn = curNode.rn,rn.val >= target {
            return search(rn, target)
        }

        return -1
    }


    func update(_ curNode: SegmentNode,_ idx: Int) {
        if curNode.l == curNode.r && curNode.l == idx {
            curNode.val = -1
            return
        }
        let mid = (curNode.l + curNode.r) >> 1
        if idx <= mid {
            update(curNode.ln!, idx)
        } else {
            update(curNode.rn!, idx)
        }
        curNode.val = max(curNode.ln?.val ?? -1, curNode.rn?.val ?? -1)
    }

    var ans = 0
    func numOfUnplacedFruits(_ fruits: [Int], _ baskets: [Int]) -> Int {
        let segmentTree = build(baskets, 0, baskets.count - 1)
        for f in fruits {
            let idx = search(segmentTree, f)
            if idx == -1 {
                ans += 1
            } else {
                update(segmentTree, idx)
            }
        }
        return ans
    }
}
