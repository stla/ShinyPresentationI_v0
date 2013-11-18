---
title       : Shiny 
subtitle    : An introductory presentation and a short training - preliminary version
author      : Stéphane Laurent
job         : R user
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [bootstrap, quiz, shiny, interactive, mathjax]          
mode        : selfcontained # {standalone, draft}
ext_widgets : {rCharts: [libraries/nvd3, libraries/highcharts]}
--- &twocol





<img src="assets/img/rstudiologo.png"  style="float:right; padding-right:10px;padding-top:10px"/>

## What is Shiny ? 

<div align='center' style='width:100%;margin-left:auto;margin-right:auto;padding-bottom:5px'>
  <img src="assets/img/joecheng.jpeg"/>
</div>


```r
help(package = shiny)
```



```r
Description:        Shiny makes it incredibly easy to build interactive web applications
                    with R. Automatic "reactive" binding between inputs and outputs and 
                    extensive pre-built widgets make it possible to build beautiful, 
                    responsive, and powerful applications with minimal effort.
```



*** =left 

- Originally created by *Joe Cheng* 
- Delivered by *RStudio company*

*** =right

![alt text](assets/img/foas.jpg)

--- 

## Easy example: the standard Gauss distribution

<div class="row-fluid">
  <div class="span4">
    <form class="well">
      <label for="title">Title</label>
      <input id="title" type="text" value=""/>
      <div id="color" class="control-group shiny-input-radiogroup">
        <label class="control-label" for="color">Color:</label>
        <label class="radio">
          <input type="radio" name="color" id="color1" value="blue" checked="checked"/>
          <span>blue</span>
        </label>
        <label class="radio">
          <input type="radio" name="color" id="color2" value="red"/>
          <span>red</span>
        </label>
        <label class="radio">
          <input type="radio" name="color" id="color3" value="green"/>
          <span>green</span>
        </label>
      </div>
      <label for="linewidth">Line width</label>
      <input id="linewidth" type="number" value="6"/>
    </form>
  </div>
  <div class="span8">
    <div id="GAUSS" class="shiny-plot-output" style="width: 100% ; height: 400px"></div>
  </div>
</div>


- Left side (*sidebar panel*) : **inputs** 

- Right side (*main panel*) : **outputs**

- *Engine* : interface is running through two **R** files, namely `ui.R` and `server.R` 


---

##  Goals of this presentation

- $\frac12$ presentation, $\frac12$ training

- Each participant uses its own computer with a recent version of R and peferably RStudio, as well as an appropriate browser: Google Chrome of Firefox 

- Intended public: non-proficient R users

- Skills expected after the presentation :

 - Making an easy Shiny app (such as the Gauss app)
 
 - Understanding reactivity 
 
 - Self-improvement of these skills by studying the Shiny tutorial  

<br/> 

<span style="border-style:solid;border-width:3px;border-color:seaShell;background-color:#FCDFFF;font-size:25px">*Warning*</span>  The examples given in these slides are mainly conceived to illustrate some concepts, and don't necessarily represent best practices !



--- &twocolcustomwidth 

## Shiny app template 

*** =left width:33%

**ui.R :**
<pre><code class="r" style="font-size:80%">shinyUI(pageWithSidebar(
  
  headerPanel("app title"),
  
  sidebarPanel(   
    ***SET INPUTS*** 
  ),
   
  mainPanel(    
    ***RENDER OUTPUTS***
  )
  
))
</code></pre>


- Inputs are  elements of the `input` list 

- Outputs are  elements of the `output` list 

*** =right width:66%

**server.R :**
<pre><code class="r" style="font-size:80%">shinyServer(function(input, output, session) {

  ***GET INPUTS AND MAKE OUTPUTS*** 
  
})
</code></pre>




  - <u>*get input*</u>:  <span style="border-style:solid;border-width:1px;border-color:yellow">`input$title`</span> (or <span style="border-style:solid;border-width:1px;border-color:yellow">`input[["title"]]`</span>)
  
  - <u>*set input*</u>: **not** by doing <span style="border-style:solid;border-width:2px;border-color:red">`input$title <- ...` </span> !!!

