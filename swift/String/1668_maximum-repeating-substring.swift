// https://leetcode.com/problems/maximum-repeating-substring/
extension String {
    func contains(substr str: String) -> Bool {
        var copy = self
        while copy.count >= str.count {
            guard !copy.hasPrefix(str) else {return true}
            copy.removeFirst()
        }
        return false
    }
}


class Solution {
    func maxRepeating(_ sequence: String, _ word: String) -> Int {
        let M = sequence.count
        let N = word.count
        guard N <= M else {return 0}
        for repeatedTime in stride(from: M / N, through: 1, by: -1) {
            let curSubStr = String(repeating: word, count: repeatedTime)
            guard !sequence.contains(substr: curSubStr) else {return repeatedTime}
        }
        return 0
    }
}