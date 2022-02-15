//https://leetcode.com/problems/20/
import CoreFoundation
struct Node:Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        guard lhs.cost != rhs.cost else {
            return lhs.discountsCnt < rhs.discountsCnt
        }
        return lhs.cost < rhs.cost
    }
    
    var node:Int
    var cost:Int
    var discountsCnt:Int
}

extension CFBinaryHeap {
    public static func getMinHeapOfNode() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = {  a, b,_ in
            let x = a!.load(as: Node.self)
            let y = b!.load(as: Node.self)
            return x < y ? .compareLessThan : .compareGreaterThan
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}


class Solution {
    
    private typealias pair = (to:Int,cost:Int)
    private let INF = 1_000_000_007
    
    func minimumCost(_ n: Int, _ highways: [[Int]], _ discounts: Int) -> Int {
        var  graph = [[pair]](repeating: [], count: n)
        for highway in highways {
            let (f,t,w) = (highway[0],highway[1],highway[2])
            graph[f].append((t,w))
            graph[t].append((f,w))
        }
        
        var dis = [[Int]](repeating: [Int](repeating: INF, count: discounts + 1), count: n)

        
        let minHeap = CFBinaryHeap.getMinHeapOfNode()
        var pointer: UnsafeMutablePointer<Node> = .allocate(capacity: 1)
        func update(_ node: Node) {
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: node)
            CFBinaryHeapAddValue(minHeap, pointer)
        }
        update( Node(node: 0, cost: 0, discountsCnt: 0))
        while CFBinaryHeapGetCount(minHeap) > 0 {
            let top = CFBinaryHeapGetMinimum(minHeap).load(as: Node.self)
            CFBinaryHeapRemoveMinimumValue(minHeap)
            guard top.discountsCnt <= discounts else {continue}
            guard top.node != n - 1 else {return top.cost}
            if top.cost < dis[top.node][top.discountsCnt] {
                dis[top.node][top.discountsCnt] = top.cost
                for (next,weight) in graph[top.node] {
                    //不打折
                    update(Node(node: next, cost: top.cost + weight, discountsCnt: top.discountsCnt))
                    //打折
                    update(Node(node: next, cost: top.cost + weight / 2, discountsCnt: top.discountsCnt + 1))
                }
            }
        }
        return -1
    }
}