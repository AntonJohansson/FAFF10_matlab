function legend_handle = end_figure(i, title_str, axis_labels, legends)
	figure(i);
	title(title_str)
    
    if isempty(legends)==0
        handle = legend(legends);
        set(handle, 'Interpreter', 'latex');
        set(handle, 'FontSize', 16);    
        legend_handle = handle;
    else
        legend_handle = 0;
    end

	xlabel(axis_labels(1));
	ylabel(axis_labels(2));
   
    
end
