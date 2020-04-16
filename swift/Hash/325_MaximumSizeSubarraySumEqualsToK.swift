// https://leetcode.com/problems/maximum-size-subarray-sum-equals-k/
class Solution {
    private typealias Info = (first: Int,last:Int)
    func maxSubArrayLen(_ nums: [Int], _ k: Int) -> Int {
        let N = nums.count
        var map = [Int:Info]()
        map[0] = (-1,-1)
        var sum = 0
        for i in 0..<N {
            sum += nums[i]
            if nil == map[sum] {
                map[sum] = (i,i)
            } else {
                map[sum]?.last = i
            }
        }
        var maxLength = 0
        for (cur,info) in map {
            let sum = cur + k
            if let info2 = map[sum] {
                maxLength = max(maxLength, info2.last - info.first)
            }
        }
        return maxLength
    }
}
