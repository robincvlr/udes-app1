%travvailler avec la 4eme dimension sur tous les vecteurs d'apprentissage et de test
ref_P300 = load("Donnees/ref_P300");
ref_P300(:,1) = [];
ref_P300(:,1) = [];
ref_P300(:,1) = [];
ref_NP300 = load("Donnees/ref_NP300");
ref_NP300(:,1) = [];
ref_NP300(:,1) = [];
ref_NP300(:,1) = [];
test_P300 = load("Donnees/test_P300");
test_P300(:,1) = [];
test_P300(:,1) = [];
test_P300(:,1) = [];
test_NP300 = load("Donnees/test_NP300");
test_NP300(:,1) = [];
test_NP300(:,1) = [];
test_NP300(:,1) = [];
%concatenation de test_NP300 et test_P300 et calcul des tailles des matrices
test=[test_P300;test_NP300];
[t,tt] = size(test);
Ntest = t ;
[i,j] = size(ref_P300);
nl = i ;
[i1,j1] = size(test_P300);
nl1 = i1 ;
[i11,j1] = size(test_NP300);
nl11 = i11 ;
[k2,l] = size(ref_NP300);
nl2 = k2 ;
%faire la classification K-PPV pour test_P300 et k=1
Nreconnu1=0;
for k=1:nl1
  for k22=1:nl
    distance_p1(k22,:)=abs(test_P300(k,:)-ref_P300(k22,:));
      
  endfor
  for k222=1:nl2
    
    distance_np1(k222,:)=abs(test_P300(k,:)-ref_NP300(k222,:));  
  endfor
  distance_p1=sort(distance_p1);
  distance_np1=sort(distance_np1);
  if distance_p1(1,:)<distance_np1(1,:)
    Nreconnu1=Nreconnu1+1;
  endif
 
endfor
printf("le nbr de p2300 reconnus est %d\n",Nreconnu1);
%faire la classification K-PPV pour test_NP300 et k=1
Nreconnu2=0;
for k=1:nl11
  for k22=1:nl
    distance_p2(k22,:)=abs(test_NP300(k,:)-ref_P300(k22,:));
      
  endfor
  for k222=1:nl2
    
    distance_np2(k222,:)=abs(test_NP300(k,:)-ref_NP300(k222,:));  
  endfor
  distance_p2=sort(distance_p2);
  distance_np2=sort(distance_np2);
  if distance_np2(1,:)<distance_p2(1,:)
    Nreconnu2=Nreconnu2+1;
  endif
  
  
endfor 
printf("le nbr de np2300 reconnus est %d\n",Nreconnu2);
Nreconnu=Nreconnu1+Nreconnu2;
taux=(Nreconnu*100)/Ntest
disp(taux);
























