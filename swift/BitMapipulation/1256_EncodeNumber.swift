//https://leetcode.com/problems/encode-number/
class Solution {
    func encode(_ num: Int) -> String {
        guard num != 0 else {
            return ""
        }
        let strCount = Int(log2(Double(num + 1)))
        let zero = Int(pow(2.0, Double(strCount))) - 1
        return getStr(num - zero,strCount)
    }
    private func getStr(_ num: Int,_ count: Int) -> String {
        var ans = ""
        var numCopy = num
        while numCopy > 0 {
            ans.insert(numCopy & 1 == 0 ? "0" : "1", at: ans.startIndex)
            numCopy >>= 1
        }
        if ans.count < count {
            ans.insert(contentsOf: String(Array<Character>(repeating: "0", count: count - ans.count)), at: ans.startIndex)
        }
        return ans
    }
}