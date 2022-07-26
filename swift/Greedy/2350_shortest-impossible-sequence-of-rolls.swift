//https://leetcode.com/problems/shortest-impossible-sequence-of-rolls/
class Solution {
    func shortestSequence(_ rolls: [Int], _ k: Int) -> Int {

        var cnt = 0
        var set = Set<Int>()
        for roll in rolls {
            set.insert(roll)
            if set.count == k {
                cnt += 1
                set = []
            }
        }
        return cnt + 1
    }
}