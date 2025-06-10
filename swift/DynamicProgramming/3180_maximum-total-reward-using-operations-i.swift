//https://leetcode.com/problems/maximum-total-reward-using-operations-i/

class Solution {
    func maxTotalReward(_ rewardValues: [Int]) -> Int {
        let sortedRewardValues = rewardValues.sorted()
        var existed = Set<Int>()
        for cur in sortedRewardValues {
            var newSet = existed
            newSet.insert(cur)
            for sum in existed {
                if cur > sum {
                    newSet.insert(cur + sum)
                }
            }
            existed = newSet
        }
        return existed.max()!
    }
}
