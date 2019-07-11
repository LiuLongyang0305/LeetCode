//https://leetcode.com/problems/group-anagrams/
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var ans = [[String]]()
        var dic = [[Character]:[String]]()
        for str in strs {
            let temp = str.sorted()
            if dic[temp] == nil {
                dic[temp] = [str]
            } else {
                dic[temp]?.append(str)
            }
        }
        for (_,val) in dic {
            ans.append(val)
        }
        return ans
    }
}