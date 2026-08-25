    //https://leetcode.cn/problems/widest-possible-fence/
    class Solution {
        func maximumWidth(_ planks: [Int]) -> Int {
            var counter = [Int:Int]()
            for p in planks {
                counter[p,default: 0] += 1
            }
            let sortedCounter = counter.sorted { p1, p2 in
                p1.key < p2.key
            }
            var cntPair = [Int:Int]()
            let M = sortedCounter.count
            for (i,(h,c)) in sortedCounter.enumerated() {
                cntPair[h,default: 0] += c
                cntPair[h * 2,default: 0] += c / 2
                for j in stride(from: i + 1, to: M , by: 1) {
                    let (h1,c1) = sortedCounter[j]
                    cntPair[h + h1,default: 0] += min(c,c1)
                }
            }

            return cntPair.values.max()!
        }
    }
