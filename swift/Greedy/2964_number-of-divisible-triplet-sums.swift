    // https://leetcode.cn/problems/number-of-divisible-triplet-sums/
    class Solution {
        func divisibleTripletCount(_ nums: [Int], _ d: Int) -> Int {
            guard nums.count >= 3 else {return 0}
            var preCounter = [Int:Int]()
            var sufCounter = [Int:Int]()
            let numsCopy = nums.map { $0 % d}
            for r in numsCopy.dropFirst(2) {
                sufCounter[r,default: 0] += 1
            }
            preCounter[numsCopy[0],default: 0] += 1
            var sb = 0
            
            for j in stride(from: 1, through: nums.count - 2, by: 1) {
                let rj = numsCopy[j]
                for (ri,cnt) in preCounter {
                    let targetR = (d - (rj + ri) % d) % d
                    sb += cnt * (sufCounter[targetR] ?? 0)
                }
                preCounter[rj,default: 0] += 1
                sufCounter[numsCopy[j + 1],default: 0] -= 1
            }
            return sb
        }
    }
