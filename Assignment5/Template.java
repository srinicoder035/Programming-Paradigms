import java.io.*;
import java.lang.*;
import java.util.*;

class TemplatePrototype <T>{
    public T val;
    
    TemplatePrototype(T obj){
        this.val = obj;
    }

    T printData(){
        return this.val;
    }

}

public class Template{
    public static void main(String[] args){
        TemplatePrototype<String> tt = new TemplatePrototype<String>("string template");
        System.out.println("The data is " + tt.printData());
        TemplatePrototype<Integer> tt1 = new TemplatePrototype<Integer>(15);
        System.out.println("The data is " + tt1.printData());
    }
}