<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Registration Successful</title>
  </head>
  <body>
    <h3>Thank you for registering for a prize.</h3>

    <p>Your registration information: ${personBean}</p>
    <p>Your registration information: ${options}</p>

    <p><a href="${pageContext.request.contextPath}/test/index">Return to home page</a>.</p>
  </body>
</html>
