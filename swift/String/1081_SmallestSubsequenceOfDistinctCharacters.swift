// https://leetcode.com/problems/smallest-subsequence-of-distinct-characters/
extension Array where Element == Int {
    func exist(largerThan value: Int) -> Bool {
        for ele in self {
            if ele > value {
                return true
            }
        }
        return false
    }
}
class Solution {
    func smallestSubsequence(_ text: String) -> String {
        let length = text.count
        var stack = Array<Character>()
        let chars = [Character](text)
        var charToIndices = [Character:[Int]]()
        for i in 0..<length {
            if nil == charToIndices[chars[i]] {
                charToIndices[chars[i]] = [Int]()
            }
            charToIndices[chars[i]]?.append(i)
        }
        for i in 0..<length {
            let ch = chars[i]
            if stack.contains(ch) {
                continue
            }
            while !stack.isEmpty && ch < stack.last! && charToIndices[stack.last!]!.exist(largerThan: i){
                stack.removeLast()
            }
            stack.append(ch)
        }
        return String(stack)
    }
}

