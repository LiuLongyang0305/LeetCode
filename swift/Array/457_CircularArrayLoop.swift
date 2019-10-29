//https://leetcode.com/problems/circular-array-loop/
class Solution {
    func circularArrayLoop(_ nums: [Int]) -> Bool {

        //目前为止正向、反向的不可能成环的节点；以及当前检索j路径走过的节点。
        var forwardVisitedIndex = Set<Int>()
        var backwardVisitedIndex = Set<Int>()
        var currentPathVisitedIndex = Set<Int>()
        
        //判断当前路径是否成环
        func dfs(currentIndex: Int, isForward: Bool) -> Bool {
            
            //正向路径不能包含反向操作，反向路径不能包含正向操作
            guard (nums[currentIndex] > 0 && isForward) || (nums[currentIndex] < 0  && !isForward) else {
                return false
            }
            //当前路径中加入不可能成环的节点，直接返回
            guard (!forwardVisitedIndex.contains(currentIndex)   && isForward) || (!isForward  && !backwardVisitedIndex.contains(currentIndex))  else {
                return false
            }
            //计算下一个节点索引
            var nextIndex = currentIndex  + nums[currentIndex]
            nextIndex  %= nums.count
            if nextIndex < 0 {
                nextIndex += nums.count
            }
            //保证循环长度不是1
            if currentPathVisitedIndex.contains(currentIndex) {
                return currentIndex != nextIndex
            }
            currentPathVisitedIndex.insert(currentIndex)
            return dfs(currentIndex: nextIndex, isForward: isForward)
        }
        
        for i in 0..<nums.count {
            if nums[i] > 0 && !forwardVisitedIndex.contains(i) {
                currentPathVisitedIndex = []
                if dfs(currentIndex: i, isForward: true) {
                    return true
                }
                forwardVisitedIndex = forwardVisitedIndex.union(currentPathVisitedIndex)
                continue
            }
            if !backwardVisitedIndex.contains(i){
                currentPathVisitedIndex = []
                if dfs(currentIndex: i, isForward: false) {
                    return  true
                }
                backwardVisitedIndex = backwardVisitedIndex.union(currentPathVisitedIndex)
            }
        }
        return false
    }
}