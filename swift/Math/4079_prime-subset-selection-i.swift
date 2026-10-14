//https://leetcode.cn/problems/vim /
let mx = 1_000_001
var isPrimer = [Bool](repeating: true, count: mx)
var primers = [Int]()
var preffixSum = [0]

func process() {
    var s = 0
    for i in 2..<mx {
        if isPrimer[i] {
            primers.append(i)
            s += i
            preffixSum.append(s)
            for j in stride(from: i * i, to: mx, by: i){
                isPrimer[j] = false
            }
        }
    }
}

process()
preffixSum.append(1_000_000_007)

func binarySearchForLastSmallerThanOrEqualTo(_ target: Int, in arr: [Int]) -> Int? {
    guard target >= 2 else {return nil}
    var l = 0
    var r = arr.count - 1
    while l < r {
        let mid = (l + r + 1) >> 1
        if arr[mid] <= target {
            l = mid
        } else {
            r = mid - 1
        }
    }
    return l
}

class Solution {
    func maxPrimes(_ n: Int, _ s: Int) -> [Int] {
        guard let idx = binarySearchForLastSmallerThanOrEqualTo(s,in : preffixSum), idx > 0 else {return []}
        guard let idx2 = binarySearchForLastSmallerThanOrEqualTo(n, in: primers) else  {
            return []
        }
        return [Int](primers[...min(idx - 1,idx2)])
    }
}
