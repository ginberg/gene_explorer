This shiny application is an interactive Gene Explorer. 
The dataset is divided into 9 contrasts, each containing (the same) 100 Genes. The first tab displays the Genes per contrasts and is used to quickly view the Genes that have increased or decreased. In the second tab, individual Genes can be analyzed. 

<p><b>Application properties</b>

* The application is created using the [**periscope**](https://github.com/neuhausi/periscope) package. Periscope was originally developed as the core Shiny component for bioinformatics and systems biology analysis applications. It provides a predefined but flexible template for new Shiny applications with a default dashboard layout, three locations for user alerts, a nice busy indicator and logging features. One of the most important features of the shiny applications created with this framework is the separation by file of functionality that exists in one of the three shiny scopes: global, server-global, and server-local. The framework forces application developers to consciously consider scoping in Shiny applications by making scoping distinctions very clear without interfering with normal application development. Scoping consideration is important for performance and scaling, which is critical when working with large datasets and/or across many users. In addition to providing a template application, the framework also contains a number of convenient modules: a (multi)file download button module and a downloadable table module for example.
* The plots are created using [CanvasXpress](https://canvasXpress.com), which is a package for interactive data visualization. It supports a large number of visualizations to display scientific and non-scientific data which includes: Area, AreaLine, Bar, BarLine, Boxplot, Bubble, Candlestick, Chord, Circular, Contour, Correlation, Density, Donnut, DotLine, Dotplot, Genome, Heatmap, Histogram, Kaplan-Meier, Layout, Line, Map, Network, NonLinear-Fit, Oncoprint, ParallelCoordinates, Pie, Radar, Remote-Graphs, Sankey, Scatter2D, Scatter3D, ScatterBubble2D, Stacked, StackedLine, StackedPercent, StackedPercentLine, Sunburst, TagCloud, Tree, Treemap, Venn, Video, Violin.

This [blogpost](https://blog.dominodatalab.com/large-visualizations-canvasxpress/) gives a good overview on how to get started with CanvasXpress.

*Application development by Connie Brett and Ger Inberg*
