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
