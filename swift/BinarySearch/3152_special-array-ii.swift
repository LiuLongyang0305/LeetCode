class Solution {
    func isArraySpecial(_ nums: [Int], _ queries: [[Int]]) -> [Bool] {
        var splitPoint = [Int]()
        let N = nums.count
        for i in stride(from: 1, to: N , by: 1) {
            if (nums[i] & 1) == (nums[i - 1] & 1) {
                splitPoint.append(10 * i - 5)
            }
        }
          guard !splitPoint.isEmpty else {
            return [Bool](repeating: true, count: queries.count)
        }

        splitPoint = [0] + splitPoint + [1_000_000_007]

        // print(splitPoint)

        func binarySearch(firtLargerThan target: Int) -> Int {
            var l = 0
            var r = splitPoint.count - 1
            while l < r {
                let m = (l + r) >> 1
                if splitPoint[m] > target {
                    r = m
                } else {
                    l = m + 1
                }
            }
            return l
        }


        return queries.map {
            binarySearch(firtLargerThan: 10 * $0[0]) == binarySearch(firtLargerThan: 10 * $0[1])
        }
    }
}