Inputs are set through the *widgets* in the interface, defined in **ui.R**:  
<span style="border-style:solid;border-width:1px;border-color:yellow">`textInput(inputId="title", label="Title")`</span> 

  - <u>*make output*</u>: <span style="border-style:solid;border-width:1px;border-color:yellow">`output$plot <- renderPlot({ ... })`</span>
  
  - <u>*render output*</u>: <span style="border-style:solid;border-width:1px;border-color:yellow">`plotOutput("plot")`</span>


--- &twocol 

## Available input widgets

<hr style="height:10pt; visibility:hidden;"/>

*** =left 

- <label for="">textInput()</label>
<input id="" type="text" value=""/> 

- <label for="">numericInput()</label>
<input id="" type="number" value="4"/> 

- <label>fileInput()</label>
<input id="" type="file"/>
<div id="_progress" class="progress progress-striped active shiny-file-input-progress">
  <div class="bar"></div>
  <label></label>
</div> 

- `sliderInput()` doesn't work in these slides currently

<hr style="height:5pt; visibility:hidden;"/>

- <button id="" type="button" class="btn action-button">actionButton()</button> 


*** =right  

- <head>
  <script src="shared/datepicker/js/bootstrap-datepicker.min.js"></script>
  <link rel="stylesheet" type="text/css" href="shared/datepicker/css/datepicker.css"/>
</head>
<div id="" class="shiny-date-input">
  <label class="control-label" for="">dateInput()</label>
  <input type="text" class="input-medium datepicker" data-date-language="en" data-date-weekstart="0" data-date-format="yyyy-mm-dd" data-date-start-view="month"/>
</div> 

<br/>

- <label class="checkbox" for="">
  <input id="" type="checkbox"/>
  <span>checkboxInput()</span>
</label> 

<hr style="height:2pt; visibility:hidden;"/>

- <div id="" class="control-group shiny-input-checkboxgroup">
  <label class="control-label" for="">checkboxGroupInput()</label>
  <label class="checkbox">
    <input type="checkbox" name="" id="1" value="A"/>
    <span>A</span>
  </label>
  <label class="checkbox">
    <input type="checkbox" name="" id="2" value="B"/>
    <span>B</span>
  </label>
  <label class="checkbox">
    <input type="checkbox" name="" id="3" value="C"/>
    <span>C</span>
  </label>
</div> 

<hr style="height:3pt; visibility:hidden;"/>

- <label class="control-label" for="">selectInput()</label>
<select id="">
  <option value="A" selected="selected">A</option>
  <option value="B">B</option>
  <option value="C">C</option>
</select> 

<hr style="height:3pt; visibility:hidden;"/>

- <div id="rrr" class="control-group shiny-input-radiogroup">
  <label class="control-label" for="rrr">radioButtons()</label>
  <label class="radio">
    <input type="radio" name="rrr" id="rrr1" value="A" checked="checked"/>
    <span>A</span>
  </label>
  <label class="radio">
    <input type="radio" name="rrr" id="rrr2" value="B"/>
    <span>B</span>
  </label>
  <label class="radio">
    <input type="radio" name="rrr" id="rrr3" value="C"/>
    <span>C</span>
  </label>
</div> 



--- &twocolcustomwidth 

## Making the app - step 1: without shiny

*** =left width:48%

- Write regular R code to plot the standard Gauss density: 






```r
curve(dnorm(x), from = -3, to = 3, 
    main = "standard Gaussian density", 
    col = "blue", lwd = 6, axes = FALSE, 
    xlab = NA, ylab = NA)
axis(1)
```

![plot of chunk unnamed-chunk-6](assets/fig/unnamed-chunk-6.png) 


*** =right width:49%

