// https://leetcode.com/problems/number-of-ways-to-select-buildings/
class Solution {
    func numberOfWays(_ s: String) -> Int {

        guard s.contains("0") && s.contains("1") else {return 0}

        let chars = [Character](s)
        let firstIndexOfOne = chars.firstIndex(of: "1")!
        let firstIndexOfZero = chars.firstIndex(of: "0")!


        let maxIndex = max(firstIndexOfOne, firstIndexOfZero)

        var numberOfZeroOne = 0
        var numberOfOneZero = 0
        var numberOfOne = 0
        var numberOfZero = 0
        if chars[maxIndex] == "0" {
            numberOfOneZero = maxIndex
            numberOfOne = maxIndex
            numberOfZero = 1
        } else {
            numberOfZeroOne = maxIndex
            numberOfZero = maxIndex
            numberOfOne = 1
        }

        let N = s.count
        var ans = 0
        var idx = maxIndex + 1
        while idx < N {


            if chars[idx] == "1" {
                ans += numberOfOneZero
                numberOfZeroOne += numberOfZero
                numberOfOne += 1

            } else {
                ans += numberOfZeroOne
                numberOfOneZero += numberOfOne
                numberOfZero += 1
            }

            idx += 1
        }

        return ans
    }
}