//https://leetcode.cn/problems/minimum-substring-partition-of-equal-character-frequency/
class Solution {
    func minimumSubstringsInPartition(_ s: String) -> Int {
        let nums = s.map { $0.numVal}
        var counters = [[Int]]()
        var counter = [Int](repeating: 0, count: 26)
        counters.append(counter)
        for num in nums {
            counter[num] += 1
            counters.append(counter)
        }


        func check(_ left: Int,_ right: Int) -> Bool{
            guard right - left > 1 else {
                return true
            }
            var maxVal = -1
            for i in 0...25 {
                let t = counters[right + 1][i] - counters[left][i]
                if t == 0 {continue}
                if maxVal == -1 {
                    maxVal = t
                } else {
                    guard maxVal == t else {return false}
                }
            }
            return true
        }

        let N = nums.count

        var memo = [Int](repeating: -1, count: N + 5)
        func dfs(_ idx: Int) -> Int {
            guard idx < N else {return 0}
            guard -1 == memo[idx] else {return memo[idx]}
            var ans = N
            for i in idx..<N {
                if check(idx, i) {
                    ans = min(ans, 1 + dfs(i + 1))
                }
            }
            memo[idx] = ans
            return ans
        }
        return dfs(0)
    }
}


extension Character {
    var numVal: Int {
        return Int(self.asciiValue! - 97)
    }
    public func next(_ k: UInt8) -> Character {
            // print("\(self)   \(self.asciiValue!)  \(k) \((self.asciiValue! + k) % 26)")
        let target = (self.asciiValue! + k - 97) % 26 + 97
        return Character.init(Unicode.Scalar.init(target))
    }

}
