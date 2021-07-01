// https://leetcode.com/problems/minimum-number-of-k-consecutive-bit-flips/
class Solution1 {
    func minKBitFlips(_ nums: [Int], _ K: Int) -> Int {
        var ans = 0
        let N = nums.count
        var flipIndices = [Int]()
        for i in 0..<N {
            while let f = flipIndices.first,i - f + 1 > K {
                flipIndices.removeFirst()
            }
            let curNum = flipIndices.count % 2 == 0 ? nums[i] : (1 - nums[i])
            if curNum == 0 {
                guard N - i >= K else {
                    return -1
                }
                ans += 1
                flipIndices.append(i)
            }
        }
        return ans
    }
}

class Solution {
    func minKBitFlips(_ nums: [Int], _ K: Int) -> Int {
        let N = nums.count
        var flipped = 0
        var ans = 0
        var isFlipped = Array<Int>(repeating: 0, count: N)
        for i in 0..<N {
            if i >= K {
                flipped ^= isFlipped[i - K]
            }
            if flipped == nums[i] {
                guard i + K <= N else {
                    return -1
                }
                isFlipped[i] = 1
                flipped ^= 1
                ans += 1
            }
        }
        return ans
    }
}


