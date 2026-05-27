 // https://leetcode.cn/problems/number-of-pairs-after-increment/
class Solution {

    private struct BlockInfo {
        var left: Int
        var right: Int
        var add: Int
        var counter: [Int:Int]

    }

    func numberOfPairs(_ nums1: [Int], _ nums2: [Int], _ queries: [[Int]]) -> [Int] {
        let M = nums1.count
        let N = nums2.count
        let B = Int(sqrt(Double(M * N)))
        var nums2Copy = nums2
        var blocks = [BlockInfo]()

        for i in stride(from: 0, to: N, by: B) {
            let r = min(i + B, N)
            var counter = [Int:Int]()
            for j in i..<r {
                counter[nums2[j],default: 0] += 1
            }
            blocks.append(BlockInfo(left: i, right: r, add: 0, counter: counter))
        }

        var sb = [Int]()

        func ope2(_ target: Int) {
            var res = 0
            for block in blocks {
                let curTarget = target - block.add
                for num in nums1 {
                    res += (block.counter[curTarget - num] ?? 0)
                }
            }
            sb.append(res)
        }

        func update(_ blockIdx: Int, left:Int, _ right: Int, _ add: Int) {
            var counter = blocks[blockIdx].counter
            for idx in left..<right {
                counter[nums2Copy[idx],default: 0] -= 1
                nums2Copy[idx] += add
                counter[nums2Copy[idx],default: 0] += 1
            }
            blocks[blockIdx].counter = counter
        }

        func ope1(_ l: Int, _ r: Int, _ add: Int) {
            for i in 0..<blocks.count {
                if blocks[i].left >= r {break}
                if blocks[i].right <= l {continue}
                if l <= blocks[i].left && blocks[i].right <= r {
                    blocks[i].add += add
                    continue
                }

                update(i, left: max(blocks[i].left,l), min(blocks[i].right,r), add)
            }
        }



        for q in queries {
            if q[0] == 2 {
                ope2(q[1])
            } else {
                ope1(q[1], q[2] + 1, q[3])
            }
        }
        return sb
    }
}
