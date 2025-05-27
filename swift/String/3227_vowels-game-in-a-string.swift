//https://leetcode.com/problems/vowels-game-in-a-string/
class Solution {
    private let vowels = Set<Character>("aeiou")
    func doesAliceWin(_ s: String) -> Bool {
        if let _ = s.firstIndex(where: {vowels.contains($0)}) {
            return true
        }
        return false
    }
}
