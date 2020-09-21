// https://leetcode.com/problems/sum-of-all-odd-length-subarrays/
class Solution {
    func sumOddLengthSubarrays(_ arr: [Int]) -> Int {
        var ans = 0
        var preffix = [0]
        for num in arr {
            preffix.append(preffix.last! + num)
        }
        let N = arr.count
        ans += preffix.last!
        func subsequenceSum(_ curSubsequenceLength: Int) -> Int {
            var sum = 0
            var j = 1
            while j + curSubsequenceLength - 1 <= N {
                sum += preffix[j + curSubsequenceLength - 1] - preffix[j - 1]
                j += 1
            }
            return sum
        }
        var  subsequenceLength = 3
        while subsequenceLength <= arr.count {
            ans += subsequenceSum(subsequenceLength)
            subsequenceLength += 2
        }
        return ans
    }
}