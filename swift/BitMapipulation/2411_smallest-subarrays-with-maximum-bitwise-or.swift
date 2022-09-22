 // https://leetcode.com/problems/smallest-subarrays-with-maximum-bitwise-or/
class Solution {
    private var nums = [Int]()
    private var N = 0
    func smallestSubarrays(_ _nums: [Int]) -> [Int] {
        self.nums = _nums
        self.N = _nums.count
        let nextBitOneIndexGroup = (0...31).map { getNextBitOneIndex($0)}
        var ans = [Int](repeating: 1, count: N)
        for i in 0..<N {
            var nextIdx = i
            for bit in 0...31{
                nextIdx = max(nextIdx, nextBitOneIndexGroup[bit][i])
            }
            ans[i] = nextIdx - i + 1
        }
        return ans
    }


    private func  getNextBitOneIndex( _ bit: Int ) ->[Int] {
        var ans = [Int](repeating: -1, count: N)
        if nums[N - 1] & (1 << bit) != 0 {
            ans[N - 1] = N - 1
        }
        var idx = N - 2
        while idx >= 0 {
            if nums[idx] & (1 << bit) != 0 {
                ans[idx] = idx
            } else {
                ans[idx] = ans[idx + 1]
            }
            idx -= 1
        }
        return ans
    }
}