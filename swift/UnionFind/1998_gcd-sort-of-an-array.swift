// https://leetcode.com/problems/gcd-sort-of-an-array/
class Solution {
    
    
    private let N = 100005
    private var parent = Array<Int>()
    func gcdSort(_ nums: [Int]) -> Bool {
        nums.forEach { divide($0)}
        let sortedNums = nums.sorted()
        let M = nums.count
        for i in 0..<M {
            guard nums[i] == sortedNums[i] || isCombined(nums[i], sortedNums[i]) else {
                return false
            }
        }
        return true
    }
    init() {
        parent = Array<Int>(0..<N)
    }
    
    private func find(_ a: Int) -> Int {
        if parent[a] != a {
            parent[a] = find(parent[a]);
        }
        return parent[a]
    }
    
    private func combine(_ a: Int, _ b: Int)  {
        let x = find(a)
        let y = find(b)
        guard x != y else {
            return
        }
        parent[x] = y;
    }
    
    
    private func isCombined(_ a: Int, _ b: Int) -> Bool {
        return find(a) == find(b)
    }
    
    
    private func divide(_ num: Int ) {
        guard parent[num] == num else {
            return
        }
        var numCopy = num
        var i = 2
        while i <= numCopy / i {
            if numCopy % i == 0 {
                while numCopy % i == 0 {
                    numCopy /= i
                }
                combine(num, i)
            }
            i += 1
        }
        if numCopy > 1 {
            combine(numCopy, num)
        }
    }
}