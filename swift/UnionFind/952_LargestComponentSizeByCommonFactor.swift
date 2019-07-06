//https://leetcode.com/problems/largest-component-size-by-common-factor
/*
Fail case:
key = 2 value = [114, 651, 147, 610, 674, 74, 240, 369, 621, 897, 535, 959, 190, 416, 629, 111, 778, 187, 161, 387, 944, 45, 272, 810, 35, 296, 414, 960, 522, 7, 567, 48, 291, 880, 905, 406, 206, 737, 142, 429, 417, 770, 519, 81, 266, 833, 432, 926, 981, 669, 494, 508, 816, 207, 405, 180, 2, 314, 407, 591, 966, 274, 1000, 93, 195, 292, 194, 425, 26, 985, 260, 68, 526, 86, 602, 218, 390, 270, 841, 785, 963, 290, 938]
key = 929 value = [929]
key = 757 value = [757]
key = 641 value = [641]
key = 79 value = [79]
key = 131 value = [131]
key = 349 value = [349]
key = 229 value = [229]
key = 163 value = [163]
key = 463 value = [463]
key = 487 value = [487]
key = 449 value = [449]
key = 457 value = [457]
key = 659 value = [659]
key = 829 value = [829]
*/

class Solution {
    class UnionFind {
        var parents = Array<Int>(0..<100001)
        
        func union(x: Int, y: Int) {
            let parentX = find(x: x)
            let parentY = find(x: y)
            
            if parentY == y {
                parents[parentX] = parentY
            } else if parentX == x {
                parents[parentY] = parentX
            } else {
                parents[parentX] = parentY
            }
        }
        func find(x: Int) -> Int {
            
            var currentRoot = x
            var temp = x
            
            while  parents[currentRoot] != currentRoot {
                currentRoot = parents[currentRoot]
            }
            while temp != parents[temp] {
                let nextRoot = parents[temp]
                parents[temp] = currentRoot
                temp = nextRoot
            }
            return currentRoot
        }
        
        func connected(x: Int, y: Int) -> Bool {
            let parentX = find(x: x)
            let parentY = find(x: y)
            return parentX == parentY
        }
        
    }
    let maxFactor = 314//sqrt(100000)
    let factors = [ 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101,
                    103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197,
                    199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313]
    func largestComponentSize(_ A: [Int]) -> Int {
        
        var count = Dictionary<Int,[Int]>()
        for factor in factors {
            count[factor] = [Int]()
        }
        
        let unionFind = UnionFind()
        
        func unionElements(factor: Int, tail: Int) {
            for node in count[factor]! {
                if !unionFind.connected(x: node, y: tail) {
                    unionFind.union(x: node, y: tail)
                }
            }
            count[factor]?.append(tail)
        }
        
        for element in A {
            if factors.contains(element) {
                unionElements(factor: element, tail: element)
            }  else {
                var i = 0
                while i < factors.count &&  factors[i] <= element / 2 {
                    if element % factors[i] == 0 {
                        unionElements(factor: factors[i], tail: element)
                    }
                    i += 1
                }
            }
        }
        
        var rootToNodes = Dictionary<Int,Set<Int>>()
        for ele in A {
            let par = unionFind.find(x: ele)
            if nil == rootToNodes[par] {
                rootToNodes[par] = Set<Int>()
            }
            rootToNodes[par]?.insert(ele)
        }
        //        print(count.filter({ (key,value) -> Bool in
        //            !value.isEmpty
        //        }))
        //        print(rootToNodes)
        
        var maxSize = 0
        for (_,value) in rootToNodes {
            if value.count > maxSize {
                maxSize = value.count
            }
        }
        
        return maxSize
    }
}
