//https://leetcode.com/problems/employee-importance/
class Employee {
public:
    // It's the unique ID of each node.
    // unique id of this employee
    int id;
    // the importance value of this employee
    int importance;
    // the id of direct subordinates
    vector<int> subordinates;
};
class Solution {
public:
    int getImportance(vector<Employee*> employees, int id) {
        Employee* employeesArr[2001];
        bool caculated[2001];
        for (size_t i = 0; i < 2001; i++)
        {
            employeesArr[i] = nullptr;
            caculated[i] = false;
        }
        for(Employee* employee : employees)
        {
            employeesArr[employee->id] = employee;
        }
        if (employeesArr[id] == nullptr) {
            return 0;
        }
        int importance = 0;
        queue<int> ids = queue<int>();
        ids.push(id);
        while (!ids.empty()) {
            int length = ids.size();
            for (size_t i = 0; i < length; i++)
            {
                int currentId = ids.front();
                ids.pop();
                importance += employeesArr[currentId]->importance;
                caculated[currentId] = true;
                for (auto subordinate : employeesArr[currentId]->subordinates)
                {
                    if (!caculated[subordinate]) {
                        ids.push(subordinate);
                    }
                }
            }
        }
        return importance;
    }
};