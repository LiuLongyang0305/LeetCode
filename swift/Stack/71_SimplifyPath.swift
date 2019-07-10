//https://leetcode.com/problems/simplify-path/
class Solution {
    func simplifyPath(_ path: String) -> String {
        
        var ans = ""
        var stack = Array<String>()
    
        let subSequences = path.split(separator: "/")
        let parts = subSequences.map { (subStr) -> String in
            String("/" + subStr)
        }
        for subStr in parts {
            if subStr == "/.."  {
                if !stack.isEmpty {
                    stack.removeLast()
                }
                continue
            }
            if subStr == "/." {
                continue
            }
            stack.append(subStr)
        }
        for level in stack {
            ans += level
        }
        return ans == "" ? "/" : ans
    }
}
