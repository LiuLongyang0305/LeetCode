// https://leetcode.com/problems/find-the-original-array-of-prefix-xor/
class Solution {
    func findArray(_ pref: [Int]) -> [Int] {
        var ans = [Int]()
        ans.append(pref[0])
        let M = pref.count
        var idx = 1
        while idx < M {
            ans.append(pref[idx] ^ pref[idx - 1])
            idx += 1
        }
        return ans

    }
}
