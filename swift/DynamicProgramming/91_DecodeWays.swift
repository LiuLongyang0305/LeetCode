//https://leetcode.com/problems/decode-ways/
let zeroAsciiVal = Character("0").asciiValue!
class Solution {
    func numDecodings(_ s: String) -> Int {
        let chars = s.map{ Int($0.asciiValue! - zeroAsciiVal)}
        if chars[0] == 0 {
            return 0
        }
        var pre = 1
        var current = 1
        for i in 1..<s.count {
            let temp = current
            if chars[i] == 0 {
                if chars[i - 1] == 1 || chars[i - 1] == 2 {
                    current = pre
                } else {
                    return 0
                }
            } else if chars[i - 1] == 1 || chars[i - 1]  == 2 && chars[i] >= 1 && chars[i] <= 6 {
                current = current + pre
            }
            pre = temp
        }
        return current
    }
}
class Solution2 {
    func numDecodings(_ s: String) -> Int {
        let chars = s.map{ Int($0.asciiValue! - zeroAsciiVal)}
        guard chars[0] != 0 else {
            return 0
        }
        var pre = 1
        var current = 1
        for i in 1..<s.count {
            let temp = current
            guard !(chars[i] == 0  && !(chars[i - 1] == 1 || chars[i - 1] == 2)) else {
                return 0
            }
            (current,pre) = (chars[i] == 0 ? pre : chars[i - 1] == 1 || chars[i - 1]  == 2 && chars[i] >= 1 && chars[i] <= 6 ? (current + pre) : current, temp )
        }
        return current
    }
}