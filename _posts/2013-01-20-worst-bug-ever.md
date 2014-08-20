---
layout: post
title: "Worst. Bug. Ever."
categories:
- blog
tags:
- story
favorite: true
---

Some bugs are the worst because they [cost money][money]. Some because they [cost lives][lives].

Others would cite bugs buried deep in a [framework][rails] or [hardware][intel] as "the worst".

For me, the worst kind of bugs are those where the solution, in hindsight, seemed
so obvious. You end up more frustrated with the bug after knowing the fix.

[money]: http://money.cnn.com/2012/08/09/technology/knight-expensive-computer-bug/index.html
[lives]: http://en.wikipedia.org/wiki/Therac-25
[intel]: http://en.wikipedia.org/wiki/Therac-25
[rails]: https://groups.google.com/forum/#!topic/rubyonrails-security/61bkgvnSGTQ/discussion

---

I encountered my worst bug during a summer internship after my sophomore year of
school. I was helping a research team at Purdue write simulation tools for
nanophotonics &mdash; I say this not to sound like I was some kind of genius, but
to highlight that I was in over my head in a very unfamiliar domain.

A group of research scientists and grad students would work out the math needed
to simulate the performance of different nano-scale lenses and I was responsible for
wrapping the computations in a web interface and plotting the results.

The team had an existing set of MATLAB scripts that they used internally, but these
scripts were hard to modify and distribute. But, on the bright side, I could hook into 
the MATLAB scripts and leverage their existing work.

When I finally got everything wired up and started comparing the results of a few test 
cases, they didn't match. I did my best to debug the MATLAB script, but the math 
was outside of my comprehension (optics theorems, higher order integrals, and 
complex numbers). And when I ran the simulation with the same inputs in the stand-alone script, 
I would get the correct results. *Hmm.*

The web interface was built on a proprietary framework &mdash; it could leverage an entire 
grid computing cluster as the backend, but wasn't exactly something that StackOverflow could 
help with.

After about of week of stepping through the code line by line (even verifying some of the
calculations by hand), I finally isolated the section of code where the results diverged.

    for i=1:length(LensLayers)
      d[i] = compute_diffraction_at_wavelength(LensLayers[i], WAVELENGTH)
    end

It seemed pretty innocuous; loop over an array, perform a calculation on each element, store
the result in another array.

Do you see the bug?

Remember when I said there were some PhD-level computations being done? Most of them dealt with
complex numbers, which are natively support in MATLAB like so:

    x = 2 + 3*i

Figure it out yet?

I was using `i` as my loop index, but as a side-effect the imaginary constant `i` in MATLAB 
was getting overwritten! So `2 + 3*i` was evaluating to `5` for the first iteration, `8` for 
the second, etc. *Sigh.*

Changing the loop variable name immediately fixed the problem and the results became 
correct (an alternate solution is to use `3i` instead of `3*i`).

---

To this day, I've never run across another bug with such a **frustratingly obvious solution**. 

It may have taken three weeks to solve, but at least I got a good "Worst. Bug. Ever." story out of it.
