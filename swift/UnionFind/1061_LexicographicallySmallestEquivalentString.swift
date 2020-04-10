// https://leetcode.com/problems/lexicographically-smallest-equivalent-string
class UF {
    var parent = [Character:Character]()
    func find(_ node: Character) -> Character {
        if nil == parent[node] {
            parent[node] = node
            return node
        }
        var currentNode = node
        while let p = parent[currentNode], p != currentNode {
            currentNode = p
        }
        var temp = node
        while let p = parent[temp], p != currentNode {
            parent[temp] = currentNode
            temp = p
        }
        return currentNode
    }
    func connected(_ first: Character, _ second: Character)  {
        parent[find(first)] = find(second)
    }
}
class Solution {
    func smallestEquivalentString(_ A: String, _ B: String, _ S: String) -> String {
        let uf = UF()
        var AIndex = A.startIndex
        var BIndex = B.startIndex
        while AIndex != A.endIndex && BIndex != B.endIndex {
            uf.connected(A[AIndex], B[BIndex])
            AIndex = A.index(after: AIndex)
            BIndex = B.index(after: BIndex)
        }
        var subTrees = [Character:Set<Character>]()
        for (key,_) in uf.parent {
            let p = uf.find(key)
            if nil == subTrees[p] {
                subTrees[p] = []
            }
            subTrees[p]?.insert(key)
        }
        print(subTrees)
        var map = [Character:Character]()
        for (_,values) in subTrees {
            let minChar = values.min()!
            for ch in values {
                map[ch] = minChar
            }
        }
        var ans = ""
        for ch in S {
            if let anther = map[ch] {
                ans.append(anther)
            } else {
                ans.append(ch)
            }
        }
        return ans
    }
}
