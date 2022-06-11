// https://leetcode.com/problems/booking-concert-tickets-in-groups/

    // let debug = false
class BookMyShow {


    private class SegmentTreeNode: CustomStringConvertible {
        var description: String {
            return "Node(\(leftBound),\(rightBound),\(maxAdjSeats),\(remainSeats))"
        }

        var leftBound: Int
        var rightBound: Int
        var maxAdjSeats = 0
        var remainSeats = 0
        var leftChild: SegmentTreeNode?
        var rightChild: SegmentTreeNode?
        var lazy: Bool = false

        init(_ l: Int, _ r: Int, _ val: Int) {
            self.leftBound = l
            self.rightBound = r
            self.maxAdjSeats = val
            self.remainSeats = val
            if l != r {
                let mid = (l + r) >> 1
                self.leftChild = SegmentTreeNode(l, mid, val)
                self.rightChild = SegmentTreeNode(mid + 1, r, val)
                pushUp()
            }

        }

        func pushUp() {
            self.maxAdjSeats = max(leftChild?.maxAdjSeats ?? 0, rightChild?.maxAdjSeats ?? 0)
            self.remainSeats = (leftChild?.remainSeats ?? 0) + (rightChild?.remainSeats ?? 0)
        }


        func  pushDown() {
            guard lazy else {return}
            self.leftChild?.maxAdjSeats = 0
            self.rightChild?.maxAdjSeats = 0
            self.leftChild?.remainSeats = 0
            self.rightChild?.remainSeats = 0
            self.leftChild?.lazy = true
            self.rightChild?.lazy = true
            lazy = false

        }

        func queryRemainSeats(_ left: Int , _ right: Int) -> Int {
            if leftBound == left && rightBound == right {
                return remainSeats
            }
            pushDown()
            let mid = (leftBound + rightBound) >> 1
            if right <= mid {
                return leftChild!.queryRemainSeats(left, right)
            } else if left > mid {
                return rightChild!.queryRemainSeats(left, right)
            }
            return leftChild!.queryRemainSeats(left, mid) + rightChild!.queryRemainSeats(mid + 1, right)
        }



        func queryMaxAdjSeats(_ left: Int, _ right: Int) -> Int {
            if leftBound == left && rightBound == right {
                return maxAdjSeats
            }
            pushDown()
            let mid = (leftBound + rightBound) >> 1
            if right <= mid {
                return leftChild!.queryMaxAdjSeats(left, right)
            } else if left > mid {
                return rightChild!.queryMaxAdjSeats(left, right)
            }
            return max(leftChild!.queryMaxAdjSeats(left, mid), rightChild!.queryMaxAdjSeats(mid + 1, right))
        }


        func updateWhenGather(_ row: Int, _ k: Int,_ maxSeats: Int,_ startC: inout Int) {
            if leftBound == row && rightBound == row {
                startC = maxSeats - remainSeats
                remainSeats -= k
                maxAdjSeats -= k
                return
            }
            let mid = (leftBound + rightBound) >> 1
            if row <= mid {
                leftChild?.updateWhenGather(row, k, maxSeats, &startC)
            } else {
                rightChild?.updateWhenGather(row, k, maxSeats, &startC)
            }
            pushUp()
        }


        func updateWhenScatterSetZero(_ left: Int, _ right: Int) {
            if leftBound == left && rightBound == right {
                self.remainSeats = 0
                self.maxAdjSeats = 0
                lazy = true
                return
            }
            let mid = (leftBound + rightBound) >> 1
            if right <= mid {
                leftChild?.updateWhenScatterSetZero(left, right)
            } else if left > mid {
                rightChild?.updateWhenScatterSetZero(left, right)
            } else {
                leftChild?.updateWhenScatterSetZero(left, mid)
                rightChild?.updateWhenScatterSetZero(mid + 1, right)
            }
            pushUp()
        }

        func updateTheLastRowWhenScatter(_ row: Int,_ maxSeats: Int, _ k: Int) {
            var c = 0
            updateWhenGather(row, k, maxSeats, &c)
        }
        func display() {
            if let l = leftChild {
                l.display()
            }
            if(leftBound == rightBound) {
                print(self)
            }
            if let r = rightChild {
                r.display()
            }
        }
    }

    private let segmentTree: SegmentTreeNode
    private let N: Int
    private let M: Int
    init(_ n: Int, _ m: Int) {
        segmentTree = SegmentTreeNode(0, n - 1, m)
        N = n
        M = m
            // if debug {
            //     segmentTree.display()
            // }
    }

    func gather(_ k: Int, _ maxRow: Int) -> [Int] {

        guard segmentTree.queryMaxAdjSeats(0, maxRow) >= k else {

            return []
        }
            //        print("  \(k)   \( maxRow) \(segmentTree.queryMaxAdjSeats(0, maxRow))")
        var left = 0
        var right = min(maxRow, N - 1)
        while left < right {
            let mid = (left + right) >> 1
            if segmentTree.queryMaxAdjSeats(0, mid) >= k {
                right = mid
            } else {
                left = mid + 1
            }
        }
        var c = 0
        segmentTree.updateWhenGather(left, k,M,&c)
            // if debug {
            //     print("--------gather  \(left)---------")
            //     segmentTree.display()
            // }
        return [left,c]
    }

    func scatter(_ k: Int, _ maxRow: Int) -> Bool {
        guard segmentTree.queryRemainSeats(0, maxRow) >= k else {
            return false
        }
        var left = 0
        var right = min(maxRow, N - 1)
        while left < right {
            let mid = (left + right) >> 1
            if segmentTree.queryRemainSeats(0, mid) >= k {
                right = mid
            } else {
                left = mid + 1
            }
        }
        var remain = k
        if left >= 1 {
            remain -= segmentTree.queryRemainSeats(0, left - 1)
            segmentTree.updateWhenScatterSetZero(0, left - 1)

        }
        segmentTree.updateTheLastRowWhenScatter(left, M, remain)
            // if debug {
            //     print("--------scatter  \(left)  ---------")
            //     segmentTree.display()

            // }
        return true
    }
}



/**
 * Your BookMyShow object will be instantiated and called as such:
 * let obj = BookMyShow(n, m)
 * let ret_1: [Int] = obj.gather(k, maxRow)
 * let ret_2: Bool = obj.scatter(k, maxRow)
 */