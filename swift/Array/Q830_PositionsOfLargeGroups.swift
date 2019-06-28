//https://leetcode.com/problems/positions-of-large-groups/
class Solution {
    func largeGroupPositions(_ S: String) -> [[Int]] {
        let sourceLength = S.count
        var result = [[Int]]()
        guard sourceLength > 2 else {
            return result
        }
        
        let characters = Array<Character>(S)
        var startIndex = 0
        for i in 1..<sourceLength {
            if characters[i] != characters[i - 1] {
                if i - startIndex >= 3 {
                    result.append([startIndex,i - 1])
                }
                startIndex = i
            }
        }
        if sourceLength - startIndex >= 3 {
            result.append([startIndex, sourceLength - 1])
        }
        return result
    }
}