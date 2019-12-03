//https://leetcode.com/problems/rotate-string/
class Solution {
     func rotateString(_ A: String, _ B: String) -> Bool {
        guard A.count == B.count else {
            return  false
        }
        guard !B.isEmpty else {
            return A.isEmpty
        }
        var right = A
        var left = ""
        let firstCharOfB = B.first!
        while !right.isEmpty {
            if right.first! == firstCharOfB {
                if right + left == B {
                    return true
                }
            }
            left.append(right.removeFirst() )
        }
        return false
     }
 }