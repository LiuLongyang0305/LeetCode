// https://leetcode.com/problems/strobogrammatic-number/
class Solution {
    private let map: [Character:Character] = ["1":"1","0":"0","8":"8","6":"9","9":"6"]
    func isStrobogrammatic(_ num: String) -> Bool {
        guard num.count > 1 else {
            if num.isEmpty {
                return true
            }
            return "108".contains(num.first!)
        }
        let chars = [Character](num)
        let N = num.count
        for i in 0..<(N >> 1) {
            guard let another = map[chars[i]], another == chars[N - 1 - i] else {
                return false
            }
        }
        if num.count % 2 == 0 {
            return true
        }
        return "108".contains(chars[N >> 1])
    }
}
