# Subplots
- fig.add_trace(X) where x is a graph object like go.Scatter or go.Bar()
- cant use px when using subplots
- fig.make_subplots(rows=2, cols=2)
- fig.add_trace()

```python
  fig = make_subplots(rows=2, cols=2, 
                    # Set the subplot titles
                    subplot_titles=['Tech', 'Professional Services', 'Retail', 'Oil'])

# Add the Tech trace
fig.add_trace(go.Box(x=df_tech.Revenue, name='', showlegend=False), row=1, col=1)
# Add the Professional Services trace
fig.add_trace(go.Box(x=df_prof_serve.Revenue, name='', showlegend=False), row=1, col=2)
# Add the Retail trace
fig.add_trace(go.Box(x=df_retail.Revenue, name='', showlegend=False), row=2, col=1)
# Add the Oil trace
fig.add_trace(go.Box(x=df_oil.Revenue, name='', showlegend=False), row=2, col=2)

# Add a title (and show)
fig.update_layout({'title': {'text': 'Box plots of company revenues', 'x': 0.5, 'y': 0.9}})
fig.show()
```


# Create the subplots
fig = make_subplots(rows=3, cols=1, shared_xaxes=True)

# Loop through the industries
row_num = 1
for industry in ['Tech', 'Retail', 'Professional Services']:
    df = revenues[revenues.Industry == industry]
    # Add a histogram using subsetted df
    fig.add_trace(go.Histogram(x=df['Revenue'], name=industry),
    # Position the trace
    row=row_num, col=1)
    row_num +=1

# Show the plot
fig.show()
```
# Layering plots
- multiple plots on top of each other
- add_trace() can be used
- add_bar(), add_area(), add_box() are shortcut methods
- use case include moving average on top on daily price bar chart.

```python
# Create the base figure
fig = go.Figure()

# Loop through the species
for species in ['Adelie', 'Chinstrap', 'Gentoo']:
  # Add a bar chart trace
  fig.add_trace(go.Bar(x=islands,
    # Set the appropriate y subset and name
    y=penguins_grouped[penguins_grouped.Species == species]['Count'],
    name=species))
# Show the figure
fig.show()

# Create the base figure
fig = go.Figure()

# Add the bar graph of daily temperatures
fig.add_trace(
  go.Bar(x=temp_syd['Date'], y=temp_syd['Temp'], name='Daily Max Temperature'))

# Add the monthly average line graph
fig.add_trace(
  go.Scatter(x=temp_syd_avg['Date'], y=temp_syd_avg['Average'], name='Average Monthly Temperature'))

# Show the plot
fig.show()
```
# Timebuttons
- buttons to filter timeframe 1d - last day 1m- 1 month etc.
- zoom at a timeframe or zoom out
  
<img width="288" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/f3d2ead3-98a6-4c94-add2-f7361ef9e845">

- label - text to appear in the place on buttons
- count - how many steps to take when clicking the button
- step - what time period to move month, year, day note there is no week time period in step
- stepmode -todate or backward
    1. todate - means nearest whole time period in setp
    2. backward - just go backwards by count

  <img width="577" alt="image" src="https://github.com/deepakgowtham/Datascience_Basics/assets/47908891/80bcc8fa-6dc5-476f-83ac-fd838b89a407">

- first step create buttons as list of dict
- then add the **rangeselector** in update_layout

```python
# Create the buttons
date_buttons = [
{'count': 28, 'label': '4WTD', 'step': "day", 'stepmode': "todate"},
{'count': 48, 'label': '48HR', 'step': "hour", 'stepmode': "todate"},
{'count': 1, 'label': 'YTD', 'step': "year", 'stepmode': "todate"}]

# Create the basic line chart
fig = px.line(data_frame=rain, x='Date', y='Rainfall', 
              title="Rainfall (mm)")

# Add the buttons and show
fig.update_layout(
  	{'xaxis':
    {'rangeselector': {'buttons': date_buttons}}})
fig.show()
```

# Custom Buttons
- toggle between plot types
- udpatemenus arugments - list of dict with following
- type button or dropdown
- direction -  left or down
- x/y
- showactive - True/False
- button
- -args contains two dictionaries
   1. dict to send to data
   2. dict to send to layout
 
```python

# Create a simple bar chart
fig = px.bar(data_frame=rain, x='Month', y='Rainfall')

# Create the buttons
my_buttons = [{'label': "Bar plot", 'method': "update", 'args': [{"type": [{"type": "bar"}]}]},
  {'label': "scatterplot", 'method': "update", 'args': [{"type": [{"type": "scatter"}], 'mode': 'markers'}]}]

# Add buttons to the plot and show
fig.update_layout({
    'updatemenus': [{
      'type':'buttons','direction': 'down',
      'x': 1.3,'y': 0.5,
      'showactive': True, 'active': 0,
      'buttons': my_buttons}]})
fig.show()

```

# Dropdown

