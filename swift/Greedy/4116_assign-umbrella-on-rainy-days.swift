    // https://leetcode.cn/problems/assign-umbrella-on-rainy-days/
    class Solution {
        func assignUmbrella(_ rain: [Int]) -> [String] {
            var ans = [String]()
            let M = rain.count
            var timeDiff = 0
            for (i,v) in rain.enumerated() {
                guard v == 1 else {
                    ans.append("None")
                    continue
                }
                if i < M - 1 && rain[i + 1] == 1 {
                    ans.append(timeDiff <= 0 ? "Alice" : "Bob")
                } else {
                    ans.append("Bob")
                }
                 if let l = ans.last {
                    timeDiff += (l == "Alice" ? 1 : -1)
                }
            }
            return ans
        }
    }
