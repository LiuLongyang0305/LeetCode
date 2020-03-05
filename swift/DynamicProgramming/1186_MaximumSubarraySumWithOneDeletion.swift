// https://leetcode.com/problems/maximum-subarray-sum-with-one-deletion/
class Solution {
    func maximumSum(_ arr: [Int]) -> Int {
        guard arr.count > 1 else {
            return arr[0]
        }
        let N = arr.count
        var ans = arr[0]
        var oneDelete = 0
        var noDelete = arr[0]
        
        for i in 1..<N {
            oneDelete = max(oneDelete + arr[i], noDelete)
            noDelete = max(noDelete + arr[i], arr[i])
            ans = max(oneDelete, noDelete,ans)
        }
        return ans
    }
 }
 