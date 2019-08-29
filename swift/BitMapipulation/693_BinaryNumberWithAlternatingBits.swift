//https://leetcode.com/problems/binary-number-with-alternating-bits/
class Solution {
    func hasAlternatingBits(_ n: Int) -> Bool {
        guard n > 0 else {
            return false
        }
        var lastBit = n & 1
        var  temp = n >> 1
        while temp != 0 {
            let nextBit = temp & 1
            if nextBit == lastBit {
                return false
            }
            lastBit = nextBit
            temp >>= 1
        }
        return true
    }
}