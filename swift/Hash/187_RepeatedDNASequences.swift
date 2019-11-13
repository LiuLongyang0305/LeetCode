//https://leetcode.com/problems/repeated-dna-sequences/
class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        guard s.count > 10 else {
            return []
        }
        var repeated = Set<String>()
        var unique = Set<String>()
        var str = String(s[s.startIndex...s.index(s.startIndex, offsetBy: 9)])
        unique.insert(str)
        let chars = [Character](s)
        for i in 10..<s.count {
            str.removeFirst()
            str.append(chars[i])
            if repeated.contains(str) {
                continue
            }
            if unique.contains(str) {
                repeated.insert(str)
                unique.remove(str)
                continue
            }
            unique.insert(str)
        }
        return [String](repeated)
    }
}