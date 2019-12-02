class Node:

    def __init__(self, val):
        self.data = val
        self.next = None

class List:
    
    def __init__(self):  
        self.head = None
    
    def addNode(self,val):
        temp = Node(val)
        if self.head == None:
            self.head = temp
            return
        last = self.head
        while(last.next):
            last = last.next
        last.next = temp

    def deleteNode(self,val):
        if self.head == None:
            return False
        if self.head.data == val:
            self.head = self.head.next
            return True
        temp  = self.head
        while(temp):
            if(temp.data == val):
                break
            temp = temp.next
        if temp == None:
            return False
        temp1 = self.head
        while(temp1.next!=temp):
            temp1 = temp1.next
        temp1.next = temp.next
        return True
        
    def printList(self):
        temp = self.head
        while(temp):
            print(temp.data)
            temp = temp.next

if __name__ == '__main__':
    li = List()
    li.addNode(1)
    li.addNode(2)
    li.addNode(3)
    li.printList()
    if li.deleteNode(5):
        print("After deletion")
        li.printList()
    else:
        print("Node doesn't exist")