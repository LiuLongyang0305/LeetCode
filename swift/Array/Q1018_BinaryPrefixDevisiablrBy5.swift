//https://leetcode.com/problems/binary-prefix-divisible-by-5/
class Solution {
    func prefixesDivBy5(_ A: [Int]) -> [Bool] {
        var ans = Array<Bool>(repeating: false, count: A.count)
        var remainder = Array<Int>(repeating: 0, count: A.count)
        ans[0] = A[0] == 0
        remainder[0] = A[0]
        for i in 1..<A.count {
            let num = remainder[i - 1] * 2 + A[i]
            ans[i] = num % 5 == 0
            remainder[i] = num % 5
        }
        return ans
    }
    
}