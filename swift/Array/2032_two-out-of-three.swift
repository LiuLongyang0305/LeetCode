// https://leetcode.com/problems/two-out-of-three/
class Solution {
    func twoOutOfThree(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int]) -> [Int] {
        var flag = [Int](repeating: 0, count: 105)
        nums1.forEach { flag[$0] |= 1}
        nums2.forEach { flag[$0] |= 2}
        nums3.forEach { flag[$0] |= 4}
        let target = Set<Int>([3,6,5,7])
        var ans = [Int]()
        for num in 1...100 {
            if target.contains(flag[num]){
                ans.append(num)
            }
        }
        return ans
    }
}