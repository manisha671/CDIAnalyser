n= 5; %time in sec
t= [0:1:n] % array of time
tm= t./60 %time in minute
header={'Time' 'Time per minute'} % headers for the file
S = [t;tm]' % generating column matrix
M=[header;num2cell(S)] 



