//https://leetcode.com/problems/count-the-number-of-powerful-integers/
class Solution {

    func numberOfPowerfulInt(_ start: Int, _ finish: Int, _ limit: Int, _ s: String) -> Int {
        guard check(Int(s)!, limit)  else {return 0}

        return cal(finish, limit, s) - cal(start, limit, s) + (check(finish, limit) && "\(finish)".hasSuffix(s) ? 1 : 0)    }

    private func  cal(_ maxNumber: Int, _ limit: Int, _ suffix: String) -> Int {
        let suffixNum = getDigits(of: Int(suffix) ?? 0)
        let digitLimits = getDigits(of: maxNumber)
        let M = digitLimits.count
        let N = suffix.count
        guard M >= N else {return 0}
        let SplitPoint = M - N
        var memo = [[Int?]](repeating: [Int?](repeating: nil, count: 2), count: M + 5)

        func dfs(_ pos: Int, _ isLessThan: Bool) -> Int{
            guard pos < M else {
                return isLessThan  ? 1 : 0
            }
            if let sb = memo[pos][isLessThan ? 0 : 1] {
                return sb
            }
            let high = isLessThan ? min(9,limit) : min(9,limit,digitLimits[pos])
            if pos >= SplitPoint {
                return suffixNum[pos - SplitPoint] <= high ? dfs(pos + 1, isLessThan || suffixNum[pos - SplitPoint] < digitLimits[pos]) : 0

            } else {

                var sb = 0
                for d in 0...high {
                    sb += dfs(pos + 1, isLessThan || d < digitLimits[pos])
                }
                memo[pos][isLessThan ? 0 : 1]  = sb
                return sb
            }

        }
        return dfs(0, false)
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

    private func check( _ num: Int, _ limit: Int) -> Bool {
        let digits = getDigits(of: num)
        return digits.max()! <= limit
    }
}
