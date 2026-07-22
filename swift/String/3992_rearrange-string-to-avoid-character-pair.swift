// https://leetcode.cn/problems/rearrange-string-to-avoid-character-pair/
class Solution {
    func rearrangeString(_ s: String, _ x: Character, _ y: Character) -> String {
        var sb = ""
        var c1 = 0
        var c2 = 0
        for ch in s {
            if ch == x {
                c1 += 1
            } else if ch == y {
                c2 += 1
            } else {
                sb.append(ch)
            }
        }
        if c2 > 0 {
            sb = String(repeating: y, count: c2) + sb
        }
        if c1 > 0 {
            sb += String(repeating: x, count: c1)
        }
        return sb
    }
}


 class Solution {
        func rearrangeString(_ s: String, _ x: Character, _ y: Character) -> String {
            return String(s.sorted { c1, c2 in
                if x < y {
                    return c1 > c2
                } else {
                    return c1 < c2
                }
            })
        }
    }
