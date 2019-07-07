//https://leetcode.com/problems/happy-number/
class Solution {
    func isHappy(_ n: Int) -> Bool {
        var visited = Set<Int>()
        var num = n
        while 1 != num && !visited.contains(num) {
            visited.insert(num)
            var sum : Int = 0
            while num > 0 {
                let temp : Int = num % 10
                sum += temp * temp
                num = num / 10
            }
            num = sum
        }
        return num == 1 ? true : false
    }
}