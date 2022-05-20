//https://leetcode.com/problems/count-of-smaller-numbers-after-self/
class Solution {

    private var c = [Int]()
    private var sortedNumbers = [Int]()
    private var N = 0
    func countSmaller(_ nums: [Int]) -> [Int] {
        self.sortedNumbers = [Int.min] + Set<Int>(nums).sorted()
        self.N = sortedNumbers.count
        self.c = [Int](repeating: 0, count: N + 1)
        var ans = [Int](repeating: 0, count: nums.count)
        var idx = nums.count - 1
        while idx >= 0 {
            let i = binarySearch(nums[idx])
            ans[idx] = query(i - 1)
            add(i)
            idx -= 1
        }
        return ans
    }


    private func binarySearch(_ target: Int) -> Int {
        var l = 0
        var r = sortedNumbers.count - 1
        while l < r {
            let mid = (l + r) >> 1
            if sortedNumbers[mid] >= target {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return l
    }

    private func add(_ pos: Int, _ delta: Int = 1) {
        var x = pos
        while x <= N {
            c[x] += delta
            x = getParentNode(x)
        }
    }
    private func query(_ pos: Int) -> Int {
        var x = pos
        var ans = 0
        while x > 0 {
            ans += c[x]
            x = getPreffixNode(x)
        }
        return ans
    }


    private func lowBit(_ x: Int) -> Int{
        return x & (-x)
    }

    private func getPreffixNode(_ x: Int) -> Int {
        return x - lowBit(x)
    }

    private func getParentNode(_ x: Int) -> Int {
        return x + lowBit(x)
    }
}