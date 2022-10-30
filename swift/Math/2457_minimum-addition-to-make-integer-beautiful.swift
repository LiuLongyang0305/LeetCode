// https://leetcode.com/problems/minimum-addition-to-make-integer-beautiful/
class Solution {
    private let powerOfTen = [1,10,100,1000,10000,100000,1000000,10000000,100000000,1000000000,10000000000,100000000000,1000000000000,10000000000000]
    func makeIntegerBeautiful(_ n: Int, _ target: Int) -> Int {
        guard getDigitsSum(of: n) > target else {return 0}
        let N = powerOfTen.count
        for i in 1..<N {
            let curN = (n / powerOfTen[i] + 1) * powerOfTen[i]
            guard getDigitsSum(of: curN) > target else {return curN - n}
        }
        return 0
    }

    private func getDigitsSum(of num: Int) -> Int {
        var sum = 0
        var copy = num
        while copy > 0 {
            sum += copy % 10
            copy /= 10
        }
        return sum
    }
}