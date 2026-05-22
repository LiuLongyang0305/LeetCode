//https://leetcode.com/problems/process-string-with-special-operations-i/
class Solution {
    func processStr(_ s: String) -> String {
        var sb = ""
        for ch in s {
            if ch.isLetter {
                sb.append(ch)
            } else {
                switch ch {
                    case "#":
                        sb += sb
                    case "*":
                        let _ = sb.popLast()
                    case "%":
                        sb = String(sb.reversed())
                    default:
                        break
                }
            }
        }
        return sb
    }
}
