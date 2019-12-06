// https://leetcode.com/problems/random-pick-index/
 class Solution {
    var map  = [Int:[Int]]()
    init(_ nums: [Int]) {
        for i in 0..<nums.count {
            if nil == map[nums[i]] {
                map[nums[i]] = []
            }
            map[nums[i]]?.append(i)
        }
    }
    
    func pick(_ target: Int) -> Int {
        let indices = map[target]!
        guard indices.count >  1 else {
            return indices[0]
        }
        return indices[Int.random(in: ClosedRange<Int>(uncheckedBounds: (lower: 0, upper: indices.count - 1)))]
    }
 }

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: Int = obj.pick(target)
 */