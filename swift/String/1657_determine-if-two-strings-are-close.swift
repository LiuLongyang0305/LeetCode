// https://leetcode.com/problems/determine-if-two-strings-are-close/
extension String {
    var counter: [Character:Int] {
        var ans = [Character:Int]()
        self.forEach { ans[$0,default: 0 ] += 1}
        return ans
    }
}
class Solution {
    private typealias CharsCounter = [Character:Int]
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        guard word1.count == word2.count else {
            return false
        }
        let word1Counter = word1.counter
        let word2Counter = word2.counter
        guard Set<Character>(word1Counter.keys) == Set<Character>(word2Counter.keys) else {
            return false
        }
        return word1Counter.values.sorted() == word2Counter.values.sorted()
    }
}