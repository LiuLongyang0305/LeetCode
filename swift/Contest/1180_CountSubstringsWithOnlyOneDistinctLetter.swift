class Solution {
    func countLetters(_ S: String) -> Int {
        guard S.count > 1 else {
            return S.count
        }
        var ans = 0
        var chars = Array<Character>(S)
        chars.insert(" ", at: 0)
        var last = 0
        for i in 1..<chars.count {
            if chars[i] != chars[i - 1] {
                if i != 1 {
                    ans += (last == 1 ? 1 : (last + 1) * last / 2)
                }
                last = 1
            } else {
                last += 1
            }
        }
        ans += (last == 1 ? 1 : (last + 1) * last / 2)
        return ans
    }
}