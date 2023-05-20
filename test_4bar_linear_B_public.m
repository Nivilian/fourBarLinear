load('testdata_4bar_linear_B_public.mat');
%% Test 4bar_linear(50,10,30,pi/2,20,(0:0.1:2*pi)')
K = problem_4bar_linear_B(50,10,30,pi/2,20,(0:0.1:2*pi)');
assert(norm(K-KtestpublicB1a)<0.1 || norm(K-KtestpublicB1b)<0.1);


%% Test 4bar_linear(50,15,35,pi/3,15,(0:0.1:2*pi)')
K = problem_4bar_linear_B(50,15,35,pi/3,15,(0:0.1:2*pi)');
assert(norm(K-KtestpublicB2a)<0.1 || norm(K-KtestpublicB2b)<0.1);



