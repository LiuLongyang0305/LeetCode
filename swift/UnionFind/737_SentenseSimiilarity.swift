// https://leetcode.com/problems/sentence-similarity-ii/
class UnionFind {
    var parents = [String:String]()
    func find(_ node: String) -> String {
        if nil == parents[node] {
            parents[node] = node
            return node
        }
        var currentNode = node
        while parents[currentNode]! != currentNode {
            currentNode = parents[currentNode]!
        }
        var temp = node
        while parents[temp]! != currentNode {
            let next = parents[temp]!
            parents[temp] = currentNode
            temp = next
        }
        return currentNode
    }
    
    func connect(_ first: String, _ second: String)  {
        parents[find(first)] = find(second)
    }
}
class Solution {
    func areSentencesSimilarTwo(_ words1: [String], _ words2: [String], _ pairs: [[String]]) -> Bool {
        guard words1.count == words2.count else {
            return false
        }
        let uf = UnionFind()
        for pair in pairs {
            uf.connect(pair[0], pair[1])
        }
        for i in 0..<words2.count {
            if words2[i] != words1[i] {
                guard uf.find(words2[i]) == uf.find(words1[i]) else {
                    return false
                }
            }
        }
        return true
    }
}
