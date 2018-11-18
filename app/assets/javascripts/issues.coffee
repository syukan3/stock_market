# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  # console.log(document.getElementById("stockData").dataset.stocks)
  stocks = JSON.parse(document.getElementById("stockData").dataset.stocks);
  console.log(stocks)
$(document).ready(ready)
$(document).on('page:load', ready)

# Google chart
drawChart = ->
  dataArray = [ [
    'Day'
    'Low'
    'Start'
    'End'
    'High'
  ] ]
  df = $.Deferred()
  $ ->
    $.ajax(
      url: stocks
      dataType: 'json').done((data) ->
      console.log 'success'
      $(data).each ->
        data_item = [
          @day
          @low
          @start
          @end
          @high
        ]
        dataArray.push data_item
        return
      df.resolve()
      return
    ).fail ->
      console.log 'error'
      return
    return
  df.done ->
    chartdata = google.visualization.arrayToDataTable(dataArray)
    options = legend: 'none'
    chart = new (google.visualization.CandlestickChart)(document.getElementById('chart_div'))
    chart.draw chartdata, options
    return
  return

google.charts.load 'current', 'packages': [ 'corechart' ]
google.charts.setOnLoadCallback drawChart


# drawChart = ->
#   data = google.visualization.arrayToDataTable([
#     [
#       'Mon'
#       20
#       28
#       38
#       45
#     ]
#     [
#       'Tue'
#       31
#       38
#       55
#       66
#     ]
#     [
#       'Wed'
#       50
#       55
#       77
#       80
#     ]
#     [
#       'Thu'
#       77
#       77
#       66
#       50
#     ]
#     [
#       'Fri'
#       68
#       66
#       22
#       15
#     ]
#   ], true)
#   options = legend: 'none'
#   chart = new (google.visualization.CandlestickChart)(document.getElementById('chart_div'))
#   chart.draw data, options
#   return
#
# google.charts.load 'current', 'packages': [ 'corechart' ]
# google.charts.setOnLoadCallback drawChart
