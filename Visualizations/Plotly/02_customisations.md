# Customisations
- customisations using prvoided arugments
- fig.update_layout


# Color
- RGB colours
- (0,0,255) for blue
- (255,255,0) for yellow
- color argument can be added with other column to add more insights or dimensions
- Manual colors - color_discrete_map : A dictionary mapping specic categorical values to colors using a string RGB code specification
- **color_continuous_scale**- when providing color we need to also mention the df column so the color can be mapped to the data.
- **color_discrete_map** - when giving specific color for a particular column

```python
# Create your own continuous color scale
my_scale = ['rgb(255, 0, 0)', 'rgb(3, 252, 40)']

# Create the bar plot
fig = px.bar(data_frame=student_scores, 
             x='student_name', y='score', title='Student Scores by Student',
             # Set the color variable and scale
             color='score',
             color_continuous_scale=my_scale
             )

# Show the plot
fig.show()

# Create the industry-color map
ind_color_map = {'Tech':'rgb(124, 250, 120)', 'Oil': 'rgb(112,128,144)', 
                 'Pharmaceuticals': 'rgb(137, 109, 247)', 'Professional Services': 'rgb(255, 0, 0)'}

# Create the basic box plot
fig = px.box(
  			# Set the data and y variable
  			data_frame=revenues, y='Revenue',
  			# Set the color map and variable
			color_discrete_map=ind_color_map,
			color='Industry')

# Show the plot
fig.show()

# Create the industry-color map
ind_color_map = {'Tech':'rgb(124, 250, 120)', 'Oil': 'rgb(112,128,144)', 
                 'Pharmaceuticals': 'rgb(137, 109, 247)', 'Professional Services': 'rgb(255, 0, 0)'}

# Create a simple histogram
fig = px.histogram(
  			# Set the data and x variable
  			data_frame=revenues, x='Revenue', nbins=5,
    		# Set the color map and variable
			color_discrete_map=ind_color_map,
			color='Industry')

# Show the plot
fig.show()
```
# Customize hover information
- **hovermode** - default is closest
- x or y adds a hightlight on the x or y axis
- xunified or y unified created a line
- **hover_name** - specified column will appear in bold at the top of hover box
- **hover_data** - list of columns to include or dictionary of columns to include/exclude
- **hover_label** - background color, borders, font, sizings.
- **hovertemplate** - html like style text.

```python
# Create the scatterplot
fig = px.scatter(
        data_frame=life_gdp, 
        x="Life expectancy", 
        y="GDP Per Capita", color='Continent')

# Create the legend
my_legend = {'x': 0.2, 'y': 0.95, 
            'bgcolor': 'rgb(60, 240, 201)', 'borderwidth': 5}

# Update the figure
fig.update_layout({'showlegend': True, 'legend': my_legend})

# Show the plot
fig.show()
```

# Legend
- update_layout() - showlegend =True
- legend - dict specifying the position
- bgcolor, borderwidth, title, font.

```python
# Create the scatterplot
fig = px.scatter(
        data_frame=life_gdp, 
        x="Life expectancy", 
        y="GDP Per Capita", color='Continent')

# Create the legend
my_legend = {'x': 0.2, 'y': 0.95, 
            'bgcolor': 'rgb(60, 240, 201)', 'borderwidth': 5}

# Update the figure
fig.update_layout({'showlegend': True, 'legend': my_legend})

# Show the plot
fig.show()
```

# Annotations
- extra boxes of text that are always present.
- **add_annotations()** - single annotations
- **update_layout() 'annotation's** argument for multiple annotations
   1. showarrow =True/False
   2. text = text ot displayed,can be variables too
   3. x and y coordinates in which to place the annotation by default is used in units of scale, can also be changed using xref, yref=paper where it used 0-1 in percentage terms.
- **arrowhead** -size of arrowhead
```python
# Create the first annotation
loss_annotation = {'x': 10, 'y': 400, 'showarrow': True, 'arrowhead': 4,
                    'font': {'color': 'black'}, 'text': 'Urgent House Repairs'}

# Create the second annotation
gain_annotation = {'x': 18, 'y':2500, 'showarrow': True, 'arrowhead': 4,
                    'font': {'color': 'black'}, 'text': 'New Job!'}

# Add annotations to the figure
fig.update_layout({'annotations': [loss_annotation,gain_annotation]})

# Show the plot!
fig.show()


# Create the first annotation
loss_annotation = {'x': 10, 'y': 400, 'showarrow': True, 'arrowhead': 4,
                    'font': {'color': 'black'}, 'text': 'Urgent House Repairs'}

# Create the second annotation
gain_annotation = {'x': 18, 'y':2500, 'showarrow': True, 'arrowhead': 4,
                    'font': {'color': 'black'}, 'text': 'New Job!'}

# Add annotations to the figure
fig.update_layout({'annotations': [loss_annotation,gain_annotation]})

# Show the plot!
fig.show()
```

# plot Axes
- can be done in two ways
- fig.update_xaxes(title_text='Species')
- fig.update_layout({'xaxis': {'title': {'text' : 'Species'}}})
- fig.update_layout( {'yaxis':
                         {'range': [150, penguin_flippers['av_flip_lenght'].max() + 30}})
- **log_y =True** to set log scale for y axis

```python
# Create and show the plot
fig = px.scatter(
  data_frame=bball_data,
  x='PPG', 
  y='FGP',
  title='Field Goal Percentage vs. Points Per Game')
fig.show()

# Update the x_axis range
fig.update_layout({'xaxis': {'range': [0, bball_data['PPG'].max() + 5]}})
fig.show()

# Update the y_axis range
fig.update_layout({'yaxis': {'range' : [0, 100]}})
fig.show()


# Create timestamp
timestamp = datetime.now()

# Create plot
fig = px.bar(penguins, x='spec', y='av_flip_length', color="spec", title='Flipper Length (mm) by Species')

# Change the axis titles
fig.update_layout({'xaxis': {'title': {'text': 'Species'}},
                  'yaxis': {'title': {'text': 'Average Flipper Length (mm)'}}})

# Add an annotation and show
fig.update_layout({'annotations': [{
  "text": f"This graph was generated at {timestamp}", 
  "showarrow": False, "x": 0.5, "y": 1.1, "xref": "paper", "yref": "paper"}]})
fig.show()
```
