<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
    <%
        session.invalidate();
        response.sendRedirect("/");
    %>
</body>
</html>
