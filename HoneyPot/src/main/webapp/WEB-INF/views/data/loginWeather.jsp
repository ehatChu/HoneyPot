<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <%@ include file="/WEB-INF/views/common/setup.jsp" %>
        <style>
            #weather-info-msg {
                font-size: 15px;
                margin-left: 10px;
                font-weight: 100;
            }
        </style>
    </head>

    <body>
        
    </body>

    </html>

    <script>
        // 날씨 정보 가져오기
        function getWeatherInfo() {
            $.ajax({
                url: '/app/kmsData/weather',
                type: 'get',
                dataType: 'text',
                success: function (data) {
                    var jsonObject = JSON.parse(data);
                    var weather = jsonObject.response.body.items.item;
                    sessionStorage.setItem("weather", JSON.stringify(weather));
                },
                error: function () {
                    alert("getWeatherInfo error");
                }
            });
        }


        // 미세먼지 날씨 정보 가져오기
        function getNanoDustInfo() {
            $.ajax({
                url: '/app/kmsData/nanoDust',
                type: 'get',
                dataType: 'text',
                success: function (data) {
                    var jsonObject = JSON.parse(data);
                    var nanoDust = jsonObject.response.body.items;
                    sessionStorage.setItem("nanoDust", JSON.stringify(nanoDust));
                },
                error: function () {
                    alert("getNanoDustInfo error");
                }
            });
        }

    </script>