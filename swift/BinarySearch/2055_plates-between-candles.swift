// https://leetcode.com/problems/plates-between-candles/
class Solution {
    private let minIndex = -1;
    private let maxIndex = 100005
    func platesBetweenCandles(_ s: String, _ queries: [[Int]]) -> [Int] {
        var preffix = [0]
        var cur = 0
        var indices = [Int]()
        var idx = 0
        s.forEach { ch in
            if ch == "*" {
                cur += 1
            } else {
                indices.append(idx)
            }
            idx += 1
            preffix.append(cur)
        }
        guard indices.count >= 2 else {
            return [Int](repeating: 0, count: queries.count)
        }
        indices.insert(minIndex, at: 0)
        indices.append(maxIndex)
        var ans = [Int]()
        //>=
        func lowwerBound(_ val: Int) -> Int {
            var left = 0
            var right = indices.count - 1
            while left < right {
                let mid = (left + right) >> 1
                if indices[mid] >= val {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            return indices[left]
        }
        //<=
        func upperBound(_ val: Int) -> Int {
            var left = 0
            var right = indices.count - 1
            while left < right {
                let mid = (left + right + 1) >> 1

                if indices[mid] <= val {
                    left = mid
                } else {
                    right = mid - 1
                }
            }
            return indices[left]
        }
        for query in queries {
            let left = lowwerBound(query[0])
            guard left < maxIndex else {
                ans.append(0)
                continue
            }
            let right = upperBound(query[1])
            guard right > minIndex else {
                ans.append(0)
                continue
            }
            guard right >= left else {
                ans.append(0)
                continue
            }
            ans.append(preffix[right] - preffix[left])
        }
        return ans
    }
}


class Solution {
    func platesBetweenCandles(_ s: String, _ queries: [[Int]]) -> [Int] {
        let chars = [Character](s)
        var  ans = [Int]()
        let N = s.count
        var preffix = [0]
        var left = [-1]
        var right = [N]
        for i in 0..<N{
            if chars[i] == "*" {
                preffix.append(preffix.last! + 1)
                left.append(left.last!)
            } else {
                preffix.append(preffix.last!)
                left.append(i)
            }
        }
        for i in stride(from: N - 1, through: 0, by: -1) {
            if chars[i] == "*" {
                right.insert(right.first!, at: 0)
            } else {
                right.insert(i, at: 0)
            }
        }
//        print(left)
//        print(right)
        for query in queries {
            let l = right[query[0]]
            let r = left[query[1] + 1]
            if l == N || r == -1 || l >= r {
                ans.append(0)
            } else {
                ans.append(preffix[r] - preffix[l])
            }
        }
        return ans
    }
}