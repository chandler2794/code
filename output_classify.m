
function output_classify(G,N)
    str1 = 'grain';
    str2 = '_translate.txt';
    filename = [str1 num2str(N) str2];
    fileID = fopen(filename,'w');
    fprintf(fileID, '%d %d %7.4f %7.4f %7.4f \r\n',G');
    fclose(fileID);
end