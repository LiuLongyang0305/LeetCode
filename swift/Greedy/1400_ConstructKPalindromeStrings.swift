// https://leetcode.com/problems/construct-k-palindrome-strings/
class Solution {
    func canConstruct(_ s: String, _ k: Int) -> Bool {
        let length = s.count
        guard k < length else {
            return k == length
        }
        var map = [Character:Bool]()
        for ch in s {
            map.updateValue(!(map[ch] ?? false), forKey: ch)
        }
        var cnt = 0
        map.forEach { (ch,flag) in
            if flag {
                cnt += 1
            }
        }
        return cnt <= k
    }
}