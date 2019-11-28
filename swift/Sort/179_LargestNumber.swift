//https://leetcode.com/problems/largest-number/ 
class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        var map = [Character:[String]]()
        for num in nums {
            let numStr = "\(num)"
            let firstChar = numStr.first!
            if nil == map[firstChar] {
                map[firstChar] = []
            }
            map[firstChar]?.append(numStr)
        }
        let sortedMapKeys = map.keys.sorted().reversed()
        guard sortedMapKeys.count != 1 || sortedMapKeys.first! != "0" else {
            return "0"
        }
        var ans = ""
        for key in sortedMapKeys {
            if let strs = map[key] {
                if strs.count == 1 {
                    ans += strs[0]
                } else {
                    ans += maxStr(strs)
                }
                
            }
        }
        return ans
    }
    private func maxStr(_  strs: [String]) -> String {
        let sortedStrs = strs.sorted { $0 + $1 >  $1 + $0
        }
        return sortedStrs.reduce("") { $0 + $1}
    }
 }