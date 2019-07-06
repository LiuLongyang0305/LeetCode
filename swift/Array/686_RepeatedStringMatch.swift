//https://leetcode.com/problems/repeated-string-match/
class Solution {
    func repeatedStringMatch(_ A: String, _ B: String) -> Int {
        
        let setA = Set<Character>(A)
        let setB = Set<Character>(B)
        
        if !setB.isSubset(of: setA) {
            return -1
        }
        
        
        let ASize = A.count
        let BSize = B.count
        
        if setA.count == 1 && setB.count == 1 && setA == setB {
            var p = 1
            while ASize * p < BSize {
                p += 1
            }
            return p
        }
        
        
        var time = 1
        var currentStr = A
        while currentStr.count < BSize {
            currentStr.append(A)
            time += 1
        }
        
        if currentStr.contains(B) {
            return time
        }
        currentStr.append(A)
        if currentStr.contains(B) {
            return time + 1
        }
        return -1
    }
}
