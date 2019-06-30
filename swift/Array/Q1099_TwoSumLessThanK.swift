//https://leetcode-cn.com/contest/biweekly-contest-3/problems/two-sum-less-than-k/
class Solution {
    func twoSumLessThanK(_ A: [Int], _ K: Int) -> Int {
        guard A.count > 1 else {
            return -1
        }
        var tempArray = A.filter { (val) -> Bool in
            val < K
        }
        if tempArray.count < 1 {
            return -1
        }
        tempArray.sort()
        if tempArray[0] > K / 2 {
            return -1
        }
        var result = 0

        var i = 0
        var j = tempArray.count - 1
        while i < j {
            let sum = tempArray[i] + tempArray[j]
            if sum == K - 1 {
                return sum
            } else if sum >= K {
                j -= 1
            } else {
                if sum > result {
                    result = sum
                }
                i += 1
                j = tempArray.count - 1
            }
        }
        return result
    }
}