*NB:* The `curve()` function is anti-pedagogical: usually `dnorm(x)` returns the evaluation of the standard Gauss density :

```r
x <- c(0, 1, 2)
dnorm(x)
```

```
## [1] 0.39894 0.24197 0.05399
```


But `dnorm(x)` inside of `curve()` is an expression written as a function of the `x` variable.


--- &twocolcustomwidth

## Making the app - step 2: embed code in template 




*** =left width:90%

**ui.R :**

```r
  sidebarPanel(
    textInput("title", "Title"), 
    radioButtons("color", "Color:", choices=c("blue","red","green")), 
    numericInput("linewidth", "Line width", value=6) 
  ),
  mainPanel(
    plotOutput("GAUSS")
  )
```



**server.R :**

```r
output$GAUSS <- renderPlot({
    curve(dnorm(x), from = -3, to = 3, main = input$title, col = input$color, 
        lwd = input$linewidth, axes = FALSE, xlab = NA, ylab = NA)
    axis(1)
})
```


*** =right width:9%

--- .middle

## Making the app - step 3: run 

- Run by doing `runApp("myappfolder")` where `myappfolder` is the folder containing **server.R** and **ui.R**, and the current directory is the one containing `myappfolder`

- If `shiny` is not loaded in your R session, type `shiny::runApp("myappfolder")`

- In RStudio just type `runApp("` and press *Tab* to select the folder 

- To prevent  the app to be launched in the default browser, type <p align="center">`runApp("myappfolder", launch.browser=FALSE)`</p> or, shorter, `runApp("myappfolder", l=FALSE)`; then the app is accessible  at <span style="border-style:solid;border-width:1px;border-color:yellow">`http://localhost:xxxx`</span>  where `xxxx` is the port given in the `runApp()` message:

<p><img alt="runApp" src="assets/img/runApp.png" width="78%"></p>

- Do not use an old version of Internet Explorer


---

## What does `runApp()` do ? 

- The **ui.R** file generates the html code of the app 

- For instance, `textInput("title","Title")` generates the following html code: 

```
<label for="title">Title</label>
<input id="title" type="text" value=""/>
```

(try  `textInput("title","Title")` in the R console)


- There are some html style files (css) in the `shiny` package folder, as well as Javascript libraries (js files)

- Javascript handles the connection between R and the interface (the server and the client), namely *reactivity*; we will see in the next slides how reactivity works

- *Is it true that using Shiny does not require skills in html/Javascript ?* 

  - Yes, I am the proof that it's possible 
  
  - But such skills are useful for customization 


---

## Incredible javascript visualizer: reactlog

- Type `options(shiny.reactlog=TRUE)` at the beginning of **server.R**, or before running the app

- It shows the *reactive objects* constituting the app, and the *connections* between them


<p><img alt="Reactive roles" src="assets/img/reactivity_diagrams/roles.png" width="70%"></p>


- There's no reactive conductor in the Gauss app, only *direct connections*:

<p><img alt="Simple connections" src="assets/img/reactivity_diagrams/simplest.png" width="40%"></p>



--- 

## Understanding reactivity (1/2)

- The output object `GAUSS` is *connected* to each input object; then it is *updated* each time an input object is modified 

- Let us try to *isolate* an input: 

<pre><code class="r" style="font-size:80%">  output$GAUSS <- renderPlot({
    curve(dnorm(x), from=-3, to=3, axes=FALSE, xlab=NA, ylab=NA, 
      main=input$title, col=isolate(input$color), lwd=input$linewidth)
    axis(1)
  })
</code></pre>


