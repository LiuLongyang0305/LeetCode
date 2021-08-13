// https://leetcode.com/problems/minimum-unique-word-abbreviation/
extension Int {
    public func getSegments(base length: Int) -> Int {
        
        var ans = 0
        var last = -1
        var temp = self
        
        for _ in 0..<length {
            if temp & 1 == 0 {
                if last != 0 {
                    ans += 1
                }
                last = 0
            } else {
                ans += 1
                last = 1
            }
            temp = temp >> 1
        }
        return ans
    }
}

class Solution1 {
    private var powerOfTwo = [1]
    init() {
        for _ in 1...21 {
            self.powerOfTwo.append(self.powerOfTwo.last! * 2)
        }
    }
    func minAbbreviation(_ target: String, _ dictionary: [String]) -> String {
        let possibleDictionary = dictionary.filter {$0.count == target.count}
        guard !possibleDictionary.isEmpty else {
            return "\(target.count)"
        }
        let N = target.count
        let sortedNum = (0..<powerOfTwo[N]).sorted {$0.getSegments(base: N) < $1.getSegments(base: N)}
        for num in sortedNum {
            let target = generate(base: num, from: target)
            var flag = true
            for word in possibleDictionary {
                let cur = generate(base: num, from: word)
                if cur == target {
                    flag = false
                    break
                }
            }
            if flag {
                return generateResult(target)
            }
        }
        return ""
    }
    
    private func generate(base num: Int, from word: String) -> String {
        var ans = ""
        var temp = num
        for ch in word {
            ans.append(temp & 1 == 0 ? "*" : ch)
            temp = temp >> 1
        }
        return ans
    }
    private func generateResult(_ abbr: String) -> String {
        var ans = ""
        var curLength = 0
        for ch in abbr {
            if ch == "*" {
                curLength += 1
            } else {
                if curLength != 0 {
                    ans.append("\(curLength)")
                    curLength = 0
                }
                ans.append(ch)
            }
        }
        if curLength != 0 {
            ans.append("\(curLength)")
        }
        return ans
    }
}