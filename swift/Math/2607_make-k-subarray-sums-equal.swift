//https://leetcode.com/problems/make-k-subarray-sums-equal/
class Solution {
    func makeSubKSumEqual(_ arr: [Int], _ k: Int) -> Int {
        let N = arr.count
        guard N > k else {return 0}
        var ans = 0
        let sequenceLength = gcd(N, k)
        var groups = [[Int]](repeating: [], count: sequenceLength)
        for i in 0..<N {
            groups[i % sequenceLength].append(arr[i])
        }

        return groups.reduce(0) {$0 + caculateTimesToMakeTheElementsToBeEqual($1.sorted())}
    }
    private func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 {return a}
        return gcd(b, a % b )
    }
    private func caculateTimesToMakeTheElementsToBeEqual(_ nums: [Int]) -> Int {
        let target = nums[nums.count / 2]
        return nums.reduce(0) { $0 + abs(target - $1)}
    }
}

