//https://leetcode.com/problems/fruit-into-baskets/
class Solution {
    func totalFruit(_ tree: [Int]) -> Int {
        guard tree.count > 1 else {
            return 1
        }
        var ans = 0
        var i = 0
        var kind = Set<Int>()
        while i < tree.count {
            var j = i
            kind = []
            while j < tree.count {
                kind.insert(tree[j])
                if kind.count == 3 {
                    break
                }
                j += 1
            }
            ans = max(ans, j - i)
            if j == tree.count {
                return ans
            }
            while tree[i]  == tree[i + 1] {
                i += 1
            }
            i += 1
        }
        return ans
    }
}