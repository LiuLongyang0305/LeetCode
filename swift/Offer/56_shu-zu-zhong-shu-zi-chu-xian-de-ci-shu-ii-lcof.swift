// https://leetcode-cn.com/problems/shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-ii-lcof/
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var counter = [Int:Int]()
        nums.forEach { (num) in
            if let c = counter[num] {
                if c == 2 {
                    counter.removeValue(forKey: num)
                } else {
                    counter[num] = c + 1
                }
            } else {
                counter[num] = 1
            }
        }
        return counter.keys.first!
    }
}