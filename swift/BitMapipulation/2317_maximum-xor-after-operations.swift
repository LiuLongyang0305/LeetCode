 // https://leetcode.com/problems/maximum-xor-after-operations/
/**
 1.  `nums[i] XOR x`,由于异或运算以及`x`的任意性，`nums[i]`的任何比特位都可以变成0也可以变成1，因此这一步可以得到任何数。
 2. `nums[i] AND x`，由于与运算的性质以及`x`的任意性，这一步可以把任何为1的比特位变成0
 3. `max(XOR(nums))`，逐位考虑，如果这一位存在1，那么总能得到奇数个1，最简单的方法就是把其他这一位位1 的数的这一位变成0。
 4. 如何判断某一位是否存在1？则用到`OR`运算。
 */
class Solution {
    func maximumXOR(_ nums: [Int]) -> Int {
        return nums.reduce(0) { $0 | $1}
    }
}