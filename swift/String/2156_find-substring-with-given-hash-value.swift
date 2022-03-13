//https://leetcode.com/problems/find-substring-with-given-hash-value/
class Solution {
    func subStrHash(_ s: String, _ power: Int, _ modulo: Int, _ k: Int, _ hashValue: Int) -> String {
        let reversedStrs = [Character](s.reversed())
        let N = reversedStrs.count
        
        var hash = [Int](repeating: 0, count: N + 1)
        var powers = [Int](repeating: 1, count: N + 1)
        
        
        func get(_ left: Int, _ right: Int) -> Int {
            return (hash[right] - hash[left - 1] * powers[right - left + 1] % modulo + modulo) % modulo
        }
        
        
        
        
        for idx in 1...N {
            hash[idx] = (hash[idx - 1] * power + Int(reversedStrs[idx - 1].asciiValue! - 96)) % modulo
            powers[idx] = powers[idx - 1] * power % modulo
        }
        
        var idx = -1
        
        for left in 1...N {
            let right = k + left - 1
            guard right <= N else {break}
            if get(left, right) == hashValue {
                idx = left - 1
            }
        }
//        print(idx)
//        print(reversedStrs[idx])
        
        return String(reversedStrs[idx...(idx + k - 1)].reversed())
    }
}