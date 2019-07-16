//https://leetcode.com/problems/occurrences-after-bigram/
class Solution {
    func findOcurrences(_ text: String, _ first: String, _ second: String) -> [String] {
        var ans = [String]()
        let compoments = text.components(separatedBy: " ")
        guard compoments.count >= 3 else {
            return ans
        }
        for i in 0...(compoments.count - 3) {
            if compoments[i] == first &&  compoments[i + 1] == second {
                ans.append(compoments[i + 2])
            }
        }
        return ans
    }
}
