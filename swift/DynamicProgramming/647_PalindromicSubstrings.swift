//https://leetcode.com/problems/palindromic-substrings/
class Solution {
    func countSubstrings(_ s: String) -> Int {
        guard s.count > 1 else {
            return s.count
        }
        
        let charArray = Array<Character>(s)
        let size = s.count
        var dp = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: size), count: size)
        var count = 0
        
        for i in 0..<size {
            dp[i][i] = true
            count += 1
        }
        
        for i in 0..<(size - 1) {
            if charArray[i] == charArray[i + 1] {
                dp[i][i + 1] = true
                count += 1
            }
        }
        guard size > 2 else {
            return count
        }
        for subStringLength in 3...size {
            for i in 0..<(size - subStringLength + 1) {
                let j = i + subStringLength - 1
                if dp[i + 1][j - 1] && charArray[i] == charArray[j] {
                    dp[i][j] = true
                    count += 1
                }
            }
        }
        return count
    }
}