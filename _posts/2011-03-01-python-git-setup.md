---
layout: post
title: Managing Python libraries across git projects
categories:
- blog
---

I finally got around to <strike>nuking from orbit</strike> cleaning up
my virtual machine. Maybe this time around I can make it a whole year
without wrecking all the permissions on $HOME (I once had to `sudo ls`...no joke).

![](/static/python_comrades.png)    
    
I know that all good Python comrades should be using [`pip`](http://pip.openplans.org/) for installing
packages and [`virtualenv`](http://virtualenv.openplans.org/) for managing them per project, but I never
really got into the latter. I was pretty lazy and just shoved everything 
into the global `site-packages`, but since I had a fresh start I decided 
to do it The Right Way&#8482; this time.

And man, is it awesome!

There is a sweet wrapper for `virtualenv` that I didn't find (exist?)
last time I tried to get this setup working. [`virtualenvwrapper`](http://www.doughellmann.com/docs/virtualenvwrapper/) makes
it less painful to manage multiple environments and has a super neat
hook system.

And then I found a handy [bash script to automatically switch your
environments when you `cd` to a git repo](http://hmarr.com/2010/jan/19/making-virtualenv-play-nice-with-git/).

Here is my new workflow:


    matt@nigiri:~$ mkvirtualenv foo-project
    matt@nigiri:~$ mkdir projects/foo-project/ && cd projects/foo-project/

    (foo-project)matt@nigiri:~/projects/foo-project$ git init
    (foo-project)matt@nigiri:~/projects/foo-project$ pip install flask   

Flask is only installed into this environment, if you open a `python` shell
inside foo-project you can import the module, but if you `cd` out to $HOME
and try you will get an ImportError.

    pip freeze > requirements.txt   

Now you can enumerate the project dependancies (including versions) so 
that when someone clones the project they can install them all in one-go.

    (foo-project)matt@nigiri:~/projects/foo-project$ cd
    matt@nigiri:~$  

Once you leave the repository folder, your environment is automatically
deactivated.  Then, when you go to work on `foo-project` again -- it will
be reactivated when you `cd` in.

It's pretty slick. If you want more info, check out:    
[http://mathematism.com/2009/07/30/presentation-pip-and-virtualenv/](http://mathematism.com/2009/07/30/presentation-pip-and-virtualenv/)