<div class="row-fluid">
  <div class="span4">
    <form class="well">
      <label for="title2">Title</label>
      <input id="title2" type="text" value=""/>
      <div id="color2" class="control-group shiny-input-radiogroup">
        <label class="control-label" for="color2">Color:</label>
        <label class="radio">
          <input type="radio" name="color2" id="color21" value="blue" checked="checked"/>
          <span>blue</span>
        </label>
        <label class="radio">
          <input type="radio" name="color2" id="color22" value="red"/>
          <span>red</span>
        </label>
        <label class="radio">
          <input type="radio" name="color2" id="color23" value="green"/>
          <span>green</span>
        </label>
      </div>
      <label for="linewidth2">Line width</label>
      <input id="linewidth2" type="number" value="6"/>
    </form>
  </div>
  <div class="span8">
    <div id="GAUSS2" class="shiny-plot-output" style="width: 100% ; height: 400px"></div>
  </div>
</div>


--- &checkbox

## Understanding reactivity (2/2)

What is happening with `isolate(input$color)` ? 

1. ${\tt input\$color}\,\,\;$ is unmodifiable when we do ${\tt isolate(input\$color)}\,\,\,\;$ 
2. _${\tt output\$GAUSS}\,\,\,\;$ is disconnected from ${\tt input\$color}\,\,\,\;$_
3. _${\tt output\$GAUSS}\,\,\,\;$ reads the value of input$color only when it reacts_

*** .hint

Look at the reactlog ! 

*** .explanation

See the Shiny tutorial !


--- 

## Action button 

- We can also isolate all  input parameters of the plot, in order that the user firstly selects the parameters and then generates the plot by pressing <button id="" type="button" class="btn action-button">Go!</button> *(this is useful when modifying the inputs generates a time-consuming task)*

**ui.R** 
<pre><code class="r" style="font-size:80%">  actionButton(inputId="gobutton", label="Go!")
</code></pre>


**server.R**
<pre><code class="r" style="font-size:80%">  output$GAUSS <- renderPlot({
    input$gobutton # create connection with the Go! button
    curve(dnorm(x), from=-3, to=3, axes=FALSE, xlab=NA, ylab=NA, 
      main=isolate(input$title), col=isolate(input$color), lwd=isolate(input$linewidth))
    axis(1)
  })
</code></pre>


- <u>*Here the content of `input$gobutton` has no importance*</u>: its only role is to create a connection; actually `input$gobutton` initially is 0 and then is incremented at each press 

- <u>**Exercise**</u>: modify the app in order that the plot first time appears only once the button has been pressed (see result in next slide)

--- 

## Gauss app with an action button


<div class="row-fluid">
  <div class="span4">
    <form class="well">
      <label for="title3">Title</label>
      <input id="title3" type="text" value=""/>
      <div id="color3" class="control-group shiny-input-radiogroup">
        <label class="control-label" for="color3">Color:</label>
        <label class="radio">
          <input type="radio" name="color3" id="color31" value="blue" checked="checked"/>
          <span>blue</span>
        </label>
        <label class="radio">
          <input type="radio" name="color3" id="color32" value="red"/>
          <span>red</span>
        </label>
        <label class="radio">
          <input type="radio" name="color3" id="color33" value="green"/>
          <span>green</span>
        </label>
      </div>
      <label for="linewidth3">Line width</label>
      <input id="linewidth3" type="number" value="6"/>
    </form>
  </div>
  <div class="span8">
    <button id="gobutton" type="button" class="btn action-button">Go!</button>
    <div id="GAUSS3" class="shiny-plot-output" style="width: 100% ; height: 400px"></div>
  </div>
</div>


--- &twocolfull

## Reactive conductors (1/4)




*** =left width:44%

- A reactive conductor is a reactive component lying between a source and an endpoint:

<p><img alt="Reactive conductor" src="assets/img/reactivity_diagrams/conductor.png" width="90%"></p>

- It is defined in **server.R** with the `reactive({})` function

- *Reactive function* is a bad synonym of *reactive conductor*: similarly to a regular R function,  `reactive({})` returns a value, but it does not work like a function

*** =right width:53%
- *Illustration*: consider an inefficient algorithm calculating the Fibonacci numbers: 


```r
# Calculate nth number in Fibonacci sequence
fib <- function(n) {
    ifelse(n < 3, 1, fib(n - 1) + fib(n - 2))
}
```


