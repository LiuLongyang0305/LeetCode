// https://leetcode-cn.com/problems/fu-za-lian-biao-de-fu-zhi-lcof/
/*
// Definition for a Node.
class Node {
public:
    int val;
    Node* next;
    Node* random;
    
    Node(int _val) {
        val = _val;
        next = NULL;
        random = NULL;
    }
};
*/
class Solution {
public:
    Node* copyRandomList(Node* head) {
        if (nullptr == head) {
            return head;
        }
        if (nullptr == head->next) {
            Node *ans = new Node(head->val);
            if(nullptr != head->random  ) {
                ans->random = ans;
            }
            return ans;
        }
        // printNodes(head);
        //copy nodes
        Node *temp = head;
        while(nullptr != temp) {
            Node *copy = new Node(temp->val);
            Node *next = temp->next;
            temp->next = copy;
            copy->next = next;
            temp = next;
        }
        // printNodes(head);
        // copy next pointers
        temp = head;
        while(nullptr != temp) {
            if (nullptr != temp->random ) {
                temp->next->random = temp->random->next;
            } else {
                temp->next->random = nullptr;
            }
            
            temp = temp->next->next;
        }
        // printNodes(head);
        // split source and copy 
        temp = head;
        Node *temp2 = head->next;
        Node *ans = head->next;

        while(nullptr != temp2 && nullptr != temp) {
            temp->next = temp2->next;
            if (nullptr != temp) {
                temp = temp->next;
            }
            if (nullptr != temp) {
                temp2->next = temp->next;
                temp2 = temp2->next;
            }
        }
        // printNodes(ans);
        return ans;
    }

    private:
    void printNodes(Node *head) {
        vector<int> ans = vector<int>();
        while(head != nullptr) {
            cout << " [" << head->val << "," << (head->random ? head->random->val : -1) << "]  " ; 
            head = head->next;
        }
        std::cout << endl;
    }
};