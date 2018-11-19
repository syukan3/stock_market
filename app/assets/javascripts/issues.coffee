# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# json-data 受け取り
ready = ->
  stocks = JSON.parse(document.getElementById("stockData").dataset.stocks);
  console.log(stocks)
  # no-need this console/ check for input

  visualizationStock = stocks.map (stock) ->
    [stock.date, stock.min_price, stock.start_price, stock.end_price, stock.max_price]
  console.log(visualizationStock)
  # no-need this console/ check for input

  # Google chart
  drawChart = ->
    data = google.visualization.arrayToDataTable(visualizationStock, true);

    options = {
      legend:'none'
    };

    chart = new google.visualization.CandlestickChart(document.getElementById('chart_div'));

    chart.draw(data, options);
    return

  google.charts.load 'current', 'packages': [ 'corechart' ]
  google.charts.setOnLoadCallback drawChart

# json-data 受け取り
$(document).ready(ready)
$(document).on('page:load', ready)
