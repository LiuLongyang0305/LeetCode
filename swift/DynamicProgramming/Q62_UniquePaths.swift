//https://leetcode.com/problems/unique-paths/

//Permutation and Combination
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m == 0 || n == 0 {
            return 0
        }
        if n == 1 || m == 1 {
            return 1
        }

        let totalSteps = m - 1 + n - 1
        var totalStepsSet = Set<Int>(1...totalSteps)
        var p1 = Set<Int>(1...(m - 1))
        var p2 = Set<Int>(1...(n - 1))
        for ele in p1 {
            if totalStepsSet.contains(ele) {
                totalStepsSet.remove(ele)
                p1.remove(ele)
            }
        }
        for ele in p2 {
            if totalStepsSet.contains(ele) {
                totalStepsSet.remove(ele)
                p2.remove(ele)
            }
        }
        var ans = 1
        for ele in totalStepsSet {
            ans *= ele
        }
        var devident = 1
        for ele in p1 {
            devident *= ele
        }
        for ele in p2 {
            devident *= ele
        }
        return ans / devident
    }
}