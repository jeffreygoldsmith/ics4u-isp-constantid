# Grade 12 Computer Science ISP

Overall expectations being assessed in this independent study project:

* A1. 	demonstrate the ability to use different data types and expressions when creating computer programs;
* A2. 	describe and use modular programming concepts and principles in the creation of computer programs;
* A4. 	use proper code maintenance techniques when creating computer programs.
* B1. 	demonstrate the ability to manage the software development process effectively, through all of its stages – planning, development ... and closing;
* B2. 	apply standard project management techniques in the context of a student-managed ... project.
* C1. 	demonstrate the ability to apply modular design concepts in computer programs;

In all phases of this ISP, you will be guided by an exemplar produced by Mr. Gordon.

The emphasis in this ISP is on understanding and applying the process of software development. The greatest success has historically come to students who plan their deliverables according to a manageeable schedule and stick to their plan.

## Scope

Aim to create a modest application that solves a problem you care about. If you solve the problem well, it is highly likely that others will find your application useful as well. Challenge yourself with something new, but avoid overreaching.

## Due dates

Planning, development, and closing will occur by the start of March Break. You can set due dates for deliverables in your project. You are strongly recommended to plan deliverable dates by working around due dates for deliverables in your other classes.

Note that you will be granted significant opportunities to work in class, but that there is, like any Grade 12 university preparation course, an expectation that work be completed outside of class time as well.

## Proposal

Modify this document and add your responses to the following prompts below.

###What problem will your application solve?

My application, named Constant ID, is a simple tool for users to ensure security on their OSX device. Once activated using the user's password, the application will scan keystrokes to detect the identity of the person typing by looking at the difference in time between specific keystroke patterns. 

Constant ID will only look at keystroke timings when the user is typing frequently. It will use machine learning to constantly update what your keystroke patterns are to make sure that it does not lock the owner out of their device. This app is a proof of concept. If the app is built to fully function it would lock the user out if they are not a verified. Because I do not know how easy it is to lock a user out of their device (I assume not easy), the proof-of-concept Constant ID will not lock the user out, only notify the user via message that there is an intruder on their device.

###What is your inspiration for this project?

While talking to others and reading about security, I have heard that the password is an insecure way of identifying users. I thought of another way to identify a user so that it would be much harder to act as the owner of/steal a computer.

###What is your prior experience in this area?

There are no special APIs that I am experienced with for this application. It will be a standard mac OS X application. I have no experience creating OS X apps, just as I have little no experience in implementing something like constant ID before. 

###What skills do you hope to acquire by completing this project

I hope to learn about creating OS X user interfaces, and learn about security through programming and designing the algorithm for Constant ID. But most of all I am interested in machine learning. Through this project I will learn more about what machine learning is, what its applications are, and how to program an algorithm using it.

###What dependencies, if any, will be required to complete your project?

I believe that I will need some sort of networking API. I look to use the Alamofire API to solve this problem. Other than this dependency, I will only be using standard OS X APIs provided by Apple.

###Rate the personal difficulty level of this project

This will be a moderately difficult project for me. The algorithm could prove challenging, depend on how accurate I wish to make it. The UI design seems fairly simplistic, but there are other possible functionalities of the project mentioned above that I could look into. For instance, I could look into how to put an apple device to sleep if Constant ID determines that the user typing is not verified. I would rate this project an 8/10 for difficulty.

###Identify what you think your biggest challenge for successfully completing this ISP will be.

I believe that the most important thing for me is setting a schedule for myself and stick to it to make sure that I get key features of this application done when I need them. If I do not stick to a good schedule, I will procrastinate and not finish my project by the allotted due date.

###Make storyboards to indicate the user interface and/or functionality of your application.

The desktop view:
![desktopView](https://github.com/jeffreygoldsmith/ics4u-isp-constantid/blob/master/Desktop%20View.png?raw=true)  

The Main App View:
![mainAppView](https://github.com/jeffreygoldsmith/ics4u-isp-constantid/blob/master/Main%20App%20View.png?raw=true)  

Do a baseline test:  
![baselineTestView](https://github.com/jeffreygoldsmith/ics4u-isp-constantid/blob/master/Do%20a%20baseline%20test%20view.png?raw=true)  

Whilst doing a baseline test:
![doingBaselineTestView](https://github.com/jeffreygoldsmith/ics4u-isp-constantid/blob/master/Doing%20baseline%20test%20view.png?raw=true)


###Algorithm Description

This program will verify the user based on their typing profile. Creating the typing profile will be created by first looking at the baseline tests. After the user is finished the baseline tests the algorithm will then identify when the user is in the middle of typing. This is important because if they are not in the middle of consistently typing the program will get incorrect data, negatively affecting the accuracy of the typing profile. Constant ID will look at each word the user types and record the specific time difference between each keystroke. By recording these differences the algorithm will build up a more comprehensive and accurate profile to be able to recognize how the user types every word and keystroke pattern.

The rough idea I have now ist that program builds the typing profile by averaging the time delta between keystrokes. I believe that there is a more accurate way to do this other than averaging, but more comprehensive research will be required to find or think of a specific way to better handle this problem, which I will do as one of my early deliverables.

