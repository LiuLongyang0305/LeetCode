//https://leetcode.com/problems/largest-perimeter-triangle/
class Solution {
    func largestPerimeter(_ A: [Int]) -> Int {
        var ans = Int.min
        let sortedA = A.sorted()
        let size = A.count
        var j = size - 1
        var maxTwoSum = Int.min
        while j >= 1 {
            let twoSum = sortedA[j] + sortedA[j - 1]
            if twoSum > maxTwoSum {
                var i = size - 1
                while sortedA[i] >= twoSum && i > j {
                    i -= 1
                }
                if i != j {
                    if sortedA[i] + twoSum >= ans {
                        ans = sortedA[i] + twoSum
                        maxTwoSum = twoSum
                    }
                }
                
            } else {
                return ans
            }
            j -= 1
            
        }
        return ans == Int.min ? 0 : ans
    }
}
Solution().largestPerimeter([2,1,2])
