// https://leetcode.com/problems/group-shifted-strings/
class Solution {
    func groupStrings(_ strings: [String]) -> [[String]] {
        var ans = [[String]]()
        let strsToNumbers = strings.map {$0.map { $0.asciiValue! - 97}}
        var map = [[UInt8]:[Int]]()
        
        for i in 0..<strsToNumbers.count {
            let delta = strsToNumbers[i][0]
            let key = strsToNumbers[i].map {$0 > delta ? ($0 - delta) : ($0 + 26 - delta)}
            if nil == map[key] {
                map[key] = []
            }
            map[key]?.append(i)
        }
        for (_,indices) in map {
            ans.append(indices.map({strings[$0]}))
        }
        return ans
    }
    
}