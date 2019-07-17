//https://leetcode.com/problems/4sum-ii/
typealias Counter = [Int: Int]
class Solution {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        var  ans = 0
        var  counter = Counter()
        let size = A.count
        for i in 0..<size {
            for j in 0..<size {
                let sum = A[i] + B[j]
                if let  count = counter[sum] {
                    counter[sum] = count + 1
                } else {
                    counter[sum] = 1
                }
            }
        }
        
        for i in 0..<size {
            for j in 0..<size {
                if let count = counter[-(C[i] + D[j])] {
                    ans += count
                }
            }
        }
        return ans
    }
}
