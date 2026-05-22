//https://leetcode.cn/problems/maximum-bitwise-xor-after-rearrangement/
class Solution {
    func maximumXor(_ s: String, _ t: String) -> String {
        var sb = ""
        var bitOneCnt = 0
        var bitZeroCnt = 0
        for ch in t {
            if ch == "1" {
                bitOneCnt += 1
            } else {
                bitZeroCnt += 1
            }
        }
        for ch in s {
            if ch == "1" && bitZeroCnt > 0 {
                sb.append("1")
                bitZeroCnt -= 1
                continue
            }
            if ch == "0" && bitOneCnt > 0 {
                sb.append("1")
                bitOneCnt -= 1
                continue
            }
            sb.append("0")
        }
        return sb
    }

}
