// https://leetcode.com/problems/exam-room/
class ExamRoom {


    private var sortedPos = [Int]()
    private let n: Int


    init(_ n: Int) {
        self.n = n
    }

    func seat() -> Int {

        guard !sortedPos.isEmpty else {
            sortedPos.append(0)
            return 0
        }

        var res = 0
        var pre = -1
        var maxDis = 0
        for cur in sortedPos {
            let dis = (cur - pre) >> 1
            if dis > maxDis {
                res = pre == -1 ? 0 : pre + dis
                maxDis = dis
            }
            pre = cur
        }

        if n - 1 - pre > maxDis {
            res = n - 1
        }

        let idx = binarySearch(res)
        if idx == sortedPos.count {
            sortedPos.append(res)
        } else {
            sortedPos.insert(res, at: idx)
        }
            // defer {
            //     print("\(#function)   --->  \(sortedPos)"  )
            // }
        return res
    }

    func leave(_ p: Int) {
        let idx = binarySearch(p)
        if idx == sortedPos.count {
            sortedPos.removeLast()
        } else {
            sortedPos.remove(at: idx)
        }

        // print("\(#function)  \(p) --->  \(sortedPos)"  )
    }


    func binarySearch(_ target: Int) -> Int {
        guard !sortedPos.isEmpty else {return 0}
        guard target > sortedPos[0] else {return 0}
        guard target < sortedPos.last! else {return sortedPos.count}
        var left = 0
        var right = sortedPos.count - 1
        while left < right {
            let mid = (left + right) >> 1
            if sortedPos[mid] >= target {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}

/**
 * Your ExamRoom object will be instantiated and called as such:
 * let obj = ExamRoom(n)
 * let ret_1: Int = obj.seat()
 * obj.leave(p)
 */