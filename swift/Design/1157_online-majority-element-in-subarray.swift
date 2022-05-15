// https://leetcode.com/problems/online-majority-element-in-subarray/
class MajorityChecker {

    class SegmentTreeNode: CustomStringConvertible {
        var description: String {
            return "(l = \(left)  r = \(right)  val = \(value) cnt = \(cnt))"
        }

        var left: Int = -1
        var right: Int = -1
        var value: Int = -1
        var cnt = 0
    }


    var segmentTree = [SegmentTreeNode]()

    var values: [Int]


    var valueToIndices = [Int:[Int]]()

    init(_ arr: [Int]) {
        self.values = arr
        let N = arr.count
//        self.segmentTree = [SegmentTreeNode](repeating: SegmentTreeNode(), count: N * 4)
        for _ in 0..<(N << 2) {
            self.segmentTree.append(SegmentTreeNode())
        }
        for i in 0..<N {
            valueToIndices[arr[i], default: [-1]].append(i)
        }
        for (k,_) in valueToIndices {
            valueToIndices[k]?.append(100000)
        }
        // print(valueToIndices)
        build(1, 0, arr.count - 1)
    }

    func query(_ left: Int, _ right: Int, _ threshold: Int) -> Int {
        let val = ask(1, left, right).value
        guard let indices = valueToIndices[val] else {return -1}
        let l = binarySearch(in: indices, left)
        var r = binarySearch(in: indices, right)
        if indices[r] == right {
            r += 1
        }
        // print("\(val)   \(l)  \(r)")
        return r - l >= threshold ? val : -1
    }

    private func build(_ u: Int, _ l: Int, _ r: Int){
        segmentTree[u].left = l
        segmentTree[u].right = r
        guard l != r else {
            segmentTree[u].cnt = 1
            segmentTree[u].value = values[l]
            return
        }
        let mid = (l + r) >> 1
        build(u << 1, l, mid)
        build(u << 1 | 1, mid + 1, r)
        pushUP(u)
    }


    private func pushUP(_ u: Int) {
        let t = add(lhs: segmentTree[u << 1], rhs: segmentTree[u << 1 | 1])
        segmentTree[u].cnt = t.cnt
        segmentTree[u].value = t.value
    }


    private func ask(_ u:Int, _ l: Int, _ r: Int) -> SegmentTreeNode {
        if l == segmentTree[u].left && r == segmentTree[u].right {
            return segmentTree[u]
        }
        let mid = (segmentTree[u].left + segmentTree[u].right) >> 1
        if r <= mid {
            return ask(u << 1, l, r)
        }
        if l > mid {
            return ask(u << 1 | 1, l, r)
        }
        return add(lhs: ask(u << 1, l, mid) , rhs: ask(u << 1 | 1, mid + 1, r))
    }


    private func add(lhs: SegmentTreeNode, rhs: SegmentTreeNode) -> SegmentTreeNode {
        let ans = SegmentTreeNode()
        if(lhs.value == rhs.value) {
            ans.value = lhs.value
            ans.cnt = lhs.cnt + rhs.cnt
        } else if (lhs.cnt < rhs.cnt) {
            ans.value = rhs.value
            ans.cnt = rhs.cnt - lhs.cnt
        } else {
            ans.value = lhs.value
            ans.cnt = lhs.cnt - rhs.cnt
        }
        return ans
    }

    private func  binarySearch(in arr: [Int], _ target: Int) -> Int {
        var left = 0
        var right = arr.count - 1
        while left < right {
            let mid = (left + right) >> 1
            if arr[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}
