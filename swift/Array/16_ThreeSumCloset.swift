class Solution {
    private  var sortedNums = [Int]()
    private var length = -1
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        length = nums.count
        guard length >= 3 else {
            return -1
        }
        sortedNums  = nums.sorted()
        let minThreeSum = sortedNums[0] + sortedNums[1] + sortedNums[2]
        let maxThreeSum = sortedNums[length - 1] + sortedNums[length -  2] + sortedNums[length - 3]
        guard minThreeSum != maxThreeSum else {
            return minThreeSum
        }
        guard target > minThreeSum && target < maxThreeSum else {
            return target <= minThreeSum ? minThreeSum : maxThreeSum
        }
        if threeSum(target) {
            return target
        }
        let deltaMax = min(target  - minThreeSum, maxThreeSum - target)
        for i in 1..<deltaMax {
            if threeSum(target - i) {
                return target - i
            }
            if threeSum(target + i) {
                return target + i
            }
        }
        return target + deltaMax == maxThreeSum ? maxThreeSum : minThreeSum
    }
    private func threeSum(_ num: Int) -> Bool {
        for i in 0..<(length - 1) {
            if i > 0 && sortedNums[i] == sortedNums[i - 1] {
                continue
            }
            var j = i + 1
            var k = length - 1
            let target = num - sortedNums[i]
            while j < k {
                if sortedNums[j] + sortedNums[k] ==  target {
                    return true
                } else if  sortedNums[j] + sortedNums[k] > target {
                    k -= 1
                } else {
                    j += 1
                }
            }
        }
        return  false
    }
}