//https://leetcode.com/problems/isomorphic-strings/
class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        var sourceStructure = Dictionary<Character,Set<Int>>()
        var targetStructure = Dictionary<Character,Set<Int>>()
        let length : Int = s.count
        var i : Int = 0
        var index1 = s.startIndex
        var index2 = t.startIndex
        while i < length {
            let currentSourceChar = s[index1]
            let currentTargetChar = t[index2]
            if nil == sourceStructure[currentSourceChar] {
                sourceStructure[currentSourceChar] = Set<Int>()
            }
            sourceStructure[currentSourceChar]?.insert(i)
            if nil == targetStructure[currentTargetChar] {
                targetStructure[currentTargetChar]  = Set<Int>()
            }
            targetStructure[currentTargetChar]?.insert(i)
            
            if !(sourceStructure[currentSourceChar]! == targetStructure[currentTargetChar]!){
                return false
            }
            i += 1
            index1 = s.index(after: index1)
            index2 = t.index(after: index2)
        }
        return true
    }
}