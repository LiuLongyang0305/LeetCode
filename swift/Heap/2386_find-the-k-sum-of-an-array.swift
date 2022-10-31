// https://leetcode.com/problems/find-the-k-sum-of-an-array/
class Solution {
    func kSum(_ nums: [Int], _ k: Int) -> Int {
        var sum = 0
        var copy = nums
        let N = nums.count
        for i in 0..<N {
            if copy[i] >= 0 {
                sum += copy[i]
                copy[i] *= -1
            }
        }
        copy.sort { $0 > $1}
        if copy.count > k {
            copy.removeLast(N - k)
        }
        var last = [sum]
        var cur = [Int]()
        for num in copy {
            let new = last.map({ $0 + num})
            var i = 0
            var j = 0
            while i < last.count && j < new.count && cur.count < k {
                if last[i] >= new[j] {
                    cur.append(last[i])
                    i += 1
                } else {
                    cur.append(new[j])
                    j += 1
                }
            }

            while i < last.count && cur.count < k {
                cur.append(last[i])
                i += 1
            }
            while j < new.count && cur.count < k {
                cur.append(new[j])
                j += 1
            }
            last = cur
            cur = []
        }
        return last[k - 1]
    }
}



import CoreFoundation
struct Info {
    var subSum: Int
    var nextIdx: Int
}
extension CFBinaryHeap {
    static public func getHeapOfInfo() -> CFBinaryHeap? {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = {  a, b,_ in
            let x = a!.load(as: Info.self)
            let y = b!.load(as: Info.self)
            return x.subSum > y.subSum ? .compareLessThan : .compareGreaterThan
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}



class Solution1 {
    func kSum(_ nums: [Int], _ k: Int) -> Int {
        var tot = 0
        var copy = nums
        let N = nums.count
        for i in 0..<N {
            if copy[i] >= 0 {
                tot += copy[i]
            } else {
                copy[i] *= -1
            }
        }
        copy.sort()
        var pointer : UnsafeMutablePointer<Info> = .allocate(capacity: 1)
        let heap  = CFBinaryHeap.getHeapOfInfo()


        func add(_ info: Info) {
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: info)
            CFBinaryHeapAddValue(heap, pointer)
        }

        add(Info(subSum: tot, nextIdx: 0))

        for _ in stride(from: k, to: 1, by: -1) {
            let top = CFBinaryHeapGetMinimum(heap).load(as: Info.self)
            let (sum,i) = (top.subSum,top.nextIdx)
            // print("sum = \(sum)   \(i)")
            CFBinaryHeapRemoveMinimumValue(heap)
            if top.nextIdx < N {
                add(Info(subSum: sum - copy[i], nextIdx: i + 1))
                if top.nextIdx > 0 {
                    add(Info(subSum: sum - copy[i] + copy[i - 1], nextIdx: i + 1))
                }
            }
        }

        return CFBinaryHeapGetMinimum(heap).load(as: Info.self).subSum
    }

}