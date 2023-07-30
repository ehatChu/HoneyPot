<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <%@ include file="/WEB-INF/views/common/setup.jsp" %>
        <style>
            #weather-info-msg {
                width: 100px;
                display: flex;
                justify-content: space-evenly;
                align-items: center;
                font-size: 15px;
                margin-left: 10px;
                margin-bottom: 5px;
                font-weight: 100;
            }
        </style>
    </head>

    <body>
        <div id="weather-info-msg">
        </div>
    </body>

    </html>

    <script>
        // 함수 실행
        applyHeaderWeatherInfo(JSON.parse(sessionStorage.getItem("weather")));

        // 날씨 정보 헤더 반영
        function applyHeaderWeatherInfo(weather) {
            const weatherImg = document.querySelector('#weather-info-msg');

            let sky = ""; // 하늘 상태
            let pty = ""; // 강수 형태
            let pop = ""; // 강수 확률
            let reh = ""; // 습도
            let tmp = ""; // 기온

            for (let elem of weather) {
                category = elem.category;
                fcstValue = elem.fcstValue;

                switch (category) {
                    case "SKY":
                        switch (fcstValue) {
                            case "1": sky = '<i class="fa-regular fa-sun fa-2x" style="color: #fe5739;"></i>'; break;
                            default: sky = '<i class="fa-solid fa-cloud fa-2x" style="color: #838fa5;"></i>';
                        }
                        break;
                    case "PTY":
                        switch (fcstValue) {
                            case "0": pty = "없음"; break;
                            case "1": pty = '<i class="fa-solid fa-cloud-rain fa-2x" style="color: #a5adbb;"></i>'; break;
                            case "2": pty = '<i class="fa-solid fa-snowflake fa-2x" style="color: #a5c2f8;"></i>'; break;
                            case "3": pty = '<i class="fa-solid fa-snowflake fa-2x" style="color: #a5c2f8;"></i>'; break;
                            case "4": pty = '<i class="fa-solid fa-cloud-showers-heavy fa-2x" style="color: #0058f0;"></i>'; break;
                        }
                        break;
                    case "POP": pop = fcstValue; break;
                    case "REH": reh = fcstValue; break;
                    case "TMP": tmp = fcstValue; break;
                }
            }

            if (pty == '없음') {
                pty = sky;
            }

            weatherImg.innerHTML = pty + "<div style='height: 25px; display: flex; flex-direction: column; justify-content:space-between; margin-left: 20px;'><div style='font-size: 20px;'>" + tmp + "℃</div></div>";
        }
    </script>