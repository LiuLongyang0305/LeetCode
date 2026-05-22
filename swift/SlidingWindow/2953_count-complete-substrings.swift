//https://leetcode.cn/problems/count-complete-substrings/
class Solution {

    func countCompleteSubstrings(_ word: String, _ k: Int) -> Int {
        let wordToNums = word.map {Int($0.asciiValue!) - 97}
        let N = wordToNums.count
        var sb = 0
        var idx = 0
        while idx < N {
            var right = idx + 1
            while right < N && abs(wordToNums[right] - wordToNums[right - 1]) <= 2 {
                right += 1
            }
            sb += cal([Int](wordToNums[idx..<right]), k)
            idx = right
        }
        return sb
    }

    func cal(_ nums:[Int], _ k: Int) -> Int {
        // print(nums)
        let N = nums.count
        var sb = 0
        var m = 1
        while m <= 26 && k * m <= N {
            var cnt = [Int](repeating: 0, count: 26)
            var right = 0
            while right < N {
                cnt[nums[right]] += 1
                let left = right - k * m + 1
                if left >= 0 {
                    var ok = true
                    for i in 0..<26{
                        if cnt[i] > 0 && cnt[i] != k {
                            ok = false
                            break
                        }
                    }
                    if ok {
                        sb += 1
                    }
                    cnt[nums[left]] -= 1
                }
                right += 1
            }
            m += 1
        }
        return sb
    }

}


