//https://leetcode.com/problems/buddy-strings/
class Solution {
    func buddyStrings(_ A: String, _ B: String) -> Bool {
        guard A.count == B.count else {
            return false
        }
        let setA = Set<Character>(A)
        let setB = Set<Character>(B)
        if setA != setB {
            return false
        }
        if A == B && setB.count < A.count {
            return true
        }
        let AToArr = Array<Character>(A)
        let BToArr = Array<Character>(B)
        var i = 0
        while i < A.count {
            if AToArr[i] != BToArr[i] {
                break
            }
            i += 1
        }
        if i >= A.count - 1 {
            return false
        }
        var j = i + 1
        while j < A.count {
            if AToArr[j] != BToArr[j] {
                break
            }
            j += 1
        }
        if j >= A.count {
            return false
        }
        var k = j + 1
        while k < A.count {
            if AToArr[k] != BToArr[k] {
                break
            }
            k += 1
        }
        if k < A.count {
            return false
        }
        return AToArr[i] == BToArr[j] && AToArr[j] == BToArr[i]
    }
}
