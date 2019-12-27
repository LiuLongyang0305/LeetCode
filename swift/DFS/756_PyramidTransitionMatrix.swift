//https://leetcode.com/problems/pyramid-transition-matrix/ 
class Solution {
    func pyramidTransition(_ bottom: String, _ allowed: [String]) -> Bool {
        var tree = [[Character]:Set<Character>]()
        for str in allowed {
            var chars = [Character](str)
            let ch = chars.removeLast()
            if nil == tree[chars] {
                tree[chars] = []
            }
            tree[chars]?.insert(ch)
        }
        func helper(currentLevel: [Character],nextLevel: [Character], index: Int) -> Bool {
            let size = currentLevel.count
            guard size != 1 else {
                return true
            }
            guard index != size - 1 else {
                return helper(currentLevel: nextLevel, nextLevel: [], index: 0)
            }
            let key = [currentLevel[index],currentLevel[ index + 1]]
            guard let chars = tree[key] else {
                return false
            }
            for ch in chars {
                var next = nextLevel
                next.append(ch)
                if helper(currentLevel: currentLevel, nextLevel: next, index: index + 1) {
                    return  true
                }
            }
            return false
        }
        return helper(currentLevel: [Character](bottom), nextLevel: [], index: 0)
    }
    
 }