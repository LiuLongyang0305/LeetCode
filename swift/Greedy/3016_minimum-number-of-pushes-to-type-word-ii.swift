//https://leetcode.cn/problems/minimum-number-of-pushes-to-type-word-ii/
class Solution {
    func minimumPushes(_ word: String) -> Int {
        var cnt = [Character:Int]()
        for ch in word {
            cnt[ch,default: 0] += 1
        }
        let sortedCnt = cnt.sorted { p1, p2 in
            p1.value > p2.value
        }
        var ans = 0
        var idx = 0
        for (_,c) in sortedCnt {
            ans +=  c * (idx / 8 + 1)
            idx += 1
        }
        return ans
    }
}