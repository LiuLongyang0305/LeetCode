// https://leetcode.com/problems/split-array-by-prime-indices/
func sieveOfEratosthenes(_ n: Int) -> [Int] {
    guard n >= 2 else { return [] }
    
    // 创建一个布尔数组，初始值都为true，表示所有数都是质数
    var isPrime = Array(repeating: true, count: n + 1)
    isPrime[0] = false
    isPrime[1] = false
    
    // 从2开始遍历到sqrt(n)
    for i in 2...Int(sqrt(Double(n))) {
        if isPrime[i] {
            // 将i的倍数标记为非质数
            for j in stride(from: i * i, through: n, by: i) {
                isPrime[j] = false
            }
        }
    }
    
    // 收集所有质数
    return (2...n).filter { isPrime[$0] }
}

let primersSet = Set<Int>(sieveOfEratosthenes(100000))
class Solution {
    func splitArray(_ nums: [Int]) -> Int {
        var ans = 0
        for i in 0..<nums.count {
            if primersSet.contains(i) {
                ans += nums[i]
            } else {
                ans -= nums[i]
            }
        }
        return abs(ans)
    }
}
