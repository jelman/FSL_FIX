function feat = featuresmoothest(strFold)
% closely related: spatial smoothness (resel size etc) of zstat map
% spatial entropy (histogram) / parameters from histogram mixture-model fit    
% smoothness    
msk = sprintf('%smask',strFold);
call_fsl(sprintf('smoothest -z %sfix/dummy -m %s > %sfix/dummy1.txt', strFold, msk, strFold));      

fid = fopen(sprintf('%sfix/dummy1.txt', strFold));
tline = fgetl(fid);
DLH = textscan(tline, '%s %f');
tline = fgetl(fid);
VOL = textscan(tline, '%s %f');
tline = fgetl(fid);
RESEL = textscan(tline, '%s %f');
fclose(fid);

% DLH, VOL, RESEL
feat = RESEL{2};
delete(sprintf('%sfix/dummy1*', strFold));
end
