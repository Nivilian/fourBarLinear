%% TU Munich - Mathematical Software Tools - Problem 042
% *Symbolic Solution of a Four-bar Linkage with linear bearing*
%
% *Author: Samuel Detzel, MIMED, reviewed by Dingzhi Zhang, MIMED*
%
% *3 points*


%% Problem Description
% A four-bar linkage is given, see figure below. Unlike in typical four-bar
% linkages, one rotational joint (in D) is replaced by a linear joint.
% Thus, the length l4 of the coupler is variable, while the angle w3 is
% fixed. The mechanism is actuated in joint B. Point K is fixed on the
% coupler. 
% Using a symbolic approach, calculate the position of point K. The lenghts
% of the bars l1, l2, and l3 are given, as well as w3 and k. The
% actuation angle w1 shall be given as a [nx1]-vector, representing a
% series of angles, eg. [0, pi/6, pi/3, 3*pi/6...].
% For each element of w1, two postitions are possible for point K. The
% implemented function should return one of the sets of positions in the base 
% coordinate system, each as a [nx2]-vector, where n is the number of 
% elements in w1.
% The base coordinate system has its origin in A and its x-axis points form
% A to B.
%
% * PLEASE DO NOT INCLUDE PLOTS OR ANIMATIONS IN YOUR SUBMITTED SOLUTIONS!
%

%%
%
% <<../img_4bar_linear_B.png>>
%

%% Problem

% [K] = problem_4bar_linear(l1, l2, l3, w3, k, w1)
% === INPUT PARAMETERS ===
% l1:    length of link between point A and B
% l2:    length of link between point B and C
% l3:    length of link between point C and D
% w3:    fixed angle between link 3 and 4
% k:     distance along link 3 from point C to point K
% w1:    nx1-vector containing a set of input angles between link 1 and
%        link 2
   
% === OUTPUT RESULTS =====
% K:     nx2 vector with coordinates of point K, for one set of solutions,
%        where n is the number of elements in w1

function [K] = problem_4bar_linear_B(l1, l2, l3, w3, k, w1)
    n = height(w1);
    K = zeros(n,2);
    for j =1:n
        r1 = [cos(w1(j)) -sin(w1(j));sin(w1(j)) cos(w1(j))];
        ac = sqrt(l2^2*sin(w1(j))^2+(l1+l2*cos(w1(j)))^2);
        l4 = -l3*cos(w3)+sqrt(l3^2*cos(w3)^2-(l3^2-ac^2));
        a1 = acos(l2*sin(w1(j))/ac);
        a2 = w1(j)-pi/2;
        p = (l3+l4+ac)/2;
        a3 = asin(2*sqrt(p*(p-l3)*(p-l4)*(p-ac))/ac/l3);
        w2 = pi-a1-a2-a3;
        r2 = [cos(w2) -sin(w2);sin(w2) cos(w2)];
        k3 = [k;0];
        k2 = r2*k3+[l2;0];
        k1 = r1*k2+[l1;0];
        K(j,1) = k1(1);
        K(j,2) = k1(2);
    end


%% Introduce symbolic variables
% If we name our symbolic variables exactly like the numeric input
% arguments (l1, l2...) we will overwrite the numeric values. It is therefore a
% good idea to name them e.g. l1_sym, l2_sym etc. to distinguish them from
% the input arguments.
    



%% Transformation Matrices
% The transformation matrices describe the relation of the different
% coordinate systems in the 4-bar (see exercise).




%% Assumptions (prepare for solving)
% In order to make the task easier for the computer, we can introduce
% assumptinons that narrow our solution space. We know, for example, that
% all our lengths and angles are real numbers, not complex.




%% Solve the equation
% We have two equations: The endpoint of the kinematic chain formed by the
% transformation matrices is indentical with point A in both x- AND
% y-direction. We can therefore solve for two variables. These will be the
% missing length, and one angle that is not given as an argument.
% For each variable, we will get two solutions. Choose one!





%% Get symbolic description of points
% Use the transformation matrices to get the symbolic description of the
% points B,C,D and K. A is given as [0,0]. 
% Use the subs command to replace the unknown symbolic variables, which we
% solved for in the previous step, with the solution for this variable.





%% Get numeric values
% Substitute the symbolic remaining variables (_sym) with their numeric 
% counterparts. 
% The angle w1 is given as a vector, representing a full turn of positions.
% Inserting it into a variable using subs will expand this variable to the
% dimension of w1. 
% Example: subs([1x1-variable], w1_sym, w1) results in a [nx1] variable.
% Alternatively, you can solve this step using a loop.

% Make sure that K has a numeric value at the end of the function. If it
% still contains symbolic variables, these need to be substituted. 
% Sometimes, Matlab does not convernt symbolic variables to numeric
% variables, even though they contain only numeric values 
% (e.g. "sin(142/120)+tan(8/7)". Use the eval command to force a conversion
% to numeric.






end

