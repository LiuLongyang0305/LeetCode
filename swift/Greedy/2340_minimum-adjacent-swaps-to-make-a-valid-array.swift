// https://leetcode.com/problems/minimum-adjacent-swaps-to-make-a-valid-array/
class Solution {
    func minimumSwaps(_ nums: [Int]) -> Int {

        guard nums.count > 1 else {return 0}
        let minEle = nums.min()!
        var ans = 0
        let idx = nums.firstIndex(of: minEle)!
        ans += idx
        let maxEle = nums.max()!
        let lastIdx = nums.lastIndex(of: maxEle)!
        ans += nums.count - 1 - lastIdx
        if lastIdx < idx {
            ans -= 1
        }
        return ans
    }
}