// https://leetcode.com/problems/course-schedule-iii/submissions/
import CoreFoundation
extension CFBinaryHeap {
    public static func getMaxHeap() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = { a,b,_ in
            let x = a!.load(as: Int.self)
            let y = b!.load(as: Int.self)
            return x == y ? .compareEqualTo : (x > y ? .compareLessThan : .compareGreaterThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}
class Solution {
    func scheduleCourse(_ courses: [[Int]]) -> Int {
        let sortedCourses = courses.sorted { c1, c2 in
            return c1[1] < c2[1]
        }
        print(sortedCourses)
        let maxHeap = CFBinaryHeap.getMaxHeap()
        var pointer: UnsafeMutablePointer<Int> = .allocate(capacity: 1)
        var time = 0
        for course in sortedCourses {
            if time + course[0] <= course[1] {
                pointer = .allocate(capacity: 1)
                pointer.initialize(to: course[0])
                time += course[0]
                CFBinaryHeapAddValue(maxHeap,pointer)
                continue
            }
            if CFBinaryHeapGetCount(maxHeap) > 0 {
                let top = CFBinaryHeapGetMinimum(maxHeap).load(as: Int.self)
                if top > course[0] {
                    time += course[0] - top
                    CFBinaryHeapRemoveMinimumValue(maxHeap)
                    pointer = .allocate(capacity: 1)
                    pointer.initialize(to: course[0])
                    CFBinaryHeapAddValue(maxHeap, pointer)
                }
                
            }
        }
        let ans = CFBinaryHeapGetCount(maxHeap)
        CFBinaryHeapRemoveAllValues(maxHeap)
        pointer.deallocate()
        return ans
    }
}