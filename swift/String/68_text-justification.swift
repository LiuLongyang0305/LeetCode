//  https://leetcode.com/problems/text-justification/
class Solution {
    private var words = [String]()
    private var maxWidth = -1
    private var preffix = [0]
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        self.words = words
        self.maxWidth = maxWidth
        self.preffix = [0]
        words.forEach { self.preffix.append(preffix.last! + $0.count)}
//        print("*******************")
        let N = words.count
        var ans = [String]()
        
        var startIdx = 0
        while startIdx < N {
            let preffixLength = self.preffix[startIdx]
            var j = startIdx + 1
            while j < N {
                guard self.preffix[j + 1] - preffixLength + (j - startIdx) <= self.maxWidth else {
                    break
                }
                j += 1
            }
//            print("start = \(startIdx)  j = \(j)")
            let newRow = j == N ? getLastRow(startIdx, j - 1) : getCurrentRow(startIdx, j - 1)
            ans.append(newRow)
//            print(newRow)
            startIdx = j
        }
        return ans
    }
    //左右两段对齐
    private func getCurrentRow(_ i: Int, _ j: Int) -> String{
        guard j > i else {
            return words[i] + String(repeating: " ", count: maxWidth - words[i].count)
        }
        var ans = ""
        let totalLength = preffix[j + 1] - preffix[i]
        let spacesCount = maxWidth - totalLength
        let wordCnt = j - i + 1
        let space = String(repeating: " ", count: spacesCount / (wordCnt - 1))
        
        if spacesCount % (wordCnt - 1) == 0 {
            for idx in i...j {
                if idx == j {
                    ans += words[idx]
                } else {
                    ans += words[idx] + space
                }
            }
            return ans
        } else {
            var remain = spacesCount % (wordCnt - 1)
            for idx in i...j {
                if idx == j {
                    ans += words[j]
                } else {
                    ans += words[idx] + space + (remain > 0 ? " " : "")
                    remain -= 1
                }
            }
        }
        return ans
    }
    //左对齐
    private func getLastRow(_ i: Int, _ j: Int) -> String {
        var ans = ""
        for idx in i...j {
            if idx == j {
                ans += words[idx]
            } else {
                ans += words[idx] + " "
            }
        }
        if ans.count < maxWidth {
            ans.append(String(repeating: " ", count: maxWidth - ans.count))
        }
        return ans
    }
}

