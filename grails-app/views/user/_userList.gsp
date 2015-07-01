<g:each in="${userList}" var="user">
    <tr>
        <td>${user.id}</td>
        <td>${user.userName}<g:if test="${user.admin==true}"> <b>(Admin)</b></g:if></td>
        <td>${user.email}</td>
        <td>${user.firstName}</td>
        <td>${user.lastName}</td>
        <g:if test="${user.active == true}">
            <td>Yes</td>
        </g:if>
        <g:elseif test="${!user.active}">
            <td>No</td>
        </g:elseif>
        <g:if test="${user.active ==true}">
            <td><g:link controller="user" action="inactivateUsers" id="${user.id}">Deactivate</g:link></td>
        </g:if>
         <g:elseif test="${!user.active ==true} || ${!user.active}">
        <td><g:link  controller="user" action="activateUsers" id="${user.id}">Activate</g:link></td>
    </g:elseif>
    </tr>
</g:each>