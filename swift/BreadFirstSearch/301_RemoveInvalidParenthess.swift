//https://leetcode.com/problems/remove-invalid-parentheses
class Solution {
    func removeInvalidParentheses(_ s: String) -> [String] {
        guard !s.isEmpty else {
            return [""]
        }
        var temp = s
        if temp.first!  == ")" {
            temp.removeFirst()
        }
        if temp.last! == "(" {
            temp.removeLast()
        }
        if temp.isEmpty || valid(temp) {
            return [temp]
        }
        var ans = [String]()
        var visited = Set<String>()
        var queue = [String]()
        visited.insert(temp)
        queue.append(temp)
        var found = false
        while !queue.isEmpty {
            var nexlLevel = [String]()
            for str in queue {
                if valid(str) {
                    ans.append(str)
                    found = true
                    nexlLevel = []
                }
                if !found {
                    var index = str.startIndex
                    while index < str.endIndex {
                        if str[index] == "(" || str[index] == ")" {
                            let nextStr = String(str[..<index]) + String(str[str.index(after: index)...])
                            if !visited.contains(nextStr) {
                                visited.insert(nextStr)
                                nexlLevel.append(nextStr)
                            }
                        }
                        index = str.index(after: index)
                    }
                }
            }
            queue = nexlLevel
        }
        return ans
    }
    private func valid(_ s: String) -> Bool{
        var cnt = 0
        for ch in s {
            switch ch {
            case "(":
                cnt += 1
            case ")":
                if cnt == 0 {
                    return false
                }
                cnt -= 1
            default:
                break
            }
        }
        return cnt == 0
    }
 }

