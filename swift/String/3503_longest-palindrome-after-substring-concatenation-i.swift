//https://leetcode.cn/problems/longest-palindrome-after-substring-concatenation-i/
    class Solution {
        func longestPalindrome(_ s: String, _ t: String) -> Int {
            let subStrsOfS = enumerateAllSubstrings(of: s)
            let subStrsOfT = enumerateAllSubstrings(of: t)
            var ans = max(getMaxLength(of: subStrsOfS),getMaxLength(of: subStrsOfT))

            for preLength in 1...s.count {

                for suffixLength in stride(from: t.count, to: 0, by: -1) {
                    guard preLength + suffixLength > ans else {break}
                    for   suiffix in subStrsOfT[suffixLength] {
                        for preffix in subStrsOfS[preLength] {
                            guard preLength + suffixLength > ans else {break}
                            if check(preffix + suiffix) {
                                ans = max(ans,preLength + suffixLength)
                            }
                        }
                    }
                }
            }



            return ans
        }

        private func check(_ str: String) -> Bool {
            var left = str.startIndex
            var right = str.index(before: str.endIndex)
            while left < right {
                guard str[left] == str[right] else {
                    return false
                }
                left = str.index(after: left)
                right = str.index(before: right)
            }
            return true
        }
        private func enumerateAllSubstrings(of str: String) -> [[String]] {
            var substrings = [[String]](repeating: [], count: str.count + 1)
            let indices = Array(str.indices)

            for i in 0..<indices.count {
                for j in i..<indices.count {
                    let start = indices[i]
                    let end = indices[j]
                    let substring = String(str[start...end])
                    substrings[substring.count].append(substring)
                }
            }
            return substrings
        }

        private func getMaxLength(of strs: [[String]]) -> Int {
            for ss in strs.dropFirst().reversed() {
                for s in ss {
                    if check(s) {
                        return s.count
                    }
                }
            }
            return 1
        }
    }