// https://leetcode.com/problems/triples-with-bitwise-and-equal-to-zero/
class Solution1 {
    func countTriplets(_ nums: [Int]) -> Int {
        var counter = Array<Int>(repeating: 0, count: 1 << 16)
        var ans = 0
        for i in nums {
            for j in nums {
                counter[i & j] += 1
            }
        }
        for k in nums {
            for idx in 0..<(1 << 16) {
                if k & idx == 0 {
                    ans += counter[idx]
                }
            }
        }
        return ans
    }
}
class Solution2 {
    func countTriplets(_ nums: [Int]) -> Int {
        var counter = [Int:Int]()
        var ans = 0
        for i in nums {
            for j in nums {
                counter[i & j, default: 0] += 1
            }
        }
        for k in nums {
            for (num,cnt) in counter {
                if k & num == 0 {
                    ans += cnt
                }
            }
        }
        return ans
    }
}


class Solution {
    func countTriplets(_ nums: [Int]) -> Int {
        var ans = 0
        var counter = Array<Int>(repeating: 0, count: 1 << 16)
        for i in nums {
            for j in nums {
                counter[i & j] += 1
            }
        }
        for num in nums {
            let bit = (~num) & 0xffff
            var j = bit
            while j > 0 {
                ans += counter[j]
                j = (j - 1) & bit
            }
            ans += counter[0]
        }
        return ans
    }
    
}