// https://leetcode.com/problems/falling-squares/
class Solution {
    private class SegmentNode {

        var l:Int
        var r:Int
        var maxHeight:Int
        var inc:Int

        init(_ l: Int, _ r: Int, _ maxHeight: Int = 0,_ inc: Int = 0){
            self.l = l
            self.r = r
            self.maxHeight = maxHeight
            self.inc = inc
        }
    }
    private var segmengTree = [SegmentNode]()
    func fallingSquares(_ positions: [[Int]]) -> [Int] {
        let N = positions.count * 3
        for _ in 0..<(4 * N) {
            segmengTree.append(SegmentNode(-1, -1))
        }

        var xs = Set<Int>()
        for position in positions {
            let l = position[0]
            let r = l + position[1]
            xs.insert(l << 1)
            xs.insert(r << 1)
            xs.insert(l + r)
        }
        let sortedXs = xs.sorted()
        build(1, 0, sortedXs.count - 1)
        
        func get(_ x: Int) -> Int {
            var left = 0
            var right = xs.count - 1
            while left < right {
                let mid = (left + right) >> 1
                if sortedXs[mid] >= x {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            return left
        }


        var ans = [Int]()

        for position in positions {
            let l = get(position[0] << 1)
            let r = get((position[0] + position[1]) << 1)
            let cur = query(1, l + 1, r - 1)
            update(1, l, r, cur + position[1])
            ans.append(segmengTree[1].maxHeight)
        }

        return ans
    }


    private func build(_ u: Int, _ l: Int,_ r: Int) {

        segmengTree[u].l = l
        segmengTree[u].r = r
        guard l != r else {return}
        let mid = (l + r) >> 1
        build(u << 1, l, mid)
        build(u << 1 | 1, mid + 1, r)

    }

    private func pushUp(_ u: Int) {
        segmengTree[u].maxHeight = max(segmengTree[u << 1].maxHeight, segmengTree[u << 1 | 1].maxHeight)
    }

    private func pushDown(_ u: Int) {
        let c = segmengTree[u].inc
        guard c > 0 else {return}
        segmengTree[u << 1].maxHeight = c
        segmengTree[u << 1 | 1].maxHeight = c
        segmengTree[u << 1 | 1].inc = c
        segmengTree[u << 1].inc = c
        segmengTree[u].inc = 0
    }


    private func update(_ u: Int, _ l: Int,_ r:Int,_ delta: Int) {
        guard l != segmengTree[u].l || r != segmengTree[u].r else {
            segmengTree[u].inc = delta
            segmengTree[u].maxHeight = delta
            return
        }
        pushDown(u)
        let mid = (segmengTree[u].r + segmengTree[u].l) >> 1
        if r <= mid {
            update(u << 1, l, r, delta)
        } else if l > mid {
            update(u << 1 | 1, l, r, delta)
        } else {
            update(u << 1, l, mid, delta)
            update(u << 1 | 1, mid + 1, r, delta)
        }
        pushUp(u)
    }


    private func query(_ u: Int,_ l: Int,_ r:Int) -> Int {
        guard l != segmengTree[u].l || r != segmengTree[u].r else {
            return segmengTree[u].maxHeight
        }
        pushDown(u)
        let mid = (segmengTree[u].l + segmengTree[u].r) >> 1
        guard r > mid else {return query(u << 1, l, r)}
        guard l <= mid else {return query(u << 1 | 1, l, r)}
        return max(query(u << 1, l, mid), query(u << 1 | 1, mid + 1, r))
    }
}











