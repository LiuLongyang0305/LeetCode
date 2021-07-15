 // https://leetcode.com/problems/sequence-reconstruction/
class Solution {
    func sequenceReconstruction(_ org: [Int], _ seqs: [[Int]]) -> Bool {
        guard !seqs.isEmpty else {
            return false
        }
        let N = org.count
        for seq in seqs {
            for num in seq {
                guard num >= 1 && num <= N  else {
                    return false
                }
            }
        }
        var inDegree = Array<Int>(repeating: 0, count: N + 1)
        var outNodes = Array<Set<Int>>(repeating: [], count: N + 1)
        for seq in seqs {
            var i = 0
            while i < seq.count - 1 {
                if !outNodes[seq[i]].contains(seq[i + 1]) {
                    outNodes[seq[i]].insert(seq[i + 1])
                    inDegree[seq[i + 1]] += 1
                }
                i += 1
            }
        }
        
        //construct sequence
        var queue = [Int]()
        for num in 1...N {
            if inDegree[num] == 0 {
                queue.append(num)
            }
        }
        var idx = 0
        while !queue.isEmpty {
            guard queue.count == 1 else {
                return false
            }
            guard org[idx] == queue[0] else {
                return false
            }
            var newLevel = [Int]()
            for next in outNodes[queue[0]] {
                inDegree[next] -= 1
                if inDegree[next] == 0 {
                    newLevel.append(next)
                }
            }
            queue = newLevel
            idx += 1
        }
        for id in inDegree {
            guard id == 0 else {
                return false
            }
        }
        return true
    }
}