// https://leetcode.com/problems/reverse-pairs/
class Solution {
    private var c = [Int]()
    private var sortedNumbers = [Int]()
    private var N = 0

    func reversePairs(_ nums: [Int]) -> Int {
        let doubleNumbers = nums.map { $0 * 2}
        self.sortedNumbers = [Int.min] + Set<Int>(doubleNumbers).sorted() + [Int.max]
        self.N = sortedNumbers.count
        self.c = [Int](repeating: 0, count: N  + 1)

        var ans = 0
        for num in doubleNumbers.reversed() {
            ans += query(binarySearch(num / 2) - 1)
            add(binarySearch(num))
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
            x -= lowBit(x)
        }
        return ans
    }
}

