clc
close all
clear all

%r = corr(A','type','Kendall');
% 'Pearson'	Pearson's Linear Correlation Coefficient
% 'Kendall'	Kendall's Tau Coefficient
% 'Spearman'	Spearman's Rho
correlation_type = "Kendall"
particles = [625 760 1133 86 153 1033 43 170 839 328 679 1074 424 379 572 800 954 222 144 1129];
file_names = ["Nikkei", "HangSeng", "SP", "FTSE", "DAX"]
list_of_coeff_matrices = cell(1, 15);
global list_of_X_L_norm_matrices
list_of_X_L_norm_matrices = cell(1, 15)
global counter
counter = 1
global k
k = 1;
for fille = 1:5
    file_working_with = fille;
  
    particle_625 = corrcoefMatrix(file_working_with,particles(1), correlation_type);
    list_of_coeff_matrices{k} = particle_625;
    k = k +1;

    % This code is used to forumlate the tables in latex
end

for fille = 1:5
    file_working_with = fille;
    
    particle_86 = corrcoefMatrix(file_working_with,particles(4), correlation_type);
    list_of_coeff_matrices{k} = particle_86;
    k = k +1;

end

for fille = 1:5
    file_working_with = fille;

    particle_1074 = corrcoefMatrix(file_working_with,particles(12), correlation_type);
    list_of_coeff_matrices{k} = particle_1074;
    k = k +1;
end
for template = 1:5
    file_working_with = template;
    print2latex(list_of_coeff_matrices{template},file_names(file_working_with), particles(1));
end

for template = 6:10
    file_working_with = template - 5;
    print2latex(list_of_coeff_matrices{template},file_names(file_working_with), particles(4));
    
end

for template = 11:15
     file_working_with = template - 10;
    print2latex(list_of_coeff_matrices{template},file_names(file_working_with) ,particles(12))
end

save("finding_the_correlation_matrices_workspace")

function coef_matrix = corrcoefMatrix(file ,particle, corr_type)
    
    direct = "output-v2.2/"
    files = ["Nikkei", "HangSeng", "SP", "FTSE", "DAX"]
    current_file = file
    true_init_dir = [direct + "ph" + files(current_file) + "/true_init/old_settings/workspace/" + files(current_file)+ "WorkSpace.mat"]
    false_workspaces = ["new_settings" , "gammas0.8_0.2", "gammas0.2_0.8", "gammas0.7_0.1", "gammas0.1_0.7", "gammas0.5", "gamma0.8", "gamma0.6", "gamma0.4", "gamma0.2"]

    load(true_init_dir)
    matrix = []
    matrix(:,1) = X_L_norm(:, particle)

    for j=1:10
        load([direct + "ph" + files(current_file) + "/false_init/" + false_workspaces(j) + "/workspace/" + files(current_file)+ "WorkSpace.mat"])

        matrix(:, j+1) = X_L_norm(:, particle)
        close all
    
    end;
    % https://nl.mathworks.com/matlabcentral/answers/300392-how-do-i-test-kendall-rank-correlation-coefficient-in-a-matrix
    % r = corr(A','type','Kendall');
    %coef_matrix = corrcoef(matrix','type', corr_type)
    fprintf("####################################################")
    global counter
    global list_of_X_L_norm_matrices
    list_of_X_L_norm_matrices{counter} = matrix;
    counter = counter + 1
    size(matrix);
    fprintf("####################################################")
    coef_matrix = corr(matrix,'type', corr_type)
end

function PrintToLatex = print2latex(matrix, fname ,particle)
    
    fprintf("\\begin{adjustwidth}{}{} \n")
    fprintf("\\begin{figure}[hbt!]\n")
    fprintf("\\[\n")
    fprintf("\\resizebox{\\dimexpr\\textwidth+4cm\\relax}{!}{\n")
    fprintf("$\n")
    fprintf("\\left(\\begin{array}{c|c|c|c|c|c|c|c|c|c|c} ti & ns & gm0.8\\_0.2 & gm0.2\\_0.8 & gm0.7\\_0.1 & gm0.1\\_0.7 & gm0.5 & gm0.8 & gm0.6 & gm0.4 & gm0.2 \\\\ \\hline")
    for i=1:11
        for j=1:11
            if j < 11
                if (0 - matrix(i, j)) < 0.000001 && (0 - matrix(i, j)) > 0
                    fprintf("%d & ", 0)
                else
                    fprintf("%d & ", matrix(i, j))
                end
            else
                if (0 - matrix(i, j)) < 0.000001 && (0 - matrix(i, j)) > 0
                    fprintf("%d ", 0)
                else
                    fprintf("%d ", matrix(i, j))
                end
                
            end
        end
        if i < 11
            fprintf(" \\\\ ")
        else
            fprintf("\\end{array}\\right)")
        end
    end
    fprintf("\n $ \n")
    fprintf(" } \n \\]")
    fprintf(["\\caption{" + fname + " particle " + num2str(particle) + ".} \n"])
    fprintf("\\end{figure} \n")
    fprintf("\\end{adjustwidth} \n")
end

