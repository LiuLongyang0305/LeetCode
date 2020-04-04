// https://leetcode.com/problems/valid-word-square/
class Solution {
    func validWordSquare(_ words: [String]) -> Bool {
        var martrix = [[Character]]()
        let M = words.count
        let N = words.reduce(-1) {max($0, $1.count)}
        guard M == N else {
            return false
        }
        for word in words {
            var currentRow = [Character](word)
            if currentRow.count < N {
                currentRow.append(contentsOf: Array<Character>(repeating: " ", count: N - currentRow.count))
            }
            martrix.append(currentRow)
        }
        for i in 0..<M {
            var currentCol = [Character]()
            for j in 0..<M {
                currentCol.append(martrix[j][i])
            }
            guard currentCol == martrix[i] else {
                return false
            }
        }
        return true
    }
}
