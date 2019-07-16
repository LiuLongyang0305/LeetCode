//https://leetcode.com/problems/longest-harmonious-subsequence/
typealias Counter = Dictionary<Int,Int>
class Solution {

    func findLHS(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        var ans = 0
        var counter = Counter()
        for num in nums {
            if let count = counter[num] {
                counter[num] = count + 1
            } else {
               counter[num] = 1
            }
        }
        let sortedNums = Array<Int>(counter.keys).sorted()
        for i in 0..<(sortedNums.count - 1) {
            if sortedNums[i + 1] - sortedNums[i] == 1 {
                let length = counter[sortedNums[i]]!  + counter[sortedNums[i + 1]]!
                if length > ans {
                    ans = length
                }
            }
        }
        return ans
    }
}
