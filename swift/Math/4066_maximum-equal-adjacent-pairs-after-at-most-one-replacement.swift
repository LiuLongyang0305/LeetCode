    //https://leetcode.cn/problems/maximum-equal-adjacent-pairs-after-at-most-one-replacement/
    class Solution {
        func maxEqualAdjacentPairs(_ nums: [Int]) -> Int {
            var base = 0
            var counter = [String:Int]()
            let M = nums.count
            for i in 0..<(M - 1) {
                let (x,y) = (nums[i],nums[i + 1])
                if x == y {
                    base += 1
                } else {
                    let xStr = "\(x)"
                    let yStr = "\(y)"
                    let key = x < y ? (xStr + "-" + yStr) : (yStr + "-" + xStr)
                    counter[key,default: 0] += 1
                }
            }
            return base + (counter.values.max() ?? 0)
        }
    }
