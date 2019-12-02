With Ada.Text_IO; Use Ada.Text_IO;  
With Ada.Integer_Text_IO; Use Ada.Integer_Text_IO;
With Ada.Numerics.Real_Arrays; Use Ada.Numerics.Real_Arrays;
 
procedure Matrix_Product is
 
   procedure Put (X : Real_Matrix) is
      type Fixed is delta 0.01 range -100.0..100.0;
   begin
      for I in X'Range (1) loop
         for J in X'Range (2) loop
            Put (Fixed'Image (Fixed (X (I, J))));
         end loop;
         New_Line;
      end loop;
   end Put;
 
    Matrix_A : constant Real_Matrix :=
         (  ( 5.0,  11.0,  11.0,   11.0),
            ( 3.0,  14.0,  18.0,  16.0),
            ( 1.0,  15.0, 27.0,  81.0),
            ( 7.0, 16.0, 4.0, 6.0)
         );
    Matrix_B : constant Real_Matrix :=
         (  (  4.0,-13.0,14.0,-10.0),
            (-13.0, 19.0,-7.0,11.0),
            (  23.0,-12.0,77.0,-16.0 ),
            ( -11.0, 31.0, -14.0,15.0)
         );
begin
   Put (Matrix_A - Matrix_B);
end Matrix_Product;
