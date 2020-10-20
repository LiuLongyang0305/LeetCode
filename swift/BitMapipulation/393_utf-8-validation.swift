// https://leetcode.com/problems/utf-8-validation/
class Solution {
    func validUtf8(_ data: [Int]) -> Bool {
        let N = data.count
        func check(_ idx: Int, _ cnt: Int) -> Bool {
            guard N - idx >= cnt else {
                return false
            }
            for i in idx..<(idx + cnt) {
                guard data[i] >> 6 == 0b10 else {
                    return false
                }
            }
            return true
        }
        var i = 0
        while i < data.count {
            if data[i] >> 7 == 0 {
                i += 1
                continue
            } else if data[i] >> 5 == 0b110 {
                guard check(i + 1, 1) else {
                    return false
                }
                i += 2
            } else if data[i] >> 4 == 0b1110 {
                guard check(i + 1, 2) else {
                    return false
                }
                i += 3
            }else if data[i] >> 3 == 0b11110 {
                guard check(i + 1, 3) else {
                    return false
                }
                i += 4
            } else {
                return false
            }
        }
        return true
    }
}