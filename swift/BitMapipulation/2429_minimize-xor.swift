// https://leetcode.com/problems/minimize-xor/
class Solution {
    func minimizeXor(_ num1: Int, _ num2: Int) -> Int {
        let N = num2.nonzeroBitCount
        let M = num1.nonzeroBitCount
        if M == N  {
            return num1
        } else if M > N {
            var t = M - N
            var ans = num1
            while t > 0 {
                ans = ans & (ans - 1)
                t -= 1
            }
            return ans
        } else {
            var ans = num1
            var t = N - M
            for i in 0..<40 {
                guard t > 0 else {
                    break
                }
                if ans & (1 << i) == 0 {
                    ans |= (1 << i)
                    t -= 1
                }
            }

            return ans
        }


    }
}