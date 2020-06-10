// https://leetcode-cn.com/problems/shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-lcof/
class Solution {
    func singleNumbers(_ nums: [Int]) -> [Int] {
        var ans = [0,0]
        let total = nums.reduce(0) { $0 ^ $1}
        var flag = 1
        while flag & total == 0 {
            flag = flag << 1
        }
        nums.forEach { (num) in
            let index = num & flag == 0 ? 0 : 1
           ans[index ] ^= num
        }
        return ans
    }
}