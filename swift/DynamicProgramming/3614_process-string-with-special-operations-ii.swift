//https://leetcode.com/problems/process-string-with-special-operations-ii/
class Solution {
    func processStr(_ s: String, _ k: Int) -> Character {
        let N = s.count
        var size = [Int](repeating: 0, count: N)
        let chars = [Character](s)
        var sz = 0
        for i in 0..<N {
            if chars[i].isLetter {
                sz += 1
            } else {
                switch chars[i] {
                    case "#":
                       sz *= 2
                    case "*":
                        sz = max(sz - 1,0)
                    case "%":
                        break
                    default:
                        break
                }
            }
            size[i] = sz
        }
        guard k < size[N - 1] else  {return "."}

        var tempK = k
        for i in stride(from: N - 1, through: 0, by: -1) {

            let c = chars[i]
            sz = size[i]

            if c == "#" {
                if tempK >= sz / 2 {
                    tempK -= sz / 2
                }
            } else if c == "%" {
                tempK = sz - 1 - tempK
            } else if c != "*" && tempK == sz - 1 {
                return c
            }
        }

        return "."
    }
}
