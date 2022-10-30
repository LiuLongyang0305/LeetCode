// https://leetcode.com/problems/words-within-two-edits-of-dictionary/
class Solution {
    func twoEditWords(_ queries: [String], _ dictionary: [String]) -> [String] {
        let dictoryCharsArray = dictionary.map { [Character]($0)}
        let N = dictionary[0].count
        let M = dictionary.count
        func check(_ query: String) -> Bool {
            let chars = [Character](query)
            for j in 0..<M {
                var diff = 0
                for i in 0..<N {
                    if chars[i] != dictoryCharsArray[j][i] {
                        diff += 1
                        guard diff <= 2 else {break}
                    }
                }
                if diff <= 2 {
                    return true
                }
            }
            return false
        }
        return queries.filter { check($0)}
    }
}