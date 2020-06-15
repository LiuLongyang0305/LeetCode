// https://leetcode.com/problems/find-two-non-overlapping-sub-arrays-each-with-target-sum/
class Solution {
    private typealias Indices = (from: Int, to: Int)
    private typealias PairIndices = (left: Indices?, right: Indices?)
    func minSumOfLengths(_ arr: [Int], _ target: Int) -> Int {
        guard arr.count > 2 else {
            return arr.count == 2 ? (arr[0] == target && arr[1] == target ? 2 : -1) : -1
        }
        let total = arr.reduce(0) { $0 + $1}
        guard total >= target * 2 else {
            return -1
        }
        var prefix = [0:-1]
        var sum = 0
        let N = arr.count
        var map = [Int: PairIndices]()
        for i in 0..<N {
            sum += arr[i]
            let remain = -target + sum
            if let index = prefix[remain] {
                let l = i - index
                if nil == map[l] {
                    map[l] = ((index + 1, i),(index + 1,i))
                } else {
                    map[l]?.right = (index + 1, i)
                }
            }
            prefix[sum] = i
        }
//        print(map)
        guard !map.isEmpty else {
            return -1
        }
        let exisitLengths = map.keys.sorted()
        let M = exisitLengths.count
        var pairs = [(Int, Int )] ( )
        for i in 0...(M - 1) {
            for j in i..<M {
                pairs.append((i,j))
            }
        }
        let sortedPairs = pairs.sorted { (pair1, pair2) -> Bool in
            exisitLengths[pair1.0] + exisitLengths[pair1.1] < exisitLengths[pair2.0] + exisitLengths[pair2.1]
        }
        // print(sortedPairs)
        for pair in sortedPairs {
            guard let pairIndices1 = map[exisitLengths[pair.0]] else {
                 continue
             }
            guard let pairIndices2 = map[exisitLengths[pair.1]]else {
                 continue
             }
            if let l = pairIndices1.left, let r  = pairIndices2.right, l.to < r.from {
                return exisitLengths[pair.0] + exisitLengths[pair.1]
            }
            if let l = pairIndices2.left, let r  = pairIndices1.right, l.to < r.from {
                return exisitLengths[pair.0] + exisitLengths[pair.1]
            }
        }
        return -1
    }
}

