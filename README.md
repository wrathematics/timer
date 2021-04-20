# timer

* **Version:** 1.0
* **License:** [BSL-1.0](http://opensource.org/licenses/BSL-1.0)
* **Project home**: https://github.com/wrathematics/timer
* **Bug reports**: https://github.com/wrathematics/timer/issues

Some basic count down timers and a count up timer.

I use this for cooking.


## Installation

The development version is maintained on GitHub:

```r
remotes::install_github("wrathematics/timer")
```



## API

Count down timers:

```r
timer::timer(hours, minutes, seconds)
timer::hours(hours)
timer::minutes(minutes)
timer::seconds(seconds)
```

The timers will produce an audio ping at the end of the count down so long as the [beepr](https://cran.r-project.org/web/packages/beepr/index.html) package is available at run time. You can also set the argument `recur=TRUE` for intervals.

Count up timer:

```r
timer::counter()
```

Set an alarm for the specified time of day ("HH:MM" or "HH:MM:SS"):

```r
timer::alarm(timestr)
```
