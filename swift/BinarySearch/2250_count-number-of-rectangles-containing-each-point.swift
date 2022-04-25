// https://leetcode.com/problems/count-number-of-rectangles-containing-each-point/
class Solution {
    func countRectangles(_ rectangles: [[Int]], _ points: [[Int]]) -> [Int] {

        var counter = [[Int]](repeating: [-1,1_000_000_007], count: 105)
        for rectangle in rectangles {
            counter[rectangle[1]].append(rectangle[0])
        }

        for i in 1...100 {
            counter[i].sort {$0 > $1}
        }

        func binarySearch(in arr:[Int], target: Int) -> Int {

            guard arr.count > 2 else {
                return 0
            }


            var left = 0
            var right = arr.count - 1

            while left < right {
                let mid = (right + left + 1) >> 1
                if arr[mid] < target {
                    right = mid - 1
                } else {
                    left = mid
                }
            }

            return left

        }

        func  count(_ x: Int, _ y: Int) -> Int {
            return (y...100).reduce(0) { $0 + binarySearch(in: counter[$1], target: x)}
        }

        return points.map { count($0[0], $0[1])}
    }
}