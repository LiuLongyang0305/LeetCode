// https://leetcode-cn.com/problems/add-without-plus-lcci/
class Solution {
    func add(_ a: Int, _ b: Int) -> Int {
        var bCopy = b
        var aCopy = a
        while bCopy != 0 {
            let carry = (aCopy & bCopy) << 1
            aCopy ^= bCopy
            bCopy = carry
        }
        return aCopy
    }
}
class Solution {
    func add(_ a: Int, _ b: Int) -> Int {
        var bCopy = b
        var aCopy = a
        while bCopy != 0 {
            let carry = (a & b) << 1
            aCopy ^= b
            bCopy = carry
        }
        return aCopy
    }
}

class Solution {
    func add(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : add(a ^ b, (a & b) << 1)
    }
}