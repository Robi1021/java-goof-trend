![Java CI with Maven](https://github.com/omearaj/java-goof/workflows/Java%20CI%20with%20Maven/badge.svg?branch=master)

## Hello!
## Java Goof

A protect by design demo application, initially based on [Ben Hassine](https://github.com/benas/)'s [TodoMVC](https://github.com/benas/todolist-mvc), and protected by Cloud One Application Security. 

The goal of this application is to demonstrate through example how to find, exploit and fix vulnerable Maven packages. 

This repo is still incomplete, a work in progress to support related presentations.


## Build and run Todolist MVC

(from the original README)

*Note that to run locally, you need JDK 8.*

1.  Check out the project source code from github : `git clone https://github.com/robi1021/java-goof-trend.git`
2.  Open a terminal and run the following command from root directory : `mvn install`
3.  Choose a web framework to test and run it. For example : `cd todolist-web-struts && mvn tomcat7:run` (note: this example currently only copied the Struts demo)
4.  Browse the following URL : `localhost:8080/`
5.  You can register a new account or login using the following credentials : foo@bar.org / foobar

## Running with docker-compose
```bash
docker-compose up --build
docker-compose down
```

## License
This repo is available released under the [MIT License](http://opensource.org/licenses/mit-license.php/).
