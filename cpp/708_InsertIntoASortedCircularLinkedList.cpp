// https://leetcode.com/problems/insert-into-a-sorted-circular-linked-list/
class Node {
public:
    int val;
    Node *next;

    Node() {}

    Node(int _val) {
        val = _val;
        next = NULL;
    }

    Node(int _val, Node *_next) {
        val = _val;
        next = _next;
    }
};

class Solution {
public:
    Node *insert(Node *head, int insertVal) {
        Node *node = new Node(insertVal);
        if (nullptr == head) {
            node->next = node;
            return node;
        }
        if (head->next == head) {
            head->next = node;
            node->next = head;
            return head;
        }

        Node *temp = head->next;
        int maxVal = head->val;
        int minVal = head->val;


        while (temp != head) {
            if (temp->val > maxVal) {
                maxVal = temp->val;
            }
            if (temp->val < minVal) {
                minVal = temp->val;
            }
            temp = temp->next;
        }
        Node *maxNode = nullptr;
        Node *minNode = nullptr;
        if (head->val == maxVal && head->next->val == minVal) {
            maxNode = head;
            minNode = head->next;
        } else {
            temp = head->next;
            while (temp != head) {
                if (temp->val == maxVal && temp->next->val == minVal) {
                    maxNode = temp;
                    minNode = temp->next;
                    break;
                }
                temp = temp->next;
            }
        }
        if (insertVal <= minVal) {
            node->next = minNode;
            maxNode->next = node;
            return head;
        }
        if (insertVal >= maxVal) {
            node->next = maxNode->next;
            maxNode->next = node;
            return head;
        }

        Node *slow = minNode, *fast = minNode->next;
        while (fast != maxNode->next) {
            if (insertVal >= slow->val && insertVal <= fast->val) {
                node->next = fast;
                slow->next = node;
                break;
            }
            slow = slow->next;
            fast = fast->next;
        }
        return head;
    }
};