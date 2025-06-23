//https://leetcode.com/problems/minimum-adjacent-swaps-to-alternate-parity/
class Solution {
    func minSwaps(_ nums: [Int]) -> Int {

        var oddIndices = [Int]()
        var evenIndices = [Int]()
        for i in 0..<nums.count {
            if nums[i] & 1 == 0 {
                oddIndices.append(i)
            } else {
                evenIndices.append(i)
            }
        }
        let N = nums.count
        guard abs(oddIndices.count - evenIndices.count) <= 1 else {return -1}
        let targetIndices = [Int](stride(from: 0, to: N, by: 2))
        let targetIndices2 = [Int](stride(from: 1, to: N, by: 2))

        func cal(_ targetIndices: [Int], _ oriIdx: [Int]) -> Int {
            var cnt = 0
            let N = targetIndices.count
            for i in 0..<N {
                cnt += abs(targetIndices[i] - oriIdx[i])
            }
            return cnt
        }



        //奇数多，奇数开头；偶数多，偶数开头，一样多，则菊科作为开头
        if oddIndices.count > evenIndices.count {
            //start with odd
            return (cal(targetIndices, oddIndices) + cal(targetIndices2, evenIndices)) / 2
        } else if evenIndices.count > oddIndices.count {

                //start with even
            return (cal(targetIndices, evenIndices) + cal(targetIndices2, oddIndices)) / 2
        } else {

            return min((cal(targetIndices, oddIndices) + cal(targetIndices2, evenIndices)),(cal(targetIndices, evenIndices) + cal(targetIndices2, oddIndices))) / 2
        }
    }
}
