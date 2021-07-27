// https://leetcode.com/problems/largest-number-after-mutating-substring/
class Solution {
    func maximumNumber(_ num: String, _ change: [Int]) -> String {
        var mutateLargerDigits = Set<Character>()
        var mutateEqualDigits = Set<Character>()

        var map = [Character:Character]()
        for i in 0...9 {
            if change[i] >= i {
                let ori = Character.init("\(i)")
                if change[i] == i {
                    mutateEqualDigits.insert(ori)
                } else {
                    mutateLargerDigits.insert(ori)
                }
                map[ori] = Character.init("\(change[i])")
            }
        }
//        print(map)
        guard !mutateLargerDigits.isEmpty else {
            return num
        }
        var numChars = [Character](num)
        let N = num.count
        var states = Array<Int>(repeating: -1, count: N)
        for idx in 0..<N {
            if mutateLargerDigits.contains(numChars[idx]) {
                states[idx] = 1
            } else if mutateEqualDigits.contains(numChars[idx]) {
                states[idx] = 0
            }
        }
        guard let firstLeargerIndex = states.firstIndex(of: 1) else {
            return num
        }
        var idx = firstLeargerIndex
        while idx < N {
            guard states[idx] >= 0 else {
                break
            }
            numChars[idx] = map[numChars[idx]]!
            idx += 1
        }
        return String(numChars)
    }
}