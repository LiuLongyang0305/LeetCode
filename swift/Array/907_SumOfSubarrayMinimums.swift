//https://leetcode.com/problems/sum-of-subarray-minimums/
//数组中需要解决i---j---k关系的，用前缀数组和后缀数组。
class Solution2 {
    private let MOD = 1_000_000_007
    func sumSubarrayMins(_ A: [Int]) -> Int {
        var ans = 0
        var prev = Array<Int>(repeating: -1, count: A.count)
        var next = Array<Int>(repeating: A.count, count: A.count)
        var minEleIndexStack = Array<Int>()
        for i in 0..<A.count {
            while  !minEleIndexStack.isEmpty && A[i] <= A[minEleIndexStack.last!] {
                minEleIndexStack.removeLast()
            }
            if !minEleIndexStack.isEmpty {
                prev[i] = minEleIndexStack.last!
            }
            minEleIndexStack.append(i)
        }
        minEleIndexStack = []
        for i in (0..<A.count).reversed() {
            while  !minEleIndexStack.isEmpty && A[i] < A[minEleIndexStack.last!] {
                minEleIndexStack.removeLast()
            }
            if !minEleIndexStack.isEmpty {
                next[i] = minEleIndexStack.last!
            }
            minEleIndexStack.append(i)
        }
        for i in 0..<A.count {
            ans += ((i - prev[i]) * (next[i] - i) % MOD * A[i] % MOD)
            ans %= MOD
        }
        return ans
    }
}
//维护最小值栈
class Solution {
    private let MOD = 1_000_000_007
    typealias Pair = (val:Int,count:Int)
    func sumSubarrayMins(_ A: [Int]) -> Int {
        var ans = 0
        var dot = 0
        var stack = Array<Pair>()
        for i in 0..<A.count {
            var count = 1
            while !stack.isEmpty && stack.last!.val >= A[i] {
                let (lastMinEle,lastMinEleCount) = stack.removeLast()
                count += lastMinEleCount
                dot -= lastMinEle * lastMinEleCount
            }
            stack.append((A[i],count))
            
            dot += A[i] * count
            ans += dot
            ans %= MOD
        }
        return ans
    }
}