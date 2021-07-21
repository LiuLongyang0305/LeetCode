// https://leetcode.com/problems/rearrange-string-k-distance-apart/
import CoreFoundation

typealias CharsCounter = (val:Character,cnt:Int)

extension CFBinaryHeap {
    class func getMaxHeapOfCharsCounter() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = { a,b,_ in
            
            let c1 = a!.load(as: CharsCounter.self)
            let c2 = b!.load(as: CharsCounter.self)
            return c1.cnt == c2.cnt ? (c1.val < c2.val ? . compareLessThan : .compareGreaterThan) : (c1.cnt < c2.cnt ? .compareGreaterThan : .compareLessThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}

class Solution {
    func rearrangeString(_ s: String, _ k: Int) -> String {
        guard k > 0 else {
            return s
        }
        var charsCnt = [Character:Int]()
        for ch in s {
            charsCnt[ch,default: 0 ] += 1
        }
        var pointer: UnsafeMutablePointer<CharsCounter> = .allocate(capacity: 1)
        let heap = CFBinaryHeap.getMaxHeapOfCharsCounter()
        for (ch,cnt) in charsCnt {
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: (ch,cnt))
            CFBinaryHeapAddValue(heap, pointer)
        }
        var ans = ""
        var queue = [CharsCounter]()
        while CFBinaryHeapGetCount(heap) > 0 {
            let top = CFBinaryHeapGetMinimum(heap).load(as: CharsCounter.self)
            CFBinaryHeapRemoveMinimumValue(heap)
            ans.append(top.val)
            queue.append((top.val,top.cnt - 1))
            if queue.count == k {
                for temp in queue {
                    if temp.cnt > 0 {
                        pointer = .allocate(capacity: 1)
                        pointer.initialize(to: temp)
                        CFBinaryHeapAddValue(heap, pointer)
                    }
                }
                queue = []
            }
        }
        pointer.deallocate()
        return ans.count == s.count ? ans : ""
    }
}