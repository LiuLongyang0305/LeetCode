//https://leetcode.com/problems/largest-time-for-given-digits/
class Solution {
    func largestTimeFromDigits(_ A: [Int]) -> String {
        var ans = -1
        for i in 0...3 {
            for j in 0...3 {
                if j != i {
                    for k in 0...3 {
                        if k != i && k != j {
                            let l = 6 - i - j - k
                            let hours = 10 * A[i] + A[j]
                            let minutes = 10 * A[k] + A[l]
                            if hours < 24 && minutes < 60 {
                                ans = max(ans, 60 * hours + minutes)
                            }
                        }
                    }
                }
            }
        }
        if ans == -1  {
            return ""
        }
        var result = ""
        let hours = ans / 60
        let minutes = ans % 60
        result += hours / 10 == 0 ? "0\(hours)" : "\(hours)"
        result += ":"
        result += minutes / 10 == 0 ? "0\(minutes)" : "\(minutes)"
        return result
        
    }
}

Solution().largestTimeFromDigits([1,2,3,4])
