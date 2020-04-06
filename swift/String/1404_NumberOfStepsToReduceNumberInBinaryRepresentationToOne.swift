// https://leetcode.com/problems/number-of-steps-to-reduce-a-number-in-binary-representation-to-one/
class Solution {
    func numSteps(_ s: String) -> Int {
        guard s.count > 1 else {
            return 0
        }
        var ans = 0
        let num = [Int](s.map { $0 == "0" ? 0 : 1}.reversed())
        
        let N = s.count
        var carry = 0
        
        for i in 0..<N {
            
            let lastDigit = num[i] + carry
            if lastDigit == 1 && i == N - 1 {
                break
            }
            if lastDigit == 1 {
                ans += 2
                carry = 1
            } else {
                ans += 1
                carry = lastDigit / 2
            }
        }
        return ans
    }
}