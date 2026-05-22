//https://leetcode.cn/problems/partition-array-into-k-distinct-groups/
class Solution {
    func partitionArray(_ nums: [Int], _ k: Int) -> Bool {
        let N = nums.count
        guard N % k == 0 else {return false}
        var counter = [Int:Int]()
        nums.forEach { counter[$0,default: 0] += 1}
        let groupsCnt = N / k
        return counter.values.max()! <= groupsCnt
    }
}
