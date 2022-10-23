// https://leetcode.com/problems/minimum-number-of-operations-to-make-arrays-similar/
class Solution {
    func makeSimilar(_ nums: [Int], _ target: [Int]) -> Int {
        let evenNums = nums.filter {$0 & 1 == 0}.sorted()
        let oddNums = nums.filter {$0 & 1 == 1}.sorted()
        let evenTarget = target.filter {$0 & 1 == 0}.sorted()
        let oddTarget = target.filter {$0 & 1 == 1}.sorted()
        var ans = 0
        let M = evenNums.count
        let N = oddNums.count
        for i in 0..<M {
            ans += abs(evenNums[i] - evenTarget[i]) / 2
        }
        for i in 0..<N {
            ans += abs(oddNums[i] - oddTarget[i]) / 2
        }
        return ans / 2
    }
}