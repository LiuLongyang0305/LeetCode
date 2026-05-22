//https://leetcode.cn/problems/count-indices-with-opposite-parity/
class Solution {
    func countOppositeParity(_ nums: [Int]) -> [Int] {
        var oddCnt = 0, evenCnt = 0
        for num in nums {
            if num & 1 == 0 {
                evenCnt += 1
            } else {
                oddCnt += 1
            }
        }
        var sb = [Int]()
        for num in nums {
            if num & 1 == 0 {
                sb.append(oddCnt)
                evenCnt -= 1
            } else {
                sb.append(evenCnt)
                oddCnt -= 1
            }
        }
        return sb
    }
}
