//https://leetcode.com/problems/unique-3-digit-even-numbers/
class Solution1 {
    private let indicesOrder = [[0,1,2],[0,2,1],[1,0,2],[1,2,0],[2,0,1],[2,1,0]]
    func totalNumbers(_ digits: [Int]) -> Int {
        let N = digits.count
        let maxMask = (1 << N ) - 1
        var set = Set<Int>()

        func chooseNumnbers(_ mask: Int) -> [Int] {
            var ans = [Int]()
            for i in 0...(64 - mask.leadingZeroBitCount) {
                if mask & (1 << i) != 0 {
                    ans.append(digits[i])
                }
            }
            return ans
        }


        func caculate(_ digits: [Int]) {
            for indice in indicesOrder {
                guard digits[indice[0]] != 0 && digits[indice[2]] & 1 == 0 else {
                    continue
                }
                set.insert(100 * digits[indice[0]] + 10 * digits[indice[1]] + digits[indice[2]])
            }
        }

        for mask in 0...maxMask {
            guard mask.nonzeroBitCount == 3 else {continue}
            caculate(chooseNumnbers(mask))

        }
        return set.count
    }
}
class Solution {
    func totalNumbers(_ digits: [Int]) -> Int {
        let counter = counterDigits(digits)
        var ans = 0
        for num in stride(from: 100, to: 999, by: 2) {
            let tempCounter = counterDigits(num)
            var flag = true
            for i in 0..<10 {
                guard tempCounter[i] <= counter[i] else {
                    flag = false
                    break
                }
            }
            if flag {ans += 1}
        }
        return ans
    }

    private func counterDigits(_ digits: [Int]) -> [Int] {
        var ans = [Int](repeating: 0, count: 10)
        for digit in digits {
            ans[digit] += 1
        }

        return ans
    }
    private func counterDigits(_ num: Int) -> [Int] {
        var ans = [Int](repeating: 0, count: 10)
        var t = num
        while t > 0 {
            ans[t % 10] += 1
            t /= 10
        }
        return ans
    }
}