# Blog post: carbon footprint of code

Carbon footprint. For many of us that term conjures up cars belching exhaust and cows belching methane as they wait to be rendered into hamburgers. However, the carbon footprint of our digital infrastructure is enormous as well. Data centers used x% of all electricity worldwide in 20XX. 

At SESYNC, we synthesize big datasets and crunch lots of numbers to fit models. This data-intensive work does not come without a cost. It requires many computer processors to run for long periods of time, consuming large amounts of energy in the process. Some of this energy consumption, and associated greenhouse gas emissions, is unavoidable if you want to work with data. But if you are clever about the way you process and analyze your data, you can save significant amounts of energy and avert a non-negligible quantity of greenhouse gas emissions. 

As most people reading this post probably know, the cyber team heavily promotes the use of R. R has a lot of advantages -- it was designed for statistical analysis, it has a very active community of users and developers who are constantly cranking out new, cool packages, and it is relatively easy to learn for beginning coders. But one of its major disadvantages is that it's pretty slow and memory-hungry. Both of those things mean inefficiency, and inefficiency equals high energy consumption. The main reason that R (and similar languages like Python) is so inefficient is that it is an interpreted language rather than a compiled one. An interpreted language is run line-by-line. This is the case whether you type the commands individually into the prompt or whether an entire R program is run all at once. Contrast this with a compiled language like C, where programs are written, compiled from human-readable code into machine code, and then the compiled code is run. The machine code is much more efficient so compiled languages tend to be faster and thus use less energy. (link to the language comparison)

All of that was not to discourage you from learning R, but to give you additional motivation to optimize your code.

## Example: carbon footprint of code optimization

Recently, I found a major inefficiency in my own code. I was doing a Monte Carlo uncertainty analysis, where I took 10,000 random draws from parameter distributions and repeated my analysis with each of the draws to estimate the uncertainty around the median result. Previously, I had been fitting a model within each iteration of the analysis, but I realized that I could save a lot of processing time by running a short script before the 10,000-iteration loop and using the results within each iteration. I was curious how much greenhouse gas emissions were saved in this process, comparing the final code I ran on SESYNC's Slurm cluster with the unoptimized code I would have run. Then I wanted to compare those emissions to other GHG-intensive activities, such as driving a car, streaming Netflix, or eating meat.

We need the following information for a back-of-the-envelope analysis:

- the length of processing time required by the code before and after optimization
- power consumption of the processors on the Slurm cluster
- average greenhouse emission intensity of electricity generation in Maryland
- equivalent power consumption and GHG emissions for comparable activities 

### The numbers

I'll spare you all the calculations. The unoptimized code would have taken ~220 seconds (3:40) to run each of the 10,000 iterations, which is over 25 processor-days. The optimized code had an extra script that ran once on a single processor for ~18 minutes, but after that each iteration only took 2.3 seconds to run. So that's around 7 processor-hours for the entire analysis, with setup included. The bottom line is that I saved about 606 processor-hours by optimizing the code!

How much electricity was saved, and what is the difference in terms of carbon footprint? Well, based on a few different sources, it looks like a single Slurm processor code draws somewhere between 60 W and 200 W when running a job[^1]. So let's take the midpoint of 130 W. Then I used data from the Energy Information Administration[^2] to estimate that the average kWh of electricity in Maryland generates about 333 grams of CO<sub>2</sub>. (If we knew the exact mix of sources used to power Park Place we might be able to get a better number there.) Based on those numbers, I estimate that about 26 kg (&plusmn;14) of CO<sub>2</sub> emissions were saved by optimizing the code!

### Put that in terms we can understand!

Let's compare the CO<sub>2</sub> footprint of the energy saved with the CO<sub>2</sub> footprint of some other activities:

- Driving a passenger car
- Streaming Netflix
- Eating a hamburger

For the car, we can use EPA's number[^3] of 404 g CO<sub>2</sub>/mile. For Netflix, it's a bit more uncertain since there are a number of sources of emissions[^4]: the data center, the data transmission, and the device you are streaming on. The CO<sub>2</sub> footprint of Wifi versus 4G is pretty different (much higher for 4G). Obviously larger-screen devices have a bigger footprint. Let's use the weighted average of 70 g CO<sub>2</sub>/hour across all modes of data transmission and whatever device you might use.

Assuming EPA's number for GHG intensity of driving a passenger car, the amount of CO<sub>2</sub> saved would get us 65 miles or 105 kilometers in a car! That's roughly the distance from Annapolis to Frederick, MD!

Using the weighted average across devices, with the CO<sub>2</sub> saved from optimization, you would be able to kick back and stream Netflix for 375 hours, or almost 16 days straight! That's enough to watch every episode of "Great British Baking Show" ever recorded three times in a row, with a few days left over to watch "Tiger King" half a dozen times.

Producing a Big Mac requires about 4 kg of emissions[^5] so you'd only be able to produce 6.6 Big Macs with that amount of CO<sub>2</sub>. 

### Final thoughts

I was surprised by the size of the carbon footprint of running code on the cluster. I hope this encourages people to sit down with their friendly neighborhood data scientist and look at ways to optimize their code and make it run faster and greener!

[^1]: Sources for Slurm power generation
[^2]: Sources for Maryland's electricity mix
[^3]: https://www.epa.gov/greenvehicles/greenhouse-gas-emissions-typical-passenger-vehicle
[^4]: https://www.epa.gov/greenvehicles/greenhouse-gas-emissions-typical-passenger-vehicle 
[^5]: https://www.sixdegreesnews.org/archives/10261/the-carbon-footprint-of-a-cheeseburger

