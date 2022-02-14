// https://leetcode.com/problems/unique-substrings-with-equal-digit-frequency/
class Solution {
    func equalDigitFrequency(_ s: String) -> Int {
        let sToDigits = s.map { Int($0.asciiValue! - 48)}
        var counter = Array<Int>(repeating: 0, count: 10)
        var preffix = [counter]
        for digit in sToDigits {
            counter[digit] += 1
            preffix.append(counter)
        }
        
        
        func check(_ subStrCounter: [Int], _ target: Int) -> Bool {
            for i in 0..<10 {
                guard subStrCounter[i] == 0 || subStrCounter[i] == target else {return false}
            }
            return true
        }

        
        
        let N = s.count
        var ans = 0

        var length = 1
        while length <= N {
            var set = Set<Int>()
            var left = 0
            while left + length - 1 < N {
                let right = left + length - 1
                let subStrCounter = (0..<10).map { preffix[right + 1][$0] - preffix[left][$0]}
                if check(subStrCounter, subStrCounter[sToDigits[left]]) {
                    set.insert(sToDigits[left...right].hashValue)
                }
                left += 1
            }
            ans += set.count
            length += 1
        }
        
        return ans
    }
    
}
