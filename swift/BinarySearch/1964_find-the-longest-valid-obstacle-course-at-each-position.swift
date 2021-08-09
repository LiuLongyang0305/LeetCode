// https://leetcode.com/problems/find-the-longest-valid-obstacle-course-at-each-position/
class Solution {
    func longestObstacleCourseAtEachPosition(_ obstacles: [Int]) -> [Int] {
        let N = obstacles.count
        var length = 0
        var ans = [Int]()
        var memo = Array<Int>(repeating: 0, count: N)
        for obs in obstacles {
            var left = 0
            var right = length
            while left < right {
                let mid = (left + right) >> 1
                if memo[mid] <= obs {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            ans.append(left + 1)
            if length == left {
                length += 1
            }
            memo[left] = obs
        }
        return ans
    }
}