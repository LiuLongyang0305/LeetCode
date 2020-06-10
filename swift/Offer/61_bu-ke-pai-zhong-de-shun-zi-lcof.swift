// https://leetcode-cn.com/problems/bu-ke-pai-zhong-de-shun-zi-lcof/
class Solution {
    func isStraight(_ nums: [Int]) -> Bool {
        func check(_ sortedNums: [Int]) -> Bool {
            // print(sortedNums)
            let minVal = sortedNums[0]
            return sortedNums.map { $0 - minVal} == [0,1,2,3,4]
        }
        var sortedNums = nums.sorted()
        while sortedNums[0] == 0 {
            sortedNums.removeFirst()
        }
        if sortedNums.count == 5 {
            return check(sortedNums)
        }
        // backtracking
        func backtracking(_ currentSortedNums: inout [Int]) -> Bool {
            guard currentSortedNums.count < 5 else {
                return check(currentSortedNums.sorted())
            }
            for cur in 1...13 {
                if !currentSortedNums.contains(cur) {
                    currentSortedNums.append(cur)
                    if backtracking(&currentSortedNums) {
                        return true
                    }
                    currentSortedNums.removeLast()
                }
            }
            return false
        }
        return backtracking(&sortedNums)
    }
}