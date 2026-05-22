// class Solution {
//     func smallestBalancedIndex(_ nums: [Int]) -> Int {
//         var sum: Int64 = 0
//         var mul: Int64 = 1
//         var l = 0
//         var r = nums.count - 1
        
//         while l < r {
//             if sum < mul {
//                 sum += Int64(nums[l])
//                 l += 1
//             } else {
//                 // 在乘法运算前检查是否会导致溢出
//                 // 这里的 1e14 是一个防止积过大的阈值
//                 if mul > Int64(1e14) / Int64(nums[r]) {
//                     return -1
//                 }
//                 mul *= Int64(nums[r])
//                 r -= 1
//             }
//         }
//         // 循环结束时，l 和 r 相遇，检查当前和与积是否相等
//         return sum == mul ? l : -1
//     }
// }

class Solution {
    func smallestBalancedIndex(_ nums: [Int]) -> Int {
        let N = nums.count
        guard N > 1 else {return -1}

        let totalSum = nums.reduce(0) { $0 + $1}
        //找到最左侧的可能分界点，并且要保证不溢出
        var rightProduct = 1
        var i = N - 1
        while i >= 0 && rightProduct < totalSum && nums[i] <= totalSum / rightProduct{
            rightProduct *= nums[i]
            i -= 1

        }
        
        var leftSum = 0
        var j = 0
        while j < i {
            leftSum += nums[j]
            j += 1
        }

        //下标i是可能的分界点，需要单独判断；
        if i >= 0 {
            if leftSum == rightProduct {return i}
            leftSum += nums[i]
        }
        //依次判断i之后的下标
        for k in stride(from: i + 1, to: N, by: 1) {
            rightProduct /= nums[k]
            if leftSum == rightProduct {
                return k
            }
            leftSum += nums[k]
        }

        return -1
    }
}
