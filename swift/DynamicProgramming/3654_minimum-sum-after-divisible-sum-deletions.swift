//https://leetcode.cn/problems/minimum-sum-after-divisible-sum-deletions/
class Solution {
    func minArraySum(_ nums: [Int], _ k: Int) -> Int {
        var memoMinSameRemainder = [Int](repeating: Int.max, count: k)
        memoMinSameRemainder[0] = 0
        var curMinRemain = 0
        var sum = 0
        for num in nums {
            sum = (sum + num) % k
            curMinRemain = min(curMinRemain + num, memoMinSameRemainder[sum])
            memoMinSameRemainder[sum] = curMinRemain
        }
        return curMinRemain
    }
}
