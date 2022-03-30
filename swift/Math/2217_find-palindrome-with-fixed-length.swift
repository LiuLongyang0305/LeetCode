// https://leetcode.com/problems/find-palindrome-with-fixed-length/
class Solution {

    private let powerOfTen = [1,10,100,1000,10000,100000,1000000,10000000,100000000,1000000000]
    func kthPalindrome(_ queries: [Int], _ intLength: Int) -> [Int] {
        guard intLength > 1 else {
            return queries.map { ($0 <= 9 && $0 >= 1) ? $0  : -1}
        }

        let leftPartCnt = (intLength + 1) >> 1
        let start = powerOfTen[leftPartCnt - 1] - 1
        func caculate(_ order: Int) -> Int {
            let left = start + order
            guard left < powerOfTen[leftPartCnt] else {return -1}
            let leftStr = "\(left)"
            let rightStr = String(leftStr.reversed().dropFirst(leftStr.count * 2 > intLength ? 1 : 0))
            return Int(leftStr + rightStr) ?? -1
        }

        return queries.map { caculate($0)}
    }
}