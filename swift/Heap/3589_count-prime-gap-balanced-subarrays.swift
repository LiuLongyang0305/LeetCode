// https://leetcode.com/problems/count-prime-gap-balanced-subarrays/description/
func getPrimesBasedEratosthenesInner(_ n: Int) -> Set<Int> {
    var primes = Set<Int>()
    var isPrime = [Bool](repeating: true, count: n + 1)
    isPrime[0] = false
    isPrime[1] = false
    for i in 2...n {
        if isPrime[i] {
            primes.insert(i)
            guard i * i <= n else {continue}
            var j = 2 * i
            while j <= n {
                isPrime[j] = false
                j += i
            }
        }
    }
    return primes
}


let  primers = getPrimesBasedEratosthenesInner(50000)
struct MinPair:Comparable {
    static func < (lhs: MinPair, rhs: MinPair) -> Bool {
        if lhs.val == rhs.val {
            return lhs.idx < rhs.idx
        }
        return lhs.val < rhs.val
    }

    var val: Int
    var idx: Int

}
class Solution {
    func primeSubarray(_ nums: [Int], _ k: Int) -> Int {
        var ans = 0
        var heap = Heap<MinPair>()
        var primersIndices = [Int]()
        for i in 0..<nums.count {
            if primers.contains(nums[i]) {
                primersIndices.append(i)
            }
        }
        
        var right = 0
        for left in 0..<nums.count {
            while let f = primersIndices.first, f < left  {
                primersIndices.removeFirst()
            }
            guard primersIndices.count >= 2 else {break}
            while let min = heap.min, min.idx < left {
                heap.popMin()
            }
            while let max = heap.max, max.idx < left {
                heap.popMax()
            }
            guard abs(nums[primersIndices[0] ] -  nums[primersIndices[1]])  <= k else{continue}
            if right < left {
                right = left
            }
            while right < nums.count && ( heap.count < 2 ||  abs(heap.max!.val - heap.min!.val) <= k) {
                if primers.contains(nums[right]) {
                    heap.insert(MinPair(val: nums[right], idx: right))
                    guard  abs(heap.max!.val - heap.min!.val) <= k else {break}
                }
                right += 1
            }

            // print("l = \(left)  r = \(right) indices = \(primersIndices)   cnt = \(heap.count) \(heap.min?.val)   \(heap.max?.val)")
            ans += (right - primersIndices[1])
        }

        return ans
    }
}
