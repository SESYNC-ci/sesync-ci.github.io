# Blog post: carbon footprint of code

Carbon footprint. For many of us that term conjures up cars belching exhaust and cows belching methane as they wait to be rendered into hamburgers. However, the carbon footprint of our digital infrastructure is enormous as well. Data centers used x% of all electricity worldwide in 20XX. 

At SESYNC, we synthesize big datasets and crunch lots of numbers to fit models. This data-intensive work does not come without a cost. It requires many computer processors to run for long periods of time, consuming large amounts of energy in the process. Some of this energy consumption, and associated greenhouse gas emissions, is unavoidable if you want to work with data. But if you are clever about the way you process and analyze your data, you can save significant amounts of energy and avert a non-negligible quantity of greenhouse gas emissions. 

As most people reading this post probably know, the cyber team heavily promotes the use of R. R has a lot of advantages -- it was designed for statistical analysis, it has a very active community of users and developers who are constantly cranking out new, cool packages, and it is relatively easy to learn for beginning coders. But one of its major disadvantages is that it's pretty slow and memory-hungry. Both of those things mean inefficiency, and inefficiency equals high energy consumption. The main reason that R (and similar languages like Python) is so inefficient is that it is an interpreted language rather than a compiled one. An interpreted language is run line-by-line. This is the case whether you type the commands individually into the prompt or whether an entire R program is run all at once. Contrast this with a compiled language like C, where programs are written, compiled from human-readable code into machine code, and then the compiled code is run. The machine code is much more efficient so compiled languages tend to be faster and thus use less energy.

(link to the language comparison)

All of this is not to discourage you from learning R, but to give you additional motivation to optimize your code.

To do for back of the envelope analysis
=======================================

Data needed:
power consumption of the Slurm cluster (hyperv)
number of nodes x number of hours of the eeio job before optimization
number of nodes x number of hours of the eeio job after optimization
average GHG intensity of electricity generation in Maryland
equivalent power consumption and GHG emissions for comparable activities (driving a car, streaming Netflix)
