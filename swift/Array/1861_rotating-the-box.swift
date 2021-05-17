// https://leetcode.com/problems/rotating-the-box/
class Solution {
    func rotateTheBox(_ box: [[Character]]) -> [[Character]] {
        let M = box.count
        let N = box[0].count
        var ans = Array<Array<Character>>(repeating: Array<Character>(repeating: " ", count: M), count: N)
        for r in 0..<M {
            let rel = getCol(from: box[r])
            for idx in 0..<N {
                ans[idx][M - 1 - r] = rel[idx]
            }
        }
        return ans
    }
    private func getCol(from row: [Character]) -> [Character] {
        let M = row.count
        var preffix = [0]
        var cnt = 0
        for ch in row {
            if ch == "#" {
                cnt += 1
            } else if ch == "*" {
                cnt = 0
            }
            preffix.append(cnt)
            
        }
        // print(preffix)
        var ans = Array<Character>(repeating: ".", count: M)
        for idx in 0..<M {
            if row[idx] ==  "*" {
                if preffix[idx] > 0 {
                    for i  in 0..<preffix[idx] {
                        ans[idx - 1 - i] = "#"
                    }
                }
                ans[idx] = "*"
            } else if idx  == M - 1 {
                if preffix[idx + 1]  >  0  {
                    for i in 0..<preffix[idx + 1] {
                        ans[idx - i] = "#"
                    }
                }
            }
        }
        return ans
    }
}