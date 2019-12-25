//  https://leetcode.com/problems/k-similar-strings/
class Solution {
    func kSimilarity(_ A: String, _ B: String) -> Int {
        guard A != B else {
            return 0
        }
        let targetChars = [Character](B)
        let AChars = [Character](A)
        let ALength = AChars.count
        var visited = Set<String>()
        visited.insert(A)
        var queue = [A]
        var depth = 0
        while !queue.isEmpty {
            depth += 1
            var nextLevel = [String]()
            for str in queue {
                let chars = [Character](str)
                var index = 0
                while chars[index] == targetChars[index] {
                    index += 1
                }
                var j = index + 1
                while j < ALength {
                    if chars[j] == targetChars[index] && chars[j] != targetChars[j]{
                        var temp = chars
                        temp.swapAt(index, j)
                        let newStr = String(temp)
                        guard newStr != B else {
                            return depth
                        }
                        if !visited.contains(newStr) {
                            nextLevel.append(newStr)
                            visited.insert(newStr)
                        }
                    }
                    j += 1
                }
            }
            queue = nextLevel
        }
        return Int.max
    }
 }