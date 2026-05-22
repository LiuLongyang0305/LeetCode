//https://leetcode.cn/problems/weighted-word-mapping/
class Solution {
    let letterToOrder2 = Dictionary(uniqueKeysWithValues: (0..<26).map { (Character(UnicodeScalar(97 + $0)!), $0) })
    let orderToLetter2 = Dictionary(uniqueKeysWithValues: (0..<26).map { ($0, Character(UnicodeScalar(97 + $0)!)) })
    func mapWordWeights(_ words: [String], _ weights: [Int]) -> String {
        func cal(_ str: String) -> String {
            let totalWeights = str.reduce(0) {$0 + weights[letterToOrder2[$1]!]} % 26
            return "\(orderToLetter2[25 - totalWeights]!)"
       }
        return words.reduce("") { $0 + cal($1)}
    }

}
