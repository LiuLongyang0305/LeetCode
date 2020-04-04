// https://leetcode.com/problems/sentence-similarity/
class Solution {
    func areSentencesSimilar(_ words1: [String], _ words2: [String], _ pairs: [[String]]) -> Bool {
        guard words1.count == words2.count else {
            return false
        }
        var map = [String:Set<String>]()
        for pair in pairs {
            if nil == map[pair[0]] {
                map[pair[0]]  = []
            }
            map[pair[0]]?.insert(pair[1])
            if nil == map[pair[1]] {
                map[pair[1]]  = []
            }
            map[pair[1]]?.insert(pair[0])
        }
        for i in 0..<words1.count {
            if words2[i] != words1[i] {
                guard let simallarWords = map[words1[i]], simallarWords.contains(words2[i]) else {
                    return false
                }
                
            }
        }
        return true
    }
}
