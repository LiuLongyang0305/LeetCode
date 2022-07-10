// https://leetcode.com/problems/move-pieces-to-obtain-a-string/
class Solution {
    func canChange(_ start: String, _ target: String) -> Bool {
        guard start.replacingOccurrences(of: "_", with: "") == target.replacingOccurrences(of: "_", with: "") else {return false}
        let startChars = [Character](start)
        let targetChars = [Character](target)
        let M = start.count
        var j = 0

        for i in 0..<M {
            guard "_" != startChars[i] else {continue}
            while "_" == targetChars[j] {
                j += 1
            }
            if i != j  && (startChars[i] == "L" ) != (i > j) {return false}
            j += 1
        }

        return true
    }
}
