//https://leetcode.cn/problems/construct-uniform-parity-array-ii/
class Solution {
    func uniformArray(_ nums1: [Int]) -> Bool {
        var oddCnt = 0 //奇数
        var evenCnt = 0 //偶数
        var minOddNum = Int.max
        var minEvenNum = Int.max
        for num in nums1 {
            if num & 1 == 0 {
                evenCnt += 1
                minEvenNum = min(minEvenNum,num)
            } else {
                oddCnt += 1
                minOddNum = min(minOddNum,num)
            }
        }
        //全是偶数
        guard oddCnt > 0 else {return true}
            //全是奇数
        return minEvenNum > minOddNum
    }
}
