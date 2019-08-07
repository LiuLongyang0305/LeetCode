//https://leetcode.com/problems/3sum/
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let length = nums.count
        var  ans =  [[Int]]()
        if length < 3 {
            return ans
        }
        var sortedNums = nums.sorted()
        for i in 0..<(length - 1) {
            if i > 0 && sortedNums[i] == sortedNums[i - 1] {
                continue
            }
            var j = i + 1
            var k = length - 1
            let target = -sortedNums[i]
            while j < k {
                if sortedNums[j] + sortedNums[k] ==  target {
                    ans.append([sortedNums[i],sortedNums[j],sortedNums[k]])
                    j += 1
                    k -= 1
                    while j < k && sortedNums[j] ==  sortedNums[j - 1] {
                        j += 1
                    }
                    while j < k && sortedNums[k] == sortedNums[k + 1] {
                        k -= 1
                    }
                } else if  sortedNums[j] + sortedNums[k] > target {
                    k -= 1
                } else {
                    j += 1
                }
            }
        }
        return  ans
    }
}