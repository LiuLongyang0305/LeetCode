//https://leetcode.com/contest/weekly-contest-161/problems/minimum-swaps-to-make-strings-equal/
class Solution {
    func minimumSwap(_ s1: String, _ s2: String) -> Int {
        var ans = 0
        let chars1 = [Character](s1)
        let chars2 = [Character](s2)

        var count1 = 0
        var count2 = 0
        for i in 0..<s1.count {
            if chars1[i] != chars2[i] {
                if chars1[i] == "x" {
                    count1 += 1
                } else {
                    count2 += 1
                }
            }
        }
        if (count2 + count1) % 2 == 1 {
            return -1
        }
        ans += count2 / 2 + count1 / 2
        if count2 % 2 == 1 {
            ans += 2
        }
        return ans
    }
}