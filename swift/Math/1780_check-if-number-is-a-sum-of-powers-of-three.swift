// https://leetcode.com/problems/check-if-number-is-a-sum-of-powers-of-three/
class Solution {
    private let powerOfThree = [1, 3, 9, 27, 81, 243, 729, 2187, 6561, 19683, 59049, 177147, 531441, 1594323, 4782969]
    private static var availableNumbers = Set<Int>()
    func checkPowersOfThree(_ n: Int) -> Bool {

        if Solution.availableNumbers.isEmpty {
            preprocess()
        }
        return Solution.availableNumbers.contains(n)
    }
    
    func preprocess()  {
        for v in 0..<65536 {
            var ans = 0
            for idx in 0..<15 {
                if v & (1 << idx) != 0 {
                    ans += powerOfThree[idx]
                }
            }
            Solution.availableNumbers.insert(ans)
        }
    }
}




class Solution1 {
    func checkPowersOfThree(_ n: Int) -> Bool {
        var val = n
        while val > 0 {
            guard val % 3 != 2 else {
                return false
            }
            val /= 3
        }
        return true
    }
}



