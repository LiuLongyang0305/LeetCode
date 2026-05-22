//https://leetcode.cn/problems/partition-string/
class Solution {
    func partitionString(_ s: String) -> [String] {
        var setString = Set<String>()
        var ans = [String]()
        var cur = ""
        for ch in s {
            cur.append(ch)
            if setString.contains(cur) {
                continue
            }
            ans.append(cur)
            setString.insert(cur)
            cur = ""
        }
        return ans
    }
}
