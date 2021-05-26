%Routine to split an xls file into individual ascii.
%Each sheet will be labeled as Filename_sheet.txt

clear all
clc
directorio= pwd;
cd C:\Users\cpqui\SOFTWARE\MATLAB-mix\Inestabilidades
s=dir('IV_RZ#37_B1.xls');%Be careful with long names!

dim=size(s);
for i=1:dim(1)
    [tipo,books]=xlsfinfo(s(i).name);
    [f hojas]=size(books);
    for j=1:hojas
        [data,encabezado]=xlsread(s(i).name,(books{j}));
        t=size(encabezado);
        nomb=strtok(s(i).name,'.');
        filename=[nomb,'_',books{j},'.txt'];%filename=[nomb,'_',books{j},'.txt'];
        fid=fopen(filename,'w+');
        for l=2:t(1)%if put from number 1 includes the headlines
            for k=1:t(2)
                if(k<t(2))
                    fprintf(fid,'%s \t',encabezado{l,k});
                else
                    fprintf(fid,'%s \n',encabezado{l,k});
                end
            end
        end
        fclose(fid);
        dlmwrite(filename, data, 'delimiter','\t','newline','pc','-append');
    end
end
cd ..
cd ..

