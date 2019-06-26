<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/themes/base/jquery-ui.css"
        type="text/css" media="all" />
    <link rel="stylesheet" href="http://static.jquery.com/ui/css/demo-docs-theme/ui.theme.css"
        type="text/css" media="all" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js"
        type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var date = new Date();
            $("[id*=dpd1]").datepicker({
                autoclose: true,
                changeMonth: true,
                changeYear: true,
                minDate: new Date()
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <p>Date</p>
        <input type="text" name="name" value=" " id="dpd1" />
    </div>
    </form>
</body>
</html>