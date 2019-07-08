//https://leetcode.com/problems/custom-sort-string/
class Solution {
    func customSortString(_ S: String, _ T: String) -> String {
        var ans = ""
        let sotred = Set<Character>(S)
        var count = Dictionary<Character,Int>()
        for ele in T {
            if sotred.contains(ele) {
                if count[ele] == nil {
                    count[ele] = 0
                }
                count[ele] = count[ele]! + 1
            } else {
                ans.append(ele)
            }
        }
        for ele in S {
            if count[ele] != nil {
                ans.append(String(repeating: ele, count: count[ele]!))
            }
        }
        return ans
    }
}