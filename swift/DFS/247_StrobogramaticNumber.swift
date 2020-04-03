// https://leetcode.com/problems/strobogrammatic-number-ii/
class Solution {
    private let map: [Character:Character] = ["1":"1","0":"0","8":"8","6":"9","9":"6"]
    private let candidate: [Character] = ["0","1","8","6","9"]
    func findStrobogrammatic(_ n: Int) -> [String] {
        guard n > 0 else {
            return []
        }
        guard n > 1 else {
            return ["1","0","8"]
        }
        var ans = [String]()
        func dfs(_ left: String, _ right: String) {
            guard left.count < n >> 1 else {
                if n % 2 == 0 {
                    ans.append(left + right)
                } else {
                    ans.append(left + "0" + right)
                    ans.append(left + "1" + right)
                    ans.append(left + "8" + right)
                }
                return
            }
            for ch in candidate {
                if ch == "0" && left.isEmpty {
                    continue
                }
                dfs(left + "\(ch)","\(map[ch]!)" + right)
            }
        }
        dfs("","")
        return ans
    }
}