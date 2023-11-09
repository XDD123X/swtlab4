<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Notification Pop Up Animation</title>
        <style>
            .containerXYZ{
                position: fixed;
                z-index: 9999;
                bottom: 50px;
                right: 50px;
                width: max-content;
                background: rgb(94,212,100);
                padding: 15px 50px;
                border-radius: 10px;
                box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.3);
                transform: translateY(30px);
                opacity: 0;
                color: white;
                animation: fade-in 4s linear forwards;
            }

            .containerXYZ p{
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 15px;
                font-weight: bold;
                margin: 10px;
            }

            .notificationXYZ{
                position: absolute;
                left: 5px;
                bottom: 5px;
                width: calc(100% - 10px);
                height: 3px;
                transform: scaleX(0);
                transform-origin: left;
                background-image: linear-gradient(to right,#539bdb,#3250bf);
                border-radius: inherit;
                animation: load 3s 0.25s linear forwards;
            }

            @keyframes fade-in{
                10%{
                    opacity: .85;
                    transform: translateY(0);
                }
                60%{
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @keyframes load{
                to{
                    transform: scaleX(1);
                }
            }
        </style>
    </head>
    <body>
        <div class="containerXYZ">
            <p>${NOTICONTENT}</p>
            <span class="notificationXYZ"></span>
        </div>

    </body>
</html>