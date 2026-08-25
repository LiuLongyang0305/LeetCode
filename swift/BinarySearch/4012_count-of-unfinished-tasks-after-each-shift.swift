// https://leetcode.cn/problems/count-of-unfinished-tasks-after-each-shift/
class Solution {
    func countTasks(_ tasks: [Int], _ shifts: [Int]) -> [Int] {
        let M = tasks.count
        var preffix = tasks
        if M > 1 {
            for i in 1..<M {
                preffix[i] += preffix[i - 1]
            }
        }

        func binarySearchFirstLargeThan(num target: Int) -> Int {
            var l = 0
            var r = preffix.count
            while l < r {
                let mid = (l + r) >> 1
                if preffix[mid] > target {
                    r = mid
                } else {
                    l = mid + 1
                }
            }
            return l
        }

        var sb = [Int]()
        var lastRemainTime = 0
        for s in shifts {
            lastRemainTime += s
            if lastRemainTime >= preffix.last! {
                sb.append(0)
                lastRemainTime = 0
            } else {
                if lastRemainTime < preffix.first! {
                    sb.append(tasks.count)
                } else {
                    let l = binarySearchFirstLargeThan(num: lastRemainTime)
                    sb.append(tasks.count - l)
                }
            }
        }
        return sb
    }
}
