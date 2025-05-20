//https://leetcode.com/problems/adjacent-increasing-subarrays-detection-i
class Solution {
    func hasIncreasingSubarrays(_ nums: [Int], _ k: Int) -> Bool {

        var first = [Int](nums[0..<k])
        var second = [Int](nums[k..<(2 * k)])







        if check(first,second) {
            return true
        }

        for num in nums.dropFirst(2 * k) {
            first.removeFirst()
            first.append(second.removeFirst())
            second.append(num)
            if check(first,second) {
                return true
            }
        }

        return false
    }

    private func check(_ first: [Int], _ second: [Int]) -> Bool {

        return check(first) && check(second)
    }


    private func check(_ arr: [Int]) -> Bool {
        var last = Int.min
        for num in arr {
            guard num > last else {return false}
            last = num
        }
        return true
    }
}