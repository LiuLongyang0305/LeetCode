 // https://leetcode.com/problems/maximum-number-of-tasks-you-can-assign/
class Solution {
    func maxTaskAssign(_ tasks: [Int], _ workers: [Int], _ pills: Int, _ deltaStrength: Int) -> Int {

        let N = tasks.count
        let M = workers.count

        let sortedTasks = tasks.sorted()
        let sortedWorkers = workers.sorted()

        func check(_ mid: Int) -> Bool {

            var possibleWorkers = [Int](sortedWorkers.suffix(mid))
            var pillesLeft = pills

            func binarySearchFirstIndexLargerThanOrEqualTo(_ target: Int) -> Int? {
                guard target > possibleWorkers[0] else {return 0}
                guard target <= possibleWorkers.last! else {return nil}
                var left = 0
                var right = possibleWorkers.count - 1
                while left < right {
                    let mid = (left + right) >> 1
                    if possibleWorkers[mid] >= target {
                        right = mid
                    } else {
                        left = mid + 1
                    }
                }
                return left
            }


            var taskIdx = mid - 1
            while taskIdx >= 0 {
                let minStrenhth = sortedTasks[taskIdx]
                if possibleWorkers.last! >= minStrenhth {
                    possibleWorkers.removeLast()
                } else {
                    guard pillesLeft > 0 else {return false}
                    guard let idx = binarySearchFirstIndexLargerThanOrEqualTo(minStrenhth - deltaStrength) else {return false}
                    //CH
                    // possibleWorkers = [Int](possibleWorkers[..<idx]) + [Int](possibleWorkers[(idx + 1)...])
                    //EN
                    possibleWorkers.remove(at: idx)
                    pillesLeft -= 1
                }
                taskIdx -= 1
            }
            return true
        }



        var ans = 0
        var left = 0
        var right = min(M, N)
        while left <= right {
            let mid = (left + right) >> 1
            if check(mid) {
                ans = max(ans, mid)
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return ans
    }
}