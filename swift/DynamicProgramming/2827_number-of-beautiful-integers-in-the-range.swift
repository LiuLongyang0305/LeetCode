//https://leetcode.com/problems/number-of-beautiful-integers-in-the-range/
class Solution {
    private struct KeyNode: Hashable {
        var pos: Int
        var isLessThan: Bool
        var remianK: Int
        var isNotZero: Bool
        var diff: Int
    }
    func numberOfBeautifulIntegers(_ low: Int, _ high: Int, _ k: Int) -> Int {
        return cal(high + 1, k) - cal(low, k)
    }

    private func cal(_ maxNum: Int, _ k: Int) -> Int {

        let digitsLimit = getDigits(of: maxNum)
        let N = digitsLimit.count
        var memo = [KeyNode:Int]()

        func dfs(_ pos: Int, _ isLessThan: Bool, _ remainK: Int, _ diff: Int, _ isNotZero: Bool, _ curNum: Int) -> Int {

            guard pos < N else {
                return (isLessThan && remainK == 0 && diff == 1_000_000 && isNotZero) ? 1 : 0
            }

            let key = KeyNode(pos: pos, isLessThan: isLessThan, remianK: remainK, isNotZero: isNotZero,diff: diff)
            if let sb = memo[key] {
                return sb
            }
            let hi = isLessThan ? 9 : digitsLimit[pos]
            var sb = 0
            for d in 0...hi {
                let flag = isNotZero || d != 0
                sb += dfs(pos + 1, isLessThan || d < digitsLimit[pos], (10 * remainK + d) % k, !flag ? 1_000_000 : (diff + (d & 1 == 0 ? 1 : -1)), flag, 10 * curNum + d)
            }
            memo[key] = sb
            return sb
        }

        let sb =  dfs(0, false, 0, 1_000_000,false, 0)
        return sb
    }
    private func getDigits(of num: Int) -> [Int] {
        var sb = [Int]()
        var t = num
        while t > 0 {
            sb.append(t % 10)
            t /= 10
        }
        return [Int](sb.reversed())
    }
}
