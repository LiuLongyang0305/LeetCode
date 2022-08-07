//https://leetcode.com/problems/task-scheduler-ii/
class Solution {
    func taskSchedulerII(_ tasks: [Int], _ space: Int) -> Int {
        var last = [Int:Int]()
        var cur = 1
        for t in tasks {
            if let v = last[t] {
                if cur - v <= space {
                    cur = space + v + 1
                }
            }
            last[t] = cur
            cur += 1
        }
        return cur - 1
    }
}