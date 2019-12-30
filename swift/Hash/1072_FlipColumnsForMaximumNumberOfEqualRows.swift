// https://leetcode.com/problems/flip-columns-for-maximum-number-of-equal-rows/
class Solution {
    func maxEqualRowsAfterFlips(_ matrix: [[Int]]) -> Int {
        var map = [String:Int]()
        for row in matrix {
            let key = row[0]  == 1 ? row.reduce("") {$0 + "\($1)"} : row.reduce(""){ $0 + "\(1 ^ $1)"}
            if let c = map[key] {
                map.updateValue(c + 1, forKey: key)
            } else {
                map.updateValue(1, forKey: key)
            }
        }
        return map.values.max() ?? 0
    }
 }