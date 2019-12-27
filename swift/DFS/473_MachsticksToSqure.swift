//https://leetcode.com/problems/matchsticks-to-square/
 class Solution1 {
    func makesquare(_ nums: [Int]) -> Bool {
        guard nums.count >= 4 else {
            return false
        }
        guard nums.count != 4 else {
            return Set<Int>(nums).count == 1
        }
        let totalLength = nums.reduce(0) { $0 + $1 }
        guard totalLength % 4 == 0 else {
            return false
        }
        let sortedNums = nums.sorted()
        let targetLength = totalLength / 4
        guard sortedNums.last! <= targetLength else {
            return false
        }
        let N = sortedNums.count
        var visited = Array<Bool>(repeating: false, count: N)
        func backtracking(currentSum: Int) -> Bool {
            var index = N  - 1
            while index >= 0 {
                if !visited[index] && currentSum + sortedNums[index] <= targetLength {
                    visited[index] =  true
                    guard sortedNums[index]  + currentSum != targetLength else {
                        return true
                    }
                    if backtracking(currentSum: sortedNums[index]  + currentSum ) {
                        return true
                    }
                    visited[index] = false
                }
                index -= 1
            }
            return false
        }
        for _ in 0..<3 {
            if !backtracking(currentSum: 0) {
                return false
            }
        }
        return true
    }
 }

 class Solution {
    func makesquare(_ nums: [Int]) -> Bool {
        let sum: Int = nums.reduce(0, +)
        guard sum % 4 == 0 else {
            return false
        }
        guard nums.count >= 4 else {
            return false
        }
        guard nums.count != 4 else {
            return Set<Int>(nums).count == 1
        }
        var sums: [Int] = [0,0,0,0]
        return findSqure(nums.sorted(),&sums,nums.count - 1, sum >> 2)
    }
    private func findSqure(_ sortedNums: [Int], _  sums: inout [Int],_ index: Int, _ target: Int) -> Bool {
        guard index != -1 else {
            return true
        }
        for i in 0..<4 {
            if sums[i] + sortedNums[index] > target || (i > 0 && sums[i] == sums[i - 1]) {
                continue
            }
            sums[i] += sortedNums[index]
            if  findSqure(sortedNums, &sums, index - 1, target) {
                return true
            }
            sums[i] -= sortedNums[index]
        }
        return false
    }
 }
