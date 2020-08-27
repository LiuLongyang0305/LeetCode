// https://leetcode.com/problems/find-latest-group-of-size-m/
class Solution {
    func findLatestStep(_ arr: [Int], _ m: Int) -> Int {
        var ans = -1
        let N = arr.count
        
        var start = Array<Int?>(repeating: nil, count: N)
        var end = Array<Int?>(repeating: nil, count: N)
        var length = [Int:Set<[Int]>]()
        
        for i in 0..<N {
            let idx = arr[i] - 1
            start[idx] = idx
            end[idx] = idx
            var flag = false
            if idx + 1 < N {
                if let idx2 = start[idx + 1] {
                    length[idx2 - idx]?.remove([idx + 1, idx2])
                    start[idx] = idx2
                    flag = true
                    length[idx2 - idx + 1, default: [] ].insert([idx,idx2])
                    start[idx + 1] = nil
                }
            }
            if idx > 0 {
                if let idx2 = end[idx - 1] {
                    flag = true
                    length[idx - idx2]?.remove([idx2,idx - 1])
                    end[idx] = idx2
                    end[idx - 1] = nil
                    length[idx - idx2 + 1, default: []].insert([idx2,idx])
                }
            }
            if flag {
                if let left = end[idx], let right = start[idx] {
                    length[idx - left + 1 ]?.remove([left,idx])
                    length[right - idx + 1]?.remove([idx,right])
                    start[idx] = nil
                    end[idx] = nil
                    start[left] = right
                    end[right] = left
                    length[right - left + 1, default: [] ].insert([left,right])
                }
            } else {
                length[1, default: [] ].insert([idx,idx])
            }
            if let indices = length[m],!indices.isEmpty {
                ans = max(ans, i + 1)
            }
        }
        return ans
    }
}

