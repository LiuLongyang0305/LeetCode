//https://leetcode.com/problems/closest-subsequence-sum/
class Solution {
    func minAbsDifference(_ nums: [Int], _ goal: Int) -> Int {
        let M = nums.count
        var distance = Int.max
        var leftSums = getSum(of: [Int](nums[0..<(M >> 1)]))
        var rightSums = getSum(of: [Int](nums.dropFirst(M >> 1)))
        leftSums.forEach {distance = min(distance,abs(goal - $0))}
        rightSums.forEach {distance = min(distance,abs(goal - $0))}
        guard distance > 0 else {
            return 0
        }
        leftSums.sort()
        rightSums.sort()
        
        var i = 0
        var j = rightSums.count - 1
        
        while i < leftSums.count && j >= 0 {
            let s = leftSums[i] + rightSums[j]
            distance = min(distance,abs(s - goal))
            if s > goal {
                j -= 1
            } else {
                i += 1
            }
        }
        return distance
    }
    
    private func getSum(of nums: [Int]) -> [Int] {
        var ans = Array<Int>(repeating: 0, count: 1 << nums.count)
        for i in 0..<nums.count {
            for j in 0..<(1 << i) {
                ans[j + (1 << i)] = ans[j] + nums[i]
            }
        }
        return ans
    }
}