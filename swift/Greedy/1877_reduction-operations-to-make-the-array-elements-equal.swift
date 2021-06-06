// https://leetcode.com/problems/reduction-operations-to-make-the-array-elements-equal/
class Solution {
    func reductionOperations(_ nums: [Int]) -> Int {
        let minEle = nums.min()!
        var counter = Array<Int>(repeating: 0, count: 5 * 10000 + 5)
        for num in nums {
            counter[num ] += 1
        }
        var ans = 0
        var pre = 0
        for  idx in stride(from: 50001, through: 1, by: -1) {
            guard idx > minEle else {
                break
            }
            if counter[idx] > 0 {
                pre += counter[idx]
                ans += pre 
            }
        }
        return ans
    }
}

