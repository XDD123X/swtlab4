<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String notificationMessage = (String) request.getAttribute("notificationMessage"); %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/notibox.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/notibox.js"></script>
    </head>
    <body>


        <a href="Test">Đây là button</a>

        <c:if test="${NOTIBOX eq true}">
            <jsp:include page="include/noti-box.jsp"/>
        </c:if>

        <script>
            // Xử lý sự kiện click nút close bên trong noti-box và đóng noti-box
            var closeButton = document.getElementById('close-button');
            closeButton.addEventListener('click', function () {
                closeNotification();
            });

            function closeNotification() {
                var notificationBox = document.getElementById('notification-box');
                notificationBox.style.display = 'none';
            }
        </script>

    </body>
</html>
