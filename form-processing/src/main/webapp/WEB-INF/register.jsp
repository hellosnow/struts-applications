<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Register</title>
</head>
<body>
<h3>Register for a prize by completing this form.</h3>

<form:form action="${pageContext.request.contextPath}/test/register-submit" method="post" modelAttribute="personBean">
    <p><label>First name: <form:input path="firstName"/></label></p>
    <p><label>Last name: <form:input path="lastName"/></label></p>
    <p><label>Email: <form:input path="email"/></label></p>
    <p><label>Age: <form:input path="age"/></label></p>
    <p>
        <input type="checkbox" name="options" value="1"> 1
        <input type="checkbox" name="options" value="2"> 2
        <input type="checkbox" name="options" value="3"> 3
    </p>
    <input type="submit" value="Submit"/>
    <a href="${pageContext.request.contextPath}/test/register-cancel">Cancel</a>
</form:form>
</body>
</html>
