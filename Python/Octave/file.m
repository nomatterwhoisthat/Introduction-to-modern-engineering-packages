 n = input("Enter n:");
fid = fopen('random_matrix.txt','w')
for i=1:n
     for j=1:n
       fprintf(fid , '%f' ,rand() );
         if j < n
           fprintf(fid , '|');
         end
     end
   fprintf(fid , '\n');
end
fclose(fid);
