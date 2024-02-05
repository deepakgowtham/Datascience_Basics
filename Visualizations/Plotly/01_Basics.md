# Intro
- graphs can be created using
 1. plotly.express for quick plots (px)
 2. plotly.graph_objects (go) for more customisation
 3. plotly.figure_factory for advanced features

refrence docs
[Refernce doc](https://plotly.com/python/)
[Plotly graph](https://plotly.com/python-api-reference/plotly.graph_objects.html)

# Components
1. Layout - dictionary of attributes that control look and style of the figure. one layout per figure
2. Data - list of dictionaries that sets up the graph type and data. Data + Type = Trace. can have multiple traces per plot
3. Frames - for animated plots

# Contructing graph from scratch
- not always done using this method
```python
import plotly.graph_objects as go
montly_sales ={{'data': [{'type': '', 'x': ['Jan', 'Feb', 'March'], 'y': [450, 475, 400]}],
 'layout': {'title': {'text': ''}}} }

# Examine the printed dictionary

# Update the type
monthly_sales['data'][0]['type'] = 'bar'

# Update the title text
monthly_sales['layout']['title']['text'] = 'Sales for Jan-Mar 2020'

# Create a figure
fig = go.Figure(monthly_sales)

# Print it out!
fig.show()
```

# Univariate visualizations
- **Plotly.express** can be used create plots easily from dataframe instead of using dictionaries.
- quick neat less custamisations.
- bar, histogram, box, density
  

  ```python
  import plotly.express as px

  fig =px.bar(data_frame =df, x='day', y='temp')
  fig.show()

  # Create the bar plot
fig = px.bar(data_frame=student_scores, 
             x='student_name', 
             y='score', 
             title='Student Scores by Student')

# Show the plot
fig.show()
```

- in box plot the argument required is y
- additional arguments hover_data: list of column names to be displayed in hover
- points: further specify how to show outliers

```python
# Create the box plot
fig = px.box(
  			# Set the data
  			data_frame=revenues, 
  			# Set the y variable
            y='Revenue', 
            # Add in hover data to see outliers
            hover_data=['Company'])

# Show the plot
fig.show()


# Create a simple histogram
fig = px.histogram(
  			data_frame=revenues, 
            # Set up the x-axis
           	x='Revenue',
            # Set the number of bins
            nbins=5)

# Show the plot
fig.show()
```