Example for $n=26\,$: 

```r
fib(20)
```

```
## [1] 6765
```

the computation is slow:

```r
system.time(fib(20))
```

```
##    user  system elapsed 
##    0.42    0.00    0.42
```




--- &twocolfull

## Reactive conductors (2/4)

Let's make an app returning the n-th Fibonacci number and its inverse:

*** =left width:56%

**server.R**
<pre><code class="r" style="font-size:79%"># Calculate nth number in Fibonacci sequence
fib <- function(n) ifelse(n<3, 1, fib(n-1)+fib(n-2))

shinyServer(function(input, output) {
  output$nthValue    <- renderText({ fib(input$n) })
  output$nthValueInv <- renderText({ 1/fib(input$n) })
})
</code></pre>


*** =right width:43%

**ui.R**
<pre><code class="r" style="font-size:80%">sidebarPanel(
  numericInput("n", "Enter n:", value=6) 
),
mainPanel(
  h3("n-th Fibonacci number:"),
  textOutput("nthValue"),
  br(),
  h3("inverse n-th Fibonacci number:"),
  textOutput("nthValueInv")
)
</code></pre>


*** =fullwidth 

<div class="row-fluid">
  <div class="span4">
    <form class="well">
      <label for="n">Enter n:</label>
      <input id="n" type="number" value="6"/>
    </form>
  </div>
  <div class="span8">
    <h3>n-th Fibonacci number:</h3>
    <div id="nthValue" class="shiny-text-output"></div>
    <br/>
    <h3>inverse n-th Fibonacci number:</h3>
    <div id="nthValueInv" class="shiny-text-output"></div>
  </div>
</div>


--- &twocol

## Reactive conductors (3/4)

*** =left 

- The graph of the current app is: 

<p><img alt="Reactive conductor" src="assets/img/reactivity_diagrams/fib_no_conductor.png" width="95%"></p>

- The `fib()` function is run twice:  each reactive endpoint executes `fib()` whenever it reacts

*** =right 

With a reactive conductor we can run `fib()`  no more times than is absolutely necessary:

<p><img alt="Reactive conductor" src="assets/img/reactivity_diagrams/conductor.png" width="95%"></p>

How ? 

- by  executing `fib(input$n)` in the reactive conductor 

- and getting the reactive conductor output in the reactive endpoints


--- 

## Reactive conductors (4/4)

**old server.R :**
<pre><code class="r" style="font-size:80%"># Calculate nth number in Fibonacci sequence
fib <- function(n) ifelse(n<3, 1, fib(n-1)+fib(n-2))

shinyServer(function(input, output) {
  output$nthValue    <- renderText({ fib(input$n) })
  output$nthValueInv <- renderText({ 1/fib(input$n) })
})
</code></pre>


<br/>

**new server.R :**
<pre><code class="r" style="font-size:80%"># Calculate nth number in Fibonacci sequence
fib <- function(n) ifelse(n<3, 1, fib(n-1)+fib(n-2))

shinyServer(function(input, output) {
  getFib <- reactive({ fib(input$n) })
  output$nthValue <- renderText({ getFib() })
  output$nthValueInv <- renderText({ 1 / getFib() })
})
</code></pre>




--- 

## Dynamic UI (1/3)

- In the app below, user uploads a data file and select columns of the dataset

- Thus the UI widgets (`selectInput()` and `actionButton()`) are *dynamic*, not *static*


<div class="row-fluid">
  <div class="span4">
    <form class="well">
      <label>Upload a CSV file:</label>
      <input id="userfile" type="file"/>
      <div id="userfile_progress" class="progress progress-striped active shiny-file-input-progress">
        <div class="bar"></div>
        <label></label>
      </div>
      <div id="column_selection" class="shiny-html-output"></div>
    </form>
  </div>
  <div class="span8">
    <div id="plot" class="shiny-plot-output" style="width: 100% ; height: 400px"></div>
  </div>
</div>




