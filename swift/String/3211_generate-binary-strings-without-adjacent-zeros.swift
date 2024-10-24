// https://leetcode.cn/problems/generate-binary-strings-without-adjacent-zeros/
    class Solution {
        private let candidate = ["1","0"]
        func validStrings(_ n: Int) -> [String] {

            var ans = [String]()
            var cur = ""
            func dfs(){
                guard cur.count < n else {
                    ans.append(cur)
                    return
                }

                if let c = cur.last,c == "0" {
                        cur.append("1")
                        dfs()
                        cur.removeLast()

                } else {
                    for  str in candidate {
                        cur.append(str)
                        dfs()
                        cur.removeLast()
                    }
                }
            }

            dfs()
            return ans
        }
    }