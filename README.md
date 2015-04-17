# CSCI455 - Electronic Voting

By Phil Nguyen, Awelemdy Orakwue, Mustafa Al-Salihi

We aim to design and implement a secure online election system using that will provide a secure election protocol. The system will overcome the drawbacks of blind voting, cheating and privacy issues by implementing a combination of hashing functions and digital signatures. 

##Objectives

###Develop a secure application
Our application will use Java EE with Spring framework. To enhance the security of the application we decided to use Spring security which provide us with different security features such as store roles that avaliable in Security Context and custom authentication with JAAS, etc .Also, Spring framework doesn’t have high setup cost nor overhead functionality.

###Secure protocol for voters to vote online
We will employ security principles such as least privilege, promote privacy and Economize mechanism to ensure that votes are secure and only active for permitted voters. Additionally, votes will be kept secret from all other users. Information sent over the network will always be encrypted with SSL.

###Analyze open source framework for vulnerabilities
Since we are planning to use a few open source frameworks such as Spring Security. We will look into Angular JS to ensure that the front end frameworks is stable and has no major security flaws that will affect our App.

##Technology Stack

###Java Spring
Spring is an open source product that provides a MVC framework for developing web applications with Java. Along with the spring framework, it includes a security package that we will use to authenticate users. We will analyze the package for any security holes, and attempt to document any vulnerabilities that we find during the project.

###Apache Tomcat
Tomcat is an open source web server that is used to host Java servlets, mainly running applications written with the Java Spring framework. It is very widely used as an enterprise system and we would like to evaluate whether it is appropriate to use Tomcat for a security essential application.

###Bootstrap
Twitter bootstrap is a front end framework that we will use in our application. It will mainly be used for styling, so security issues should not be a problem.

###AngularJS
This is a front end javascript framework that will be used for the presentation of our web application. Since this is a front end framework, anyone will be able to see the code. There should not be any kind of code that exposes critical security aspects of our application. For example, things like a password salt should not be implemented in AngularJS since all of the code that we write for it will be public.


## Compiling/Installation

This project uses maven as a dependency manager. 

You will need to edit the database.properties file with your database settings before building the project. The file is located in src/resources/database.properties.

To build the project, simply run `mvn clean install` to build the necessary war file

Once it completes, move it to your Tomcat's deployment directory and rename the war to ROOT.war

