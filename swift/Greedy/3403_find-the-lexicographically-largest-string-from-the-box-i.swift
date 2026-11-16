    // https://leetcode.cn/problems/find-the-lexicographically-largest-string-from-the-box-i/
class Solution {
    func answerString(_ word: String, _ numFriends: Int) -> String {
        guard numFriends > 1 else {return word}
        let maxChar = word.max()!
        let chars = [Character](word)
        let M = chars.count
        var ans = ""
        for i in 0..<M {
            if chars[i] != maxChar {continue}
            let maxLenth = min(M - numFriends + 1,M - i)
            if maxLenth > 0 {
                ans = max(ans,String(chars[i..<(i + maxLenth)]))
            }
        }
        return ans
    }
}
