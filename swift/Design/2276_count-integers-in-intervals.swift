//https://leetcode.com/problems/count-integers-in-intervals/
class CountIntervals {


    struct SegNode: CustomStringConvertible {
        var description: String {
            return "(\(left), \(right))"
        }

        var left: Int = -1
        var right: Int = -1
    }
    var cnt = 0
    var sortedSegs = [SegNode]()
    private let INF = 10000000007
    init() {
        self.cnt = 0
        self.sortedSegs.append(SegNode())
        self.sortedSegs.append(SegNode(left: INF, right: INF))
    }

    func add(_ left: Int, _ right: Int) {
        // print(sortedSegs)
        let l = binarySearchLessThan(left - 1)
        let r = binarySearchLargeThan(right + 1)

        var L = left
        var R = right

        var idx = l + 1
        while idx < r {
            cnt -= sortedSegs[idx].right - sortedSegs[idx].left + 1
            idx += 1
        }

        L = min(L, sortedSegs[l + 1].left)
        R = max(R, sortedSegs[r - 1].right)
        cnt += R - L + 1
        if l + 1 == r {
            sortedSegs.insert(SegNode(left: L, right: R), at: l + 1)
        } else {
            sortedSegs.replaceSubrange((l + 1)..<r, with: [SegNode(left: L, right: R)])
        }
        // print(sortedSegs)
    }

    func count() -> Int {
        return cnt
    }



    private func binarySearchLessThan(_ target: Int) -> Int {
        var left = 0
        var right = sortedSegs.count - 1
        while left < right {
            let mid = (left + right + 1) >> 1
            if sortedSegs[mid].right < target {
                left = mid
            } else {
                right = mid - 1
            }
        }

        return left
    }


    private func binarySearchLargeThan(_ target: Int) -> Int {
        var left = 0
        var right = sortedSegs.count - 1
        while left < right {
            let mid = (left + right) >> 1
            if sortedSegs[mid].left > target {
                right = mid
            } else {
                left = mid + 1
            }
        }

        return left
    }
}

/**
 * Your CountIntervals object will be instantiated and called as such:
 * let obj = CountIntervals()
 * obj.add(left, right)
 * let ret_2: Int = obj.count()
 */