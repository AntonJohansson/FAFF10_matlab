function R = calculate_rydberg(n1, n2, lambdas)
    R_teori = 1.097373156850865e7;
    
    fprintf('lambda : n2->n1 : R : R_teori\n');
    
    for i=1:length(lambdas)
        R = (1/(1/n1(i)^2 - 1/n2(i)^2))*1/(lambdas(i)*1e-9);
        fprintf('%f : %i->%i : %f : %f\n', lambdas(i), n2(i), n1(i), R, abs(R-R_teori));
    end
end