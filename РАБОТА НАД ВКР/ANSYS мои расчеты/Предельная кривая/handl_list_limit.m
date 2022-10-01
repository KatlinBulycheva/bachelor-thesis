clc
clear

d_0 = 3;               % мм   диаметр проволоки без коррозии
d_proc = 2.4;            % мм   диаметр проволоки с коррозией
Wp_0 = pi*d_0^3/16;    % мм^3   момент сопротивления на кручение
Wp_proc = pi*d_proc^3/16;  % мм^3   момент сопротивления на кручение с коррозией
sig_t = 400;           % МПа

%% Считывание текста

etab_scanf = [];
range = 41; % один регулярный блок данных 
 
el_41 = 1; % el_41 - последний элемент в текущем регулярном блоке
           % (начальное значение - условно равно 1)
el_bott_41 = 2960; % Последний элемент в последнем регулярном блоке
el_last    = 2982; % Последний элемент в файле

fid = fopen('20corros&1break.lis', 'rt');
for j = 1 : 7      % пропуск 7 строк текста
    fgetl(fid);
end

% считывание из каждого регулярного блока
while el_41 < el_bott_41
   A = fscanf(fid,'%d %f %f %f %f %f %f', [7,range]); 
   etab_scanf = [etab_scanf  A];
   fgetl(fid);          % исчерпание последней числовой строки
   for j = 1 : 5        % пропуск 5 строк текста
     str = fgetl(fid);         
   end;
   el_41 = A(1,range);  % последний элемент в регулярном блоке
end

% считывание из последнего (нерегулярного) блока списка
check_el = el_41;
while  check_el < el_last
   A = fscanf(fid,'%d %f %f %f %f %f %f', [7,1]); 
   etab_scanf = [etab_scanf  A];
   check_el = A(1,1);
end

fclose(fid);
etab = etab_scanf';

%% Поиск элемента с максимальным эквивалентным напряжением
count_el    = size(etab,1);  % количество элементов

sdir   = zeros(2,count_el); % норм. напряжения раст./сж.
sbend  = zeros(2,count_el); % норм. нпаряжения изгиба
tau    = zeros(2,count_el); % касательные напряжения кручения
sig    = zeros(2,count_el); % нормальные напряжения суммарные
sig_eq = zeros(2,count_el); % эквивалентные напряжения

n_corros_proc = 2953:2980;
for j = 1 : count_el
   n_el = etab(j,1);   % номер элемента в j-й строке списка
   % напряжения  (имена ANSYS) а узлах I,J элемента n 
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
  
    for i = 1:length(n_corros_proc)
        if n_el == n_corros_proc(i)
            tau(2,j) = abs(etab(j,7))/Wp_proc;
        else
            tau(2,j) = abs(etab(j,7))/Wp_0;
        end
    end
  
  sig(2,j) = sdir(2,j) + sbend(2,j);
  sig_eq(2,j) = sqrt(sig(2,j).^2 + 4*tau(2,j).^2);
end;
  
disp(' Максимальные эквивалентные напряжения');
[sig_eq_max, j] = max(sig_eq(2,:));
sig_eq_max
n_element = sig_eq(1,j)

disp(' Отдельные компоненты напряжений на данном элементе'); 
sig_tens    = sdir(2,j)
sig_bend    = sbend(2,j)
tau_torsion = tau(2,j)

% Найдем фактический коэф. запаса
disp(' Фактический коэффициент запаса прочности ');
n = sig_t/sig_eq_max


proc_corros = [0;20;50];
n_break = [3;1;0];
%createfigure(proc_corros, n_break)

plot(proc_corros, n_break)
grid on