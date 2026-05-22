//https://leetcode.com/problems/find-the-minimum-amount-of-time-to-brew-potions/
class Solution {
    func minTime(_ skill: [Int], _ mana: [Int]) -> Int {
        let M = skill.count
        let N = mana.count

        var lastFinish = [Int](repeating: 0, count: M)
        for i in 0..<M {
            lastFinish[i] = (i >= 1 ? lastFinish[i - 1] : 0) + skill[i] * mana[0]
        }

        for j in 1..<N {
            var newFinish = [Int](repeating: 0, count: M)
            newFinish[0]  = lastFinish[0] + skill[0] * mana[j]
            for i in 1..<M {
                newFinish[i] = max(lastFinish[i], newFinish[i - 1]) + skill[i] * mana[j]
            }
            for  i in stride(from: M - 2, through: 0, by: -1) {
                newFinish[i] = newFinish[i + 1] - skill[i + 1] * mana[j]
            }
            lastFinish = newFinish
        }
        return lastFinish.last!
    }
}

