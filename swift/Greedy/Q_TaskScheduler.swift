//https://leetcode.com/problems/task-scheduler
class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        if n == 0 || tasks.count < 2 {
            return tasks.count
        }
        var map = Array<Int>(repeating: 0, count: 26)
        let aToInt = Character("a").asciiValue!
        var ans = 0
        for ch in tasks {
            map[Int(ch.asciiValue! - aToInt) ] += 1
        }
        map.sort()
        while map[25] > 0{
            var i = 0
            while i <= n {
                if map[25] == 0 {
                    break
                }
                if i < 26 && map[25 - i] > 0 {
                    map[25 - i] -= 1
                }
                ans += 1
                i += 1
            }
            map.sort()
        }
        return ans
    }
}