// https://leetcode-cn.com/problems/di-yi-ge-zhi-chu-xian-yi-ci-de-zi-fu-lcof/
class Solution {
    func firstUniqChar(_ s: String) -> Character {
        var oneTime = Set<Character>()
        var moreThanOneTime = Set<Character>()
        var map = [Character:Int]()
        var cnt = 0
        for ch in s {
            if !moreThanOneTime.contains(ch) {
                if oneTime.contains(ch) {
                    moreThanOneTime.insert(ch)
                    map.removeValue(forKey: ch)
                    oneTime.remove(ch)
                } else {
                    oneTime.insert(ch)
                    map[ch] = cnt
                }
            }
            cnt += 1
        }

        var ans: Character = " "
        var currentIndex = Int.max
        for ch in oneTime {
            if let i = map[ch] {
                if i < currentIndex {
                    ans = ch
                    currentIndex = i
                }
            }
        }
        return ans
    }
}