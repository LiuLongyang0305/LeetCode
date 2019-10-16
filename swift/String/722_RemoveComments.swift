//https://leetcode.com/problems/remove-comments/
class Solution {
    func removeComments(_ source: [String]) -> [String] {
        var sourceCode = ""
        for s in source {
            sourceCode += s
            sourceCode += "#"
        }
        var sourceCodeWithoutComments = ""
        while !sourceCode.isEmpty {
            if sourceCode.hasPrefix("//") {
                sourceCode.removeFirst(2)
                while !sourceCode.hasPrefix("#") {
                    sourceCode.removeFirst()
                }
            } else if sourceCode.hasPrefix("/*") {
                sourceCode.removeFirst(2)
                while !sourceCode.hasPrefix("*/") {
                    sourceCode.removeFirst()
                }
                sourceCode.removeFirst(2)
            } else {
                sourceCodeWithoutComments.append(sourceCode.removeFirst())
            }
        }
        let lines = sourceCodeWithoutComments.split(separator: "#")
        var ans =  [String]()
        for line in lines {
            if  !line.isEmpty {
                ans.append(String(line))
            }
        }
        return ans
    }
}