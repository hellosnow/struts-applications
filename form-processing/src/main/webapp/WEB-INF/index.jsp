<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Basic Spring MVC Application - Welcome</title>
  </head>
  <body>
    <h1>Welcome To Spring MVC!</h1>
    <p><a href="${pageContext.request.contextPath}/test/hello">Hello World</a></p>
    <p><a href="${pageContext.request.contextPath}/test/hello?userName=Bruce+Phillips">Hello Bruce Phillips</a></p>

    <p>Get your own personal hello by filling out and submitting this form.</p>
    <form action="${pageContext.request.contextPath}/test/hello" method="get">
      <label>Your name: <input type="text" name="userName"/></label>
      <input type="submit" value="Submit"/>
    </form>

    <p><a href="${pageContext.request.contextPath}/test/register">Please register</a> for our prize drawing.</p>
  </body>
</html>
