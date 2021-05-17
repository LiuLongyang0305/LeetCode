// https://leetcode.com/problems/sorting-the-sentence/
class Solution {
    
    func sortSentence(_ s: String) -> String {
        let compoments = s.split(separator: " ").map { String($0)}
        var strs = Array<String>(repeating: "", count: compoments.count)
        for var compoment in compoments {
            let  order = Int(compoment.last!.asciiValue! - 49)
            compoment.removeLast()
            strs[order] =  compoment
        }
        var ans = ""
        for str in strs {
                ans += str + " "
        }
        ans.removeLast()
        return ans
    }
}

