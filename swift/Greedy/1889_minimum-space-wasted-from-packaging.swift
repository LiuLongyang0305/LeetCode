// https://leetcode.cn/problems/minimum-space-wasted-from-packaging/
class Solution {
    private var sortedPackages = [Int]()
    private var  totalPackage = 0
    private var N = 0
    func minWastedSpace(_ packages: [Int], _ _boxes: [[Int]]) -> Int {

        self.sortedPackages =  [-1] + packages.sorted() + [Int.max]
        self.totalPackage =  packages.reduce(0) { $0 + $1}
        self.N = packages.count

        var ans = Int.max
        let biggestPackge = sortedPackages[N]

        for boxes in _boxes {

            guard (boxes.max() ?? 0) >= biggestPackge else {
                continue
            }

            ans = min(ans,caculate(boxes))
        }
        return ans == Int.max ? -1 : ans % 1_000_000_007
    }
    private func caculate(_ boxes: [Int]) -> Int {
        let sortedBoxes = boxes.sorted()
        var nextIdx = 1
        var totalBox = 0
        for box in sortedBoxes {
            guard nextIdx <= N else {break}
            guard box >= sortedPackages[nextIdx] else {continue}
            let lastIdx = binarySearchLastIdx(lessThanOrEqualTo: box , from: nextIdx)
            totalBox += box * (lastIdx - nextIdx + 1)
            nextIdx =  lastIdx + 1
        }
        return  totalBox - totalPackage
    }


    private func binarySearchLastIdx(lessThanOrEqualTo target: Int,  from idx: Int) -> Int {
        var left = idx
        var right = N
        while left < right {
            let mid = (left + right + 1) >> 1
            if sortedPackages[mid] <= target {
                left = mid
            } else {
                right = mid - 1
            }
        }
        return left
    }
}