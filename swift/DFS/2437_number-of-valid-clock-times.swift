// https://leetcode.com/problems/number-of-valid-clock-times/
class Solution {
    func countTime(_ time: String) -> Int {
     func check(_ str: String) -> Bool {
            let hour = String(str.prefix(2))
            let min = String(str.suffix(2))
            return hour >= "0" && hour <= "23" && min >= "00" && min <= "59"
        }
        var ans = 0


        func dfs(_ chars: [Character])  {
            guard let idx = chars.firstIndex(of: "?") else {
                if check(String(chars)) {
                    ans += 1
                }
                return
            }
            var temp = chars
            for i in 0...9 {
                temp[idx] = Character("\(i)")
                dfs(temp)
            }

        }


        dfs([Character](time))


        return ans


    }
}
