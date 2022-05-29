 // https://leetcode.com/problems/rearrange-characters-to-make-target-string/
class Solution {
    func rearrangeCharacters(_ s: String, _ target: String) -> Int {
        var targetCounter = [Character:Int]()
        var sCounter = [Character:Int]()
        s.forEach {sCounter[$0,default: 0] += 1}
        target.forEach {targetCounter[$0, default: 0] += 1}
        var ans = Int.max
        for (ch,cnt) in targetCounter {
            let c = sCounter[ch] ?? 0
            ans = min(ans, c / cnt)
        }
        return ans
    }
}
