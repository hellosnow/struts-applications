<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hello World!</title>
  </head>
  <body>
    <h2>${messageStore.message}</h2>
    <p>I've said hello ${helloCount} times!</p>
    <p>${messageStore}</p>
    <p><a href="${pageContext.request.contextPath}/test/index">Return to home page</a>.</p>
  </body>
</html>
