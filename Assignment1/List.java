import java.io.*;
import java.util.*;

class List{

    NODE head;

    static class NODE{
        int data;
        NODE next;

        NODE(int d){
            data = d;
            next = null;
        }
    }

    List(){
        head = null;
    }

    public static List insertNode(List li,int val){

        NODE temp = new NODE(val);

        if(li.head == null){
            li.head = temp;
        }
        else{
            NODE prev = li.head;
            while(prev.next!=null){
                prev = prev.next;
            }
            prev.next = temp;
        }
        return li;

    }

    public static List deleteNode(List li,int val){
        if(li.head == null){
            System.out.println("List empty");
            return li;
        }
        if(li.head.data == val){
            li.head = li.head.next;
            return li;
        }

        NODE temp = li.head;
        int fl = 0;
        while(temp!=null){
            if(temp.data == val){
                fl = 1;
                break;
            }
            temp = temp.next;
        }
        if(fl == 0){
            System.out.println("Node not found");
            return li;
        }
        NODE temp1 = li.head;
        while(temp1.next!=temp){
            temp1 = temp1.next;
        }
        temp1.next = temp.next;
        return li;
    }
    
    public static void printlist(List li){
        NODE temp = li.head;
        System.out.println("Printing the list");
        while(temp!=null){
            System.out.print(temp.data + " ");
            temp = temp.next;
        }
        System.out.println();
    }

    public static void main(String[] args){
        List li = new List();
        li = insertNode(li,1);
        li = insertNode(li,2);
        li = insertNode(li,3);
        printlist(li);
        li  = deleteNode(li,3);
        printlist(li);
    }
}
