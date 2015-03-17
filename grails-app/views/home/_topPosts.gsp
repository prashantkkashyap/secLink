
<%
    topPost.each {
        %>

<div> <div>${it.createdBy.userName}<div><g:link action="">${it.topic}</g:link></div>
    <div>${it.description}</div>
    <div><g:link action="">View Post</g:link></div>
</div> </div>


<%
    }
%>