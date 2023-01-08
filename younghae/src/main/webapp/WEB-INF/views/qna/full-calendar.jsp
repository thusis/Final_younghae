<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  
  <!-- <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script> -->
  <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.0.2/index.global.js"></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
   <script>

document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          height: '700px', // calendar 높이 설정
          expandRows: true, // 화면에 맞게 높이 재설정
          slotMinTime: '08:00', // Day 캘린더에서 시작 시간
          slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
          locale: 'ko', // 한국어 설정

          initialView: 'timeGridWeek',
          
          events: [
          {
          id: 'a',
          title: 'my event',
          start  : '2023-01-09T10:20:00',
          end    : '2023-01-09T10:50:00'
        }
        ],
          eventColor: '#378006',
          eventBackgroundColor: 'red',
          eventBorderColor: 'blue',
          eventTextColor: 'black',
          eventTimeFormat: { // like '14:30:00'
					    hour: '2-digit',
					    minute: '2-digit',
					    hour12: false
					  }
        });
        calendar.render();
      });
    </script> 
<style>
  /* body 스타일 */
  html, body {
    overflow: hidden;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
  .fc-header-toolbar {
    padding-top: 1em;
    padding-left: 1em;
    padding-right: 1em;
  }
</style>
</head>

<body style="padding:30px;">
    <div id="fullCalendarContainer">
        <div id='calendar'></div>
    </div>


  </body>
</html>

