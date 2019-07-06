//https://leetcode.com/problems/1-bit-and-2-bit-characters/
class Solution {
    func isOneBitCharacter(_ bits: [Int]) -> Bool {
        let size = bits.count
        guard size > 0 else {
            return false
        }
        var i = 0
        while size - i > 2 {
            i += bits[i] == 0 ? 1 : 2
        }
        return i == size - 1 ? bits[i] == 0 : bits[i + 1] == 0 && bits[i] == 0
    }
}