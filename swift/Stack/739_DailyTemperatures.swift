//https://leetcode.com/problems/daily-temperatures/
class Solution {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        var stack = [Int]()
        let length = T.count
        var ans = Array<Int>(repeating: 0, count: length)
        for i in 0..<length {
            let index = length - 1 - i
            while !stack.isEmpty && T[index] >= T[stack.last!] {
                stack.removeLast()
            }
            ans[index] = stack.isEmpty ? 0 : stack.last! - index
            stack.append(index)
        }
        return ans
    }
}

var temperature = [73,74,75,71,69,72,76,73]
Solution().dailyTemperatures(temperature)