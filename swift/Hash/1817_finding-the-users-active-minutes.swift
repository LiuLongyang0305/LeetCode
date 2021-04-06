// https://leetcode.com/problems/finding-the-users-active-minutes/
class Solution {
    func findingUsersActiveMinutes(_ logs: [[Int]], _ k: Int) -> [Int] {
        var counter = [Int:Set<Int>]()
        for log in logs {
            counter[log[0], default: []].insert(log[1])
        }
        var counter2 = [Int:Int]()
        for (_,minutes) in counter {
            counter2[minutes.count, default: 0] += 1
        }
        var ans = Array<Int>(repeating: 0, count: k)
        for (t,cnt) in counter2 {
            ans[t - 1] = cnt
        }
        return ans
    }
}

