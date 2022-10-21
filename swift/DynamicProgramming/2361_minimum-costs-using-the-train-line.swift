// https://leetcode.com/problems/minimum-costs-using-the-train-line/
class Solution {
    private typealias Pair = (reugularCost: Int,ExpressionCost:Int)
    func minimumCosts(_ regular: [Int], _ express: [Int], _ expressCost: Int) -> [Int] {

        var ans = [Int]()
        var ori: Pair = (0,expressCost)
        let N = regular.count
        for i in 0..<N {
            var cur:Pair = (0,0)
            cur.reugularCost = min(ori.reugularCost,ori.ExpressionCost) + regular[i]
            cur.ExpressionCost = min(ori.ExpressionCost, ori.reugularCost + expressCost) + express[i]
            ans.append(min(cur.reugularCost,cur.ExpressionCost))
            ori = cur
        }
        return ans
    }
}