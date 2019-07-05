//https://leetcode.com/problems/powerful-integers/
class Solution {
    func powerfulIntegers(_ x: Int, _ y: Int, _ bound: Int) -> [Int] {
        var ans = [Int]()
        
        let xTimesLimit = x == 1 ? 1 : Int(log2(Double(bound)) / log2(Double(x))) + 1
        let yTimesLimit = y == 1 ? 1 : Int(log2(Double(bound)) / log2(Double(y))) + 1
        var xExponential = Array<Int>(repeating: 1, count: xTimesLimit)
        if x != 1 {
            for i in 1..<xTimesLimit {
                xExponential[i] = x * xExponential[i - 1]
            }
        }
        var yExponential = Array<Int>(repeating: 1, count: yTimesLimit)
        if y != 1 {
            for i in 1..<yTimesLimit {
                yExponential[i] = y * yExponential[i - 1]
            }
        }
        var exist = Set<Int>()
        for i in 0..<xTimesLimit {
            for j in 0..<yTimesLimit {
                let temp = xExponential[i] + yExponential[j]
                if temp <= bound {
                    if !exist.contains(temp) {
                        ans.append(temp)
                        exist.insert(temp)
                    }
                }
            }
        }
        return ans
    }
}

Solution().powerfulIntegers(2, 1, 10)