   //https://leetcode.cn/problems/design-task-manager/
    class TaskManager {

        private struct Task: Comparable, Hashable {
            static func < (lhs: TaskManager.Task, rhs: TaskManager.Task) -> Bool {
                if lhs.priority == rhs.priority {
                    return lhs.taskId < rhs.taskId
                }
                return lhs.priority < rhs.priority
            }

            var userId:Int
            var taskId: Int
            var priority:Int
        }


        private let debug: Bool = false
        private var heap = Heap<Task>()
        private var taskToPriority = [Int:Task]()


        init(_ tasks: [[Int]]) {
            for task in tasks {
                add(task[0], task[1], task[2])
            }
        }

        func add(_ userId: Int, _ taskId: Int, _ priority: Int) {
            let t = Task(userId: userId, taskId: taskId, priority: priority)
            taskToPriority[taskId] = t
            heap.insert(t)
            if debug {
                print("\(#function)  task = \(t)")
            }
        }

        func edit(_ taskId: Int, _ newPriority: Int) {
            add(taskToPriority[taskId]!.userId,taskId,newPriority)
        }

        func rmv(_ taskId: Int) {
            taskToPriority[taskId]?.priority = -1
        }

        func execTop() -> Int {
            while let max = heap.popMax(), let curTask = taskToPriority[max.taskId] {
                if max == curTask {
                    rmv(max.taskId)
                    return max.userId
                }
            }
            return -1
        }
    }