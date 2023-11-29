<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
<head>
   <title>app 전용 데이터전송 페이지</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
  <script>
    $(document).ready(function () {
        function getB1ListData() {
            $.ajax({
                type: "GET",
                url: "/api/b1page",
                success: function (data) {
                    console.log(data);
                //    var newWindow = window.open("", "_blank");
                //    newWindow.document.write("<html><head><title>Response Body</title></head><body><pre>" + JSON.stringify(data, null, 2) + "</pre></body></html>");
                    
                },
                error: function (error) {
                    console.error("데이터를 불러오는 중 오류 발생: ", error);
                }
            });
        }

        getB1ListData();
        
        function getB2ListData() {
            $.ajax({
                type: "GET",
                url: "/api/b2page",
                success: function (data) {
                    console.log(data);
                //    var newWindow = window.open("", "_blank");
                //    newWindow.document.write("<html><head><title>Response Body</title></head><body><pre>" + JSON.stringify(data, null, 2) + "</pre></body></html>");
                    
                },
                error: function (error) {
                    console.error("데이터를 불러오는 중 오류 발생: ", error);
                }
            });
        }

        getB2ListData();
    });
</script>
</body>
</html>