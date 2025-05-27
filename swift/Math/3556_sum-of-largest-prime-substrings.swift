//https://leetcode.com/problems/sum-of-largest-prime-substrings/
class Solution {
    func sumOfLargestPrimes(_ s: String) -> Int {
       var primers = Set<Int>()
        let chars = [Character](s)
        let N = chars.count
        for length in stride(from: N, through: 1, by: -1) {
            var i = 0
            while i < N {
                let j = i + length - 1
                if j < N {
                    let num = Int(String(chars[i...j]))!
                    if isPrime(num) {
                        primers.insert(num)
                    }
                }
                i += 1
            }
        }

        let sortedPrimers = primers.sorted { $0 > $1}
        if sortedPrimers.count >= 3 {
            return sortedPrimers[0] + sortedPrimers[1] + sortedPrimers[2]
        }
        return sortedPrimers.reduce(0) { $0 + $1}
    }

    private func isPrime(_ number: Int) -> Bool {
        guard number > 1 else { return false } // 排除 ≤1 的情况[1,5](@ref)
        if number <= 3 { return true }         // 2和3是质数[5](@ref)
        if number % 2 == 0 { return false }    // 排除偶数[4,5](@ref)

        let sqrtNumber = Int(sqrt(Double(number))) + 1
        for divisor in stride(from: 3, through: sqrtNumber, by: 2) { // 仅检查奇数
            if number % divisor == 0 {
                return false
            }
        }
        return true
    }
}

