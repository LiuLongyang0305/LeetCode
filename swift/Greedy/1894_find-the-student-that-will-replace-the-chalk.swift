// https://leetcode.com/problems/find-the-student-that-will-replace-the-chalk/
class Solution {
    func chalkReplacer(_ chalk: [Int], _ k: Int) -> Int {
        let N = chalk.count
        var preffix = [0]
        for v in chalk {
            preffix.append(preffix.last! + v)
        }
        let remain = k % preffix.last!
        guard remain != 0 else {
            return 0
        }
        for idx in 1...N {
            if remain < preffix[idx] {
                return idx - 1
            }
        }
        return -1
    }
}