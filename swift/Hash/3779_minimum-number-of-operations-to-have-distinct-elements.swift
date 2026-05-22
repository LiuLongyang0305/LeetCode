// https://leetcode.com/problems/minimum-number-of-operations-to-have-distinct-elements/
    class Solution {
        private typealias PairIndex = (penult:Int?,last:Int)
        func minOperations(_ nums: [Int]) -> Int {
            var map = [Int:PairIndex]()
            let M = nums.count
            var maxPenultIndex = -1
            for i in 0..<M {
                if var p = map[nums[i]] {
                    p.penult = p.last
                    p.last = i
                    map[nums[i]] = p

                } else {
                    map[nums[i]] = (nil,i)
                }
                maxPenultIndex = max(maxPenultIndex,map[nums[i]]?.penult ?? -1)
            }
            let sb = (maxPenultIndex + 1) / 3
            return (maxPenultIndex + 1) % 3 == 0 ? sb : (sb + 1)
        }
    }
