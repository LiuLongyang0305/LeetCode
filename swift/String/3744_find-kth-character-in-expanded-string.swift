   //https://leetcode.cn/problems/find-kth-character-in-expanded-string/
class Solution1 {
    func kthCharacter(_ s: String, _ k: Int) -> Character {
        let words = s.components(separatedBy: " ")

        var remainLength = k + 1

        for i in 0..<words.count {
            let word = words[i]
            let n = word.count

            let expandedLength = n * (n + 1) / 2

            // 当前单词的展开部分
            if remainLength <= expandedLength {
                var j = 1

                while remainLength > j {
                    remainLength -= j
                    j += 1
                }

                let index = word.index(
                    word.startIndex,
                    offsetBy: j - 1
                )

                return word[index]
            }

            remainLength -= expandedLength

            // 当前单词后面的空格
            if i + 1 < words.count {
                if remainLength == 1 {
                    return " "
                }

                remainLength -= 1
            }
        }

        return " "
    }
}

    //https://leetcode.cn/problems/find-kth-character-in-expanded-string/
    class Solution {
        func kthCharacter(_ s: String, _ k: Int) -> Character {
            let words = s.components(separatedBy: " ")
            let M = words.count

            var remainLength = k + 1

            for i in 0..<M {
                let N = words[i].count
                let curLength = N * (N + 1) / 2 + 1

                if remainLength > curLength {
                    remainLength -= curLength
                } else {
                    if remainLength == curLength {
                        return " "
                    } else {
                        var j = 1
                        while j <= N {
                            if remainLength > j {
                                remainLength -= j
                            } else {
                                break
                            }
                            j += 1
                        }

                        return words[i][words[i].index(words[i].startIndex, offsetBy: j - 1)]
                    }
                }


            }
            return " "
        }
    }
