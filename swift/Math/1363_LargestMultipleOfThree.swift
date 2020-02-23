// https://leetcode.com/problems/largest-multiple-of-three/
class Solution {
    func largestMultipleOfThree(_ digits: [Int]) -> String {
        var ans = ""
        
        var counter = Array<Int>(repeating: 0, count: 10)
        var sum = 0
        for digit in digits {
            counter[digit] += 1
            sum += digit
        }
        
        func del(_ n: Int) -> Bool {
            for i in 0...9 where i % 3 == n && counter[i] > 0 {
                counter[i] -= 1
                return true
            }
            return false
        }
        
        if sum % 3 == 1 {
            if !del(1) {
                del(2)
                del(2)
            }
        } else if sum % 3 == 2 {
            if !del(2) {
                del(1)
                del(1)
            }
        }
        var temp = 9
        while temp >= 0 {
            if counter[temp] > 0 {
                ans += String(repeating: "\(temp)", count: counter[temp])
            }
            temp -= 1
        }
        guard !ans.isEmpty else {
            return ""
        }
        guard !ans.hasPrefix("0") else {
            return "0"
        }
        return ans
    }
 }
