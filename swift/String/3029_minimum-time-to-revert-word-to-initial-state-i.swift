//https://leetcode.com/problems/minimum-time-to-revert-word-to-initial-state-i

class Solution {
    func minimumTimeToInitialState(_ word: String, _ k: Int) -> Int {
        var i = 1

        var temp = word
        while temp.count >= k{
            temp.removeFirst(k)
            if word.hasPrefix(temp) {
                return i
            }
            i += 1
        }
        return i 
    }
}
