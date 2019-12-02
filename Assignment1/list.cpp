#include<iostream>
using namespace std;

typedef struct ls{

    int data;
    struct ls* next;

} LIST;


class List{

    private:

        LIST *head,*prev;            

    public:

        List(){
            head = NULL;
            prev = NULL;
        }

        LIST* createNode(int val){
            LIST* temp = new LIST();
            temp->data = val;
            temp->next = NULL;
            return temp;
        }

        void addNode(int val){
            if(head == NULL){
                head = createNode(val);
                prev = head;
            }
            else{
                prev->next = createNode(val);
                prev = prev->next;
            }
            
        }

        bool deleteNode(int val){
            if(!head){
                return false;
            }
            if(head->data == val){
                head = head->next;
                return true;
            }
            LIST* temp1 = head;
            int fl = 0;
            while(temp1){
                if(temp1->data == val){
                    fl = 1;
                    break;
                }
                temp1 = temp1->next;
            }
            if(!fl)
                return false;
            LIST* temp2 = head;
            while(temp2->next!=temp1){
                temp2 = temp2->next;
            }
            temp2->next = temp1->next;
            delete(temp1);
            return true;
        }

        void print(){
            LIST* temp = head;
            cout<<"Printing the linked list"<<endl;
            while(temp){
                cout<<temp->data<<" ";
                temp = temp->next;
            }
            cout<<endl;
            delete(temp);
        }


};

int main(){
    List li;
    li.addNode(1);
    li.addNode(2);
    li.addNode(3);
    li.print();
    if(li.deleteNode(1))
        li.print();
    else
        cout<<"Node not present in list"<<endl;
    return 0;
}