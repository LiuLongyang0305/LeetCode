// https://leetcode.com/problems/longest-binary-subsequence-less-than-or-equal-to-k/
/**
 思路：贪心，首先所有的"0"肯定满足题目要求。然后在子序列里面从低位想搞为添加"1"，知道构成的子序列所代表的数字大于*k*
 */

class Solution {
    func longestSubsequence(_ s: String, _ k: Int) -> Int {
        let sToChars = [Character](s)
        let N = s.count



            //子序列中"1"的最高出现位置
        let highestBitOneLimit = 64 - k.leadingZeroBitCount + 1
        var possibleSubSequence = [Character]()
            //前缀"1"的个数
        var preffix = [0]
            //保存"1"出现的位置
        var onesIndices = [Int]()

        for i in 0..<N {
            if sToChars[i] == "1" {
                onesIndices.append(i)
                preffix.append(preffix.last!)
            } else {
                possibleSubSequence.append("0")
                preffix.append(preffix.last! + 1)
            }
        }

        var ans = possibleSubSequence.count
        for idx in onesIndices.reversed() {
            let zeroCnt = preffix[idx]
            let suffixCnt = possibleSubSequence.count - zeroCnt
            guard suffixCnt + 1 <= highestBitOneLimit else {break}
            if suffixCnt == 0 {
                possibleSubSequence.append("1")
            } else {
                possibleSubSequence.insert("1", at: zeroCnt)
            }

                //检查所代表是数字是否小于等于k
            var v = 0
            var idx = zeroCnt
            while idx < possibleSubSequence.count {
                v = v * 2 + (possibleSubSequence[idx] == "0" ? 0 : 1)
                idx += 1
            }

            guard v <= k else {
                break
            }
            ans = possibleSubSequence.count
        }
        return ans
    }
}


