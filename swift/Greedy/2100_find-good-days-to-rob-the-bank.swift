// https://leetcode.com/problems/find-good-days-to-rob-the-bank/
class Solution {
    func goodDaysToRobBank(_ security: [Int], _ time: Int) -> [Int] {
        let mySecurity = [Int.max] + security + [Int.max]
        let N = mySecurity.count
        var left = [Int](repeating: 0, count: N)
        for i in 1..<N {
            if mySecurity[i] <= mySecurity[i - 1] {
                left[i] = left[i - 1]
            } else {
                left[i] = i
            }
        }
        var right = [Int](repeating: N - 1, count: N)
        for idx in stride(from: N - 2, through: 0, by: -1) {
            if mySecurity[idx] <= mySecurity[idx + 1] {
                right[idx] = right[idx + 1]
            } else {
                right[idx] = idx
            }
        }
        var ans = [Int]()
        let rightLimit = security.count
        for i in 0..<N {
            if left[i] <= i - time && right[i] >= i + time {
                let idx = i - 1
                
                guard idx - time >=  0  && idx + time < rightLimit else {
                    continue
                }
                ans.append(idx)
            }
        }
        
        return ans
    }
}