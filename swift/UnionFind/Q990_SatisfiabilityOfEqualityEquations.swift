//https://leetcode.com/problems/satisfiability-of-equality-equations/
class Solution {
    
    class UnionFind {
        var parents : [Int]
        init() {
            parents = Array<Int>(repeating: 0, count: 123)
            for i in 0..<123 {
                parents[i] = i
            }
        }
        
        func union(para1: Character, para2: Character) {
            let parentPara1 = find(para: para1)
            let parentPara2 = find(para: para2)
            parents[parentPara1] = parentPara2
        }
        
        func find(para: Character) -> Int {
            var currentRoot = Int(para.asciiValue!)
            var temp = Int(para.asciiValue!)
            while parents[currentRoot] != currentRoot {
                currentRoot = parents[currentRoot]
            }
            while temp != parents[temp] {
                let nextRoot = parents[temp]
                parents[temp] = currentRoot
                temp = nextRoot
            }
            return temp
        }
        
        func connected(para1: Character, para2: Character) -> Bool {
            return find(para: para1) == find(para: para2)
        }
    }

    func equationsPossible(_ equations: [String]) -> Bool {
        typealias Symbols = (equal: String, notEqual: String)
        typealias Pairs = (first: Character, second: Character)
        let unionFind = UnionFind()
        let symbols: Symbols = ("==", "!=")
        var notEqualPairs = [Pairs]()
        for equation in equations {
            var index = equation.startIndex
            let firstPara: Character = equation[index]
            var sym: String = ""
            index = equation.index(after: index)
            sym.append(equation[index])
            index = equation.index(after: index)
            sym.append(equation[index])
            index = equation.index(after: index)
            let secondPara: Character = equation[index]
            if sym == symbols.equal {
                if !unionFind.connected(para1: firstPara, para2: secondPara) {
                    unionFind.union(para1: firstPara, para2: secondPara)
                }
            } else {
                notEqualPairs.append((firstPara,secondPara))
            }
        }
        for pair in notEqualPairs {
            if unionFind.connected(para1: pair.first, para2: pair.second) {
                return false
            }
        }
        return true
    }
}
