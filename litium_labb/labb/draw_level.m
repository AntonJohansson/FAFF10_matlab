function [] = draw_level(x, E, str)
    width = 0.75;
    
    i = (x-width/2):0.1:(x+width/2);
    plot(i, E*ones(length(i)), 'k');
    text(x,E, str, 'Interpreter', 'latex', 'FontSize', 14, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');
end

