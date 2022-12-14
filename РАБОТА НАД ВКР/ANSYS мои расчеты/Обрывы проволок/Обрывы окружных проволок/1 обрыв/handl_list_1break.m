clc
clear

d = 3;             % ??   ??????? ?????????
Wp = pi*d^3/16;    % ??^3   ?????? ????????????? ?? ????????
sig_t = 400;       % ???

%% ?????????? ??????

etab_scanf = [];
range = 41; % ???? ?????????? ???? ?????? 
 
el_41 = 1; % el_41 - ????????? ??????? ? ??????? ?????????? ?????
           % (????????? ???????? - ??????? ????? 1)
el_bott_41 = 757; % ????????? ??????? ? ????????? ?????????? ?????
el_last    = 2953; % ????????? ??????? ? ?????

fid = fopen('1break_listing.lis', 'rt');
for j = 1 : 7      % ??????? 7 ????? ??????
    fgetl(fid);
end

% ?????????? ?? ??????? ??????????? ?????
while el_41 < el_bott_41
   A = fscanf(fid,'%d %f %f %f %f %f %f', [7,range]); 
   etab_scanf = [etab_scanf  A];
   fgetl(fid);          % ?????????? ????????? ???????? ??????
   for j = 1 : 5        % ??????? 5 ????? ??????
     str = fgetl(fid);         
   end;
   el_41 = A(1,range);  % ????????? ??????? ? ?????????? ?????
end

% ?????????? ?? ?????????? (?????????????) ????? ??????
check_el = el_41;
while  check_el < el_last
   A = fscanf(fid,'%d %f %f %f %f %f %f', [7,1]); 
   etab_scanf = [etab_scanf  A];
   check_el = A(1,1);
end

fclose(fid);
etab = etab_scanf';

%% ????? ???????? ? ???????????? ????????????? ???????????
count_el    = size(etab,1);  % ?????????? ?????????

sdir   = zeros(2,count_el); % ????. ?????????? ????./??.
sbend  = zeros(2,count_el); % ????. ?????????? ??????
tau    = zeros(2,count_el); % ??????????? ?????????? ????????
sig    = zeros(2,count_el); % ?????????? ?????????? ?????????
sig_eq = zeros(2,count_el); % ????????????? ??????????

for j = 1 : count_el
   n_el = etab(j,1);   % ????? ???????? ? j-? ?????? ??????
   % ??????????  (????? ANSYS) ? ????? I,J ???????? n 
   sdir_IJ   = etab(j,2);       
   sbyt_I    = etab(j,3); 
   sbyt_J    = etab(j,4); 
   sbzt_I    = etab(j,5); 
   sbzt_J    = etab(j,6);
   sbend_I   = sqrt(sbyt_I^2 + sbzt_I^2);
   sbend_J   = sqrt(sbyt_J^2 + sbzt_J^2);
   
   sdir(1,j) = n_el;
   sdir(2,j) = abs(sdir_IJ);
   
   sbend(1,j) = n_el;
   if sbend_I > sbend_J
     sbend(2,j) = sbend_I;
   else
     sbend(2,j) = sbend_J;
  end;
  
  sig(1,j)    = n_el;
  tau(1,j)    = n_el;
  sig_eq(1,j) = n_el; 
  
  tau(2,j) = abs(etab(j,7))/Wp;
  sig(2,j) = sdir(2,j) + sbend(2,j);
  sig_eq(2,j) = sqrt(sig(2,j).^2 + 4*tau(2,j).^2);
end;
  
disp(' ???????????? ????????????? ??????????');
[sig_eq_max, j] = max(sig_eq(2,:));
sig_eq_max
n_element = sig_eq(1,j)

disp(' ????????? ?????????? ?????????? ?? ?????? ????????'); 
sig_tens    = sdir(2,j)
sig_bend    = sbend(2,j)
tau_torsion = tau(2,j)

% ?????? ??????????? ????. ??????
disp(' ??????????? ??????????? ?????? ????????? ');
n = sig_t/sig_eq_max