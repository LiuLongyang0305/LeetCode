// https://leetcode.com/problems/minimum-rounds-to-complete-all-tasks/
class Solution {
    func minimumRounds(_ tasks: [Int]) -> Int {
        var counter = [Int:Int]()
        tasks.forEach { counter[$0, default: 0] += 1}
        var ans = 0

        for (_,cnt) in counter {
            guard cnt >= 2 else {return -1}
            ans += cnt / 3 + (cnt % 3 == 0 ? 0 : 1)
        }
        return ans
    }
}