clc;
clear val;
importfile_1("E:\BIOMED PROJECT\124m.mat");
data1=val(1,:);
data2=val(2,:);
plot(data1,'r');
hold on;
plot(data2,'b');