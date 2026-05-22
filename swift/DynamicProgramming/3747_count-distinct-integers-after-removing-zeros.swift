//https://leetcode.cn/problems/count-distinct-integers-after-removing-zeros/
class Solution {

    func countDistinct(_ n: Int) -> Int {
        let digits = getDigits(of: n)
        let N = digits.count


        var memo = [String:Int]()
        func dfs(_ idx: Int, _ isNum: Bool, _ isLessthan: Bool) -> Int {
            guard idx < N else {
                return isNum ? 1 : 0
            }
            let key = "\(idx)_\(isNum ? 1 : 0)_\(isLessthan ? 1 : 0)"
            if let v = memo[key] {
                return v
            }
            let maxCurDigit = isLessthan ? 9 : digits[idx]
            let minCurDigit = isNum ? 1 : 0
            guard minCurDigit <= maxCurDigit else {
                return 0
            }
            var sb = 0
            for i in minCurDigit...maxCurDigit {
                sb += dfs(idx + 1, isNum || (i != 0) , isLessthan || (i < digits[idx]))
            }
            memo[key] = sb
            return sb
        }

        return dfs(0, false, false)
    }
    private func getDigits(of num: Int) -> [Int] {
        var temp = num
        var sb = [Int]()
        while temp > 0 {
            sb.append(temp % 10)
            temp /= 10
        }
        return [Int](sb.reversed())
    }
}
