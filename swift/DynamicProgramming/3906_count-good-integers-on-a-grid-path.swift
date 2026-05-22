//https://leetcode.cn/problems/count-good-integers-on-a-grid-path/
class Solution {
    func countGoodIntegersOnPath(_ l: Int, _ r: Int, _ directions: String) -> Int {
        let seq = getSequence(for: directions)
        return cal(r,seq) - cal(l - 1,seq)
    }

    private func cal(_ num: Int,_ indicesSequence:[Int]) -> Int {
        let digitLimits = getDigis(of: num)
        let seqSet = Set<Int>(indicesSequence)
        var memo = [String:Int]()

        func dfs(_ curIdx: Int, _ isLessThan:Bool, _ lastDigit:Int) -> Int {
            guard curIdx < 16 else {return 1}

            let key = "\(curIdx)-\(isLessThan ? 1 : 0)-\(lastDigit)"
            if let v = memo[key] {
                return v
            }
            var sb = 0
            for candidateDigit in stride(from: 0, through: isLessThan ? 9 : digitLimits[curIdx], by: 1){
                if seqSet.contains(curIdx) {
                    if candidateDigit >= lastDigit {
                        sb += dfs(curIdx + 1, isLessThan || candidateDigit < digitLimits[curIdx], candidateDigit)
                    }
                } else {
                    sb += dfs(curIdx + 1, isLessThan || candidateDigit < digitLimits[curIdx], lastDigit)
                }
            }
            memo[key] = sb
            return sb
        }
        var sb = dfs(0, false, -1)
        return sb
    }

    private func getDigis(of num: Int) -> [Int] {
        var sb = [Int]()
        var t = num
        while t > 0 {
            sb.append(t % 10)
            t /= 10
        }
        if sb.count < 16 {
            sb += [Int](repeating: 0, count: 16 - sb.count)
        }
        return [Int](sb.reversed())
    }

    private func getSequence(for dirs: String) -> [Int] {
        var sb = [0]
        var last = (0,0)
        for d in dirs {
            if d == "D" {
                last.0 += 1
            } else {
                last.1 += 1
            }
            sb.append(4 * last.0 + last.1)
        }
        return sb
    }
}
