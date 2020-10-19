// https://leetcode.com/problems/lexicographically-smallest-string-after-applying-operations/
class Solution {
    let chars = (0...9).map { Character.init(Unicode.Scalar.init($0 + 48))}
    func findLexSmallestString(_ s: String, _ a: Int, _ b: Int) -> String {
        let nums = s.map {Int($0.asciiValue!) - 48}
        var visited = Set<String>()
        visited.insert(s)
        var queue = [[Int]]()
        queue.append(nums)
        let N = nums.count
        var ans = s
        var nextLevel = [[Int]]()
        
        func update(_ newNums: [Int]) {
            let str = getStr(newNums)
            if !visited.contains(str) {
                nextLevel.append(newNums)
                visited.insert(str)
                if ans > str {
                    ans = str
                }
            }
        }
        while !queue.isEmpty {
           nextLevel = []
            for  curNums in queue {
                // add
                var newNums1 = curNums
                for i in stride(from: 1, through: N, by: 2) {
                    newNums1[i] = (curNums[i] + a) % 10
                }
                update(newNums1)
                // rotate
                let newNums2 = [Int](curNums[(N - b)...] + curNums[..<(N - b)])
                update(newNums2)
            }
            queue = nextLevel
        }
        return ans
    }
    
    private func getStr(_ nums: [Int]) -> String {
        var ans = ""
        nums.forEach {ans.append(chars[$0])}
        return ans
    }
}