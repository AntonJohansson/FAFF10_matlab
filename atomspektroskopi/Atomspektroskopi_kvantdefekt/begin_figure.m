function begin_figure(i)
	figure(i);
	
	ax = gca;
	ax.TickLabelInterpreter ='latex';
	ax.FontName = 'latex';
	ax.Title.Interpreter = 'latex';
	ax.XLabel.Interpreter = 'latex';
	ax.YLabel.Interpreter = 'latex';
    ax.XAxis.FontSize = 14;
    ax.YAxis.FontSize = 14;
    ax.XLabel.FontSize = 16;
	ax.YLabel.FontSize = 16;
	ax.Title.FontSize = 16;
	
	pbaspect([1.618 1 1]);

	hold on;
	box on;
end
