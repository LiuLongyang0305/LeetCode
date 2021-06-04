// https://leetcode.com/problems/confusing-number-ii/
class Solution {
    private let digitsSets = Set<Int>([0,1,6,8,9])
    private var maxLength = -1
    private var ans = 0
    private var upperBounds = [Int]()
    func confusingNumberII(_ N: Int) -> Int {
        self.maxLength = "\(N)".count
        self.ans = 0
        self.upperBounds = caculateUpperBound(of: N)
        recurrsion(self.upperBounds.count - 1, 0, targetMax: 0)
        return ans
    }
    
    func recurrsion(_ curPos: Int,_ preNum: Int,targetMax: Int) {
        guard curPos >= 0 else {
            if check(preNum) {
                self.ans += 1
            }
            return
        }
        let limit = preNum < targetMax ? 9 : self.upperBounds[curPos]
        for digit in self.digitsSets {
            if digit <= limit {
                recurrsion(curPos - 1, preNum * 10 + digit, targetMax: targetMax * 10 + self.upperBounds[curPos])
            }
        }
    }
    private func caculateUpperBound(of num: Int) -> [Int] {
        var ans = [Int]()
        var n = num
        while n > 0 {
            ans.append(n % 10)
            n /= 10
        }
        return ans
    }
    private func check(_ num: Int) -> Bool {
        guard num >= 1 else {
            return false
        }
        var newNum = 0
        var t = num
        while t > 0 {
            let digit = t % 10
            newNum = 10 * newNum + (digit == 6 ? 9 : (digit == 9 ? 6 : digit))
            t /= 10
        }
        return num != newNum
    }
}