 // https://leetcode.com/problems/three-divisors/
class Solution {
    func isThree(_ n: Int) -> Bool {
        guard n > 1 else {
            return false
        }
        let sqrtOfN = Int(sqrt(Double(n)))
        var set = Set<Int>()
        for i in 1...sqrtOfN {
            if n % i == 0 {
                set.insert(i)
                set.insert(n / i)
            }
            guard set.count <= 3 else {
                return false
            }
        }
        return set.count == 3
    }
}