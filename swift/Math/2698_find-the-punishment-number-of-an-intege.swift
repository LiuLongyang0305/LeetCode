    //https://leetcode.cn/problems/find-the-punishment-number-of-an-integer/
func getDigits(of num: Int) -> [Int] {
    guard num >= 10 else {return [num]}
    var ans = [Int]()
    var t = num
    while t > 0 {
        ans.insert(t % 10, at: 0)
        t /= 10
    }
    return ans
}
var punishmentNumbers = Set<Int>()
func  check(_ num: Int) -> Bool {
    let digits = getDigits(of: num * num)
    let N = digits.count
    var flag = false
    guard N > 1 else{return digits[0] == num}

    func  dfs(_ curIdx: Int, _ curSum: Int) {
        guard !flag else {
            return
        }
        guard curIdx < N else {
            flag = curSum == num
            return
        }
        var splitIdx = curIdx
        var curNum = 0
        while splitIdx < N {
            curNum = 10 * curNum + digits[splitIdx]
            dfs(splitIdx + 1, curSum + curNum)
            splitIdx += 1
        }
    }

    dfs(0, 0)

    return flag
}
for i in 0...1000 {
    if check(i) {
        punishmentNumbers.insert(i)
        // print(i)
    }
}
class Solution {

    func punishmentNumber(_ n: Int) -> Int {
        var ans = 0
        for i in 1...n {
            if punishmentNumbers.contains(i) {
                ans += i * i
            }
        }
        return ans
    }
}