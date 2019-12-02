import java.lang.*;
import java.util.*;
import java.io.*;
class StackUnderflowException extends Exception{
    public StackUnderflowException(){
        super();
    }
    public StackUnderflowException(String s){
        super(s);
    }
}
class StackOverflowException extends Exception{
    public StackOverflowException(){
        super();
    }
    public StackOverflowException(String s){
        super(s);
    }
}
class Stack{
    private int stack[];
    private int top = 0;
    public Stack(int n){
        stack = new int[n];
    }
    public void push(int val) throws StackOverflowException{
        if(top >= stack.length)
            throw new StackOverflowException("Push on Full Stack");
        stack[top] = val;
        top++;
    }
    public int pop() throws StackUnderflowException{
        if(top<=0)
            throw new StackUnderflowException("Pop on Empty Stack");
        return stack[--top];
    }
    public int peep() throws StackUnderflowException{
        if(top == 0)
             throw new StackUnderflowException("Peep on Empty Stack");
        return stack[top-1];
    }
    public static void main(String[] args){
        Stack s = new Stack(3);
        try{
            int val = 1;
            //s.peep();
            s.push(val);
            val++;
            System.out.println("STACK TOP: " + s.peep());
            s.push(val);
            val++;
            System.out.println("STACK TOP: " + s.peep());
            s.push(val);
            val++;
            System.out.println("STACK TOP: " + s.peep());
            s.push(val);
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
}
