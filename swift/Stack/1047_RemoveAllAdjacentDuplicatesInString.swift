//https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/
class Solution {
    func removeDuplicates(_ S: String) -> String {
        var stack = Array<Character>()
        
        for ele in S {
            if stack.isEmpty {
                stack.append(ele)
            } else {
                if ele == stack.last! {
                    stack.removeLast()
                } else {
                    stack.append(ele)
                }
            }
        }
        return String(stack)
    }
}