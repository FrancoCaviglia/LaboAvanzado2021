%Routine to convert an xls file with multiple sheets into one individual ascii.

clear all
clc
directorio= pwd;
cd C:\Users\cpqui\SOFTWARE\MATLAB-mix
s=dir('Hfb_G_C4.xls');%Be careful with long names!

dim=size(s);
B = zeros(1,7);
cumtime = 0;
[tipo,books]=xlsfinfo(s(1).name);
[f hojas]=size(books);
nomb=strtok(s(1).name,'.');
filename=[nomb,'.txt']; %filename=[nomb,'_',books{j},'.txt'];
fid=fopen(filename,'w+');
for i=1:hojas
[data,encabezado]=xlsread(s(1).name,(books{i}));
t=size(encabezado);    
        for l=2:t(1) %if put from number 1 includes the headlines
            for k=1:t(2)
                if(k<t(2))
                    fprintf(fid,'%s \t',encabezado{l,k});
                else
                    fprintf(fid,'%s \n',encabezado{l,k});
                end
            end
        end
    ddata = size(data);
    data(:,1) = cumtime + data(:,1);
    cumtime = data(ddata(1),1);
    B = [B;data];
end
    fclose(fid);
    dlmwrite(filename, B, 'delimiter','\t','newline','pc','-append');

    %writematrix()
%end
%cd ..
%cd ..

