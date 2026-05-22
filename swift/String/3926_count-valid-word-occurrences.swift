//https://leetcode.cn/problems/count-valid-word-occurrences/
class Solution {
    func countWordOccurrences(_ chunks: [String], _ queries: [String]) -> [Int] {

        let words = chunks.reduce("") {$0 + $1}.replacingOccurrences(of: "--", with: " ").split { $0 == " "}.map { String($0)}
        var counter = [Int:Int]()
        for var word in words {
            while let f = word.first, f == "-" {
                word.removeFirst()
            }
            while let e = word.last, e == "-" {
                word.removeLast()
            }
            counter[word.hashValue,default:0] += 1
        }
        return queries.map { counter[$0.hashValue] ?? 0 }
    }
}