--- &doubletwocolcustomwidth 




## Dynamic UI (2/3) 

- The dynamic UI is made as follows:

*** =left1 width:65%

**server.R :**
<pre><code class="r" style="font-size:78%">output$column_selection <- renderUI({
  dat <- getFile()  ## to be explained below
  if(!is.null(dat)){
    list(
      selectInput("column_x", "Column x:", choices=names(dat)),      
      selectInput("column_y", "Column y:", choices=names(dat)),
      actionButton("gobutton", "Plot!")
    )
  }
})
</code></pre>


*** =right1 width:33%

**ui.R :**
<pre><code class="r" style="font-size:78%">uiOutput("column_selection")
</code></pre>



*** =fullwidth

- File is got as a dataframe with my `getFile()` reactive conductor:

*** =left2 width:48%

**ui.R :**
<pre><code class="r" style="font-size:78%">fileInput("userfile", "Upload a CSV file:")
</code></pre>


*** =right2 width:48%

**server.R :**
<pre><code class="r" style="font-size:78%">getFile <- reactive({
  if(!is.null(input$userfile)){
    read.csv(input$userfile$datapath)
  }
})
</code></pre>



--- &doubletwocolcustomwidth 

## Dynamic UI (3/3) 

And finally the plot: 

*** =left1 width:65%

**server.R :**
<pre><code class="r" style="font-size:85%">output$plot <- renderPlot({
  if(!is.null(input$gobutton)){
    dat <- getFile()
    if(input$gobutton==0) return(NULL)
    xname <- input$column_x
    yname <- input$column_y
    plot(x=dat[,xname], y=dat[,yname], xlab=xname, ylab=yname)
  }
})
</code></pre>


*** =right1 width:33%

**ui.R :**
<pre><code class="r" style="font-size:85%">plotOutput("plot")
</code></pre>


*** =fullwidth

--- 

## Other important Shiny components 

- `conditionalPanel()` in **ui.R**: to hide/unhide something in the UI

- `observe({})`: this is like `reactive({})`, but does not return anything 

- `updateXXXInput()` in **server.R**: to change the value of the input (`updateNumericInput`, `updateTextInput`, ...) 

- `reactiveValues()` in **server.R**: simiilar to a list, but to store reacting values

- the Shiny tutorial on RStudio website (from which I plagiarized the Fibonacci example)

- the Shiny Google group, to get some help

- the `shinyIncubator` package: unofficial add-ons for Shiny

- the `shinyAce` package: a cosy text area input/output


--- 

## New in Shiny : Javascript tables (DataTables library)

<div class="row-fluid">
  <div class="span4">
    <form class="well">
      <h3>I currently don't know how to do within slides</h3>
    </form>
  </div>
</div>


---

## Javascript charts 

Shiny allows to render the Javascript charts generated by the `rCharts` package

<div class="row-fluid">
  <div class="span4">
    <form class="well">
      <label class="control-label" for="sex">Choose Sex</label>
      <select id="sex">
        <option value="Male" selected="selected">Male</option>
        <option value="Female">Female</option>
      </select>
      <label class="control-label" for="type">Choose Type</label>
      <select id="type">
        <option value="multiBarChart" selected="selected">multiBarChart</option>
        <option value="multiBarHorizontalChart">multiBarHorizontalChart</option>
      </select>
    </form>
  </div>
  <div class="span8">
    <div id="nvd3plot" class="shiny-html-output nvd3 rChart"></div>
  </div>
</div>



--- 

<img src="assets/img/ramnath.jpeg"  style="float:right; padding-left:10px;padding-right:1px;padding-top:10px;width:29%"/>

## About these slides  

- This HTML5 slide deck has been created with Ramnath Vaidyanathan's `slidify` package

- He is also the author or the `rCharts` package, R package to create interactive javascript visualizations from R, possibly jointly with Shiny


## Acknowledgements 

I am grateful to Ramnath and to the members of the Shiny Google group for their help 

