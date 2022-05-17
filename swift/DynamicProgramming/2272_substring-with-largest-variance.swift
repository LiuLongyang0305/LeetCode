// https://leetcode.com/problems/substring-with-largest-variance/
class Solution {
    private let chars = "abcdefghijklmnoqprstuvwxyz"
    func largestVariance(_ s: String) -> Int {
        var ans = 0

        for p in chars  {
            for q in chars {
                guard p != q else {continue}
                var pCnt = 0
                var qCnt = 0
                var canExtendPrevQ = false

                for ch in s {
                    if ch == p {
                        pCnt += 1
                    }
                    if ch == q {
                        qCnt += 1
                    }
                    if(qCnt > 0) {
                        ans = max(ans, pCnt - qCnt)
                    } else if qCnt == 0 && canExtendPrevQ {
                        ans = max(ans, pCnt - qCnt - 1)
                    }
                    guard pCnt >= qCnt else {
                        pCnt = 0
                        qCnt = 0
                        canExtendPrevQ = true
                        continue
                    }
                }
            }
        }



        return ans
    }
}