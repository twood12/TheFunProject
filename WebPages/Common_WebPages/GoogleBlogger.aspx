<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GoogleBlogger.aspx.cs" Inherits="GoogleBlogger" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
    <script> function testBlogger() {

     var payload =
         {
             "kind": "blogger#post",
             "blog": {
                 "id": "YOUR_BLOG_ID"
             },
             "title": "New post",
             "content": "With content..."
         };

     var options =
         {
             "method": "post",
             "headers": { "Authorization": "Bearer YOUR_ACTIVE_TOKEN" },
             "contentType": "application/json",
             "payload": '{ "kind": "blogger#post", "blog": { "id": "YOUR_BLOG_ID" }, "title": "New post", "content": "With content..." }'
         };

     try {

         var result = UrlFetchApp.fetch(
           "https://www.googleapis.com/blogger/v3/blogs/YOUR_BLOG_ID/posts",
           options);

         Logger.log(result);

     } catch (e) {
         Logger.log(e);
     }
 }</script>
   
</body>
</html>
