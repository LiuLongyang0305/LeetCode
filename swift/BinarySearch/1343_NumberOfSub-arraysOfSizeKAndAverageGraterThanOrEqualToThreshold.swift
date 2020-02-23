// https://leetcode.com/problems/number-of-sub-arrays-of-size-k-and-average-greater-than-or-equal-to-threshold/
class Solution {
    func numOfSubarrays(_ arr: [Int], _ k: Int, _ threshold: Int) -> Int {
        var ans = 0
        var sum = 0
        let thresholdDouble = Double(threshold)
        var left = 0
        var right = 0
        while right < arr.count {
            sum += arr[right]
            if right - left != k - 1 {
                right += 1
            } else {
                let ave = Double(sum) / Double(k)
                if ave >= thresholdDouble {
                    ans += 1
                }
                right += 1
                sum -= arr[left]
                left += 1
            }
        }
        return ans
    }
 }


