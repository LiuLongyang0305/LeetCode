// https://leetcode.com/problems/minimum-number-of-work-sessions-to-finish-the-tasks/
class Solution {
    func minSessions(_ tasks: [Int], _ sessionTime: Int) -> Int {
        let N = tasks.count
        let target = (1 << N - 1)
        var memo = [Int:Int]()
        func helper(_ visited: Int,_ remainTime: Int) -> Int {
            
            guard visited != target else {
                return 0
            }
            let key = visited << 16 | remainTime
            guard nil == memo[key] else {
                return memo[key]!
            }
            var ans = Int.max
            for idx in 0..<N {
                if visited & (1 << idx) ==  0 {
                    //处理当前任务
                    if remainTime >= tasks[idx]{
                        ans = min(ans, helper(visited | (1 << idx), remainTime -  tasks[idx]))
                    } else {
                        ans = min(ans, 1 + helper(visited | (1 << idx), sessionTime - tasks[idx]))
                    }
                }
            }
            memo[key] = ans
            return ans
        }
        return helper(0, 0)
    }
}