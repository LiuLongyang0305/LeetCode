//https://leetcode.com/problems/the-number-of-beautiful-subsets/

class Solution {
    func beautifulSubsets(_ nums: [Int], _ k: Int) -> Int {
        let N = nums.count
        let sortedNums = nums.sorted()
        func check(_ mask: Int) -> Bool {
            let M = 64 - mask.leadingZeroBitCount
            var numsSet = Set<Int>()
            for i in 0..<M {
                if mask & (1 << i) != 0 {
                    guard !numsSet.contains(sortedNums[i] - k) else {return false}
                    numsSet.insert(sortedNums[i])
                }
            }

            return true
        }
        var ans = 0
        for mask in 1..<(1 << N) {
            if check(mask) {
                ans += 1
            }
        }
        return ans
    }
}
