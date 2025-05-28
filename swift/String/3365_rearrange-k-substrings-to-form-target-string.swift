//https://leetcode.cn/problems/rearrange-k-substrings-to-form-target-string/
class Solution {
    func isPossibleToRearrange(_ s: String, _ t: String, _ k: Int) -> Bool {
        let subStrLength = s.count / k
        guard subStrLength > 1 else {return true}


        return getKlenthPreffix(of: s, subStrLength) == getKlenthPreffix(of: t, subStrLength)
    }
    private func getKlenthPreffix(of str: String, _ k: Int) -> [String]{
        var ans = [String]()
        var temp = str
        while !temp.isEmpty {
            ans.append(String(temp.prefix(k)))
            temp.removeFirst(k)
        }
        return ans.sorted()
    }
}

