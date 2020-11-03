// https://leetcode.com/problems/check-array-formation-through-concatenation/
class Solution {
    func canFormArray(_ arr: [Int], _ pieces: [[Int]]) -> Bool {
        let N = arr.count
        var numToIndex = [Int:Int]()
        (0..<N).forEach {numToIndex[arr[$0]] = $0}
        for piece in pieces {
            guard let idx = numToIndex[piece[0]] else {
                return false
            }
            guard N - idx >= piece.count else {
                return false
            }
            for delta in 0..<piece.count {
                guard arr[idx + delta] == piece[delta] else {
                    return false
                }
            }
        }
        return true
    }
}

