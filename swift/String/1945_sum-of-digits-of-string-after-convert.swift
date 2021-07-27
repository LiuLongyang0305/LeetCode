// https://leetcode.com/problems/sum-of-digits-of-string-after-convert/
class Solution {
    func getLucky(_ s: String, _ k: Int) -> Int {
        var number = s.map { Int($0.asciiValue! - 96)}.reduce("") { $0 + "\($1)"}
        for _ in 1...k {
            number = helper(number)
        }
        return Int(number) ?? -1
    }
    
    private func helper(_ s: String) -> String {
        let newNumber = s.reduce(0) {$0 + Int($1.asciiValue! - 48)}
        return "\(newNumber)"
    }
}