//https://leetcode.com/problems/replace-words/
class Solution {
    func replaceWords(_ dict: [String], _ sentence: String) -> String {
        var ans = ""
        let sortedDict = dict.sorted { (str1, str2) -> Bool in
            str1.count < str2.count
        }
        var compoments = sentence.components(separatedBy: " ")
        for i in 0..<compoments.count {
            let word = compoments[i]
            for root in sortedDict {
                if word.hasPrefix(root) {
                    compoments[i] = root
                    break
                }
            }
        }
        for word in compoments {
            ans += word
            ans.append(" ")
        }
        ans.remove(at: ans.index(before: ans.endIndex))
        return ans
    }
}