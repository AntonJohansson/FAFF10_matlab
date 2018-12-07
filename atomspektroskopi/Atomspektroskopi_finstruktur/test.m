interval = 1:10000;

for A=interval
    A
    for B=interval
        for C=interval
            if 15*A ~= 5*B + 5*C
                continue
            end
            for D=interval
                
                for E=interval
                    if 35*A + 35*B + 35*D ~= 21*C + 21*E
                        continue
                    end
                    for F=interval
                        if 15*F == 21*C + 21*E
                            if 3*F + 3*E + 3*D == 15*A + 5*B + 5*C
                                fprintf('A: %i\nB: %i\nC: %i\nD: %i\nE: %i\nF: %i\n',A,B,C,D,E,F);
                            else
                                continue
                            end
                        else
                            continue
                        end
                    end
                end
             end
        end
    end
end