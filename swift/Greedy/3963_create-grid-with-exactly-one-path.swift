 // https://leetcode.cn/problems/create-grid-with-exactly-one-path/
    class Solution {
        func createGrid(_ m: Int, _ n: Int) -> [String] {
            var sb = [String]()
            for r in 0..<m {
                var row = ""
                if r == 0 {
                    row = String(repeating: ".", count: n)
                } else {

                    if n > 1 {
                        row = String(repeating: "#", count: n - 1)
                    }
                    row.append(".")
                }
                sb.append(row)
            }
            return sb
        }
    }
